#!/bin/bash
bq load UAE_SORTING_SYSTEM_STAGE.ImpressionData  gs://uae_impression_data_stg/Cat_Impression_Data.csv > /home/shabi_victor/log/load_ImpressionData/`date +\%Y\%m\%d\%H\%M\%S`-Load_FCDATALAKE_UAE_SORTING_SYSTEM_Impression_Data.log 2>&1

if [ $? -eq 0 ];
then
   gsutil del gs://uae_impression_data_stg/Cat_Impression_Data.csv > /home/shabi_victor/log/drop_ImpressionData/`date +\%Y\%m\%d\%H\%M\%S`-Drop_FCDATALAKE_UAE_SORTING_SYSTEM_Impression_Data.log 2>&1   
else
   echo 'load & drop job failed' > /home/shabi_victor/log/failed_Jobs/`date +\%Y\%m\%d\%H\%M\%S`-Failed_FCDATALAKE_UAE_SORTING_SYSTEM_Impression_Data.log 2>&1
fi
