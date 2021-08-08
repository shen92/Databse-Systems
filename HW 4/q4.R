########################################################################################################################
# geosphere is a really cool library for spatial calcs, see
# https://cran.r-project.org/web/packages/geosphere/vignettes/geosphere.pdf
#install.packages('geosphere')
# use the library to compute polygon stats such as area, perimeter, centroid
library('geosphere')
# the pairs of values are long,lat...
pol <- rbind(c(-118.276394,34.019152), c(-118.282412,34.018697), c(-118.286602,34.018677), c(-118.288755,34.019573), c(-118.290477,34.020474), c(-118.286199,34.023943),c(-118.28233,34.02254), c(-118.276394,34.019152))
areaPolygon(pol)
perimeter(pol)
# store the centroid in 'c' because we'll need it below, for plotting
c <- centroid(pol)
c
c[1][1]
c[2][1]

########################################################################################################################
# leaflet is an R port of the excellent leaflet.js library (https://leafletjs.com/)
# see https://cran.r-project.org/web/packages/leaflet/leaflet.pdf
#install.packages("leaflet")
# use leaflet to plot the convex hull coords, plus centroid
library("leaflet")
m <- leaflet()
m <- addTiles(m)
# our centroid - right now, it's the centroid of the 'pol' polygon above 
m <- addMarkers(m, lng=c[1][1], lat=c[2][1], popup="Hull centroid")
# our convex hull - right now it's a piece of Venice Beach!!

m <- addCircleMarkers(m, lng=-118.276394,lat=34.019152,label="CAL", radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.282412,lat=34.018697,label="JFF", radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.286602,lat=34.018677,label="MHP", radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.288755,lat=34.019573,label="SSL", radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.290477,lat=34.020474,label="GER", radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.286199,lat=34.023943,label="DEN", radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28233,lat=34.02254,label="SWC", radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
# time to see the results
m
########################################################################################################################

