 create TABLE IF NOT EXISTS client (
  id SERIAL PRIMARY KEY,
  entity_name VARCHAR(255) NOT NULL,
  status VARCHAR(255) NOT NULL,
  created_on TIMESTAMP,
  created_by VARCHAR(255),
  updated_on TIMESTAMP,
  updated_by VARCHAR(255),
  secret_key VARCHAR(255) NOT NULL
);

 create TABLE IF NOT EXISTS client_aud (
  id SERIAL,
  rev INTEGER NOT NULL,
  revtype SMALLINT,
  entity_name VARCHAR(255),
  status VARCHAR(255),
  updated_on TIMESTAMP,
  updated_by VARCHAR(255),
  secret_key VARCHAR(255),
  CONSTRAINT client_aud_pkey PRIMARY KEY(id,rev)
);

create TABLE IF NOT EXISTS processor (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  status VARCHAR(255) NOT NULL,
  processor_code VARCHAR(255) NOT NULL,
  created_on TIMESTAMP,
  created_by VARCHAR(255),
  updated_on TIMESTAMP,
  updated_by VARCHAR(255)
);

create TABLE IF NOT EXISTS processor_aud (
  id SERIAL,
  rev INTEGER NOT NULL,
  revtype SMALLINT,
  updated_on TIMESTAMP,
  updated_by VARCHAR(255),
  name VARCHAR(255),
  status VARCHAR(255),
  processor_code VARCHAR(255),
  CONSTRAINT processor_aud_pkey PRIMARY KEY(id,rev)
);
create TABLE IF NOT EXISTS card_product (
  id SERIAL  PRIMARY KEY,
  card_type VARCHAR(3) NOT NULL,
  card_quantity BIGINT NOT NULL,
  card_product_name VARCHAR(55) NOT NULL,
  product_code VARCHAR(10),
  card_product_desc VARCHAR(1024),
  card_product_status VARCHAR(3),
  failure_reason VARCHAR(1024),
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP,
  created_on TIMESTAMP,
  created_by VARCHAR(255),
  updated_on TIMESTAMP,
  updated_by VARCHAR(255),
  reference_id VARCHAR(1024),
  client_id BIGINT NOT NULL,
  processor_id BIGINT NOT NULL,
  bin VARCHAR(9),
  FOREIGN KEY (client_id) REFERENCES Client (id),
  FOREIGN KEY (processor_id) REFERENCES Processor (id)
);

create TABLE IF NOT EXISTS card_product_aud (
  id SERIAL,
  rev INTEGER NOT NULL,
  revtype SMALLINT,
  updated_on TIMESTAMP,
  updated_by VARCHAR(255),
  card_type VARCHAR(3),
  card_quantity BIGINT,
  card_product_name VARCHAR(55),
  product_code VARCHAR(10),
  card_product_desc VARCHAR(1024),
  card_product_status VARCHAR(3),
  failure_reason VARCHAR(1024),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  reference_id VARCHAR(1024),
  bin VARCHAR(9),
  CONSTRAINT card_product_aud_pkey PRIMARY KEY(id,rev)
);

create TABLE IF NOT EXISTS card_holder (
  id SERIAL PRIMARY KEY,
  prefix VARCHAR(4),
  first_name VARCHAR(255) NOT NULL,
  middle_name VARCHAR(255),
  last_name VARCHAR(255) NOT NULL,
  mother_maiden_name VARCHAR(255),
  guardian_name VARCHAR(255),
  gender VARCHAR(255),
  nationality VARCHAR(255),
  citizen_status VARCHAR(255),
  display_name VARCHAR(255),
  dob DATE,
  is_minor BOOLEAN NOT NULL,
  isKYC BOOLEAN NOT NULL,
  isVIP BOOLEAN NOT NULL,
  client_provided_id VARCHAR(50),
  status VARCHAR(255) NOT NULL,
  profile_operation_mode VARCHAR(255),
  parent_card_holder_id BIGINT,
  parent_card_id BIGINT,
  notes VARCHAR(255),
  ssn VARCHAR(255),
  created_on TIMESTAMP,
  created_by VARCHAR(255),
  updated_on TIMESTAMP,
  updated_by VARCHAR(255),
  client_id BIGINT NOT NULL,
  FOREIGN KEY (client_id) REFERENCES Client (id)
);

