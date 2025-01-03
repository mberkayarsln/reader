DROP TABLE IF EXISTS Publishers;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS BookDetails;

CREATE TABLE Publishers(
	publisher_id INT AUTO_INCREMENT,
    publisher_name VARCHAR(100),
    
    PRIMARY KEY(publisher_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE Books (
	book_id INT AUTO_INCREMENT,
    isbn CHAR(13),
    title VARCHAR(300) NOT NULL,
    author_id INT,
    publication_year YEAR,
    publisher_id INT,
    
    PRIMARY KEY (book_id),
    
    FOREIGN KEY (author_id)
		REFERENCES Authors (author_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    
    FOREIGN KEY (publisher_id)
        REFERENCES Publishers (publisher_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE BookDetails (
	book_details_id INT AUTO_INCREMENT,
	book_id INT,
    rating DECIMAL(2,1) DEFAULT 0 CHECK(rating <= 10 AND rating >=0),
	language varchar(20),
    page_number SMALLINT,
    counts_of_review INT,
    
    PRIMARY KEY(book_details_id),
    
    FOREIGN KEY(book_id)
		REFERENCES Books (book_id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
