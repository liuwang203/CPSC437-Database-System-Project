--return the details nutritional information of one meal
create function detailed_nutritional_information(meal_name varcahr(3))
	returns table as $$ (
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
		niacin float)
	begin
	return table (
		select *
		from nutritional_information
		where food_name = meal_name);
	end
$$ language plpgsql immutable strict;

--return the standard detailed nutritional information of a day
create function standard_nutritional_information(age integer, gender integer)
	returns table (
		protein varchar(30),
		total_fiber float,
		total_water float,
		fat float,
		carbohydrates float,
		a_linoelic_acid float,
		linoleic_acid float,
	)
	begin
	return table(
		select protein, total_fiber, total_water, fat, carbohydrates, a_linoelic_acid, linoleic_acid
		from recommended_macros
		where age = recommended_macros.age and gender = recommended_macros.gender
	)
	end
$$ language plpgsql immutable strict;

--return the standard detailed diary restrictions of a day
create function standard_diary_restriction(age integer, gender integer)
	returns table (
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
	)
	begin
	create table (
		select pork, nuts, alcohol, peanuts, dairy, eggs, wheat, fish_seafood, shellfish, gluten, soy
		from food_dietary_restrictions
		where age = food_dietary_restrictions.age and gender = food_dietary_restrictions.gender
	)
	end
$$ language plpgsql immutable strict;

--return the recommended daily values in a day by one person of a nutrition
create function recommended_daily_values(nutrient varchar(30))
	returns table (
		nutrient varchar(30),
		unit_of_measure float,
		daily_value float,
	)
	begin
	create table (
		select *
		from rec_daily_values
		where nutrient = rec_daily_values.nutrient
	)
	end
$$ language plpgsql immutable strict;

--compute the total calories taken in a day by one person
select sum(calories) as sum_calories
from nutritional_information, choices
where nutritional_information.food_name = choices.food_name;

--compute the total sodium taken in a day by one person
select sum(sodium) as sum_sodium
from nutritional_information, choices
where nutritional_information.food_name = choices.food_name;

--compute the total protein taken in a day by one person
select sum(protein) as sum_protein
from nutritional_information, choices
where nutritional_information.food_name = choices.food_name;

--compute the total sugar taken in a day by one person
select sum(sugar) as sum_sugar
from nutritional_information, choices
where nutritional_information.food_name = choices.food_name;