create TABLE IF NOT EXISTS card_holder_aud (
  id SERIAL,
  rev INTEGER NOT NULL,
  revtype SMALLINT,
  updated_on TIMESTAMP,
  updated_by VARCHAR(255),
  citizen_status VARCHAR(255),
  client_provided_id VARCHAR(50),
  display_name VARCHAR(255),
  dob DATE,
  first_name VARCHAR(255),
  gender VARCHAR(255),
  guardian_name VARCHAR(255),
  is_minor BOOLEAN,
  isKYC BOOLEAN,
  isVIP BOOLEAN,
  middle_name VARCHAR(255),
  last_name VARCHAR(255),
  mother_maiden_name VARCHAR(255),
  nationality VARCHAR(255),
  prefix VARCHAR(4),
  profile_operation_mode VARCHAR(255),
  status VARCHAR(255),
  CONSTRAINT card_holder_aud_pkey PRIMARY KEY(id,rev)
);

create TABLE IF NOT EXISTS cards (
  id SERIAL PRIMARY KEY,
  account_number VARCHAR(255),
  parent_account_number VARCHAR(255),
  product_code VARCHAR(255),
  proxy_number VARCHAR(255),
  card_number VARCHAR(255),
  customer_id VARCHAR(255),
  account_currency VARCHAR(255),
  account_type VARCHAR(255),
  expires_at TIMESTAMP,
  card_expiry_date TIMESTAMP,
  name_on_card VARCHAR(255),
  status VARCHAR(255) NOT NULL,
  card_operation_mode VARCHAR(255),
  created_on TIMESTAMP,
  created_by VARCHAR(255),
  updated_on TIMESTAMP,
  updated_by VARCHAR(255),
  reference_id VARCHAR(255),
  card_holder_id BIGINT NOT NULL,
  card_product_id BIGINT NOT NULL,
  FOREIGN KEY (card_holder_id) REFERENCES card_holder (id),
  FOREIGN KEY (card_product_id) REFERENCES card_product (id)
);
create TABLE IF NOT EXISTS cards_aud (
  id SERIAL,
  rev INTEGER NOT NULL,
  revtype SMALLINT,
  updated_on TIMESTAMP,
  updated_by VARCHAR(255),
  account_currency VARCHAR(255),
  account_number VARCHAR(255),
  account_type VARCHAR(255),
  card_expiry_date TIMESTAMP,
  card_number VARCHAR(255),
  card_operation_mode VARCHAR(255),
  customer_id VARCHAR(255),
  expires_at TIMESTAMP,
  name_on_card VARCHAR(255),
  parent_account_number VARCHAR(255),
  product_code VARCHAR(255),
  proxy_number VARCHAR(255),
  status VARCHAR(255),
  CONSTRAINT cards_aud_pkey PRIMARY KEY(id,rev)
);

create TABLE IF NOT EXISTS program_gateway_funding_source (
  id SERIAL PRIMARY KEY,
  client_id BIGINT,
  reference_id VARCHAR(255)
);

create TABLE IF NOT EXISTS program_gateway_funding_source_aud (
  id SERIAL,
  rev INTEGER NOT NULL,
  revtype SMALLINT,
  client_id BIGINT,
  reference_id VARCHAR(255),
  CONSTRAINT program_gateway_funding_source_aud_pkey PRIMARY KEY(id,rev)
);

