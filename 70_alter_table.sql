DROP TABLE IF EXISTS training_scores;

CREATE TABLE training_scores (
    score_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    exam_name VARCHAR(100) NOT NULL,
    score NUMERIC(5,2) CHECK (score BETWEEN 0 AND 100),
    exam_date DATE DEFAULT CURRENT_DATE
);

ALTER TABLE training_scores
RENAME TO exam_results;

ALTER TABLE exam_results
RENAME COLUMN student_name TO full_name;

ALTER TABLE exam_results
ALTER COLUMN exam_name TYPE VARCHAR(150);

ALTER TABLE exam_results
ADD COLUMN passed BOOLEAN DEFAULT FALSE;

ALTER TABLE exam_results
ADD CONSTRAINT valid_score
CHECK (score BETWEEN 0 AND 100);

ALTER TABLE exam_results
DROP COLUMN passed;
