
-- 72_ddl_challenge.sql

DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;

CREATE TABLE courses (
    course_id SERIAL,
    course_name VARCHAR(100) NOT NULL,
    level VARCHAR(20),
    duration_hours INTEGER,

    CONSTRAINT pk_courses
        PRIMARY KEY (course_id),

    CONSTRAINT chk_course_level
        CHECK (level IN ('Beginner', 'Intermediate', 'Advanced')),

    CONSTRAINT chk_duration_hours
        CHECK (duration_hours > 0)
);

CREATE TABLE enrollments (
    enrollment_id SERIAL,
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_enrollments
        PRIMARY KEY (enrollment_id),

    CONSTRAINT fk_enrollments_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    CONSTRAINT fk_enrollments_course
        FOREIGN KEY (course_id)
        REFERENCES courses(course_id),

    CONSTRAINT uq_student_course
        UNIQUE (student_id, course_id)
);