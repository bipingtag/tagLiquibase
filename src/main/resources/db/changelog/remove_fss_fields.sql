--remove column from card_holder
ALTER TABLE card_holder
DROP COLUMN IF EXISTS  profile_operation_mode,
DROP COLUMN IF EXISTS  client_provided_id;

--remove column from card_holder_aud
ALTER TABLE card_holder_aud
DROP COLUMN IF EXISTS  profile_operation_mode,
DROP COLUMN IF EXISTS  client_provided_id;

--remove column from cards
ALTER TABLE cards
DROP COLUMN IF EXISTS  card_operation_mode,
DROP COLUMN IF EXISTS  customer_id,
DROP COLUMN IF EXISTS  name_on_card,
DROP COLUMN IF EXISTS  proxy_number,
DROP COLUMN IF EXISTS  product_code;

--remove column from cards_aud
ALTER TABLE cards_aud
DROP COLUMN IF EXISTS  card_operation_mode,
DROP COLUMN IF EXISTS  customer_id,
DROP COLUMN IF EXISTS  name_on_card,
DROP COLUMN IF EXISTS  proxy_number,
DROP COLUMN IF EXISTS  product_code;

--DROP TABLES IF EXISTS
DROP TABLE IF EXISTS account_subsidiary_data_aud;
DROP TABLE IF EXISTS account_subsidiary_data;
DROP TABLE IF EXISTS account_aud;
DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS anonymous_profile;
DROP TABLE IF EXISTS profile_aud;
DROP TABLE IF EXISTS profile;
DROP TABLE IF EXISTS program_aud;
DROP TABLE IF EXISTS program;
DROP TABLE IF EXISTS business_representative;
