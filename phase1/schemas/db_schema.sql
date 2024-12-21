-- Create the HOST table
CREATE TABLE IF NOT EXISTS HOST (
    id INT PRIMARY KEY,
    url VARCHAR(255),
    name VARCHAR(255),
    about TEXT,
    is_superhost BOOLEAN,
    thumbnail_url VARCHAR(255),
    picture_url VARCHAR(255),
    verifications TEXT,
    location VARCHAR(255),
    neighbourhood VARCHAR(255)
);

-- Create the HOST_STATISTICS table
CREATE TABLE IF NOT EXISTS HOST_STATISTICS (
    id INT PRIMARY KEY,
    host_id INT,
    since DATE,
    response_time VARCHAR(255),
    response_rate FLOAT,
    acceptance_rate FLOAT,
    listings_count INT,
    total_listings_count INT,
    calculated_host_listings_count INT,
    calculated_host_listings_count_entire_homes INT,
    calculated_host_listings_count_private_rooms INT,
    calculated_host_listings_count_shared_rooms INT,
    FOREIGN KEY (host_id) REFERENCES HOST(id)
);

-- Create the LISTINGS table
CREATE TABLE IF NOT EXISTS LISTINGS (
    id INT PRIMARY KEY,
    host_id INT,
    base_price FLOAT,
    instant_bookable BOOLEAN,
    has_availability BOOLEAN,
    minimum_nights INT,
    maximum_nights INT,
    last_scraped DATE,
    picture_url VARCHAR(255),
    listing_url VARCHAR(255),
    name VARCHAR(255),
    description TEXT,
    neighborhood_overview TEXT,
    neighborhood VARCHAR(255),
    latitude FLOAT,
    longitude FLOAT,
    bathrooms FLOAT,
    bathrooms_text VARCHAR(255),
    property_type VARCHAR(255),
    room_type VARCHAR(255),
    accommodates INT,
    bedrooms FLOAT,
    beds FLOAT,
    amenities TEXT,
    FOREIGN KEY (host_id) REFERENCES HOST(id)
);

-- Create the CALENDAR table
CREATE TABLE IF NOT EXISTS CALENDAR (
    id INT PRIMARY KEY,
    listing_id INT,
    date DATE,
    available BOOLEAN,
    price FLOAT,
    FOREIGN KEY (listing_id) REFERENCES LISTINGS(id)
);

-- Create the REVIEWS table
CREATE TABLE IF NOT EXISTS REVIEWS (
    id INT PRIMARY KEY,
    listing_id INT,
    date DATE,
    reviewer_id INT,
    reviewer_name VARCHAR(255),
    comments TEXT,
    FOREIGN KEY (listing_id) REFERENCES LISTINGS(id)
);

-- Create the AVAILABILITY_STATISTICS table
CREATE TABLE IF NOT EXISTS AVAILABILITY_STATISTICS (
    id INT PRIMARY KEY,
    listing_id INT,
    availability_30 INT,
    availability_60 INT,
    availability_90 INT,
    availability_365 INT,
    minimum_minimum_nights INT,
    maximum_minimum_nights INT,
    minimum_maximum_nights INT,
    maximum_maximum_nights INT,
    minimum_nights_avg_ntm FLOAT,
    maximum_nights_avg_ntm FLOAT,
    FOREIGN KEY (listing_id) REFERENCES LISTINGS(id)
);

-- Create the REVIEWS_STATISTICS table
CREATE TABLE IF NOT EXISTS REVIEWS_STATISTICS (
    id INT PRIMARY KEY,
    listing_id INT,
    number_of_reviews INT,
    number_of_reviews_ltm INT,
    number_of_reviews_l30d INT,
    first_review DATE,
    last_review DATE,
    scores_rating FLOAT,
    scores_accuracy FLOAT,
    scores_cleanliness FLOAT,
    review_scores_checkin FLOAT,
    review_scores_communication FLOAT,
    review_scores_location FLOAT,
    review_scores_value FLOAT,
    reviews_per_month FLOAT,
    FOREIGN KEY (listing_id) REFERENCES LISTINGS(id)
);
