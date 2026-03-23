## ETL Decisions

## Decision 1 — Standardising Category Casing
Problem: Category column had inconsistent casing.
category'Electronics'appeared as 'electronics'.
This would cause GROUP BY queries to treat them as separate categories.

Resolution: Applied title-case normalisation to all category values using
str.title(), so 'electronics' and 'Electronics' both became 'Electronics'.


## Decision 2 — Resolving NULL Values for store_city 
Problem: Some rows had NULL values in the `store_city` column. Since dim_store
requires store_city NOT NULL, these rows would either fail on insert action.

Resolution: dropping the affected rows, a lookup dictionary was
built mapping each store_name to its known city (e.g. 'Mumbai Central' ->
'Mumbai'). The NULL city values were filled using this mapping, since store_name
was always present and consistent, allowing all 19 rows to be recovered cleanly.

## Decision 3 — Groceries mapped to Grocery
Problem: Groceries' appeared as 'Grocery'.
This would cause GROUP BY queries to treat them as separate categories.

Resolution: 'Groceries' was mapped to 'Grocery' to eliminate the duplicate
category name before loading into dim_product.