create TABLE IF NOT EXISTS three_ds_authentication (
  id SERIAL PRIMARY KEY,
  acs_transaction_id VARCHAR(255),
  profile_id BIGINT,
  card_id BIGINT,
  client_id BIGINT,
  processor_id BIGINT
);
create TABLE IF NOT EXISTS reference_id (
  id SERIAL PRIMARY KEY,
  token VARCHAR(1024) NOT NULL,
  parent_type VARCHAR(255),
  parent_id BIGINT NOT NULL,
  processor_id BIGINT NOT NULL,
  created_on TIMESTAMP,
  created_by VARCHAR(255),
  updated_on TIMESTAMP,
  updated_by VARCHAR(255)
);
create TABLE IF NOT EXISTS reference_id_aud (
  id SERIAL,
  rev INTEGER NOT NULL,
  revtype SMALLINT,
  updated_on TIMESTAMP,
  updated_by VARCHAR(255),
  token VARCHAR(1024),
  parent_type VARCHAR(255),
  parent_id BIGINT,
  processor_id BIGINT,
  CONSTRAINT reference_id_aud_pkey PRIMARY KEY(id,rev)
);

create TABLE IF NOT EXISTS velocity_control (
  id SERIAL PRIMARY KEY,
  velocity_control_id VARCHAR(255),
  client_id BIGINT,
  parent_id BIGINT,
  parent_type VARCHAR(255),
  created_on TIMESTAMP,
  created_by VARCHAR(255),
  updated_on TIMESTAMP,
  updated_by VARCHAR(255)
);

create TABLE IF NOT EXISTS velocity_control_aud (
  id SERIAL,
  rev INTEGER NOT NULL,
  revtype SMALLINT,
  updated_on TIMESTAMP,
  updated_by VARCHAR(255),
  velocity_control_id VARCHAR(255),
  client_id BIGINT,
  parent_id BIGINT,
  parent_type VARCHAR(255),
  CONSTRAINT velocity_control_aud_pkey PRIMARY KEY(id,rev)
);

create TABLE IF NOT EXISTS jit_funding_gateway_webhook (
  id SERIAL PRIMARY KEY,
  active BOOLEAN NOT NULL,
  basic_auth_password VARCHAR(255)NOT NULL,
  basic_auth_username VARCHAR(255)NOT NULL,
  client_id BIGINT NOT NULL,
  custom_header VARCHAR(3019),
  name VARCHAR(255)NOT NULL,
  secret VARCHAR(255),
  url VARCHAR(255)NOT NULL,
  use_mtls BOOLEAN
);

