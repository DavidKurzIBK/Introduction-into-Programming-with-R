# communication:
# - program: return/invisible
# - user: print/cat/... 
#   - standard output 
#   - standard error output

library('tinytest')

help(expect_silent)
example(expect_silent)

# expect_silent() for correct statements (with or without output) 

x <- 1
expect_silent(x <- 1)

1+1
expect_silent(1+1)

print(1)
expect_silent(print(1))

# expect_error() for incorrect statements 

1+a
expect_silent(1+a)
expect_error(1+a)

# explicitely:
help(stop)
expect_error(stop("Forcing an error"))  # in session 05

# expect_warning() for problematic statements 

mean(c("1", NA))
expect_silent(mean(c("1", NA)))
expect_error(mean(c("1", NA)))
expect_warning(mean(c("1", NA)))

# explicitly: 
help(warning)
expect_warning(warning("Forcing a warning"))  # in session 05

# expect_message() for messages sent to stderr 

help(message)  # beyond this course
expect_message(message("Forcing a message"))
expect_message(print("print() is not a message"))
