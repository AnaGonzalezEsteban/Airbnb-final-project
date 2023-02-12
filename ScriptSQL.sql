create schema project AUTHORIZATION rejnzqju;

create table project.hosts(
    host_id int not null, --PK
    host_name varchar(100) not null,
    host_since varchar(100) null,
    host_location varchar(50) null,
    host_about varchar(500) null,
    host_response_time varchar(50) null,
    host_response_rate int null,
    host_acceptance_rate varchar(100) null,
    --host_thumbnail_url,
    --host_picture_url,
    --host_picture_url,
    host_neighbourhood varchar (100) null,
    host_listing_count int null,
    host_total_listing_count int null,
    host_verifications varchar(200) null
    --host_features,
    --calculated_host_listing_count
);

alter table project.hosts add constraint host_PK primary key(host_id);

create table project.neighbourhood_group(
    NHGroup_ID int not null, --PK
    NH_Group_Name varchar(100) not null
);

alter table project.neighbourhood_group add constraint neighbourhood_group_PK primary key (NHGroup_ID);

create table project.neighbourhoods(
    NH_ID int not null, --PK
    neighbourhood_Name varchar(50) null,
    NHGroup_ID int not null --FK
);

alter table project.neighbourhoods add constraint neighbourhood_PK primary key (NH_ID);
alter table project.neighbourhoods add constraint neighbourhood_FK foreign key (NHGroup_ID) references project.neighbourhood_group(NHGroup_ID);

create table project.country(
    country_code char not null, --pk
    country_name varchar(50) not null
);

alter table project.country add constraint country_PK primary key(country_code);

create table project.city(
    city_id int not null, --PK
    city_name varchar(50) not null,
    country_code char not null --fk
);

alter table project.city add constraint city_PK primary key (city_id);
alter table project.city add constraint city_country_FK foreign key (country_code) references project.country (country_code);

create table project.scrapes(
    scrape_id int not null --pk
);

alter table project.scrapes add constraint scrapes_PK primary key (scrape_id);

create table project.street(
	street_id int not null, --PK
    street_name varchar(100) not null
);

alter table project.street add constraint street_PK primary key (street_id);

create table project.market(
    market_id int not null, --pk
    market varchar(100) not null
);

alter table project.market add constraint market_PK primary key (market_id);

create table project.property_type(
    property_Type_id int not null, --pk
    property_type char(100) not null
);

alter table project.property_type add constraint property_type_PK primary key (property_Type_id);

create table project.room_type(
    room_type_id int not null, --PK
    room_type varchar(50) not null
);

alter table project.room_type add constraint room_type_PK primary key(room_type_id);

create table project.bed_type(
    bed_Type_id int not null, --pk
    Bed_type char(50) not null
);

alter table project.bed_type add constraint bed_type_PK primary key (bed_Type_id);

create table project.cancellation_policy(
    cancel_policy_id int not null, --PK
    cancellation_policy_name char(250) not null,
    cancellation_policy_description varchar(500) null
);

alter table project.cancellation_policy add constraint cancellation_policy_PK primary key(cancel_policy_id);

create table project.houses_listing(
    id_house int not null, --pk
    scrape_id int not null, --fk
    host_id int not null, --fk
    last_scraped date not null,
    listing_url char(50) not null,
    name_house char(50) not null,
    summary varchar(250) null,
    space char(250) null,
    description_house varchar(500) null,
    experiences_offered_id int not null, --fk
    notes char(100) null,
    transit char(100) null,
    access char(100) null,
    interaction char(100) null,
    house_rules char(500) null,
    thumbnail_url_house char(100) null,
    medium_url char(100) null,
    picture char(100) null,
    xl_picture_url char(100) null,
    street_id int not null, --fk
    NH_ID int not null, --fk
    city_id int not null, --fk
    state_house varchar(50) null,
    zip_code char(50) null,
    --geolocation,
    latitude float not null,
    longitude float not null,
    market_id int not null, --fk
    smart_location varchar(100),
    property_Type_id int not null, --fk
    room_type_id int not null, --fk
    accommodates int null,
    bathrooms int null,
    beds int null,
    bed_Type_id int not null, --fk
    amenities char(100) null,
    square_feet float null,
    price float not null,
    weekly_price float null,
    monthly_price float null,
    security_deposit float null,
    cleaning_fee float null,
    guest_included int null,
    extra_people int null,
    minimun_nights int null,
    maximun_nights int null,
    calendar_update date null,
    has_availability boolean null,
    availability_30 int null,
    availability_60 int null,
    availability_90 int null,
    availability_365 int null,
    calendar_last_scraped date null,
    license char(100) null,
    jurisdiction_names varchar(250) null,
    cancel_policy_id int not null, --fk
    reviews_per_month float,
    house_features varchar(100)null
);

alter table project.houses_listing add constraint house_listing_PK primary key(id_house);
alter table project.houses_listing add constraint house_host_FK foreign key(host_id) references project.hosts(host_id);
alter table project.houses_listing add constraint house_scraped_FK foreign key(scrape_id) references project.scrapes(scrape_id);
-- alter table project.houses_listing add constraint house_experience_FK foreign key(experiences_offered_id) references project.;
alter table project.houses_listing add constraint house_street foreign key(street_id) references project.street(street_id);
alter table project.houses_listing add constraint house_neighbourhood_FK foreign key(NH_ID) references project.neighbourhoods(NH_ID);
alter table project.houses_listing add constraint house_city_FK foreign key(city_id) references project.city(city_id);
alter table project.houses_listing add constraint house_market_FK foreign key(market_id) references project.market(market_id);
alter table project.houses_listing add constraint house_property_FK foreign key(property_Type_id) references project.property_type(property_Type_id);
alter table project.houses_listing add constraint house_room_FK foreign key(room_type_id) references project.room_type(room_type_id);
alter table project.houses_listing add constraint house_bed_FK foreign key(bed_Type_id) references project.bed_type(bed_Type_id);
alter table project.houses_listing add constraint house_cancell_FK foreign key(cancel_policy_id) references project.cancellation_policy(cancel_policy_id);