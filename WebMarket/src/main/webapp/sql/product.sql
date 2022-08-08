CREATE TABLE product(
	p_id VARCHAR(10) NOT NULL,
	p_name VARCHAR(20),
	P_unitPrice INTEGER,
	p_description TEXT,
	P_category VARCHAR(20),
	p_manufacturer VARCHAR(20),
	p_unitsInStock LONG,
	p_condition VARCHAR(20),
	p_fileName VARCHAR(20),
	PRIMARY KEY(p_id)
);

INSERT INTO product VALUES('P1234', 'iPhone 6s', 800000, '1334X750 Renina HD display 8-megapixel iSight Camera', 
   'Smart Phone', 'Apple', 1000, 'new', 'P1234.png');
INSERT INTO product VALUES('P1235', 'LG PC gram', 1500000, '3.3-inch, IPS LED display, 5rd Generation Intel Core Processors', 
   'Notebook', 'LG', 1000, 'new', 'P1235.png');
INSERT INTO product VALUES('P1236', 'Galaxy Tab S', 900000, '3.3-inch, 212.8*125.6*6.6mm, Super AMOLED display, 
   Octa-core processor', 'Tablet', 'Samsung', 1000, 'new', 'P1236.png');