# Quantigration RMA Database | MySQL Portfolio Project

![Relational database diagram](diagrams/rma_erd.png)

A relational database project for tracking product returns at a **fictional networking equipment manufacturer**. I built this project as part of database coursework and organized a public, reproducible portfolio version using **original, synthetic sample data**.

## Why this database exists

A shipping-and-receiving team needs to connect each product return (RMA) to the original order and customer. The database stores contact information, product orders, and the status of a return. Primary and foreign keys keep the data linked across tables.

## Tech and skills

**MySQL 8.0 · SQL · CSV · relational modeling · primary/foreign keys · joins · filtering · aggregation · INSERT/UPDATE/DELETE · ALTER TABLE · data export**

| Table | Primary key | Relationship |
| --- | --- | --- |
| `Customers` (later `Collaborators`) | `CustomerID` (later `CollaboratorID`) | One customer can have many orders |
| `Orders` | `OrderID` | Each order refers to a customer; an order can have multiple RMAs |
| `RMA` | `RMAID` | Each return refers to an order |

## Repository layout

```text
sql/
  01_create_database_and_tables.sql   Database and table structure
  02_seed_sample_data.sql             Insert fictional demo records
  02b_optional_import_csv.sql        Optional CSV import approach
  03_analysis_queries.sql            JOIN, WHERE, COUNT queries
  04_insert_new_records.sql          Insert four customers and orders
  05_update_and_delete.sql           Targeted UPDATE and DELETE
  06_rename_to_collaborators.sql     Rename tables, columns, index
  07_export_orders.sql               CSV export instructions

data/                                 Fictional sample CSVs (with headers)
diagrams/                             Original ERD (PNG, SVG, DOT source)
screenshots/                          15 cropped screenshots of my original lab SQL work
```

## Run the demo locally

**Requirements:** MySQL 8.x and a MySQL user allowed to create databases and tables.

In a terminal from the repository folder, run the SQL files **in order**:

```bash
mysql -u root -p < sql/01_create_database_and_tables.sql
mysql -u root -p < sql/02_seed_sample_data.sql
mysql -u root -p < sql/03_analysis_queries.sql
mysql -u root -p < sql/04_insert_new_records.sql
mysql -u root -p < sql/05_update_and_delete.sql
mysql -u root -p < sql/06_rename_to_collaborators.sql
```

Each command prompts for the MySQL password. Substitute your own user for `root` if needed. These scripts are designed for a **fresh database** and are not idempotent; don't rerun inserts or rename commands against an already modified schema. The schema name is `QuantigrationRMA_Portfolio`.

To demonstrate importing CSV files rather than SQL `INSERT` statements, use `sql/02b_optional_import_csv.sql` **instead of** `02_seed_sample_data.sql`. Update its absolute file paths and enable `LOCAL INFILE` where permitted. The included CSVs have column headers and LF line endings; the original class lab files had a different format. Never run both loading options in the same fresh database.

### Demo result checks

These are **expected results for the included synthetic demo dataset**, not the large academic lab dataset.

| Query / action | Expected result |
| --- | ---: |
| Seeded customers | 8 |
| Seeded orders | 11 |
| Seeded RMAs | 8 |
| Framingham order count, before four additions | 4 |
| Massachusetts customers, before additions | 3 |
| Woonsocket, Rhode Island customers | 2 |
| Customers after four new INSERTs | 12 |
| Orders after four new INSERTs | 15 |
| RMA `OrderID = 5175` after UPDATE | Complete / Credit Customer Account |
| Rejected RMAs removed | 3 |
| RMAs remaining after DELETE | 5 |
| Collaborators after renaming | 12 |

### Exporting the Orders table

`sql/07_export_orders.sql` shows how to use MySQL `SELECT ... INTO OUTFILE` for a CSV export. This step is intentionally **commented out**, since the correct output path, MySQL file privileges, and `secure_file_priv` settings depend on your computer. Update the path, remove the comment markers, and execute it after the rename script. The CSV export has no header by default and cannot overwrite an existing file.

## Work demonstrated in the original lab

In the separate course lab environment, I built the same three-table model and worked with a larger preloaded dataset. The following numbers are **observed results from that class environment only**; the smaller downloadable dataset in this repository intentionally produces different results.

