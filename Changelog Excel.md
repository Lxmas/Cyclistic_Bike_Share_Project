# Changelog 

This file contains the notable changes to the project Cyclistic 

## New 

Created file excel with trips data from the last 12 months  

Checked for NULL or misspellings with Filter 

Created column "ride_lenght" and Calculate the length of each ride by subtracting the column “started_at” from the column “ended_at”. 

Created column "day_of_week" and calculated  the day of the week that each ride started using the “WEEKDAY” command  

Created column "ride_time" finding just the decimal number that make the time, used =find(), len(), concatenate() and then converting the string in float. 

Created column "part_of_day". =IFS(L2>=0.916666666666667, "night", L2>=0.75, "evening", L2>=0.5, "afternoon", L2>=0.208333333333333, "morning") 

Deleted columns with station names because full of blanks 

Deleted rides with 0 ride length 

Deleted rides with wrong length spotted with conditional formatting rides that end a different day they started. Ended up that those rides don't have an end point. This was giving wrong ride length values. 

 

## Analysis 

Found mean length of rides, number of trips per months, mode of day of week 

Calculated the average ride_length for members and casual riders with Pivot table. Rows = member_casual; Values = Average ride_length 

Calculated the average ride_length for users by day_of_week with Pivot table. Try columns = day_of_week; Rows = member_casual; Values = Average of ride_length 

Calculated the number of rides for users by day_of_week by adding Count of trip_id to Values. 
