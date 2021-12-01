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

# Quick plot of number of students who completed or did not complete the course by archetype.
arch_counts %>%
  ggplot(aes(x = completed, y = n, fill = archetype)) + geom_bar(stat="identity", position = "dodge")

# Quick plot of learner archetypes by number of demographic columns declared. 
arch_true_counts %>%
  group_by(archetype, completed, num_true) %>% #swap archetype for type of data you're looking for.
  filter(!is.na(archetype)) %>%
  count() %>%
  filter(!(num_true == 0)) %>%
  print(ids_of_declared_cols, arch_true_counts, n = 65, width = Inf) %>%
  ggplot(aes(x = num_true, y = n, fill = archetype)) + geom_bar(stat="identity", position = "dodge")
