

# QUESTION 1


#Variable Declaration & Initialisation 
Field_Holder = "Temp" # Type String
Gene_Sig1 = 0 # Numeric Type
Gene_Sig2 = 0 # Numeric Type
Gene_Sig3 = 0 # Numeric Type
Gene_Sig4 = 0 # Numeric Type
Gene_Sig5 = 0 # Numeric Type
Counter = 1 # Numeric Type
#Variable Declaration & Initialisation ^

#Set Working Directory - So the program can find the data set
setwd("C:/Users/Craig/Desktop/CW1/Submission")
#Set Working Directory ^

#Declaring a dataset and initialising it with the dataset, which is in the format csv. The dataset name is direclty below
Imported_Data_DF <- read.csv("PanCanAtlas_9126RNASeqSamplesWithImmuneSubtypes_440Genes_SampleIdsOrdered_RR020718_RownamesGenesWithSignature.csv")
#Loading in Dataset ^

#While loop running while Counter is less than or equal to 440. 440 is significant because it is the number of genes,
#in our dataset.
while (Counter <= 440){
  
  # (Field_Holder) - String Variable is set to equal the Data Frame @Imported_Data_DF cell Number, in this case this
  # is equal to the gene name.As Counter increments by 1 each iteration, the variable Field_Holder equals the new gene
  # name below.
  Field_Holder = (Imported_Data_DF[Counter,1])
  
  # (Field_Holder) - String Variable is set to equal the last character.
  # Making use of substring function -> (VariableName, Char_Num), nchar is used to get the length of the variable
  # Field_Holder, and then this is used in combination with Substring to get the last character of the string Field_Holder
  Field_Holder = (substring((Field_Holder),(nchar(as.character(Field_Holder)))))
  
  # These if statements, check what Field_Holder holds, and if a condition is true, it adds 1 to the Gene_Sig(x) variable
  # This is used to keep count.
  if (Field_Holder == "1") Gene_Sig1 = Gene_Sig1 + 1
  if (Field_Holder == "2") Gene_Sig2 = Gene_Sig2 + 1
  if (Field_Holder == "3") Gene_Sig3 = Gene_Sig3 + 1
  if (Field_Holder == "4") Gene_Sig4 = Gene_Sig4 + 1
  if (Field_Holder == "5") Gene_Sig5 = Gene_Sig5 + 1
  
  #At the end of the while loop, the variable Counter is incremented by 1, this changes Field_Holder to be equal to
  #a new Dataset cell, along with bringing the while loop closer to closing.
  Counter = Counter + 1}
#While loop running through all the features ^

#This prints out the following to console
print(paste("S1: [", Gene_Sig1, "] ","Gene_Sig2: [", Gene_Sig2, "] ", "Gene_Sig3: [", Gene_Sig3, "] ","Gene_Sig4: [", Gene_Sig4, "] ","Gene_Sig5: [", Gene_Sig5, "]"  ))
#Printing out results ^

#Declaring and initialising a new data frame called Output_DF, with the number of Gene_Signatures
Output_DF = data.frame(
  "Gene_Signature" = c("S1", "S2", "S3", "S4", "S5"),
  "Number_of_Genes" = c(Gene_Sig1,Gene_Sig2,Gene_Sig3,Gene_Sig4,Gene_Sig5)
)
#Outputting Results to a DataFrame ^

#Writing a DataFrame to a CSV File 
write.csv(Output_DF, "Num_Gene_Per_Sig.csv")
#Writing a DataFrame to a CSV File  ^



# QUESTION 2) PART 1


