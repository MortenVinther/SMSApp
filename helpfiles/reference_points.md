---
title: 'Reference points'
output:
  html_document:
    keep_md: true
---



Reference points are limit points (B<sub>lim</sub>, and  F<sub>lim</sub>), precautionary points (B<sub>pa</sub>, and  F<sub>pa</sub>) or targets points (F<sub>MSY</sub>) used to evaluate the stock status and to  provide advice.  

(Modified from ICES https://www.ices.dk/sites/pub/Publication%20Reports/Advice/2021/2021/Advice_on_fishing_opportunities.pdf )

Due to the variability in stock size, there may be situations where the spawning stock biomass (SSB) is so low that reproduction is at
significant risk of being impaired. A precautionary approach implies that fisheries management in such situations should
be more cautious. For stocks where quantitative information is available, the reference point  B<sub>lim</sub> may be identified as the
stock size below which there is a high risk of reduced recruitment. A precautionary safety margin incorporating
the uncertainty in ICES stock estimates leads to the precautionary reference point B<sub>pa</sub>, which is a biomass reference point
designed to have a low probability of being below  B<sub>lim</sub>. When the spawning-stock size is estimated to be above B<sub>pa</sub>, the
probability of impaired recruitment is expected to be low.

F<sub>lim</sub> is the fishing mortality which in the long term will result in an average stock size at  B<sub>lim</sub>. Fishing at levels above F<sub>lim</sub> will
result in a decline in the stock to levels below F<sub>lim</sub>. ICES also defines F<sub>pa</sub>, which is the fishing mortality that results in no
more than 5% probability of bringing the spawning stock to below B<sub>lim</sub> in the long term.

F<sub>MSY</sub> is the fishing mortality that in the long run leads to the Maximum Sustainable Yield (MSY) from the stock. MSY refers to a long-term average and is measured as weight of the catch in the ICES advice. B<sub>MSY</sub> is the expected average biomass if the stock is exploited at F<sub>MSY</sub>, however B<sub>MSY</sub> is not used as a target point for the ICES advice. MSY B<sub>trigger</sub> is the parameter in ICES MSY framework which triggers advice on reduced fishing mortality relative to F<sub>MSY</sub>. MSY B<sub>trigger</sub> is as minimum set at B<sub>pa</sub>. When multi-species interactions are important MSY reference points for a given species are conditional on the stock size of other predator and prey species. F<sub>MSY</sub> and MSY B<sub>trigger</sub> are not used directly in this application, but can candidate points can be examined using the F-Model option in "Detailed predictions".

**Reference points as defined in this application (may not be the same as applied by ICES advice).**

<table class=" lightable-classic" style="font-family: Cambria; width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> Flim </th>
   <th style="text-align:right;"> Fpa </th>
   <th style="text-align:right;"> Blim </th>
   <th style="text-align:right;"> Bpa </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;width: 1.0in; "> Cod </td>
   <td style="text-align:right;width: 0.7in; "> 0.540 </td>
   <td style="text-align:right;width: 0.7in; "> 0.390 </td>
   <td style="text-align:right;width: 0.7in; "> 107.0 </td>
   <td style="text-align:right;width: 0.7in; "> 150.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 1.0in; "> Whiting </td>
   <td style="text-align:right;width: 0.7in; "> 0.460 </td>
   <td style="text-align:right;width: 0.7in; "> 0.330 </td>
   <td style="text-align:right;width: 0.7in; "> 120.0 </td>
   <td style="text-align:right;width: 0.7in; "> 166.7 </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 1.0in; "> Haddock </td>
   <td style="text-align:right;width: 0.7in; "> 0.384 </td>
   <td style="text-align:right;width: 0.7in; "> 0.274 </td>
   <td style="text-align:right;width: 0.7in; "> 94.0 </td>
   <td style="text-align:right;width: 0.7in; "> 132.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 1.0in; "> Saithe </td>
   <td style="text-align:right;width: 0.7in; "> 0.620 </td>
   <td style="text-align:right;width: 0.7in; "> 0.446 </td>
   <td style="text-align:right;width: 0.7in; "> 107.3 </td>
   <td style="text-align:right;width: 0.7in; "> 149.1 </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 1.0in; "> Mackerel </td>
   <td style="text-align:right;width: 0.7in; "> 0.460 </td>
   <td style="text-align:right;width: 0.7in; "> 0.360 </td>
   <td style="text-align:right;width: 0.7in; "> 2000.0 </td>
   <td style="text-align:right;width: 0.7in; "> 2580.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 1.0in; "> Herring </td>
   <td style="text-align:right;width: 0.7in; "> 0.340 </td>
   <td style="text-align:right;width: 0.7in; "> 0.300 </td>
   <td style="text-align:right;width: 0.7in; "> 800.0 </td>
   <td style="text-align:right;width: 0.7in; "> 900.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 1.0in; "> N.sandeel </td>
   <td style="text-align:right;width: 0.7in; "> NA </td>
   <td style="text-align:right;width: 0.7in; "> 0.600 </td>
   <td style="text-align:right;width: 0.7in; "> 200.0 </td>
   <td style="text-align:right;width: 0.7in; "> 280.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 1.0in; "> S.sandeel </td>
   <td style="text-align:right;width: 0.7in; "> NA </td>
   <td style="text-align:right;width: 0.7in; "> 0.600 </td>
   <td style="text-align:right;width: 0.7in; "> 175.0 </td>
   <td style="text-align:right;width: 0.7in; "> 245.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 1.0in; "> Nor.pout </td>
   <td style="text-align:right;width: 0.7in; "> NA </td>
   <td style="text-align:right;width: 0.7in; "> 0.700 </td>
   <td style="text-align:right;width: 0.7in; "> NA </td>
   <td style="text-align:right;width: 0.7in; "> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 1.0in; "> Sprat </td>
   <td style="text-align:right;width: 0.7in; "> NA </td>
   <td style="text-align:right;width: 0.7in; "> 0.690 </td>
   <td style="text-align:right;width: 0.7in; "> 94.0 </td>
   <td style="text-align:right;width: 0.7in; "> 125.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 1.0in; "> Plaice </td>
   <td style="text-align:right;width: 0.7in; "> 0.516 </td>
   <td style="text-align:right;width: 0.7in; "> 0.369 </td>
   <td style="text-align:right;width: 0.7in; "> 207.3 </td>
   <td style="text-align:right;width: 0.7in; "> 290.2 </td>
  </tr>
  <tr>
   <td style="text-align:left;width: 1.0in; "> Sole </td>
   <td style="text-align:right;width: 0.7in; "> 0.420 </td>
   <td style="text-align:right;width: 0.7in; "> 0.302 </td>
   <td style="text-align:right;width: 0.7in; "> 30.8 </td>
   <td style="text-align:right;width: 0.7in; "> 42.8 </td>
  </tr>
</tbody>
</table>

 Reference points can, if defined, optionally be shown on the summary plots.
 
