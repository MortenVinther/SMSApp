# load data for the selected area
load_ecoRegion<-function(ar){
  
  if (ar=='North Sea') {ard<-'Data_northsea';ars<<-'NS'} else if (ar=='Baltic Sea') {ard<-'Data_baltic';ars<<-'BS'}
  
  load(file=file.path(ard,"environment.Rdata"),verbose=FALSE,envir=my.environment)
  
  
  
  # command file for executing the OP program to make a prediction
  cmd <<- paste0('cd "', file.path('Data'), '" &&  "./op" -maxfn 0 -nohess > ud.dat')
  
  ### copy OP files
  op.files<-c("area_names.in","just_one.in","op_c.in","op_consum.in","op_exploitation.in","op_f.in","op_length_weight_relations.in",
              "op_m.in","op_m1.in","op_m1m2.in","op_multargetf.in","op_n.in","op_n_proportion_m2.in","op_other_n.in","op_price.in","op_prop_landed.in","op_propmat.in",
              "op_reference_points.in","op_seed.in","op_size.in","op_ssb_rec_residuals.in","op_wcatch.in","op_wsea.in","species_names.in",
              "op_msfd.dat","op.dat","op_config.dat","op_trigger.dat","sms.dat")

  for (f.file in op.files) {
    from.file<-file.path(my.app.dir,ard,f.file)
    to.file<-file.path(my.app.dir,'Data',f.file)
    tmp<-file.copy(from.file, to.file, overwrite = TRUE)
  }
  
 
  
}


# Data for table with the most important data
makeResTable<-function(x){
  a<-data.frame(Species=VPA.spNames,
                F_base=round(x$baseLine[,'Fbar'],3),
                F_new=round(x$out$a[,'Fbar'],roundUnits['Fbar']),
                F_change=(x$out$a[,'Fbar']-x$baseLine[,'Fbar'])/x$baseLine[,'Fbar'],
                Yield_base=round(x$baseLine[,'Yield'],3),
                Yield_new=round(x$out$a[,'Yield'],roundUnits['Yield']),
                Y_change=(x$out$a[,'Yield']-x$baseLine[,'Yield'])/x$baseLine[,'Yield'],
                SSB_base=round(x$baseLine[,'SSB'],roundUnits['SSB']),
                SSB_new=round(x$out$a[,'SSB'],roundUnits['SSB']),
                SSB_change=(x$out$a[,'SSB']-x$baseLine[,'SSB'])/x$baseLine[,'SSB'],
                rec_base=round(x$baseLine[,'Recruits'],roundUnits['Recruits']),
                rec_new=round(x$out$a[,'Recruits'],roundUnits['Recruits']))
  
  colnames(a)<-c("Species",'F base',                                  paste0('F(',termYear,')'),                         'F change',
                 paste0('Yield base',plotLabels['Yield']),  paste0('Yield(',termYear,')', plotLabels['Yield']),'Yield change',
                 paste0('SSB base', plotLabels['SSB']),     paste0('SSB(',termYear,') ',  plotLabels['SSB']),  'SSB change',
                 paste0('Rec. base',plotLabels['Recruits']),paste0('Rec(',termYear,') ',  plotLabels['Recruits']))
  return(a)
}

do_baseLine<-function(){
  baseLine=cbind(SSB=base_SSB,Fbar=base_F,Yield=base_Yield,Recruits=base_Rec)
  rownames(baseLine)<-VPA.spNames
  return(baseLine)
}


updateExplPatttern<-function(explPat) {
  # change factor in annual exploitation pattern
  change<-annExplPat/apply(explPat,c(1,2),sum) 
  change[is.na(change)]<-1.0
  for (q in (1:n.seasons)) explPat[,,q]<-explPat[,,q]*change
  
  # rescale to 1
  avExplPat<-sapply(rownames(Fages),function(sp) mean(annExplPat[paste('age',as.character(Fages[sp,1]:Fages[sp,2])),sp]))
  for (sp in rownames(Fages)) explPat[,sp,]<-explPat[,sp,] /avExplPat[sp]
  
  # recalculate annual exploitation pattern
  annExplPat<<-apply(explPat,c(1,2),sum) 
  
  return(explPat)
}



put_op_Fmodel<-function(a,OP.trigger) {
  OP.trigger@HCR[1,] <- hcrval[a$HCR]
  OP.trigger@Ftarget['init',]<-a$target.F
  OP.trigger@trigger[1,]<-a$T1/plotUnits['SSB']
  OP.trigger@trigger[2,]<-a$T2/plotUnits['SSB']
  return(OP.trigger)
}


put_other_predators<-function(a,OP){
  OP@other.predator['factor',]<-a$change
  for (sp in other.spNames){
    if (a[sp,'change']==1) OP@other.predator['first',sp]<- -1  else OP@other.predator['first',sp] <- a[sp,"First.year"]
    if (a[sp,'change']==1) OP@other.predator['second',sp]<- -1 else OP@other.predator['second',sp]<- a[sp,"Last.year"] 
  }
  return(OP)
}

get_op_Fmodel<-function(){
  HCR<-OP.trigger@HCR
  trigger<-OP.trigger@trigger*plotUnits['SSB']
  Ftarget<-OP.trigger@Ftarget['init',]
  return(data.frame(Species=VPA.spNames,target.F=Ftarget, HCR=names(hcrval[match(HCR[1,],hcrval)]),T1=trigger[1,],T2=trigger[2,],stringsAsFactors = FALSE))
}

