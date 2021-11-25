# Find the student IDs of columns which include "declared" in the name.
# These are the columns we would like to count TRUEs for.
ids_of_declared_cols <- grep("declared", names(FL_data1))

# Create a new column called "count" containing the value (count of columns) where this is true.
true_counts <- FL_data1 %>% 
  mutate(num_true = rowSums(.[ids_of_declared_cols] != FALSE)) %>% # Count up how many of the columns have a value != FALSE
  print(ids_of_declared_cols, num_true, completed, n = 20, width = Inf) # View the selected columns (from line 3) and also the count, to confirm we have the intended result.

# Quick plot of number of completes and non-completes based on the number of demographic columns filled in by the student.
true_counts %>% 
  group_by(num_true, completed) %>% 
  count() %>% 
  print(ids_of_declared_cols, true_counts, n = 15, width = Inf) %>%
  ggplot(aes(x = num_true, y = n, fill = completed)) + geom_bar(stat="identity")

# Calculate percentage of students who completed or did not complete the course and declared demographic data (number of columns filled by student)
completed_no_dd <- ((100*(1626/37296)) # Completed, no demographic data provided
incomplete_no_dd <- (100*(31467/37296)) # Incomplete, no demographic data provided
completed_1_dd <- (100*(0/37296)) # Completed, 1 demographic data provided
incomplete_1_dd <- (100*(14/37296)) # Incomplete, 1 demographic data provided
completed_2_dd <- (100*(4/37296)) # Completed, 2 demographic data provided
incomplete_2_dd <- (100*(15/37296)) # Incomplete, 2 demographic data provided
completed_3_dd <- (100*(9/37296)) # Completed, 3 demographic data provided
incomplete_3_dd <- (100*(31/37296)) # Incomplete, 3 demographic data provided
completed_4_dd <- (100*(7/37296)) # Completed, 4 demographic data provided
incomplete_4_dd <- (100*(79/37296)) # Incomplete, 4 demographic data provided
completed_5_dd <- (100*(134/37296)) # Completed, 5 demographic data provided
incomplete_5_dd <- (100*(858/37296)) # Incomplete, 5 demographic data provided
completed_6_dd <- (100*(372/37296)) # Completed, 6 demographic data provided
incomplete_6_dd <- (100*(2676/37296)) # Incomplete, 6 demographic data provided

#Create a bar plot for the gender of students who have completed the course
gender_counts <- table(course_completed$gender)
barplot(gender_counts)

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
gender <- rbind(gender_counts, incomplete_gender_counts)
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
