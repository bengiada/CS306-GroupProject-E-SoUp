-- Find min and max values in the table
SELECT MIN(percentage) AS min_constraint, MAX(percentage) AS max_constraint
FROM Access_to_Electricity;

-- Add constraint to the table to prevent values outside the range
ALTER TABLE Access_to_Electricity
ADD CONSTRAINT nequal_check 
CHECK (percentage >= 1 AND percentage <= 100);

-- Insert a value outside the range to trigger the constraint
INSERT INTO Access_to_Electricity (date,percentage,iso_code) 
VALUES (2040,0,'ZZZ');
-- Error Code: 3819. Check constraint 'nequal_check' is violated.


