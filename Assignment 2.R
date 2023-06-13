# Prompt the user to enter a three digit positive number
armstrong <- readline(prompt = "Please enter a three digit positive number: ")
armstrong <- as.integer(armstrong)
# Check if the user input is numeric and an integer. If not, print an error message and quit.
if (is.numeric(as.numeric(armstrong)) &
    (as.numeric(armstrong)) %% 1 == 0) {
# Check if the number is narcissistic 
  if (armstrong 
}
# Check if the number is narcissistic 
# Display the result with an appropriate message 