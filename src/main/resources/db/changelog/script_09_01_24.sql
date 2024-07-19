ALTER TABLE card_holder_aud ADD COLUMN IF NOT EXISTS parent_card_holder_id VARCHAR(255);

ALTER TABLE card_holder ALTER COLUMN parent_card_holder_id TYPE VARCHAR(255);

ALTER TABLE card_holder_aud ALTER COLUMN parent_card_holder_id TYPE VARCHAR(255);
