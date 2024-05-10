
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/
-- ALTER SESSION SET TIMESTAMP_OUTPUT_FORMAT = 'YYYY-MM-DD HH24:MI:SS.FF9 TZH:TZM';

{{ config(materialized='table') }}

with source_data as (

    select DATEDIFF(minute, STARTTIME,STOPTIME) as DURATION
    from CITIBIKE.PUBLIC.TRIPDATA_2013
)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
