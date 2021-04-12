# Generate Normal dist. and plot it  
x <- seq(-10,10, by=0.1)
y <- dnorm(x)
plot(y)
rm(x,y)
#______________________

#You are given an array prices where prices[i] is the price of a given stock on the ith day.
#You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
#Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
### need to be solved ####
#______________________


#1 - Find the max value 
prices <- c(-7,-1,-1,5,-1,-1)
mx=prices[1]
for (i in 1:length(prices)){
  if (prices[i]>mx){
    mx=prices[i]
  }
}  
print(mx)

#1.1 Find the min value 
prices <- c(-7,-1,-1,-10,5,-1,-1)
mn=prices[1]
for (i in 1:length(prices)){
  if(prices[i]<mn){
    mn=prices[i]
  }
}
print(mn)

#2 - Find the max value when starting point=1st var, loop start from day2 
prices <- c(7,1,1,8,10,12,1)
mx=prices[1]
mxchanged=0 
day=0
for (i in 2:length(prices)){
  if (prices[i]>mx){
    mx=prices[i]
    mxchanged=1
    day=i
  }
}  
if (mxchanged==1) {
  print(mx)
  print(day)
} else {
  print("You lost your money")
}

#3 - sum the prices vector if there is a change
prices <- c(7,1,1,8,10,12,1)
mx=prices[1]
mxchanged=0 
sm=0
for (i in 1:length(prices)){
  if (prices[i]>mx){
    sm=prices[i]+mx
    mx=prices[i]
    mxchanged=1
  }
}  
if (mxchanged==1) {
  print(mx)
  print(sm)
} else {
  print("You lost your money")
}

#4 - add sum
add=0
for (i in 1:length(prices)){
  add=add+prices[i]
}
print(paste("your sum is:", add))

#5 - How many negativ/positive in vector
negpos <- c(-1,-2,3,2,0,-5,5)
neg=0
pos=0
for (i in 1:length(negpos)){
  if(negpos[i]<0){
    neg=neg+1
  }
  pos=length(negpos)-neg
}
print(neg)
print(pos)

#5.1 - How many negativ/positive/zero in vector
neg_pos <- c(-1,-2,3,2,1,-5,1,0)
neg=0
pos=0
zero=0
for (i in 1:length(neg_pos)){
  if(neg_pos[i]<0){
    neg=neg+1
  } 
  if(neg_pos[i]==0){
    zero=zero+1
  }
}
pos=length(neg_pos)-neg-zero
print(paste("neg;",neg))
print(paste("pos;",pos))
print(paste("zero;",zero))

#6 Sum two (easy version): print all the indexes
## that the value inside them is equal to the value inside the FIRST element in the array
# example: c(-1,-2,3,2,1,-5,1) -> 5,7
aray <- c(-1,-2,3,2,-1,-5,-1)
for (i in 2:length(aray)){
  if(aray[i]==aray[1]){
    i_index=i
    print(i_index)
  }
}

#6.1 double loop example
for (i in 1:3){
  for (j in 1:3){
    print(paste(i,j))
  }
}

#7 print differences: neg_pos <- c(1, 2, 5, 8, 10) -> 1, 3, 3, 2
v <- c(1, 2, 5, 8, 10)
dif_aray <- numeric(length(v)-1)
for (i in 1:length(v)-1){
  dif <- v[i+1]-v[i]
  dif_aray[i] <- dif
}
print(dif_aray)

#8 Sum two (real version): print all the indexes that the sum of their value equals 0
# example: c(-1,-2,3,2,1,-5,2) -> (1,5), (2,4), (2,7)
v <- c(-1,-2,3,2,1,-5,2)
for (i in 1:length(v)) {
  for (j in i:length(v)) {
    if (v[j]==(-v[i])) {
      print(paste(i,j)) 
    } 
   }
 }
#8
v <- c(-1,-2,3,2,1,-5,2)
for (i in 1:length(v)) {
  for (j in i:length(v)) {
    if (v[j]+v[i]==0) {
      print(paste(i,j)) 
    } 
  }
}

#9 Given an array of length N, with values of numbers in the range of 1..N, print the number
# of times each number appeared (guy merin asked me in Msft):
# example: c(1,5,3,5,3) -> (1, 0, 2, 0, 2)

v <- c(1,5,3,5,3,6,6,0)
aray <- numeric(6)
for (i in 1:length(v)){
   aray[v[i]]=aray[v[i]]+1
}
print(aray)
 
#_______________________
## Two sums
#Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
#You may assume that each input would have exactly one solution, and you may not use the same element twice.
#You can return the answer in any order.

# Sub optimal O(N^2)
nums <- c(3,5,2,4,7,11,15,2) 
target <- 9
should_break <- 0

for (i in 1:length(nums)){
  for (j in i:length(nums)){
    if (nums[i]+nums[j]==target){
      should_break <- 1
      print(paste(i,j))
      break
    }
  }
  if(should_break==1) {
    break
  }
}

# optimal O(N)
nums <- c(3,5,2,4,7,11,15,2) 
aray <- numeric(100) # create a "dictionary" to store new index array  
target <- 18
should_break <- 0

for (i in 1:length(nums)){
  aray[nums[i]]=i   # store the nums vector indexes into array   
  if((aray[target-nums[i]])>0){   # go over the nums, if we already found a completing number - means the index box(in aray) not empty    
    should_break <- 1   
    print(paste(aray[target-nums[i]],i)) # print the first and second index
    break
  }
  if(should_break==1) {
    break
  }
}

#_________________
#Given a string, return the first recurring character in it, or None if there is no recurring chracter.
#input = "interviewquery"
#output = "i"

#1 numeric example
v <- c(1,5,3,5,3,6,6,0)
aray <- numeric(10)
should_break <- 0
for (i in 1:length(v)){
 aray[v[i]]=aray[v[i]]+1
 if(aray[v[i]]==2){
   should_break <- 1
   print(v[i])
   break
 }
 if(should_break==1) {
   break
 }
}


