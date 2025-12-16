-- 1. set the user role as sysadmin
-- 2. create database
-- 3. creating the schemas inside the swiggy database
-- 4. creating the csv file format since the source files are in csv
-- 5. creating stage for storing the raw source data
-- 6. create a tag and masking policies

--step: 1
use role sysadmin;

--step 2
create database if not exists swiggy;

use database swiggy;

--step 3
create schema if not exists stage_sch;
create schema if not exists clean_sch;
create schema if not exists consumption_sch;
create schema if not exists common;

use schema stage_sch;

--step 4
create file format if not exists stage_sch.csv_format
 type = 'csv'
 compression = 'auto'
 field_delimiter = ','
 record_delimiter = '\n'
 skip_header = 1
 field_optionally_enclosed_by = '\042'
 null_if = ('\\N');

--step 5
create stage if not exists stage_sch.csv_stg
    directory = ( enable = true )
    comment = 'the stage is used to store the source data- internal stage';

--step 6 
create or replace tag 
    common.pii_policy_tag
    allowed_values 'PII', 'PRICE', 'SENSITIVE', 'EMAIL'
    comment = 'this is PII tag object';

create or replace masking policy
    common.email_masking_policy as (email_text string)
    returns string -> 
    to_varchar('** EMAIL **');

create or replace masking policy 
    common.phone_masking_policy as (phone string)
    returns string -> 
    to_varchar('** Phone **');