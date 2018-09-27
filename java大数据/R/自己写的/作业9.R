for (i in 1:6) {
  print("cat and dog")
}
j <- 6
while (j>0) {
  print("dog and cat");
  j <- j-1
}

a <- 1
if(is.numeric(a)) a <- as.character(a)
is.character(a)
if(is.numeric(a)) print("a is a numeric") else print("a is not a numeric")

b <- c("cat", "dag")

ifelse(is.numeric(b), 1, 0)

for (i in b) {
  print(
    switch (i,
      cat = "this is a cat",
      dag = "this is a dag"
    )
  )
}

mystats <- function(cat=TRUE, dog=FALSE){
  if(cat) print("have a cat") else print("not cat")
  if(dog) print("have a dog") else print("not dog")
  if(!cat & !dog) print("not cat and dog")
}
mystats()
mystats(dog=TRUE)
