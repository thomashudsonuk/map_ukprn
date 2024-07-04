# map_ukprn
Map of UK Higher Education providers, using Google Place API

The rough logic of the code is:
1. Get a dataset of UK Higher Education providers (in this case just England), from the Office for Students.
2. Use Google's Place API (with the 'googleway' R package) to search the name of the instituion, and return the latitude/ longitude of it.
3. Plot these lat/ lng points on a map using 'leaflet'.

## Please note
- step 2 is quite generalised, as it's similar to searching for a location manually using Google Maps. 
- that step 2 is needed because the data in step 1 does not include location information (and I couldn't find a reliable source for Higher Education provider location information)

## Future changes/ ideas
- get a list of full UK providers, not just England
- use map layers to provide more information, such as uni specific data and regional map layers