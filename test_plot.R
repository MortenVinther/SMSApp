plot_summary_new<-function(res,ptype=c('Yield','Fbar','SSB','Recruits','Dead','M2'),years=c(0,5000),species='Cod',splitLine=FALSE,incl.reference.points=FALSE,nox=2,noy=3) {

  a<-as_tibble(subset(res$out$detail_sum,Year>=years[1] & Year<=years[2] & Species %in% species))
  a2<-subset(histCondensed,Year>=years[1] & Year<=years[2] & Species %in% species)
  a<-bind_rows(a,a2)%>% mutate(Year=as.integer(Year)) %>% arrange(Year) 
  
  b<-subset(res$out$detail_M2,Year>=years[1] & Year<=years[2] & Species %in% species)
  b2<-subset(histAnnoM,Year>=years[1] & Year<=years[2] & Species %in% species)
  b<-bind_rows(b,b2) %>% arrange(Year,Age)
  
  #A<<-a;  B<<-b
  
   if ("SSB" %in% ptype) {
    pSSB<-ggplot(a,aes(x=Year,y=SSB))+
    geom_line(lwd=1.5)+
    geom_point(shape = 21, colour = "black", fill = "white", size = 2, stroke = 1.5)+
    labs(x='',y=plotLabels['SSB'],title=paste(species,'SSB',sep=', '))+
    ylim(0,max(a$SSB))+
    theme(plot.title = element_text(size = 16, face = "bold",hjust=0))
    
    if (splitLine) pSSB<- pSSB+geom_vline(xintercept=stq_year,col='blue',lty=3,lwd=1)
    if (incl.reference.points) {
       if ( refPoints[species,'Blim']>0) pSSB<- pSSB+geom_hline(yintercept=refPoints[species,'Blim'],lty=2,lwd=1,col='red')
       if (refPoints[species,'Bpa']>0)   pSSB<- pSSB+geom_hline(yintercept=refPoints[species,'Bpa'],lty=3,lwd=1,col='green')
    }
  }
  

  if ("Recruits" %in% ptype) {
    y <-aggregate(Recruits~Year,data=a,sum)
    pRec<-ggplot(y,aes(x=Year,y=Recruits)) +
      geom_bar(stat = "identity")+
      labs(x='',y=plotLabels['Recruits'],title='Recruitment')+
      theme(plot.title = element_text(size = 16, face = "bold"))
    if (splitLine) pRec<- pRec+geom_vline(xintercept=stq_year,col='blue',lty=3,lwd=1)
  }
  
  if ("Fbar" %in% ptype) {
     pF<-ggplot(a,aes(x=Year,y=Fbar))+
       geom_line(lwd=1.5)+
       geom_point(shape = 21, colour = "black", fill = "white", size = 2, stroke = 1.5)+
       labs(x='',y=plotLabels['Fbar'],title='Fishing mortality, F')+
       ylim(0,max(a$Fbar))+
       theme(plot.title = element_text(size = 16, face = "bold"))
     
     if (splitLine) pF<- pF+geom_vline(xintercept=stq_year,col='blue',lty=3,lwd=1)
     if (incl.reference.points) {
       if ( refPoints[species,'Flim']>0) pF<- pF+geom_hline(yintercept=refPoints[species,'Flim'],lty=2,lwd=1,col='red')
       if (refPoints[species,'Fpa']>0)   pF<- pF+geom_hline(yintercept=refPoints[species,'Fpa'],lty=3,lwd=1,col='green')
     }
  } 
  
  if ("Yield" %in% ptype) {
    y <-aggregate(Yield~Year,data=a,sum)
    pY<-ggplot(y,aes(x=Year,y=Yield)) +
      geom_bar(stat = "identity")+
      labs(x='',y=plotLabels['Yield'],title='Catch')+
      theme(plot.title = element_text(size = 16, face = "bold"))
    if (splitLine) pY<- pY+geom_vline(xintercept=stq_year,col='blue',lty=3,lwd=1)
  }  
  
  if ("Dead" %in% ptype) {
    y<-select(a,Year,Yield,DeadM1,DeadM2)
    y<-as.data.frame(y)
    y<-reshape(y,direction='long',varying = list(2:4))
    pD<-ggplot(y, aes(x = Year, y = Yield, fill = as.factor(time)) )+
       geom_bar(stat = "identity")+ 
       labs(x='',y=plotLabels['DeadM'],title='Biomass removed\ndue to F, M1 and M2')+
       theme(plot.title = element_text(size = 16, face = "bold"),legend.position="none")
    if (splitLine) pD<- pD+geom_vline(xintercept=stq_year,col='blue',lty=3,lwd=1)
  }
 
  if ("M2" %in% ptype) if (any(b$M2>0)) {
    b$Age<-as.factor(b$Age)
    m2<-aggregate(M2~Year+Age,data=b,sum)
    m2max<-aggregate(cbind(maxM2=M2)~Age,data=b,max)
    m2<-droplevels(subset(merge(m2,m2max),maxM2>0.01 & as.character(Age)<"6"))
    pM<-ggplot(m2,aes(x=Year,y=M2,color=Age, shape=Age)) +
      geom_line(lwd=1)+
      geom_point()+
      labs(x='',y=plotLabels['Fbar'],title='M2 at age')+
      ylim(0,max(m2max$maxM2))+
      theme(plot.title = element_text(size = 16, face = "bold"),legend.position="none")
    
    if (splitLine) pM<- pM+geom_vline(xintercept=stq_year,col='blue',lty=3,lwd=1)
  }
  out<-plot_grid(pSSB, pF,pD,pRec,pM,pY, 
            ncol = 3, nrow = 2)
  return(out)
}

 #plot_summary_new(res=res$rv,ptype=c('Yield','Fbar','SSB','Recruits','Dead','M2'),years=c(0,5000),species='Cod',splitLine=FALSE,incl.reference.points=FALSE) 

