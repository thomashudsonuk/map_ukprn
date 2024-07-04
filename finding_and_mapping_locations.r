library(googleway)
library(readxl)
library(leaflet)

# google API key
set_key("")

# list of UK OfS registered higher education providers, sourced from: https://www.officeforstudents.org.uk/data-and-analysis/student-number-data/get-the-current-student-numbers-data/
universities <- read_excel("UKPRNs.xlsx")

# to limit API calls when testing code
# universities <- head(universities, 10)

# search google maps for each place and return the latitude (lat) and longitude (lng)
for (i in 1:nrow(universities)) {
  print(i)
  uni_geo <- google_places(universities$Provider[i])
  # use 'place_type = "university"' to limit: https://developers.google.com/maps/documentation/places/web-service/supported_types#table1
  if (length(uni_geo$results) == 0) {
    # incase some search results fail to return lat/lng
    universities[i,3] <- NA
    universities[i,4] <- NA
  } else {
    universities[i,3] <- uni_geo$results$geometry$location$lat[1]
    universities[i,4] <- uni_geo$results$geometry$location$lng[1]
  }
  
}

# rename new lat/lng columns
colnames(universities)[3] <- "lat"
colnames(universities)[4] <- "lng"

# create and view leaflet map of locations
map <- leaflet() %>% addTiles() %>% addMarkers(data = universities, label = ~as.character(universities$Provider))
map

