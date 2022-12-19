------Month analysis count and avarage duration

select month, member_casual, count(ride_id) as total_rides, avg(ride_length_seconds) as avg_ride_lenght
from [PortfolioProject].[dbo].[1yeartripdata_complete]
group by member_casual, month
order by 1



---- Annual rides growth

---member

with CTE_member_annual_growth as
(
select count(ott.ride_id) as total_start,
count(sett.ride_id) as total_end
from [PortfolioProject].[dbo].[202110-divvy-tripdata] ott
full outer join [PortfolioProject].[dbo].[202209-divvy-tripdata] sett
on ott.started_at = sett.started_at

where sett.member_casual = 'member' or ott.member_casual = 'member'
)



select 
(cast(total_end as decimal) - cast(total_start as decimal)) / cast(total_start as decimal) as member_annual_growth

from CTE_member_annual_growth

 ---- casual

with CTE_casual_annual_growth as
(
select count(ott.ride_id) as total_start,
count(sett.ride_id) as total_end
from [PortfolioProject].[dbo].[202110-divvy-tripdata] ott
full outer join [PortfolioProject].[dbo].[202209-divvy-tripdata] sett
on ott.started_at = sett.started_at

where sett.member_casual = 'casual' or ott.member_casual = 'casual'
)

select 
(cast(total_end as decimal) - cast(total_start as decimal)) / cast(total_start as decimal) as member_annual_growth

from CTE_casual_annual_growth

----------union both------------------------

with 
CTE_member_annual_growth as
(
select count(ott.ride_id) as total_start,
count(sett.ride_id) as total_end
from [PortfolioProject].[dbo].[202110-divvy-tripdata] ott
full outer join [PortfolioProject].[dbo].[202209-divvy-tripdata] sett
on ott.started_at = sett.started_at

where sett.member_casual = 'member' or ott.member_casual = 'member'
)

,

CTE_casual_annual_growth as
(
select count(ott.ride_id) as total_start,
count(sett.ride_id) as total_end
from [PortfolioProject].[dbo].[202110-divvy-tripdata] ott
full outer join [PortfolioProject].[dbo].[202209-divvy-tripdata] sett
on ott.started_at = sett.started_at

where sett.member_casual = 'casual' or ott.member_casual = 'casual'
)

select 
total_start, total_end,
(cast(total_end as decimal) - cast(total_start as decimal)) / cast(total_start as decimal) as member_casual_annual_growth
from CTE_member_annual_growth

union all

select 
total_start, total_end,
(cast(total_end as decimal) - cast(total_start as decimal)) / cast(total_start as decimal) as casual_annual_growth

from CTE_casual_annual_growth


------------ total ride by user

select member_casual
, count(ride_id) as total_rides
from [PortfolioProject].[dbo].[1yeartripdata]
group by member_casual

------ total users

select member_casual, count(distinct(ride_id)) as total_users

from [PortfolioProject].[dbo].[1yeartripdata]

group by member_casual


----------- total bike type per user

select member_casual
,count(case when rideable_type = 'electric_bike' then 1 end) as total_electric_bike
,count(case when rideable_type = 'classic_bike' then 1 end ) as total_classic_bike
,count(case when rideable_type = 'docked_bike' then 1 end) as total_docked_bike
from [PortfolioProject].[dbo].[1yeartripdata]
group by member_casual

--------- rides and duration per week day

select day_of_week, member_casual
, count(ride_id) as total_rides
, avg(ride_length_seconds) as avg_duration_in_sec
from [PortfolioProject].[dbo].[1yeartripdata_complete]
group by member_casual, day_of_week
order by 2,3 desc

------------ day of week analysis 
with CTE_1yeartripdata as

(select ride_id, member_casual, ride_length, rideable_type, day_of_week,
DATEPART(year, started_at) as year,
DATEPART(month, started_at) as month,
DATEDIFF(second, started_at, ended_at) as ride_length_seconds

from [PortfolioProject].[dbo].[1yeartripdata])

select day_of_week
,count(case when member_casual = 'member' then 1 end) as total_member_rides
,count(case when member_casual = 'casual' then 1 end) as total_casual_rides
,count(member_casual) as total_rides
,avg(convert(bigint,ride_length_seconds)) as avg_ride_length_seconds
from CTE_1yeartripdata
group by day_of_week
order by 4 desc


-------- total and average ride duration by user

with CTE_1yeartripdata as

(select ride_id, member_casual, ride_length, rideable_type, day_of_week,
DATEPART(year, started_at) as year,
DATEPART(month, started_at) as month,
DATEDIFF(second, started_at, ended_at) as ride_length_seconds

from [PortfolioProject].[dbo].[1yeartripdata])

select member_casual
      ,count(ride_id) as total_ride
	  ,sum(convert(bigint,ride_length_seconds))/ 3600  as hours
	  ,(sum(convert(bigint,ride_length_seconds)) % 3600) / 60 as minutes
	  ,sum(convert(bigint,ride_length_seconds)) % 60 as seconds
	  , (avg(convert(bigint,ride_length_seconds)) % 3600) / 60 as avg_ride_length_minutes
	  , avg(convert(bigint,ride_length_seconds)) % 60 as avg_ride_length_seconds

from CTE_1yeartripdata
group by member_casual

------ Assigningn part of the day

select top (100) member_casual, ride_time, ride_length_seconds,
case
        when ride_time between '12:00:00.0000000' and '17:59:59.9999999' then 'afternoon'
		when ride_time between '18:00:00.0000000' and '23:59:59.9999999' then 'evening'
		when ride_time between '00:00:00.0000000' and '04:59:59.9999999' then 'night'
        else 'morning'
		end as part_of_day

from [PortfolioProject].[dbo].[1yeartripdata_complete]

------------- analysis on part of the day rides

with CTE_week as

(select * ,
case
        when ride_time between '12:00:00.0000000' and '17:59:59.9999999' then 'afternoon'
		when ride_time between '18:00:00.0000000' and '23:59:59.9999999' then 'evening'
		when ride_time between '00:00:00.0000000' and '04:59:59.9999999' then 'night'
        else 'morning'
		end as part_of_day

from [PortfolioProject].[dbo].[1yeartripdata_complete]
)

select part_of_day
,count(case when member_casual = 'member' then 1 end) as total_member_rides
,count(case when member_casual = 'casual' then 1 end) as total_casual_rides
,count(member_casual) as total_rides
,avg(convert(bigint,ride_length_seconds)) / 60 as avg_ride_length_minutes
from CTE_week

group by part_of_day
order by 4 desc