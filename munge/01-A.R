# Combine enrolments data for cs course into cyber_security_full_enrolments
cyber_security_full_enrolments <- rbind(cyber.security.1_enrolments, cyber.security.2_enrolments, cyber.security.3_enrolments, cyber.security.4_enrolments, cyber.security.5_enrolments, cyber.security.6_enrolments, cyber.security.7_enrolments)

# Create data set of students and demographic data for initial investigation
FL_data1 <- as_tibble(cyber_security_full_enrolments) %>% #Create tibble
  mutate(completed = !is.na(fully_participated_at), #Is there a non-NA value in fully_participated_at?
         gender_declared = gender != "Unknown", #Is gender something other than unknown?
         country_declared = country != "Unknown", #Is country something other than unknown?
         age_declared = age_range != "Unknown", #Is age something other than unknown?
         education_declared = highest_education_level != "Unknown", #Is education level something other than unknown?
         employment_status_declared = employment_status != "Unknown", #Is employment status something other than unknown?
         employment_area_declared = employment_area != "Unknown") #Is employment area something other than unknown?

#Combine archetype data for cs course into cyber_security_full_archetypes
cyber_security_full_archetypes <- rbind(cyber.security.1_archetype.survey.responses, cyber.security.2_archetype.survey.responses, cyber.security.3_archetype.survey.responses, cyber.security.4_archetype.survey.responses, cyber.security.5_archetype.survey.responses, cyber.security.6_archetype.survey.responses, cyber.security.7_archetype.survey.responses)

# Join between enrolments and archetype_survey_response on learner_id
# More info on joins: https://dplyr.tidyverse.org/reference/mutate-joins.html 
left_join(cyber_security_full_enrolments, cyber_security_full_archetypes, by = "learner_id", archetype)


#Filter students who have completed the course
course_completed <- filter(cyber_security_full_enrolments, !is.na(cyber_security_full_enrolments$fully_participated_at))

#Filter students who have not completed the course
course_incomplete <- filter(cyber_security_full_enrolments, is.na(cyber_security_full_enrolments$fully_participated_at))
