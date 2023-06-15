# Assignment 2 Code Review for Stephanie. Reviewer: Christopher 

# Prompt the user to enter a three digit positive number

#' COMMENT FOR LINE 9: It's nice that you added an explicit number range in the user prompt. 
#' I think this is an example of defensive programming because you are communicating
#' to the user some additional information about what kind of entry the script is expecting.

armstrong <- readline(prompt = "Please enter a number between 100 - 999: ")

#' COMMENT FOR IF-BLOCK LINES 28-34: This is another great example of defensive programming. You 
#' are checking all the necessary conditions for user input to satisfy the criteria for narcissistic 
#' numbers. However, some of these condition checks are redundant & could thus shorten your code. 
#' 
#' 1) In Line 33 you are checking that as.numeric(armstrong) >= 100. However, this will already
#' be fulfilled by the previous lines. The number will be positive (greater than 0) due to Line 30.
#' Additionally, it will be three digits due to nchar() on Line 31. Lastly, line 29 checks that
#' it's an integer. As such, decimals (e.g. 1.5), negative numbers (-100), and entries like 001
#' will not be satisfied as they each fail one of these conditions. Examples:
#' 1.5 would fail the %% 1 (mod) check for integers. Yields 0.5 not 0.
#' -100 would fail the positive check (greater than 0).
#' 001 would fair the nchar() check as this yields 1. 
#' 
#' 2) The same applies for Line 34 where it's checking that the number is less than 999.
#' This will be satisfied by the same combination of functions as mentioned above. 

# Check if the user input is numeric, an integer, contains three characters, and is positive. If not, print an error message and quit.
if (is.numeric(as.numeric(armstrong)) & #numeric
    (as.numeric(armstrong)) %% 1 == 0 & #integer
    as.numeric(armstrong) > 0 & #positive number
    nchar(armstrong) == 3 & #three digits
    !grepl("[A-Za-z]", armstrong) & #this line ensures that if the user inputs any words including three letter words such as "pop", the error message (line 18) is still displayed
    as.numeric(armstrong) >= 100 &
    as.numeric(armstrong) <= 999) { #these lines were added to ensure the user inputs values between 100-999 and not a number for ex. 001
  
#' COMMENT LINE 32: The use of the grepl() function is really neat. Using regular expressions to check the input pattern
#' is really clever. Cool stuff!!
  
  armstrong <- as.integer(armstrong) 
  if (((armstrong %/% 100)^3) + (((armstrong %% 100) %/% 10)^3) + ((armstrong %% 10)^3) == armstrong) { # Check if the number is narcissistic (formula)
    
    #' COMMENT IF BLOCK LINE 40: This is a great way to compute the cubes of each digit. Especially the use of %/% in the
    #' first parameter is a very efficient way to get the first digit. You could have used the sum() function with
    #' these three calculations as the parameters to make it even fancier, but the approach above works perfectly. 
    
    print(paste(armstrong, "is a Narcissistic number.")) # Display the result with an appropriate message
  } else {
    print(paste(armstrong, "is not a Narcissistic number."))
  }
} else {
  
  #' COMMENT FOR LINE 56: One thing that could be a nice addition would be to paste the user input value like you
  #' did for lines 46 and 48 but in this case showing that this entry is invalid. This would show the user what
  #' they had entered as a reminder. This way they could perhaps deduce what was wrong (e.g. a typing mistake).
  
  print("Oops, silly goose! This entry is not valid. Terminating...")
}

# Final Comments & Feedback: 

#' Overall this code is very efficient and follows great defensive programming principles. Great job!
#' Stylistically it was easy to follow and the attached comments provided the necessary insight to understand it.
#' The first defensive programming IF block (to check conditions) on line 28 could have been shortened a little,
#' but in this case I believe it's better to play it safe rather than to miss some critical condition checks. 
#' You used some really neat functions like grepl on line 32, %/% on line 40, so I learned something on top of it. Thanks :)
