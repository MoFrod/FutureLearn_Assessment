library("ProjectTemplate")
load.project("FutureLearn_Assessment")

#Create a bar plot for the gender of students who have completed the course
gender_counts <- table(course_completed$gender)
barplot(gender_countgender_counts)

#Create a bar plot for the gender without unknown of students who have completed the course
barplot(gender_counts[1:4])

#Create a bar plot for the gender of students who have not completed the course
incomplete_gender_counts <- table(course_incomplete$gender)
barplot(incomplete_gender_counts)

#Create a bar plot for the gender without unknown of students who have not completed the course
barplot(incomplete_gender_counts[1:4])

#Create a bar plot for the percentage of gender declarations for those who have completed and not completed the course 
addmargins(gender_counts)
round(100*prop.table(gender_counts), digits = 2)
addmargins(incomplete_gender_counts)
round(100*prop.table(incomplete_gender_counts), digits = 2)
gender <- cbind(gender_counts, incomplete_gender_counts)
addmargins(gender)
round(100*prop.table(gender), digits = 2)
barplot(round(100*prop.table(gender_counts), digits = 2), round(100*prop.table(incomplete_gender_counts), digits = 2))

#Create a bar plot for the country of students who have completed the course
country_counts <- table(course_completed$country)
barplot(country_counts)

#Create a bar plot for the country without unknown of students who have completed the course
barplot(country_counts[c(1:71, 73:77)])

#Create a bar plot for the age range of students who have completed the course
age_range_counts <- table(course_completed$age_range) 
barplot(age_range_counts) 

#Create a bar plot for the age range without unknown of students who have completed the course
barplot(age_range_counts[1:7]) 

#Create a bar plot for the age range with >65 after 56-65 of students who have completed the course
over_65 <- age_range_counts[2] #Create over 65 table
under_65 <- age_range_counts[-2] #Create table without over 65s
age_counts <- cbind(under_65, over_65) #Column bids the under_65 table to the over_65 table so that over 65s appear after
barplot(age_counts)

#Create a bar plot for the highest education level of students who have completed the course
highest_education_level_counts <-table(course_completed$highest_education_level)
barplot(highest_education_level_counts)

#Create a bar plot for the highest education level without unknown of students who have completed the course
barplot(highest_education_level_counts[1:7])

#Create a bar plot for the employment status of students who have completed the course
employment_status_counts <-table(course_completed$employment_status)
barplot(employment_status_counts)

#Create a bar plot for the employment status without unknown of students who have completed the course
barplot(employment_status_counts[c(1:6,8:9)])

#Create a bar plot for the employment area of students who have completed the course
employment_area_counts <-table(course_completed$employment_area)
barplot(employment_area_counts)

#Create a bar plot for the employment area without unknown of students who have completed the course
barplot(employment_area_counts[1:8])
