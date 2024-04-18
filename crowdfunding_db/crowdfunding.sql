-- after creating tables using schema (check if tables created correctly)
SELECT * FROM campaign;

SELECT * FROM category;

SELECT * FROM contacts;

SELECT * FROM subcategory;

-- after importing data (check if data imported correctly)
-- imported campaign last (foreign keys dependent on other tables)
SELECT * FROM category;

SELECT * FROM subcategory;

SELECT * FROM contacts;

SELECT * FROM campaign;



