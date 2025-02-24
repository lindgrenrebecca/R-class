
A <- matrix(c(2, 0, 1, 3), ncol= 2)

B <- matrix(c(5, 2, 4, -1), ncol = 2)

print(A)
print(B)

addition <- A + B
subtraction <- A - B

diagonal <- diag(c(4, 1, 2, 3), ncol = 4)
print(diagonal)

#Create the matrix with 3's in the diagonal
matrix <- diag(3, ncol = 5, nrow = 5)
#Try adding 1's to all columns in row 1 except for column 1
matrix[,-c(1)] <-1 #not what I want

matrix[1, 2:5] <- 1 #worked!
matrix[2:5, 1] <- 2 #worked!
print(matrix)


