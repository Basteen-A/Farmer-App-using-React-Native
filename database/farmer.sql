CREATE DATABASE farm_tractor;
USE farm_tractor;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  is_admin TINYINT DEFAULT 0
);

CREATE TABLE tractor_fields (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  cost_per_hour DECIMAL(10,2) NOT NULL
);

CREATE TABLE bills (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  field_name VARCHAR(255),
  time DECIMAL(10,2),
  cost DECIMAL(10,2),
  status VARCHAR(50) DEFAULT 'pending',
  payment_method VARCHAR(50),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Initial data
INSERT INTO users (username, password, is_admin) VALUES ('admin', 'admin123', 1);
INSERT INTO tractor_fields (name, cost_per_hour) VALUES 
  ('rotavater', 900),
  ('cultivator', 800),
  ('harvester', 1200),
  ('balor', 1000),
  ('tailor', 850);