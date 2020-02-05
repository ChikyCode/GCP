Complete Job
--------------------------------------------------------------------------------------------------------------

#!/bin/bash
bq query --use_legacy_sql=False "Insert into LOG_DB.Global_Log values ('ImpressionData','UAE_SORTING_SYSTEM_STAGE',(Select Count(*) FROM Test.ImpressionData),current_datetime(),'Before load ImpressionData')" && bq load Test.ImpressionData  gs://uae_impression_data_stg/Cat_Impression_Data.csv && bq query --use_legacy_sql=False "Insert into LOG_DB.Global_Log values ('ImpressionData','UAE_SORTING_SYSTEM_STAGE',(Select Count(*) FROM Test.ImpressionData),current_datetime(),'After load ImpressionData')"

if [ $? -eq 0 ];
then
   gsutil del gs://uae_impression_data_stg/Cat_Impression_Data.csv && bq query --use_legacy_sql=False "Insert into LOG_DB.Global_Log values ('ImpressionData','UAE_SORTING_SYSTEM_STAGE',0,current_datetime(),'Drop uae_impression_data_stg.Cat_Impression_Data')"   
else
   bq query --use_legacy_sql=False "Insert into LOG_DB.Global_Log values ('ImpressionData','UAE_SORTING_SYSTEM_STAGE',0,current_datetime(),'Load & Drop Job Failed')"   
fi




Check individually Each job 
--------------------------------------------------------------------------------------------------------------

bq query --use_legacy_sql=False "Insert into LOG_DB.Global_Log values ('ImpressionData','UAE_SORTING_SYSTEM_STAGE',(Select Count(*) FROM Test.ImpressionData),current_datetime(),'Before load ImpressionData')" && bq load Test.ImpressionData  gs://uae_impression_data_stg/Cat_Impression_Data.csv && bq query --use_legacy_sql=False "Insert into LOG_DB.Global_Log values ('ImpressionData','UAE_SORTING_SYSTEM_STAGE',(Select Count(*) FROM Test.ImpressionData),current_datetime(),'After load ImpressionData')"

gsutil del gs://uae_impression_data_stg/Cat_Impression_Data.csv && bq query --use_legacy_sql=False "Insert into LOG_DB.Global_Log values ('ImpressionData','UAE_SORTING_SYSTEM_STAGE',0,current_datetime(),'Drop uae_impression_data_stg.Cat_Impression_Data')"   

bq query --use_legacy_sql=False "Insert into LOG_DB.Global_Log values ('ImpressionData','UAE_SORTING_SYSTEM_STAGE',0,current_datetime(),'Load & Drop Job Failed')"   

