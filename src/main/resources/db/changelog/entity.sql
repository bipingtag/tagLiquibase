CREATE TABLE IF NOT EXISTS webhook (
    id SERIAL PRIMARY KEY,
    created_by VARCHAR(255),
    created_on TIMESTAMP,
    updated_by VARCHAR(255),
    updated_on TIMESTAMP,
    name VARCHAR(255) NOT NULL,
    active BOOLEAN NOT NULL DEFAULT FALSE,
    url VARCHAR(255) NOT NULL,
    secret VARCHAR(255),
    basic_auth_username VARCHAR(255) NOT NULL,
    basic_auth_password VARCHAR(255) NOT NULL,
    use_mtls BOOLEAN NOT NULL DEFAULT FALSE,
    client_id BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS webhook_events (
    webhook_id BIGINT NOT NULL,
    event VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS webhook_custom_header (
    webhook_id BIGINT NOT NULL,
    custom_header VARCHAR(500),
    custom_header_key VARCHAR(500) NOT NULL ,
    CONSTRAINT webhook_custom_header_pkey PRIMARY KEY (webhook_id, custom_header_key)
);
CREATE TABLE IF NOT EXISTS webhook_aud (
  id SERIAL,
  rev INTEGER NOT NULL,
  revtype SMALLINT NOT NULL,
  updated_on TIMESTAMP,
  updated_by VARCHAR(255),
  active BOOLEAN,
  basic_auth_password VARCHAR(255),
  basic_auth_username VARCHAR(255),
  name VARCHAR(255),
  secret VARCHAR(255),
  url VARCHAR(255),
  use_mtls BOOLEAN,
  CONSTRAINT webhook_aud_pkey PRIMARY KEY(id,rev)
);
CREATE TABLE IF NOT EXISTS webhook_custom_header_aud (
  rev INTEGER NOT NULL,
  webhook_id BIGINT NOT NULL,
  custom_header VARCHAR(500)NOT NULL,
  custom_header_key VARCHAR(500)NOT NULL,
  revtype SMALLINT,
  CONSTRAINT webhook_custom_header_aud_pkey PRIMARY KEY(rev,webhook_id,custom_header,custom_header_key)
);
CREATE TABLE IF NOT EXISTS webhook_events_aud (
  rev INTEGER NOT NULL,
  webhook_id BIGINT NOT NULL,
  event VARCHAR(255)NOT NULL,
  revtype SMALLINT,
  CONSTRAINT webhook_events_aud_pkey PRIMARY KEY(rev,webhook_id,event)
);

