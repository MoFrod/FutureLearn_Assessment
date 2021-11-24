# Import enrolments data for cyber security course
cyber_security_1_enrolments <- read_csv("data/cyber-security-1_enrolments.csv")
cyber_security_2_enrolments <- read_csv("data/cyber-security-2_enrolments.csv")
cyber_security_3_enrolments <- read_csv("data/cyber-security-3_enrolments.csv")
cyber_security_4_enrolments <- read_csv("data/cyber-security-4_enrolments.csv")
cyber_security_5_enrolments <- read_csv("data/cyber-security-5_enrolments.csv")
cyber_security_6_enrolments <- read_csv("data/cyber-security-6_enrolments.csv")
cyber_security_7_enrolments <- read_csv("data/cyber-security-7_enrolments.csv")

#Combine enrolments data for cs course into cyber_security_full_enrolments
cyber_security_full_enrolments <- rbind(cyber_security_1_enrolments, cyber_security_2_enrolments, cyber_security_3_enrolments, cyber_security_4_enrolments, cyber_security_5_enrolments, cyber_security_6_enrolments, cyber_security_7_enrolments)

#Create data set of students and demographic data for initial investigation
FL_data1 <- as_tibble(cyber_security_full_enrolments)
FL_data1[is.na(FL_data1)] <- "Incomplete"
print(FL_data1, n = 10, width = Inf)
FL_data1 %>%
  select(fully_participated_at, gender, country, age_range, highest_education_level, employment_status, employment_area) %>%

  

#Group students who have completed the course
course_completed <- filter(cyber_security_full_enrolments, !is.na(cyber_security_full_enrolments$fully_participated_at))
course_completed <- as_tibble(course_completed)
course_completed %>%
  select(fully_participated_at, gender, country, age_range, highest_education_level, employment_status, employment_area) %>%
  
print(course_completed, n = 10, width = Inf)

#Group students who have not completed the course
course_incomplete <- filter(cyber_security_full_enrolments, is.na(cyber_security_full_enrolments$fully_participated_at))
