install.packages("pryr")
library(pryr)

data(USArrests) #load in data from R's built in datasets
head(USArrests) #previous data; an S3 generic function
print(USArrests) #print all of the data; an S3 generic function
ftype(print) #returns "s3" "generic"
print #returns "UseMethod("print"), this tells me it is a generic function 


typeof(USArrests) #returns "list"
is.data.frame(USArrests) #returns TRUE
is.function(USArrests) #returns FALSE
otype(USArrests) #returns "S3"
otype(USArrests$Murder) #returns "base"


class(USArrests) #returns "data.frame"
class(USArrests$Murder) #returns "numeric"

##Turn USArrests into an S4 object
#Create the class "USArrestsS4"
setClass(
  Class = "USArrestsS4",
  slots = list(
    Murder = "numeric",
    Assault = "integer",
    UrbanPop = "integer",
    Rape = "numeric"
  )
)

#Create an object of class "USArrestsS4"
USArrests_S4 <- new(
  "USArrestsS4",
  Murder = USArrests$Murder,
  Assault = USArrests$Assault,
  UrbanPop = USArrests$UrbanPop,
  Rape = USArrests$Rape
)

otype(USArrests_S4) #returns "S4"

#Create a new S3 object
mydogs <- list(Name = "Knox", Breed = "American Bully", Weight = 55)
class(mydogs) <- "dog"
mydogs
otype(mydogs) #returns "S3"; checking to ensure it is an S3 object

#Create a new S4 object
setClass(
  Class = "dogS4",
  slots = list(
    Name = "character",
    Breed = "character",
    Weight = "numeric"
  )
)

mydogs_S4 <- new(
  "dogS4",
  Name = "Knox",
  Breed = "American Bully",
  Weight = 55
)

mydogs_S4
otype(mydogs_S4) #returns "S4"

#testing out something from the textbook!
setMethod("show", "dogS4",
          function(object) {
            cat(object@Name, "is a", object@Breed, "who weighs", object@Weight, "pounds.")
          }
      )

mydogs_S4 #returns "Knox is a American Bully who weighs 55 pounds."
#now, I'm not sure how I could get it to be grammatically correct depending on if "Breed" starts with a vowel (print "an") or a consonant (print "a")



