-- Nettoyage
DROP TABLE IF EXISTS exam_results;
DROP TABLE IF EXISTS students CASCADE;

-- Table des étudiants
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Table des résultats
CREATE TABLE exam_results (
    result_id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL,
    exam_name VARCHAR(100) NOT NULL,
    score NUMERIC(5,2),
    passed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    CONSTRAINT chk_score
        CHECK (score BETWEEN 0 AND 100),

    CONSTRAINT uq_student_exam
        UNIQUE (student_id, exam_name)
);