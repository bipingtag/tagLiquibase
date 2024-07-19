DO '
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE table_name = ''card_product'' AND constraint_name = ''unique_card_product_name_and_client_id''
    ) THEN
        ALTER TABLE card_product
        ADD CONSTRAINT unique_card_product_name_and_client_id UNIQUE (card_product_name, client_id);
    END IF;
END';