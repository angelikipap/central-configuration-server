
--create the table withe the configuration entries
CREATE TABLE properties
(
    application VARCHAR(200),
    profile     VARCHAR(200),
    label       VARCHAR(200),
    KEY         VARCHAR(200),
    value       VARCHAR(200)
);

-- entries for testing key-values
insert into properties (application,profile,label, key, value) values ('customer-manager', 'default', 'master','premium-email-suffix', '@channel-vaswwww.com');
insert into properties (application,profile,label, key, value) values ('product-manager', 'default', 'master','hellomessage', 'Salut!');