#Variable Declartion & initialization 
#Cancer Subtype
ACC = 0  #type Numeric
BLCA = 0 #type Numeric
BRCA = 0 #type Numeric
CESC = 0 #type Numeric
CHOL = 0 #type Numeric
COAD = 0 #type Numeric
ESCA = 0 #type Numeric
GBM = 0  #type Numeric
HNSC = 0 #type Numeric
KICH = 0 #type Numeric
KIRC = 0 #type Numeric
KIRP = 0 #type Numeric
LGG = 0  #type Numeric
LIHC = 0 #type Numeric
LUAD = 0 #type Numeric
LUSC = 0 #type Numeric
MESO = 0 #type Numeric
OV = 0   #type Numeric
PAAD = 0 #type Numeric
PCPG = 0 #type Numeric
PRAD = 0 #type Numeric
READ = 0 #type Numeric
SARC = 0 #type Numeric
SKCM = 0 #type Numeric
STAD = 0 #type Numeric
TGCT = 0 #type Numeric
THCA = 0 #type Numeric
UCEC = 0 #type Numeric
UCS = 0  #type Numeric
UVM = 0  #type Numeric
#Cancer Subtype

Counter = 2 #type Numeric
First_Cancer_Type_Char_Loc = 0 #type Numeric
Second_Cancer_Type_Char_Loc = 0 #type Numeric
Field_Holder = "temp" #type String
#Variable Declartion & initialization

#Set Working Directory - So the program can find the data set
setwd("C:/Users/Craig/Desktop/CW1/Submission")
#Set Working Directory ^


#Declaring a dataset and initialising it with the dataset, which is in the format csv. The dataset name is direclty below
Imported_Data_DF <- read.csv("PanCanAtlas_9126RNASeqSamplesWithImmuneSubtypes_440Genes_SampleIdsOrdered_RR020718_RownamesGenesWithSignature.csv")
#Loading in Dataset ^

#While loop running while Counter is less than or equal to 9127. 9127(+1 to account for Dataset format) is significant because it is the
#number of patients, in our dataset.
while (Counter <= 9127){
  
  # (Field_Holder) - String Variable is set to equal the Data Frame @Imported_Data_DF cell Number, in this case this
  # is equal to the Column name (which is a new patient).
  # As Counter increments by 1 each iteration, the variable Field_Holder equals the new Column name below.
  Field_Holder = colnames(Imported_Data_DF[Counter])
  
  # @Variable Second_Cancer_Type_Char_Loc is equal to Patient Length - 3, as each Patient name has the subtype 
  # at the end, the "-3" accounts for the string length of this, and points to the last char of the Cancer subtype.
  Second_Cancer_Type_Char_Loc = (nchar(Field_Holder)) - 3
  
  # @Variable First_Cancer_Type_Char_Loc is equal to Second_Cancer_Type_Char_Loc as we know to work out way backwards
  # from this point to find the dot.
  First_Cancer_Type_Char_Loc = Second_Cancer_Type_Char_Loc
  
  # This while loop will continue untill the substring of Field_Holder, at the location of @variable
  # First_Cancer_Type_Char_Loc is equal to a "." this marks the end of our cancer subtype.
  while (!substring(Field_Holder,First_Cancer_Type_Char_Loc,First_Cancer_Type_Char_Loc) == "."){
    First_Cancer_Type_Char_Loc = First_Cancer_Type_Char_Loc - 1
  }
  
  # Here the @variable First_Cancer_Type_Char_Loc is incremented by 1, as we want it to point to the first
  # Char of the substring, rather than the "."
  First_Cancer_Type_Char_Loc = First_Cancer_Type_Char_Loc + 1;
  
  # Field_Holder is equal to the substring of Field_Holder at the first char of the subtype of the cancer, to the last char
  # of the subtype of cancer. This makes use of the substring function in R, to find the cancer subtype location.
  Field_Holder = substring(Field_Holder,First_Cancer_Type_Char_Loc, Second_Cancer_Type_Char_Loc)
  
  # These if statements, check what Field_Holder holds, and if a condition is true, it adds 1 to the Cancer_Subtype(x) variable
  # This is used to keep count.
  if (Field_Holder == "ACC") ACC = ACC + 1
  if (Field_Holder == "BLCA") BLCA = BLCA + 1
  if (Field_Holder == "BRCA") BRCA = BRCA + 1
  if (Field_Holder == "CESC") CESC = CESC + 1
  if (Field_Holder == "CHOL") CHOL = CHOL + 1
  if (Field_Holder == "COAD") COAD = COAD + 1
  if (Field_Holder == "ESCA") ESCA = ESCA + 1
  if (Field_Holder == "GBM") GBM = GBM + 1
  if (Field_Holder == "HNSC") HNSC = HNSC + 1
  if (Field_Holder == "KICH") KICH = KICH + 1
  if (Field_Holder == "KIRC") KIRC = KIRC + 1
  if (Field_Holder == "KIRP") KIRP = KIRP + 1
  if (Field_Holder == "LGG") LGG = LGG + 1
  if (Field_Holder == "LIHC") LIHC = LIHC + 1
  if (Field_Holder == "LUAD") LUAD = LUAD + 1
  if (Field_Holder == "LUSC") LUSC = LUSC + 1
  if (Field_Holder == "MESO") MESO = MESO + 1
  if (Field_Holder == "OV") OV = OV + 1
  if (Field_Holder == "PAAD") PAAD = PAAD + 1
  if (Field_Holder == "PCPG") PCPG = PCPG + 1
  if (Field_Holder == "PRAD") PRAD = PRAD + 1
  if (Field_Holder == "READ") READ = READ + 1
  if (Field_Holder == "SARC") SARC = SARC + 1
  if (Field_Holder == "SKCM") SKCM = SKCM + 1
  if (Field_Holder == "STAD") STAD = STAD + 1
  if (Field_Holder == "TGCT") TGCT = TGCT + 1
  if (Field_Holder == "THCA") THCA = THCA + 1
  if (Field_Holder == "UCEC") UCEC = UCEC + 1
  if (Field_Holder == "UCS") UCS = UCS + 1
  if (Field_Holder == "UVM") UVM = UVM + 1
  
  #At the end of the while loop, the variable Counter is incremented by 1, this changes Field_Holder to be equal to
  #a new Data Frame cell, along with bringing the while loop closer to closing.
  Counter = Counter + 1
}


