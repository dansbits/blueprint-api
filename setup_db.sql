CREATE TABLE screening_questions (
  question_id VARCHAR(50) PRIMARY KEY,
  domain VARCHAR(50)
);

INSERT INTO screening_questions (question_id, domain)
VALUES
  ("question_a", "depression"),
  ("question_b", "depression"),
  ("question_c", "mania"),
  ("question_d", "mania"),
  ("question_e", "anxiety"),
  ("question_f", "anxiety"),
  ("question_g", "anxiety"),
  ("question_h", "substance_use");