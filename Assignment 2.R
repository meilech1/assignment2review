# Prompt the user to enter a three digit positive number
armstrong <- readline(prompt = "Please enter a number between 100 - 999: ")
# Check if the user input is numeric, an integer, contains three characters, and is positive. If not, print an error message and quit.
if (is.numeric(as.numeric(armstrong)) & #numeric
    (as.numeric(armstrong)) %% 1 == 0 & #integer
    as.numeric(armstrong) > 0 & #positive number
    nchar(armstrong) == 3 & #three digits
    as.numeric(armstrong) >= 100 &
    as.numeric(armstrong) <= 999) { #these lines were added to ensure the user inputs values between 100-999 and not a number for ex. 001
  armstrong <- as.integer(armstrong) 
  if (((armstrong %/% 100)^3) + (((armstrong %% 100) %/% 10)^3) + ((armstrong %% 10)^3) == armstrong) { # Check if the number is narcissistic (formula)
    print(paste(armstrong, "is a Narcissistic number.")) # Display the result with an appropriate message
  } else {
    print(paste(armstrong, "is not a Narcissistic number."))
  }
} else {
  print("Oops, silly goose! This entry is not valid. Terminating...")
}