#Declaring and initialising a new data frame called Output_DF, with the number of Cancer Subtypes.
Output_DF = data.frame(
  "Cancer_Subtype" = c("ACC", "BLCA", "BRCA", "CESC", "CHOL",
                       "COAD","ESCA","GBM","HNSC","KICH",
                       "KIRC","KIRP","LGG","LIHC","LUAD",
                       "LUSC","MESO","OV","PAAD","PCPG",
                       "PRAD","READ","SARC","SKCM","STAD",
                       "TGCT","THCA","UCEC","UCS","UVM"),
  "Number_of_Samples" = c(ACC, BLCA, BRCA, CESC, CHOL,
                          COAD,ESCA,GBM,HNSC,KICH,
                          KIRC,KIRP,LGG,LIHC,LUAD,
                          LUSC,MESO,OV,PAAD,PCPG,
                          PRAD,READ,SARC,SKCM,STAD,
                          TGCT,THCA,UCEC,UCS,UVM))
#Outputting Results to a DataFrame ^

#Writing a DataFrame to a CSV File 
write.csv(Output_DF, "Num_Cancer_Subtypes.csv")
#Writing a DataFrame to a CSV File ^



# QUESTION 2) PART 2


#Variable Declaration & Initialisation 
Immune_Subtype_C1 = 0 # Numeric Type
Immune_Subtype_C2 = 0 # Numeric Type
Immune_Subtype_C3 = 0 # Numeric Type
Immune_Subtype_C4 = 0 # Numeric Type
Immune_Subtype_C5 = 0 # Numeric Type
Immune_Subtype_C6 = 0 # Numeric Type
Field_Holder = "temp" # String Type
Counter = 2           # Numeric Type
#Variable Declaration & Initialisation 

Immune_Subtypes = c("C1","C2","C3","C4","C5","C6") #Vector Declaration and Initialisation


