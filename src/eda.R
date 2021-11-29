# Find the student IDs of columns which include "declared" in the name.
# These are the columns we would like to count TRUEs for.
ids_of_declared_cols <- grep("declared", names(FL1))

# Create a new column called "count" containing the value (count of columns) where this is true.
true_counts <- FL1 %>% 
  mutate(num_true = rowSums(.[ids_of_declared_cols] != FALSE)) %>% # Count up how many of the columns have a value != FALSE
  print(ids_of_declared_cols, num_true, completed, n = 20, width = Inf) # View the selected columns (from line 3) and also the count, to confirm we have the intended result.

# Quick plot of number of completes and non-completes based on the number of demographic columns filled in by the student.
true_counts %>% 
  group_by(num_true, completed) %>% 
  count() %>% 
  print(ids_of_declared_cols, true_counts, n = 15, width = Inf) %>%
  ggplot(aes(x = num_true, y = n, fill = completed)) + geom_bar(stat="identity")

# 
arch_counts <- joint_full %>%
  mutate(num_true = rowSums(.[ids_of_declared_cols] != FALSE)) %>%
  print(ids_of_declared_cols, num_true, completed, n = 20, width = Inf)

#
arch_counts %>%
  group_by(archetype, completed) %>%
  filter(!is.na(archetype)) %>%
  count() %>%
  print(ids_of_declared_cols, arch_counts, n = 20, width = Inf) %>%
  ggplot(aes(x = completed, y = n, fill = archetype)) + geom_bar(stat="identity")

#
arch_counts %>%
group_by(archetype, completed, num_true) %>% #swap archetype for type of data you're looking for.
  filter(!is.na(archetype)) %>%
  count() %>%
  filter(!(num_true == 0)) %>%
  print(ids_of_declared_cols, arch_counts, n = 65, width = Inf) %>%
  ggplot(aes(x = num_true, y = n, fill = archetype)) + geom_bar(stat="identity")

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
