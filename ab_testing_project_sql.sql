CREATE DATABASE IF NOT EXISTS ab_test_lab;
USE ab_test_lab;

CREATE TABLE client_profiles (
client_id INT PRIMARY KEY,
clnt_tenure_yr INT,
clnt_tenure_mnth INT,
clnt_age INT,
gendr VARCHAR(10),
num_accts INT,
bal DECIMAL(12,2),
calls_6_mnth INT,
logons_6_mnth INT );

CREATE TABLE digital_footprints (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    visitor_id VARCHAR(50),
    visit_id VARCHAR(50),
    process_step VARCHAR(100),
    date_time DATETIME,
    FOREIGN KEY (client_id) REFERENCES client_profiles(client_id)
);

CREATE TABLE experiment_roster (
    client_id INT PRIMARY KEY,
    variation VARCHAR(20),  -- 'control' o 'test'
    FOREIGN KEY (client_id) REFERENCES client_profiles(client_id)
);

