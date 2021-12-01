# Tibble of success rates (this will go in the report model section)
total_success_rates <- tribble(~Success_Rate, ~Percentage, "Gross", 5.78, "No Demographic Data", 4.92, "Demographic Data", 12.53,) %>%
  print()

# Quick plot of number of completes and non-completes based on the number of demographic columns filled in by the learner.
learner_counts %>%
  ggplot(aes(x = num_true, y = n, fill = completed)) + geom_bar(stat="identity", position="dodge") + labs(title = "Course Completion by Number of Demographic Data Fields", x = "Number of Demographic Data Fields Provided by Learner", y = "Number of Learners", fill = "Course Completed") + scale_fill_brewer(palette = "Paired")


