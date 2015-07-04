#Crime Data Project

###CSV data files
These files are stored into the project root directory and contain the following data:
1. now_data.csv contains time and season adjusted crime ratings for each lga in comparison to all the lga's for the state of Victoria. It also contains tip information to be presented on the now page. 
2. questions_data.csv contains all quiz information.
3. postcode_lga_lookup.csv contains data to produce a lookup table between postcode and lga
4. police_map_data.csv contains latitude/longitude coordinate data of police stations

###Loading new data
New data can be bulk uploaded into the postgres database by running the following rake task commands:
1. bundle exec rake import:now_data
2. bundle exec rake import:question_data
3. bundle exec rake import:postcode_lga_data
4. bundle exec rake import:police_map_data