# Screenshot index

This directory contains **15 distinct screenshots** from the original Codio MySQL project, in roughly the order the steps were performed. SQL statements, schema details, record counts, and terminal output are real evidence from that class lab. Screenshots are **not** claimed to be output from the smaller synthetic demo dataset included in `data/`.

The screenshots were **cropped** to remove the Codio account identifier and unused screen space, without editing the SQL text or query results. The CSV export screenshot intentionally retains the temporary permission error and its successful resolution.

| # | File | Demonstrated skill |
|---:|---|---|
| 01 | [01_database_and_customers_table.png](01_database_and_customers_table.png) | Database creation and 8-column Customers structure |
| 02 | [02_orders_table_and_foreign_key.png](02_orders_table_and_foreign_key.png) | Orders table with primary and customer foreign keys |
| 03 | [03_rma_table_and_relationship.png](03_rma_table_and_relationship.png) | RMA structure and order foreign key |
| 04 | [04_import_customers_37994.png](04_import_customers_37994.png) | 37,994 customers loaded and verified |
| 05 | [05_import_orders_37994.png](05_import_orders_37994.png) | 37,994 orders loaded and verified |
| 06 | [06_import_rma_38162.png](06_import_rma_38162.png) | 38,162 RMA records loaded and verified |
| 07 | [07_join_framingham_orders.png](07_join_framingham_orders.png) | JOIN + WHERE + COUNT returning 505 orders |
| 08 | [08_massachusetts_customer_query.png](08_massachusetts_customer_query.png) | SELECT / WHERE returning 982 records |
| 09 | [09_insert_four_customers.png](09_insert_four_customers.png) | 4 new customers added; total now 37,998 |
| 10 | [10_insert_four_orders.png](10_insert_four_orders.png) | 4 new orders added; total now 37,998 |
| 11 | [11_count_woonsocket_customers.png](11_count_woonsocket_customers.png) | COUNT + WHERE returning 7 customers |
| 12 | [12_update_rma_status.png](12_update_rma_status.png) | Order 5175 changed from Pending to Complete |
| 13 | [13_delete_rejected_rmas.png](13_delete_rejected_rmas.png) | 596 rejected RMA rows deleted; 0 remain |
| 14 | [14_rename_columns_and_index.png](14_rename_columns_and_index.png) | CollaboratorID and foreign key verified after rename |
| 15 | [15_export_orders_csv.png](15_export_orders_csv.png) | 37,998 rows written and verified in CSV |
