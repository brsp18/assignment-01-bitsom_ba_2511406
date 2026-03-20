
// OP1: insertMany() — insert all 3 documents from sample_documents.json

db.products.insertMany([
  {
  "category": "Electronics",
  "product_name": "Phone",
  "specs": {
    "processor": "Qualcomm Snapdragon 8",
    "memory_gb": 6,
    "storage": "64GB",
    "size_inches": 6.5,
    "resolution": "1080 x 2340",
    "battery_life_hours": 10,
    "warranty_years": 2,
    "price_usd": 50000,
    "available_colors": ["Silver", "Black"]
        }
},
  
{
 "category": "Clothing",
 "gender": "Female",
 "age_range": "10yrs-12yrs",
 "specs": {
 "size": "Medium",
 "color": "Pink",
 "fit": "Regular",
 "availability": ["Online-Only", "InStore"],
 "price_usd": 50
 }
 
},

{
 "category": "Groceries",
 "product_name": "Chips",
 "manufactured_date": "2026-01-01",
 "expiry_date": "2026-12-31",
 "size": "Family size",
 "specs":{
   "ingredients": ["Potatoes","Oil","Salt"],
 "allergens": "None",
 "price_usd": 10
 }
}
 
]);


// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({ price_usd : {$gt:20000}})



// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({ expiry_date : {$lt:"2025-01-01"}})



// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
    { product_name : "Phone"},
    {$set : {discount_percent : 20}}
)


// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category : 1})
// creating an index will improve performance when querying for filtering or sorting.
// without indexing, mongoDB will scan for all the documents. 
// With index, it directly jumps to matching category.