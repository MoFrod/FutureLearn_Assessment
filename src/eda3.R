# Count the number of demographic columns filled in by the learners of different archetypes.
arch_true_counts <- FL2 %>%
  mutate(num_true = rowSums(.[ids_of_declared_cols] != FALSE)) %>%
  print(ids_of_declared_cols, num_true, completed, n = 20, width = Inf)

# Count the number of learners who completed or did not complete the course by archetype.
arch_counts <- arch_true_counts %>%
  group_by(archetype, completed) %>%
  filter(!is.na(archetype)) %>%
  count()

# Display a tibble of number of learners who have completed or did not complete the course by archetype.
arch_counts %>%
  print(ids_of_declared_cols, arch_counts, n = 20, width = Inf)

# Success rate of learners who provided archetypes
total_archetype <- sum(arch_counts$n) # Total number of learners who provided their archetype.
c_archetype <- (20 + 13 + 6 + 1 + 6 + 5 + 8 + 17) # Completion of archetypes.
SR_archetype <- (100*(c_archetype/total_archetype)) %>%
  round(., digits = 2) %>% # Success rate of archetypes
  print()

# Quick plot of number of students who completed or did not complete the course by archetype.
arch_counts %>%
  ggplot(aes(x = archetype, y = n, fill = completed)) + geom_bar(stat="identity", position = "dodge") + scale_fill_brewer(palette = "Paired") + labs(title = "Course Completion by Learner Archetype", x = "Learner Archetype", y = "Number of Learners", fill = "Course Completed") + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

# Print learner archetypes by number of demographic columns declared
arch_true_counts %>%
  group_by(archetype, completed, num_true) %>% #swap archetype for type of data you're looking for.
  filter(!is.na(archetype)) %>%
  count() %>%
  filter(!(num_true == 0)) %>%
  print(ids_of_declared_cols, arch_true_counts, n = 65, width = Inf)

# Quick plot of learner archetypes by number of demographic columns declared. 
arch_true_counts %>%
  group_by(archetype, completed, num_true) %>% #swap archetype for type of data you're looking for.
  filter(!is.na(archetype)) %>%
  count() %>%
  filter(!(num_true == 0)) %>%
  ggplot(aes(x = num_true, y = n, fill = archetype)) + geom_bar(stat="identity", position = "dodge") + scale_fill_brewer(palette = "PuOr") + labs(title = "Number of Demographic Fields by Number of Learners per Archetype", x = "Number of Demographic Data Fields Provided by Learner", y = "Number of Learners", fill = "Archetype")
  