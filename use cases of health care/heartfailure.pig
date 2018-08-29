health = load '/home/cloudera/Desktop/Payment_and_value_of_care_-_Hospital.csv' using PigStorage('\t') as (ProviderID:chararray,HospitalName:chararray,Address:chararray,City:chararray,State:chararray,ZIPCode:chararray,Countyname:chararray,Phonenumber:chararray,Paymentmeasurename:chararray,PaymentmeasureID:chararray,Paymentcategory:chararray,Denominator:chararray,Payment:chararray,Lowerestimate:chararray,Higherestimate:chararray,Paymentfootnote:chararray,Valueofcaredisplayname:chararray,ValueofcaredisplayID:chararray,Valueofcarecategory:chararray,Valueofcarefootnote:chararray,MeasureStartDate:chararray,MeasureEndDate:chararray,Location:chararray);
result = filter health by Paymentmeasurename == 'Payment for heart failure patients';
result1 = FOREACH result generate ProviderID,HospitalName,Payment,Location;
STORE result1 into '/home/cloudera/Desktop/heartfailure' using PigStorage(',');