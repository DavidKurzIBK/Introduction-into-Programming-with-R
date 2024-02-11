# FOR LOOP DEMOS
X <- LETTERS[1:5] # [1] "A" "B" "C" "D" "E"
Y <- vector()
N <- length(X)

for (e in X)           print(e)     # A.  

for (i in length(X))   print(i)     # B. incorrect 
for (i in 1:length(X)) print(X[i])  # C. risky for []
for (i in 1:length(Y)) print(i)     # D. incorrect
for (i in 1:N)         print(X[i])  # E. equivalent to C, but risky for [], for numbers

for (i in seq_along(X)) print(X[i]) # F.
for (i in seq_along(Y)) print(Y[i]) # G.
for (i in seq_along(N)) print(i)    # H. incorrect, meaningless for single value

for (i in seq_len(length(X))) print(X[i]) # I. rather use seq_along() instead of seq_len(length())
for (i in seq_len(N))         print(X[i]) # J. 
for (i in seq_len(length(Y))) print(Y[i]) # K.
