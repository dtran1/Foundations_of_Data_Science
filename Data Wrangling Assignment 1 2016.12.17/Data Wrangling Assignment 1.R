# finalized version to upload to Git for Data Wrangling Exercise # 1
#libraries
library(dplyr)
library(tidyr)
df <- read.csv("refine.csv")
#change company names and make all lower case 
# make company name lower case 
df$company <- tolower(df$company)
df
for (i in 1:length(df$company)) {
  if(df$company[i] == "phillips") {
    df$company[i] = "philips"
  }
  if(df$company[i] == "fillips") {
    df$company[i] = "philips"
  }
  if(df$company[i] == "phllips") {
    df$company[i] = "philips"
  }
  if(df$company[i] == "phillps") {
    df$company[i] = "philips"
  }
  if(df$company[i] == "phlips") {
    df$company[i] = "philips"
  }
  if (df$company[i] == "akz0") {
    df$company[i] = "akzo"
  }
  if (df$company[i] == "ak zo") {
    df$company[i] = "akzo"
  }
  if(df$company[i] == "unilver") {
    df$company[i] = "unilever"
  } else {
    df$company[i] = df$company[i]
  }
}


df$company

#separating one column into two 
glimpse(df)
df<-separate(df, Product.code...number, c("product_code", "product_number"), sep="-")

#create product category 
emptyDF = c() 
for (i in 1:length(df$product_code)) {
  if(df$product_code[i] == "p") {
    emptyDF[i] = "Smartphone"
  }
  if(df$product_code[i] == "v") {
    emptyDF[i] = "TV"
  }
  if(df$product_code[i] == "q") {
    emptyDF[i] = "Tablet"
  }
  if(df$product_code[i] == "x") {
    emptyDF[i] = "Laptop"
  }
}
df$product_category = emptyDF

#creating full address column based on address, city, and country separated by commas 
df <- df %>% 
  unite(full_address, address, city, country, sep=",")
View(df)
#turning rows into columns - that's using spread but to I don't know how to make binary values. 
df$company_philips = c()
for(i in 1:length(df$company)) {
  if (df$company[i] == "philips") {
    df$company_philips[i] = 1 
  } else {
    df$company_philips[i] = 0
  }
}
df$company_akzo = c() 
for(i in 1:length(df$company)) {
  if (df$company[i] == "akzo") {
    df$company_akzo[i] = 1 
  } else {
    df$company_akzo[i] = 0
  }
}
df$company_unilever = c()
for(i in 1:length(df$company)) {
  if (df$company[i] == "unilever") {
    df$company_unilever[i] = 1 
  } else {
    df$company_unilever[i] = 0
  }
}
df$company_van_houten = c()
for(i in 1:length(df$company)) {
  if (df$company[i] == "van houten") {
    df$company_van_houten[i] = 1 
  } else {
    df$company_van_houten[i] = 0
  }
}

# turns out this step is not necessary df$product_smartphone = c()
#df$product_tv = c() 

for(i in 1:length(df$product_category)) {
  if(df$product_category[i] == "Smartphone") {
    df$product_smartphone[i] = 1
  } else {
    df$product_smartphone[i] = 0
  }
}
for(i in 1:length(df$product_category)) {
  if(df$product_category[i] == "TV") {
    df$product_tv[i] = 1
  } else {
    df$product_tv[i] = 0
  }
}
for(i in 1:length(df$product_category)) {
  if(df$product_category[i] == "Laptop") {
    df$product_laptop[i] = 1
  } else {
    df$product_laptop[i] = 0
  }
}
for(i in 1:length(df$product_category)) {
  if(df$product_category[i] == "Tablet") {
    df$product_tablet[i] = 1
  } else {
    df$product_tablet[i] = 0
  }
}
#make this one step -- there has to be a way to condense these steps..

write.csv(df
          , file = "refine_clean.csv"
          , sep = "\t,"
          )