create TABLE IF NOT EXISTS jit_funding_gateway_webhook_aud (
  id SERIAL,
  rev INTEGER NOT NULL,
  revtype SMALLINT,
  active BOOLEAN,
  basic_auth_password VARCHAR(255),
  basic_auth_username VARCHAR(255),
  client_id BIGINT,
  name VARCHAR(255),
  secret VARCHAR(255),
  url VARCHAR(255),
  use_mtls BOOLEAN,
  CONSTRAINT jit_funding_gateway_webhook_aud_pkey PRIMARY KEY(id,rev)
);
CREATE TABLE IF NOT EXISTS business_representative (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    last_name VARCHAR(255) NOT NULL,
    prefix VARCHAR(24),
    role VARCHAR(255),
    user_id VARCHAR(255),
    gender VARCHAR(255),
    nationality VARCHAR(255),
    citizen_status VARCHAR(255),
    parent_type VARCHAR(3) NOT NULL,
    parent_id BIGINT NOT NULL,
    status VARCHAR(255) NOT NULL,
    created_on TIMESTAMP,
    created_by VARCHAR(255),
    updated_on TIMESTAMP,
    updated_by VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS business_representative_aud (
    id SERIAL,
    rev INTEGER NOT NULL,
    revtype SMALLINT,
    updated_on TIMESTAMP,
    updated_by VARCHAR(255),
    first_name VARCHAR(255),
    middle_name VARCHAR(255),
    last_name VARCHAR(255),
    prefix VARCHAR(24),
    role VARCHAR(255),
    user_id VARCHAR(255),
    gender VARCHAR(255),
    nationality VARCHAR(255),
    citizen_status VARCHAR(255),
    parent_type VARCHAR(3),
    parent_id BIGINT,
    status VARCHAR(255) ,
    CONSTRAINT business_representative_aud_pkey PRIMARY KEY(id,rev)
);

CREATE TABLE IF NOT EXISTS channel (
  id SERIAL PRIMARY KEY,
  preference_id BIGINT NOT NULL,
  channel_type INTEGER NOT NULL,
  status INTEGER NOT NULL,
  value BOOLEAN NOT NULL,
  created_on TIMESTAMP,
  created_by VARCHAR(255),
  updated_on TIMESTAMP,
  updated_by VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS channel_aud (
  id SERIAL,
  rev INTEGER NOT NULL,
  revtype SMALLINT,
  updated_on TIMESTAMP,
  updated_by VARCHAR(255),
  preference_id BIGINT,
  channel_type INTEGER ,
  status INTEGER,
  value BOOLEAN,
  CONSTRAINT channel_aud_pkey PRIMARY KEY(id,rev)
);
CREATE TABLE IF NOT EXISTS email_address (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) NOT NULL,
  is_verified BOOLEAN DEFAULT false,
  parent_type VARCHAR(3) NOT NULL,
  parent_id BIGINT NOT NULL,
  type VARCHAR(3) NOT NULL,
  status VARCHAR(3) NOT NULL,
  created_on TIMESTAMP,
  created_by VARCHAR(255),
  updated_on TIMESTAMP,
  updated_by VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS email_address_aud (
  id SERIAL,
  rev INTEGER NOT NULL,
  revtype SMALLINT,
  updated_on TIMESTAMP,
  updated_by VARCHAR(255),
  email VARCHAR(255),
  is_verified BOOLEAN DEFAULT false,
  parent_type VARCHAR(3),
  parent_id BIGINT,
  type VARCHAR(3),
  status VARCHAR(3),
  CONSTRAINT email_address_aud_pkey PRIMARY KEY(id,rev)
);
CREATE TABLE IF NOT EXISTS phone_number (
  id SERIAL PRIMARY KEY,
  phone_number VARCHAR(255) NOT NULL,
  is_verified BOOLEAN DEFAULT false,
  is_mobile BOOLEAN,
  parent_type VARCHAR(3),
  parent_id BIGINT,
  type VARCHAR(3) NOT NULL,
  status VARCHAR(3) NOT NULL,
  created_on TIMESTAMP,
  created_by VARCHAR(255),
  updated_on TIMESTAMP,
  updated_by VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS phone_number_aud (
  id SERIAL,
  rev INTEGER NOT NULL,
  revtype SMALLINT,
  updated_on TIMESTAMP,
  updated_by VARCHAR(255),
  is_verified BOOLEAN DEFAULT false,
  is_mobile BOOLEAN,
  phone_number VARCHAR(255),
  parent_type VARCHAR(3),
  parent_id BIGINT,
  type VARCHAR(3),
  status VARCHAR(3),
  CONSTRAINT phone_number_aud_pkey PRIMARY KEY(id,rev)
);

CREATE TABLE IF NOT EXISTS physical_address (
  id SERIAL PRIMARY KEY,
  address1 VARCHAR(1024),
  address2 VARCHAR(1024),
  address3 VARCHAR(1024),
  city VARCHAR(50),
  country VARCHAR(50),
  state VARCHAR(50),
  zip_code VARCHAR(50),
  parent_type VARCHAR(3) NOT NULL,
  parent_id BIGINT NOT NULL,
  type VARCHAR(50) NOT NULL,
  status VARCHAR(3) NOT NULL,
  created_on TIMESTAMP,
  created_by VARCHAR(255),
  updated_on TIMESTAMP,
  updated_by VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS physical_address_aud (
  id SERIAL,
  rev INTEGER NOT NULL,
  revtype SMALLINT,
  updated_on TIMESTAMP,
  updated_by VARCHAR(255),
  address1 VARCHAR(1024),
  address2 VARCHAR(1024),
  address3 VARCHAR(1024),
  city VARCHAR(50),
  country VARCHAR(50),
  state VARCHAR(50),
  zip_code VARCHAR(50),
  parent_type VARCHAR(3),
  parent_id BIGINT,
  type VARCHAR(50),
  status VARCHAR(3),
  CONSTRAINT physical_address_aud_pkey PRIMARY KEY(id,rev)
);
CREATE TABLE IF NOT EXISTS proof (
  id SERIAL PRIMARY KEY,
  parent_type VARCHAR(255),
  parent_id BIGINT NOT NULL,
  proof_type VARCHAR(255) NOT NULL,
  document_type VARCHAR(255) NOT NULL,
  proof_status VARCHAR(3),
  value VARCHAR(255) NOT NULL,
  expiration_date VARCHAR(255)NOT NULL,
  created_on TIMESTAMP,
  created_by VARCHAR(255),
  updated_on TIMESTAMP,
  updated_by VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS proof_aud (
  id SERIAL,
  rev INTEGER NOT NULL,
  revtype SMALLINT,
  updated_on TIMESTAMP,
  updated_by VARCHAR(255),
  parent_type VARCHAR(255),
  parent_id BIGINT,
  proof_type VARCHAR(255),
  document_type VARCHAR(255),
  proof_status VARCHAR(3),
  value VARCHAR(255),
  expiration_date VARCHAR(255),
  CONSTRAINT proof_aud_pkey PRIMARY KEY(id,rev)
);

CREATE TABLE IF NOT EXISTS security_question (
  id SERIAL PRIMARY KEY,
  answer1 VARCHAR(1024),
  answer2 VARCHAR(1024),
  answer3 VARCHAR(1024),
  parent_id BIGINT NOT NULL,
  parent_type VARCHAR(255)NOT NULL,
  question1 VARCHAR(1024),
  question2 VARCHAR(1024),
  question3 VARCHAR(1024),
  created_on TIMESTAMP,
  created_by VARCHAR(255),
  updated_on TIMESTAMP,
  updated_by VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS security_question_aud (
  id SERIAL,
  rev INTEGER NOT NULL,
  revtype SMALLINT,
  answer1 VARCHAR(1024),
  answer2 VARCHAR(1024),
  answer3 VARCHAR(1024),
  parent_id BIGINT,
  parent_type VARCHAR(255),
  question1 VARCHAR(1024),
  question2 VARCHAR(1024),
  question3 VARCHAR(1024),
  updated_on TIMESTAMP,
  updated_by VARCHAR(255),
  CONSTRAINT security_question_aud_pkey PRIMARY KEY(id,rev)
);

CREATE TABLE IF NOT EXISTS general_reason (
  id SERIAL PRIMARY KEY,
  type VARCHAR(3),
  parent_id BIGINT,
  parent_type VARCHAR(24),
  reason VARCHAR(1024) NOT NULL,
  remark VARCHAR(1024),
  created_on TIMESTAMP,
  created_by VARCHAR(255),
  updated_on TIMESTAMP,
  updated_by VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS general_reason_aud (
  id SERIAL,
  rev INTEGER NOT NULL,
  revtype SMALLINT,
  type VARCHAR(3),
  parent_id BIGINT,
  parent_type VARCHAR(24),
  reason VARCHAR(1024),
  remark VARCHAR(1024),
  updated_on TIMESTAMP,
  updated_by VARCHAR(255),
  CONSTRAINT general_reason_aud_pkey PRIMARY KEY(id,rev)
);

CREATE SEQUENCE IF NOT EXISTS hibernate_sequence
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE IF NOT EXISTS revinfo (
  rev INTEGER NOT NULL,
  revtstmp  BIGINT,
  CONSTRAINT revinfo_pkey PRIMARY KEY(rev)
);