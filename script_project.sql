create schema project AUTHORIZATION rejnzqju;

create table project.verifications(
	verification_id int not null, --pk
	verification_name char(50) not null
);

alter table project.verifications add constraint verification_PK primary key(verification_id);

create table project.hosts(
    host_id int not null, --PK
    host_name varchar(100) not null,
    host_since varchar(100) null,
    host_location varchar(50) null,
    host_about varchar(500) null,
    host_response_time varchar(50) null,
    host_listing_count int null,
    host_total_listing_count int null,
    verification_id int not null, --fk
    host_has_profile_pic bool null,
    host_identity_verified bool null,
    host_is_superhost bool null
);

alter table project.hosts add constraint host_PK primary key(host_id);
alter table project.hosts add constraint host_verification_FK foreign key (verification_id) references project.verifications(verification_id);

create table project.neighbourhood_group(
    NHGroup_ID int not null, --PK
    NH_Group_Name varchar(100) not null
);

alter table project.neighbourhood_group add constraint neighbourhood_group_PK primary key (NHGroup_ID);

create table project.neighbourhoods(
    NH_cleansed_ID int not null, --PK
    neighbourhood_cleansed_Name varchar(50) null,
    NHGroup_ID int not null --FK
);

alter table project.neighbourhoods add constraint neighbourhood_PK primary key (NH_cleansed_ID);
alter table project.neighbourhoods add constraint neighbourhood_FK foreign key (NHGroup_ID) references project.neighbourhood_group(NHGroup_ID);

create table project.zipcodes(
	zipcode int not null, --pk
	NH_cleansed_ID int not null --fk
);

alter table project.zipcodes add constraint zipcode_PK primary key (zipcode);
alter table project.zipcodes add constraint zipcode_nh_FK foreign key (NH_cleansed_ID) references project.neighbourhoods(NH_cleansed_ID);

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
    cancellation_policy_name char(250) not null
);

alter table project.cancellation_policy add constraint cancellation_policy_PK primary key(cancel_policy_id);

create table project.houses_listing(
    id_house int not null, --pk
    host_id int not null, --fk
    latitude float not null,
    longitude float not null,
    zipcode int not null,
    property_Type_id int not null,
    room_type_id int not null, --fk
    bed_Type_id int not null, --fk
    bathrooms int null,
    bedrooms int not null,
    beds int not null,
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
    accommodates int null,
    review_scores_rating int null,
    review_scores_accuracy int null,
    review_scores_checkin int null,
    review_scores_cleanliness int null,
    review_scores_comunication int null,
    review_scores_location int null,
    review_scores_values int null,
    review_scores_per_month int null,
    cancel_policy_id int not null, --fk
    TV bool null,
    internet bool null,
    kitchen bool null,
    doorman bool null,
    elevator bool null,
    buzzer bool null,
    heating bool null,
    washer bool null,
    essentials bool null,
    shampoo bool null,
    hangers bool null,
    air_conditioned bool null,
    breakfast bool null,
    family_friendly bool null,
    dryer bool null,
    hair_dryer bool null,
    iron bool null,
    laptop_friedly bool null,
    pets_allowed bool null,
    smoke_detector bool null,
    first_aid_kit bool null,
    fire_extinguisher bool null,
    twenty_four_hours_checkin bool null,
    smoking_allowed bool null,
    weelchair_accessible bool null,
    safety_card bool null,
    is_location_exact bool null,
    instant_bookable bool null
);

alter table project.houses_listing add constraint house_listing_PK primary key(id_house);
alter table project.houses_listing add constraint house_host_FK foreign key(host_id) references project.hosts(host_id);
alter table project.houses_listing add constraint house_zipcode_FK foreign key(zipcode) references project.zipcodes (zipcode);
alter table project.houses_listing add constraint house_property_FK foreign key(property_Type_id) references project.property_type(property_Type_id);
alter table project.houses_listing add constraint house_room_FK foreign key(room_type_id) references project.room_type(room_type_id);
alter table project.houses_listing add constraint house_bed_FK foreign key(bed_Type_id) references project.bed_type(bed_Type_id);
alter table project.houses_listing add constraint house_cancell_FK foreign key(cancel_policy_id) references project.cancellation_policy(cancel_policy_id);