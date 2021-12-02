# Success rate of gender.
men <- (3 + 8 + 1 + 8 + 4 + 30 + 403 + 69 + 1467 + 239 + 1) # Total men.
c_men <- (1 + 4 + 69 + 239) # Men who completed.
SR_male <- (100*(c_men/men)) %>%
  round(., digits = 2) # Success rate of men.
women <- (4 + 4 + 3 + 13 + 1 + 46 + 6 + 431 + 60 + 1197 + 132 + 1 + 2) # Total women.
c_women <- (3 + 1 + 6 + 60 + 132 + 2) # Women who completed.
SR_female <- (100*(c_women/women)) %>%.
  round(., digits = 2) # Success rate of women
nb <- (6 + 5 + 1) # Total nonbinary.
c_nb <- (1) # Nonbinary who completed.
SR_nb <- (100*(c_nb/nb)) %>%
  round(., digits = 2) # Success rate of nonbinary.
o <- (6 + 1 + 7) # Total of other.
c_o <- (1) # Other who completed.
SR_o <- (100*(c_o/o)) %>%
  round(., digits = 2) # Success rate of other.

# Success rate of age.
total_age <- sum(age_counts$n) # Total learners who declared age.
c_total_age <- (2+74+63+1+2+9+16+1+2+3+71+1+1+1+5+60+7+78+26+84) # Completion of total learners.
SR_total_age <- (100*(c_total_age/total_age)) %>%
  round(., digits = 2) # Total success rate of learners who declared age.
total_u18 <- (27+13+2) #Total of under 18s.
c_u18 <- (2) # Completion of under 18s.
SR_u18 <- (100*(c_total_u18/total_u18)) %>%
  round(., digits = 2) # Success rate of under 18s.
total_18_25 <- (2+7+19+220+414+1+2+9+16+1) # Total learners aged 18-25.
c_18_25 <- (1+2+9+16+1) # Completion of 18-25s.
SR_18_25 <- (100*(c_total_18_25/total_18_25)) %>%
  round(., digits = 2) # Success rate of 18-25.
total_26_36 <- (1+7+91+699+2+3+71+1) # Total learners aged 26-35.
c_26_35 <- (2+3+71+1) # Completion of 26-35s.
SR_26_35 <- (100*(c_total_26_35/total_26_36)) %>%
  round(., digits = 2) # Success rate of 26-35s.
total_36_45 <- (2+3+42+492+2+1+1+5+60) # Total of learners aged 36-45.
c_36_45 <- (1+1+5+60) # Completion of 36-45s.
SR_36_45 <- (100*(c_total_36_45/total_36_45)) %>%
  round(., digits = 2) # Success rate of 36-45s.
total_46_55 <- (4+1+51+461+7+78) # Total learners aged 46-55.
c_46_55 <- (7+78) # Completion of 46-55s.
SR_46_55 <- (100*(c_total_46_55/total_46_55)) %>%
  round(., digits = 2) # Success rate of 46-55s.
total_56_65 <- (1+5+110+386+26+84) # Total learners aged 56-65.
c_56_65 <- (26+84) #Completion of 56-65s.
SR_56_65 <- (100*(c_total_56_65/total_56_65)) %>%
  round(., digits = 2) # Success rate of 56-65s.
total_o65 <- (4+246+211+74+63) # Total learners aged over 65.
c_o65 <- (74+63) # Completion of over 65s.
SR_o65 <- (100*(c_total_o65/total_o65)) %>%
  round(., digits = 2) # Success rate of over 65s.

# Success rate by highest level of education.
total_edu <- (sum(education_counts$n)) # Total number of learners who declared education.
c_edu <- (1+4+2+1+13+38+2+2+19+43+19+19+2+3+57+174+1+5+17+1+17+79) # Completion rate of learners who declared education.
SR_edu <- (100*(c_edu/total_edu)) %>%
  round(., digits = 2) #Success rate of learners who declared education.
total_a <- (1+6+8) # Total apprenticeships.
c_a <- 0 # Completion of apprenticeships.
SR_a <- (100*(c_a/total_a)) %>%
  round(., digits = 2) # Success rate of apprenticeships.
