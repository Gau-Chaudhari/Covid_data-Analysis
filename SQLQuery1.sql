SELECT * 
FROM project..CovidDeaths;

SELECT * 
FROM project..CovidVaccinations;


select location,total_cases,new_cases,total_deaths,population
from project..CovidDeaths
order by location;


--TOTAL CASES vs TOTAL DEATH PERCNTAGE

select location,total_cases,new_cases,total_deaths,(total_deaths/total_cases)*100 as Death_rate,population
from project..CovidDeaths
order by location;


--TOATAL PEOPLE AFFECTED POPULATION WISE

select location,total_cases,total_deaths,population,(total_deaths/total_cases)*100 as Death_rate,(total_cases/population)*100 as Affected_percent
from project..CovidDeaths
order by location;

--TOATAL PEOPLE AFFECTED POPULATION WISE FOR INDIA

select location,total_cases,total_deaths,population,(total_deaths/total_cases)*100 as Death_rate,(total_cases/population)*100 as Affected_percent
from project..CovidDeaths
where location='India';

--INFECTION RATE COUNTRY-WISE

select location,total_cases,total_deaths,population,(total_cases/population)*100 as Infection_rate,(total_deaths/total_cases)*100 as Death_rate,(total_cases/population)*100 as Affected_percent
from project..CovidDeaths
where continent IS NOT NULL
order by location;

--HIGEST INFECTED COUNTRY

select location,population,MAX((total_cases/population)*100) as High_infected
from project..CovidDeaths
group by location,population
order by High_infected desc;

--FOR CONTINENTS WITH HIGEST INFECTED RATE

select continent,MAX((total_cases/population)*100) as High_infected
from project..CovidDeaths
where continent is not null
group by continent
order by High_infected desc;

--HIGEST INFECTION RATE IN INDIA IS

select location,MAX((total_cases/population)*100) as High_infected
from project..CovidDeaths
where location='India'
group by location


--GLOBAL RATES

select date,new_cases,new_deaths
from project..CovidDeaths
where continent is not null
group by date,new_cases,new_deaths


--INFECTION RATE

select date,sum(new_cases) as glob_inf_num,(sum(new_cases)/sum(total_cases))*100 as  glob_inf_rate
from project..CovidDeaths
where continent is not null
group by date


--DEATH RATE

select sum(cast(new_deaths as int)) as glob_deat_num,(sum (cast(new_deaths as int))/sum(new_cases))*100 as  glob_death_rate
from project..CovidDeaths
where continent is not null



