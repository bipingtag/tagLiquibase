create TABLE IF NOT EXISTS three_ds_client_authentication_webhook
(
    id SERIAL PRIMARY KEY,
    active boolean NOT NULL,
    basic_auth_password character varying(255) NOT NULL,
    basic_auth_username character varying(255) NOT NULL,
    client_id bigint NOT NULL,
    custom_header character varying(3019),
    name character varying(255) NOT NULL,
    secret character varying(255),
    url character varying(255) NOT NULL,
    use_mtls boolean,
    created_by character varying(255),
    created_on timestamp without time zone,
    updated_by character varying(255),
    updated_on timestamp without time zone
);

create TABLE IF NOT EXISTS three_ds_client_authentication_webhook_aud
(
    id SERIAL,
    rev integer NOT NULL,
    revtype smallint,
    active boolean,
    basic_auth_password character varying(255),
    basic_auth_username character varying(255),
    client_id bigint,
    name character varying(255),
    secret character varying(255),
    url character varying(255),
    use_mtls boolean,
    updated_on TIMESTAMP,
    updated_by VARCHAR(255),
    CONSTRAINT three_ds_client_authentication_webhook_aud_pkey PRIMARY KEY (id, rev)
);