#Set Working Directory - So the program can find the data set
setwd("C:/Users/Craig/Desktop/CW1/Submission")
#Set Working Directory ^


#Declaring a dataset and initialising it with the dataset, which is in the format csv. The dataset name is direclty below
Imported_Data_DF <- read.csv("PanCanAtlas_9126RNASeqSamplesWithImmuneSubtypes_440Genes_SampleIdsOrdered_RR020718_RownamesGenesWithSignature.csv")
#Loading in Dataset

#While loop running while Counter is less than or equal to 9127. 9127(+1 to account for Dataset format) is significant because it is the
#number of patients, in our dataset.
while (Counter <= 9127){
  
  # (Field_Holder) - String Variable is set to equal the Data Frame @Imported_Data_DF cell Number, in this case this
  # is equal to the Column name (which is a new patient).
  # As Counter increments by 1 each iteration, the variable Field_Holder equals the new Column name below.
  Field_Holder = colnames(Imported_Data_DF[Counter])
  
  # (Field_Holder) - String Variable is set to equal the last character.
  # Making use of substring function -> (VariableName, Char_Num), nchar is used to get the length of the variable
  # Field_Holder, and then this is used in combination with Substring to get the last character of the string Field_Holder
  Field_Holder = (substring((Field_Holder),(nchar(as.character(Field_Holder)))))
  
  # These if statements, check what Field_Holder holds, and if a condition is true, it adds 1 to the Immune_Subtype(x) variable
  # This is used to keep count.
  if (Field_Holder == "1") Immune_Subtype_C1 = Immune_Subtype_C1 + 1
  if (Field_Holder == "2") Immune_Subtype_C2 = Immune_Subtype_C2 + 1
  if (Field_Holder == "3") Immune_Subtype_C3 = Immune_Subtype_C3 + 1
  if (Field_Holder == "4") Immune_Subtype_C4 = Immune_Subtype_C4 + 1
  if (Field_Holder == "5") Immune_Subtype_C5 = Immune_Subtype_C5 + 1
  if (Field_Holder == "6") Immune_Subtype_C6 = Immune_Subtype_C6 + 1
  
  #At the end of the while loop, the variable Counter is incremented by 1, this changes Field_Holder to be equal to
  #a new Dataset cell, along with bringing the while loop closer to closing.
  Counter = Counter + 1
  
}

# This line of code outputs the next diagram as a png file, with the following name.
png('Freq_Of_Immune_Subtypes.png')

#The method barplot, takes in the data gathered from the above datasets, and creates a diagram based on these.
barplot(height = c(Immune_Subtype_C1,Immune_Subtype_C2,Immune_Subtype_C3, Immune_Subtype_C4, Immune_Subtype_C5, Immune_Subtype_C6),
        legend.text =c(Immune_Subtype_C1,Immune_Subtype_C2,Immune_Subtype_C3, Immune_Subtype_C4, Immune_Subtype_C5, Immune_Subtype_C6) , 
        names.arg = Immune_Subtypes, col = rainbow(6), main = "Frequency of Immune Subtypes", xlab = "Immune Subtypes of Cancer", ylab = "Frequency of Subtypes", ylim = c(0,3000))

# Dev.off shuts down all graphic devices, and ensures that the file is outputed correctly without interference
dev.off()



# Question 3


#Variable Declaration & Initialisation 
Field_Holder = "Temp" # Type String
Number_Holder = 0
Counter = 1 # Numeric Type
Vec_Location = c()
Vec_Num = c()
Vec_Char = vector(mode="character", length=3)
Col_Counter_0 = 0
Col_Counter_1 = 0
Col_Counter_2 = 0
Col_Counter_3 = 0
#Variable Declaration & Initialisation ^


#Set Working Directory - So the program can find the data set
setwd("C:/Users/Craig/Desktop/CW1/Submission")
#Set Working Directory ^