total_ls <- (1+4+2+1+2+40+30) # Total less than secondary.
c_ls <- (1+4+2+1) # Completion of less than secondary.
SR_ls <- (100*(c_ls/total_ls)) %>%
  round(., digits = 2) # Success rate of less than secondary. 
total_s <- (2+2+19+43+2+7+199+330+1) # Total secondary.
c_s <- (2+2+19+43) # Completion of secondary.
SR_s <- (100*(c_s/total_s)) %>%
  round(., digits = 2) # Success rate of secondary.
total_p <- (13+38+4+4+61+219) # Total professional.
c_p <- (13+38) # Completion of professional.
SR_p <- (100*(c_p/total_p)) %>%
  round(., digits = 2) # Success rate of professional.
total_t <- (19+19+1+5+78+239) # Total tertiary.
c_t <- (19+19) # Completion of tertiary.
SR_t <- (100*(c_t/total_t)) %>%
  round(., digits = 2) # Success rate of tertiary.
total_ud <- (3+3+57+174+1+3+12+31+308+1136+1) # Total of university degrees.
c_ud <- (3+3+57+174+1) # Completion of university degrees. 
SR_ud <- (100*(c_ud/total_ud)) %>%
  round(., digits = 2) # Success rte of university degrees. 
total_um <-(1+17+79+1+4+11+126+613) # Total of university masters. 
c_um <- (1+17+79) # Completion of university masters. 
SR_um <- (100*(c_um/total_um)) %>%
  round(., digits = 2) # Success rate of university masters. 
total_udoc <- (5+17+4+27+93) # Total of university doctorates.
c_udoc <- (5+17) # Completion of university doctorates.
SR_udoc <- (100*(c_udoc/total_udoc)) %>%
  round(., digits = 2) # Success rate of university doctorates. 

# Success rate of employment status. 
estatus_total <- (sum(estatus_counts$n)) # Total employment status.
c_estatus <- (1+1+4+15+1+1+6+24+10+16+1+2+96+62+3+40+1+5+10+2+7+174+1+2+31) # Completion of total employment status.
SR_estatus <- (100*(c_estatus/estatus_total)) %>%
  round(., digits = 2) # Success rate of total employment.
student_total <- (1+2+1+13+163+259+1+1+1+4+15+1) # Total of learners who are students. 
c_student <- (1+1+4+15+1) # Completion of students.
SR_student <- (100*(c_student/student_total)) %>%
  round(., digits = 2) # Success rate of students.
looking_total <- (1+6+77+258+1+6+24) # Total of learners who are looking for work.
c_looking <- (1+6+24) # Completion of looking for work.
SR_looking <- (100*(c_looking/looking_total)) %>%
  round(., digits = 2) # Success rate of looking for work.
nworking_total <- (5+102+97+10+16) # Total of learners not working.
c_nworking <- (10+16) # Completion of not working.
SR_nworking <- (100*(c_nworking/nworking_total)) %>%
  round(., digits = 2) # Success rate of not working.
retired_total <- (1+17+317+221+1+2+96+62) # Total of learners who are retired.
c_retired <- (1+2+96+62) #Completion of retired.
SR_retired <- (100*(c_retired/retired_total)) %>%
  round(., digits = 2) # Success rate of retired. 
self_total <- (4+28+319+3+40) # Total of learners who are self-employed.
c_self <- (3+40) # Completion of self employed.
SR_self <- (100*(c_self/self_total)) %>%
  round(., digits = 2) # Success rate of self employed.
un_total <- (2+63+90+1+5+10) # Total of learners who are unemployed. 
c_un <- (1+5+10) # Completion of learners who are unemployed. 
SR_un <- (100*(c_un/un_total)) %>%
  round(., digits = 2) # Success rate of learners who are unemployed.
ftworking_total <- (1+5+81+1130+1+2+7+174+1) # Total of learners who are working full time.
c_ftworking <- (2+7+174+1) # Completion of working full time.
SR_ftworking <- (100*(c_ftworking/ftworking_total)) %>%
  round(., digits = 2) # Success rate of working full time.
ptworking_total <- (3+18+302+2+31) # Total of learners working part time.
c_ptworking <- (2+31) # Completion of part time.
SR_ptworking <- (100*(c_ptworking/ptworking_total)) %>%
  round(., digits = 2) # Success rate of part time.




