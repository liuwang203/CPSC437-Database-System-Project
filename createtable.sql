create table food_item (
	food_name varchar(30) not null,
	serving_size float,
	primary key (food_name),
);

create table recommended_macros (
	age integer,
	gender integer,
	protein varchar(30),
	total_fiber float,
	total_water float,
	fat float,
	carbohydrates float,
	a_linoelic_acid float,
	linoleic_acid float,
	primary key (age, gender),
);

create table rec_daily_values (
	nutrient varchar(30),
	unit_of_measure float,
	daily_value float,
	primary key(nutrient),
);

create table person(
	age integer,
	gender integer,
	primary key(age, gender)
);

create table dietary_habits(
	age integer,
	gender integer,
	vegan integer,
	vegetarian integer,
	gluten_free integer,
	primary key(age, gender),
);

create table dietary_restrictions(
	age integer,
	gender integer,
	pork float,
	nuts float,
	alcohol float,
	peanuts float,
	dairy float,
	eggs float,
	wheats float,
	fish_seafood float,
	shellfish float,
	gluten float,
	soy float,
	primary key(age, gender),
);

create table eats(
	age integer,
	gender integer,
	food_name varchar(30),
	primary key(age, gender),
);

create table time_day(
	meal_type integer,
	day_of_week integer,
	primary key(meal_type, day_of_week),
);

create table dining_hall(
	dhall_name varchar(30),
	primary key (dhall_name),
);

create table served_on(
	food_name varchar(30),
	meal_type integer,
	day_of_week integer,
	primary key(food_name, meal_type, day_of_week)
);

create table  served_in(
	food_name varchar(30),
	dhall_name varchar(30),
	primary key(food_name, dhall_name),
);

create table food_dietary_habits(
	food_name varchar(30),
	vegan integer,
	vegetarian integer,
	gluten_free integer,
	primary key(food_name)
);

create table food_dietary_restrictions(
	food_name varchar(30),
	pork integer,
	nuts integer,
	alcohol integer,
	peanuts integer,
	dairy integer,
	eggs integer,
	wheat integer,
	fish_seafood integer,
	shellfish integer,
	gluten integer,
	soy integer,
	primary key(food_name),
);

create table nutritional_information(
	food_name varchar(30),
	calories float,
	protein float,
	fat float,
	polyunsaturated_fat float,
	saturated_fat float,
	cholesterol float,
	carbohydrates float,
	sugar float,
	dietary_fiber float,
	calcium float,
	iron float,
	sodium float,
	vitamin_C float,
	vitamin_B1 float,
	vitamin_A float,
	vitamin_B2 float,
	riboflavin float,
	niacin float,
	primary key(food_name),
);