| Lab operation | Observed result |
| --- | ---: |
| Customer rows imported | 37,994 |
| Order rows imported | 37,994 |
| RMA rows imported | 38,162 |
| Orders tied to Framingham, MA | 505 |
| Customers with State = Massachusetts | 982 |
| Customers in Woonsocket, RI | 7 |
| Rejected RMA rows deleted | 596 |
| Orders written to exported CSV | 37,998 |

## SQL evidence gallery — 15 screenshots

These are **screenshots of my original MySQL/Codio lab work**; they are separate from the smaller, independently prepared sample dataset in this repository. Images are cropped to remove my Codio account identifier and excess blank space; the displayed SQL statements and query results have not been altered. **Click a screenshot name** to open the full-resolution image.

| # | Evidence | What the output demonstrates |
| ---: | --- | --- |
| 01 | [Create database + Customers table](screenshots/01_database_and_customers_table.png) | Database creation and 8-column Customers structure |
| 02 | [Create Orders table](screenshots/02_orders_table_and_foreign_key.png) | Orders table with primary and customer foreign keys |
| 03 | [Create RMA table](screenshots/03_rma_table_and_relationship.png) | RMA structure and order foreign key |
| 04 | [Import Customers CSV](screenshots/04_import_customers_37994.png) | 37,994 customers loaded and verified |
| 05 | [Import Orders CSV](screenshots/05_import_orders_37994.png) | 37,994 orders loaded and verified |
| 06 | [Import RMA CSV](screenshots/06_import_rma_38162.png) | 38,162 RMA records loaded and verified |
| 07 | [SQL JOIN: Framingham](screenshots/07_join_framingham_orders.png) | JOIN + WHERE + COUNT returning 505 orders |
| 08 | [Filter Massachusetts customers](screenshots/08_massachusetts_customer_query.png) | SELECT / WHERE returning 982 records |
| 09 | [INSERT: Customers](screenshots/09_insert_four_customers.png) | 4 new customers added; total now 37,998 |
| 10 | [INSERT: Orders](screenshots/10_insert_four_orders.png) | 4 new orders added; total now 37,998 |
| 11 | [Filter Woonsocket customers](screenshots/11_count_woonsocket_customers.png) | COUNT + WHERE returning 7 customers |
| 12 | [UPDATE: RMA status](screenshots/12_update_rma_status.png) | Order 5175 changed from Pending to Complete |
| 13 | [DELETE: Rejected RMAs](screenshots/13_delete_rejected_rmas.png) | 596 rejected RMA rows deleted; 0 remain |
| 14 | [ALTER: Rename terminology](screenshots/14_rename_columns_and_index.png) | CollaboratorID and foreign key verified after rename |
| 15 | [Export Orders CSV](screenshots/15_export_orders_csv.png) | 37,998 rows written and verified in CSV |

### Selected evidence

**Relational table creation and foreign key**

![Orders table and foreign key validation from MySQL](screenshots/02_orders_table_and_foreign_key.png)

**SQL JOIN — 505 orders in Framingham, Massachusetts**

![INNER JOIN and COUNT output for Framingham orders](screenshots/07_join_framingham_orders.png)

**RMA update — before and after**

![UPDATE RMA and SELECT verifying changed status and step](screenshots/12_update_rma_status.png)

**CSV export — 37,998 orders written and verified**

![MySQL CSV export and file verification](screenshots/15_export_orders_csv.png)

The export evidence shows an initial file-read permission error followed by a successful permission adjustment, CSV line count, and sample output. Both the troubleshooting and verified result are included as authentic session evidence.

## What I learned

This project helped me practice database design, referential integrity, joining related data, updating a precise record safely using a `WHERE` clause, documenting data changes, and moving tabular data between CSV and MySQL. I also learned to check schema definitions and row counts to confirm the results.

## Project context and data use

This is an **educational portfolio project**, not a production application. “Quantigration” is a fictional scenario from a database course. The SQL is rewritten and organized for portfolio presentation, the diagram is newly drawn, and the published CSV records are synthetic. The original assignment instructions, grading rubric, course-provided diagrams, and source CSV datasets are **not** included.
