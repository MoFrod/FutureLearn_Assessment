# Group by gender
gender_counts <- true_counts %>%
  group_by(num_true, gender, completed) %>%
  count() %>%
  filter(!(gender == "Unknown"))

# Quick plot of gender counts
gender_counts %>%
  ggplot(aes(x = gender, y = n, fill = completed)) + geom_bar(stat="identity", position="dodge") + scale_fill_brewer(palette = "Paired")

gender_counts %>%
  ggplot(aes(x = num_true, y = n, fill = gender)) + geom_bar(stat="identity", position="dodge") + scale_fill_brewer(palette = "Paired") # Men are more likely to declare all 6 demographic data points than women. If non-binary/other is declared, almost all demographic fields are provided.

# Success rate of gender
total_gender <- sum(gender_counts$n) # Total gender
men <- (3 + 8 + 1 + 8 + 4 + 30 + 403 + 69 + 1467 + 239 + 1) # Total men
c_men <- (1 + 4 + 69 + 239) # Men who completed
male_success_rate <- (100*(c_men/men)) %>%
  round(., digits = 2) # Success rate of men
women <- (4 + 4 + 3 + 13 + 1 + 46 + 6 + 431 + 60 + 1197 + 132 + 1 + 2) # Total women
c_women <- (3 + 1 + 6 + 60 + 132 + 2) # Women who completed
female_success_rate <- (100*(c_women/women)) %>%
  round(., digits = 2) # Success rate of women


# Group by age range
age_counts <- true_counts %>%
  group_by(num_true, age_range, completed) %>%
  count() %>%
  filter(!(age_range == "Unknown"))

# Quick plot of age counts
age_counts %>%
  mutate(age_range2 = fct_relevel(age_range, "<18", "18-25", "26-35", "36-45", "46-55", "56-65", "<65")) %>%
  ggplot(aes(x = age_range2, y = n, fill = completed)) + geom_bar(stat="identity", position="dodge") + scale_fill_brewer(palette = "Paired")

age_counts %>%
  ggplot(aes(x = num_true, y = n, fill = age_range)) + geom_bar(stat="identity", position="dodge") + scale_fill_brewer(palette = "Paired")

# Success rate of age range
total_age <- sum(age_counts$n)
over_65 <- (4 + 246 + 74 + 211 + 63)
c_over_65 <- (74+63)
SR_over_65 <- (100*(c_over_65/over_65)) %>%
  round(., digits = 2)
over_55 <- (1 + 5 + 110 + 26 + 386 + 84)
c_over_55 <- (26 + 84)
SR_over_55 <- (100*(c_over_55/over_55)) %>%
  round(., digits = 2)
between26_35 <- (1 + 2 + 7 + 91 + 3 + 699 + 71 + 1)
c_between26_35 <- (2 + 3 + 71 + 1)
SR_between26_35 <- (100*(c_between26_35/between26_35)) %>%
  round(., digits = 2)

# Group by country
country_counts <- true_counts %>%
  group_by(num_true, country, completed) %>%
  count() %>%
  filter(!(country == "Unknown")) 

# Quick plot of country counts (this doesn't work - too many countries)
country_counts %>%
  ggplot(aes(x = country, y = n, fill = completed)) + geom_bar(stat="identity", position="dodge") + scale_fill_brewer(palette = "Paired")

country_counts %>%
  filter(num_true == 6) %>%
  ggplot(aes(x = num_true, y = n, fill = country)) + geom_bar(stat="identity", position="dodge")

# Group by highest level of education
education_counts <- true_counts %>%
  group_by(num_true, highest_education_level, completed) %>%
  count() %>%
  filter(!(highest_education_level == "Unknown"))

# Quick plot of highest level of education counts
education_counts %>%
  ggplot(aes(x = highest_education_level, y = n, fill = completed)) + geom_bar(stat="identity", position="dodge") + scale_fill_brewer(palette = "Paired") # You are more likely to complete the course if already hold a professional or a university doctorate

education_counts %>%
  ggplot(aes(x = num_true, y = n, fill = highest_education_level)) + geom_bar(stat="identity", position="dodge") + scale_fill_brewer(palette = "PuOr")

# Group by employment status
estatus_counts <- true_counts %>%
  group_by(num_true, employment_status, completed) %>%
  count() %>%
  filter(!(employment_status == "Unknown"))

# Quick plot of employment status counts
estatus_counts %>%
  ggplot(aes(x = employment_status, y = n, fill = completed)) + geom_bar(stat="identity", position="dodge") + scale_fill_brewer(palette = "Paired") # You're more likely to complete the course if you're retired - matches the age range conclusions

estatus_counts %>%
  ggplot(aes(x = num_true, y = n, fill = employment_status)) + geom_bar(stat="identity", position="dodge") + scale_fill_brewer(palette = "PuOr")

# Group by employment status
earea_counts <- true_counts %>%
  group_by(num_true, employment_area, completed) %>%
  count() %>%
  filter(!(employment_area == "Unknown"))

# Quick plot of employment status counts
earea_counts %>%
  ggplot(aes(x = employment_area, y = n, fill = completed)) + geom_bar(stat="identity", position="dodge") + scale_fill_brewer(palette = "Paired")

earea_counts %>%
  ggplot(aes(x = num_true, y = n, fill = employment_area)) + geom_bar(stat="identity", position="dodge")







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

#Create a bar plot for the age range of students who have completed the course
age_range_counts <- table(course_completed$age_range) 
barplot(age_range_counts) 

#Create a bar plot for the age range without unknown of students who have completed the course
barplot(age_range_counts[1:7]) 

#Create a bar plot for the age range with >65 after 56-65 of students who have completed the course
over_65 <- age_range_counts[2] #Create over 65 table
under_65 <- age_range_counts[-2] #Create table without over 65s
under_65['>65'] <- over_65
barplot(as.matrix(under_65))