#Declaring a dataset and initialising it with the dataset, which is in the format csv. The dataset name is direclty below
Imported_Data_DF <- read.csv("PanCanAtlas_9126RNASeqSamplesWithImmuneSubtypes_440Genes_SampleIdsOrdered_RR020718_RownamesGenesWithSignature.csv")
#Loading in Dataset ^

# Counting number of NA per Row and storing it in a Dataframe
NA_ROW_SUM = apply(is.na(DF), 1, sum)
# Counting number of NA per Row and storing it in a Dataframe

# Counting number of NA per Column and storing it in a Dataframe
NA_Column_SUM = apply(is.na(DF), 2, sum)
# Counting number of NA per Column and storing it in a Dataframe

#While Loop that is running 440 times, to account for the number of rows in the data frame
while(Counter <= 440){
  Number_Holder = NA_ROW_SUM[Counter] #Storing the field in Number_Holder
  
  if (Number_Holder > 0){ # if Num is greater than 0, store it in various vectors
    Vec_Location = c(Vec_Location, (Imported_Data_DF[Counter,1]))
    Vec_Num = c(Vec_Num, Number_Holder)}
  Counter = Counter + 1 # increase the Counter by 1 to change the selection
}

#Resetting the Counter by setting it to one
Counter = 1

#While counter is less than three change the selection into string values, and store in an pre-set vector
while(Counter <= 3){
  Number_Holder = Vec_Location[Counter]
  Field_Holder = (Imported_Data_DF[Number_Holder,1])
  Field_Holder = substring(Field_Holder, 1)
  Vec_Char[Counter] = Field_Holder
  Counter = Counter + 1
}
#Save the next graphic as a png, with this title
png('Missing_Genes.png')
#Setting the barplot up with various values
barplot.default(height = Vec_Num, names.arg = Vec_Char, ylim = c(0,2000), legend.text = Vec_Num, col = rainbow(3),
                main = "Missing Genes", ylab = "Number of missing Genes", xlab = "Gene Names")
dev.off() #Closing the graphical interface

#Resetting Field_Holder and Counter 
Field_Holder = "Temp" # Type String
Counter = 2 # Numeric Type

#Running through all the patients listed, and adding up the summed NA genes per patient
while (Counter <= 9127){
  Field_Holder = (NA_Column_SUM[Counter])
  Field_Holder = (substring((Field_Holder),(nchar(as.character(Field_Holder)))))
  
  # These if statements add up and count the number of NA per patient
  if (Field_Holder == "0") Col_Counter_0 = Col_Counter_0 + 1
  if (Field_Holder == "1") Col_Counter_1 = Col_Counter_1 + 1
  if (Field_Holder == "2") Col_Counter_2 = Col_Counter_2 + 1
  if (Field_Holder == "3") Col_Counter_3 = Col_Counter_3 + 1
  
  Counter = Counter + 1
}
# Initialisation and Declaration of a vector containing the counter information
Vec_Missing = c(Col_Counter_0,Col_Counter_1,Col_Counter_2, Col_Counter_3)
#Initialisation and Declaration of a vector containing the Title information
Vec_Missing_Title = c("0","1","2","3")

# The following line of code, saves the graphic as an PNG
png('Missing_Patient_Genes.png')
#This creates a barplot, and fills in the various needed information
barplot.default(height = Vec_Missing, names.arg = Vec_Missing_Title, ylim = c(0,8000), legend.text = Vec_Missing, col = rainbow(4),
                main = "Number of missing per Gene", ylab = "Number of samples = 9126", xlab = "Number of Patients with missing Data")
dev.off()#Dev off closes the graphical interface

#I think the best package to use would be Amela, simply excluding data is dangerous, as it may lead to poor end results when analysising the data,
#,or using different visiaul techniques. Amerla makes use of EM bootstrapping, and works using Multivariable normal distribution, our data set contains
#lots of features/variables, so therefore this would be the best way for predicting the missing data. However a downside of using Amerla is that it
#struggles to make use of different variable types. Mice uses mean matching , however as we have a lot of variables, and features, this may not work
#so well.