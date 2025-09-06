-- Users table (multi-role)
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(120) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  role VARCHAR(20) NOT NULL, -- 'admin', 'staff', 'intern', 'advertiser'
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Internships
CREATE TABLE internships (
  id SERIAL PRIMARY KEY,
  title VARCHAR(150) NOT NULL,
  description TEXT,
  eligibility VARCHAR(255),
  deadline DATE,
  image_url VARCHAR(255),
  created_by INT REFERENCES users(id),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Internship Applications
CREATE TABLE applications (
  id SERIAL PRIMARY KEY,
  internship_id INT REFERENCES internships(id),
  user_id INT REFERENCES users(id),
  resume_url VARCHAR(255),
  motivation TEXT,
  status VARCHAR(20) DEFAULT 'pending', -- pending, accepted, rejected
  applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Advertisements
CREATE TABLE ads (
  id SERIAL PRIMARY KEY,
  title VARCHAR(120) NOT NULL,
  organization VARCHAR(120),
  description TEXT,
  contact_info VARCHAR(120),
  type VARCHAR(20), -- 'government', 'private'
  url VARCHAR(255),
  status VARCHAR(20) DEFAULT 'pending', -- pending, approved, rejected
  posted_by INT REFERENCES users(id),
  posted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- News & Events
CREATE TABLE news_events (
  id SERIAL PRIMARY KEY,
  title VARCHAR(150) NOT NULL,
  snippet VARCHAR(255),
  content TEXT,
  image_url VARCHAR(255),
  event_date DATE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);