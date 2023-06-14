# Prompt the user to enter a three digit positive number
armstrong <- readline(prompt = "Please enter a three digit positive number: ")
# Check if the user input is numeric, an integer, contains three characters, and is positive. If not, print an error message and quit.
if (is.numeric(as.numeric(armstrong)) & #numeric
    (as.numeric(armstrong)) %% 1 == 0 & #integer
    as.numeric(armstrong) > 0 & #positive number
    length(armstrong) == 3) { #three digits 
  armstrong <- as.integer(armstrong)
  # Check if the number is narcissistic 
  if (((armstrong %/% 100)^3) + (((armstrong %% 100) %/% 10)^3) + ((armstrong %% 10)^3) == armstrong) {
    # Display the result with an appropriate message   
    print(paste(armstrong, "is a Narcissitic number."))
  } else {
    print(paste(armstrong, "is not a Narcisstic number."))
  }
} else {
  print("Oops, silly goose! This entry is not valid. Terminating...")
}

