 ## Database Recommendation

 I would suggest MYSQL for patient management system.Health care data is important so it needs to be consistent, accurate and saftely stored. Patient records, precriptions and medical bills are important and need to be saved for future. 
 Since MYSQL is ACID compliant, it provides high reliability and is also consistent at all the times which is what is required in medical system. 

 Mongodb is flexible and eventually consistent making it little reliable when compared with MYSQL as it might take time to update data across the entire system. This is acceptable to some extent but not in maintaining Medical records which becomes very sensitive at some situations especially when treating patients in emergency state.

 For fruad detection, healthcare system can choose mongoDB. To analyze fraud detection, system requires huge amounts of unstructured historical data, and to deal with this huge volume of historical data mongoDB is recommended. 

 Overall My sugession is :
  MYSQL for Patient Record Management and mongoDB for fraud detection.