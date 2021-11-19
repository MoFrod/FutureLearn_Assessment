library("ProjectTemplate")
load.project("FutureLearn_Assessment")

#Create a bar plot for gender
gender_counts <- table(course_completed$gender)
barplot(gender_counts)

#Create a bar plot for gender without unknown
barplot(gender_counts[1:4])
