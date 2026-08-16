CREATE TABLE training_scores (
    score_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    exam_name VARCHAR(100) NOT NULL,
    score NUMERIC(5,2) CHECK (score BETWEEN 0 AND 100),
    exam_date DATE DEFAULT CURRENT_DATE
);