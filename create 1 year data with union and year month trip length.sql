--- Create Table with 1 year data 
--- Combine single month table in one with "Union"
--- Create Year, Month and ride_lenght columns


create table [PortfolioProject].[dbo].[1yeartripdata_complete] (
ride_id varchar(100)
      ,rideable_type varchar(100)
      ,started_at datetime
	  ,ended_at datetime
      ,start_lat int
      ,start_lng int
      ,end_lat int
      ,end_lng int
      ,member_casual varchar(100)
      ,day_of_week int
      ,ride_time time
	  ,year int
	  ,month int
	  ,ride_length_seconds int
	  )
insert into [PortfolioProject].[dbo].[1yeartripdata_complete]

select ride_id
      ,rideable_type
      ,started_at
	  ,ended_at
      ,start_lat
      ,start_lng
      ,end_lat
      ,end_lng
      ,member_casual
      ,day_of_week
      ,ride_time
	  ,DATEPART(year, started_at) as year
	  ,DATEPART(month, started_at) as month
	  ,DATEDIFF(second, started_at, ended_at) as ride_length_seconds
    
from [PortfolioProject].[dbo].[202110-divvy-tripdata]
union all
select ride_id
      ,rideable_type
      ,started_at
	  ,ended_at
      ,start_lat
      ,start_lng
      ,end_lat
      ,end_lng
      ,member_casual
      ,day_of_week
      ,ride_time
	  ,DATEPART(year, started_at) as year
	  ,DATEPART(month, started_at) as month
	  ,DATEDIFF(second, started_at, ended_at) as ride_length_seconds
	  
    
from [PortfolioProject].[dbo].[202111-divvy-tripdata]
union all
select ride_id
      ,rideable_type
      ,started_at
	  ,ended_at
      ,start_lat
      ,start_lng
      ,end_lat
      ,end_lng
      ,member_casual
      ,day_of_week
      ,ride_time
	  ,DATEPART(year, started_at) as year
	  ,DATEPART(month, started_at) as month
	  ,DATEDIFF(second, started_at, ended_at) as ride_length_seconds

    
from [PortfolioProject].[dbo].[202112-divvy-tripdata]

union all
select ride_id
      ,rideable_type
      ,started_at
	  ,ended_at
      ,start_lat
      ,start_lng
      ,end_lat
      ,end_lng
      ,member_casual
      ,day_of_week
      ,ride_time
	  ,DATEPART(year, started_at) as year
	  ,DATEPART(month, started_at) as month
	  ,DATEDIFF(second, started_at, ended_at) as ride_length_seconds

    
from [PortfolioProject].[dbo].[202201-divvy-tripdata]

union all
select ride_id
      ,rideable_type
      ,started_at
	  ,ended_at
      ,start_lat
      ,start_lng
      ,end_lat
      ,end_lng
      ,member_casual
      ,day_of_week
      ,ride_time
	  ,DATEPART(year, started_at) as year
	  ,DATEPART(month, started_at) as month
	  ,DATEDIFF(second, started_at, ended_at) as ride_length_seconds

    
from [PortfolioProject].[dbo].[202202-divvy-tripdata]

union all
select ride_id
      ,rideable_type
      ,started_at
	  ,ended_at
      ,start_lat
      ,start_lng
      ,end_lat
      ,end_lng
      ,member_casual
      ,day_of_week
      ,ride_time
	  ,DATEPART(year, started_at) as year
	  ,DATEPART(month, started_at) as month
	  ,DATEDIFF(second, started_at, ended_at) as ride_length_seconds
    
from [PortfolioProject].[dbo].[202203-divvy-tripdata]

union all
select ride_id
      ,rideable_type
      ,started_at
	  ,ended_at
      ,start_lat
      ,start_lng
      ,end_lat
      ,end_lng
      ,member_casual
      ,day_of_week
      ,ride_time
	  ,DATEPART(year, started_at) as year
	  ,DATEPART(month, started_at) as month
	  ,DATEDIFF(second, started_at, ended_at) as ride_length_seconds

    
from [PortfolioProject].[dbo].[202204-divvy-tripdata]

union all
select ride_id
      ,rideable_type
      ,started_at
	  ,ended_at
      ,start_lat
      ,start_lng
      ,end_lat
      ,end_lng
      ,member_casual
      ,day_of_week
      ,ride_time
	  ,DATEPART(year, started_at) as year
	  ,DATEPART(month, started_at) as month
	  ,DATEDIFF(second, started_at, ended_at) as ride_length_seconds

from [PortfolioProject].[dbo].[202205-divvy-tripdata]

union all
select ride_id
      ,rideable_type
      ,started_at
	  ,ended_at
      ,start_lat
      ,start_lng
      ,end_lat
      ,end_lng
      ,member_casual
      ,day_of_week
      ,ride_time
	  ,DATEPART(year, started_at) as year
	  ,DATEPART(month, started_at) as month
	  ,DATEDIFF(second, started_at, ended_at) as ride_length_seconds

    
from [PortfolioProject].[dbo].[202206-divvy-tripdata]

union all
select ride_id
      ,rideable_type
      ,started_at
	  ,ended_at
      ,start_lat
      ,start_lng
      ,end_lat
      ,end_lng
      ,member_casual
      ,day_of_week
      ,ride_time
	  ,DATEPART(year, started_at) as year
	  ,DATEPART(month, started_at) as month
	  ,DATEDIFF(second, started_at, ended_at) as ride_length_seconds

    
from [PortfolioProject].[dbo].[202207-divvy-tripdata]

union all
select ride_id
      ,rideable_type
      ,started_at
	  ,ended_at
      ,start_lat
      ,start_lng
      ,end_lat
      ,end_lng
      ,member_casual
      ,day_of_week
      ,ride_time
	  ,DATEPART(year, started_at) as year
	  ,DATEPART(month, started_at) as month
	  ,DATEDIFF(second, started_at, ended_at) as ride_length_seconds
    
from [PortfolioProject].[dbo].[202208-divvy-tripdata]

union all
select ride_id
      ,rideable_type
      ,started_at
	  ,ended_at
      ,start_lat
      ,start_lng
      ,end_lat
      ,end_lng
      ,member_casual
      ,day_of_week
      ,ride_time
	  ,DATEPART(year, started_at) as year
	  ,DATEPART(month, started_at) as month
	  ,DATEDIFF(second, started_at, ended_at) as ride_length_seconds

    
from [PortfolioProject].[dbo].[202209-divvy-tripdata]


select top (100) *
from [PortfolioProject].[dbo].[1yeartripdata_complete]