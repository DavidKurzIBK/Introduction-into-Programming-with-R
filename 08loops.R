#---------------------------------------------------Exercise 8.1----------------------------------------------------------------------------------


# first it sets x to 1
# then setting up the loop variable from 1 to 10
# as long as loop variable <= 8 it loops and immediately loops again without calculating x <- x+1
# if i=9 so i > 8 it calculates x <- 1+1, so x = 2
# if i=10 @ last iteration of for loop: it calcs x <- 2+1, so x = 3;

x <- 1
for (i in 1:10) {
  if (i <= 8) next
  x <- x + 1
}
print(x)


# result of this loop?
# first sets y <- 1, then loop var is 0 (itself a numeric vec with length 1)
# think it the loop one time;  
# so it calcs y <- 1 + 1, so y = 2
y <- 1
for (i in 0) {
  y <- y + 1
}
print(y)

# proof that 0 is a numeric vector with length 1
x <- 0
for(i in seq_along(x)){
  print(paste("Element", i ,"of x is", x[i]))
}

length(x)


# result of this loop?
z <- 0                # sets z 0; 
for (i in 1:5){       # loop var from 1 to 5
  z <- z + 1          # sums up z @ every pass
  if (i > 2) break    # after 2nd loop it break the whole for loop
  z <- z + 0.5        # if loop wasn't broken before it sums up z
  next                # if this is reached, it jumpes immediately to begin of for-loop;
}

print(z)


