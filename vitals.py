from datetime import date
from datetime import datetime
import random


file = open("vitals2.txt","w") 
sign = "vitals"

#vitalNum = 1
nurseNum = 1

def essentials(num):
    patientSign = "P-"
    patientId = patientSign + (str(num))
    return patientId
    
def theDate() :   
    year = random.choice(range(1990, 2018))
    month = random.choice(range(1, 13))
    day = random.choice(range(1, 29))
    dateTaken = date(year,month, day)
    return dateTaken
    #vitalSign = sign + "1"
    #empId = "Nrs" + str(nurseNum)


for s in range(1500,4000):
    patientId = essentials(s)
    dateTaken = theDate()
    vitalSign = sign + "1"
    empId = "Nrs" + str(nurseNum)
    
    valueNum = random.choice(range(49,81))
    value = str(valueNum) + "bpm"
    file.write("Insert into vitalsRecord" + " " + "values ('"+patientId+"','"+empId+"','"+vitalSign+"','"+value+"','"+str(dateTaken)+"');\n")
    
    if nurseNum <29:
        nurseNum+=2
    else: nurseNum = 1
    
    patientId = essentials(s)
    dateTaken = theDate()
    vitalSign = sign + "2"
    empId = "Nrs" + str(nurseNum)
    topNum = random.choice(range(100,211))
    bottomNum = random.choice(range(75,121))
    value = str(topNum) + "/" + str(bottomNum) + "mmHg"
    file.write("Insert into vitalsRecord" + " " + "values ('"+patientId+"','"+empId+"','"+vitalSign+"','"+value+"','"+str(dateTaken)+"');\n")
    if nurseNum <25:
        nurseNum+=4
    else: nurseNum = 1
    
    patientId = essentials(s)
    dateTaken = theDate()
    vitalSign = sign + "3"
    empId = "Nrs" + str(nurseNum)
    temp = random.choice(range(65,190))
    value = str(temp) + "degreesF"
    file.write("Insert into vitalsRecord" + " " + "values ('"+patientId+"','"+empId+"','"+vitalSign+"','"+value+"','"+str(dateTaken)+"');\n")
    if nurseNum <29:
        nurseNum+=2
    else: nurseNum = 1
    
    patientId = essentials(s)
    dateTaken = theDate()
    vitalSign = sign + "4"
    empId = "Nrs" + str(nurseNum)
    breathing = random.choice(range(4,25))
    value = str(breathing) + "/min"
    file.write("Insert into vitalsRecord" + " " + "values ('"+patientId+"','"+empId+"','"+vitalSign+"','"+value+"','"+str(dateTaken)+"');\n")
    if nurseNum <29:
        nurseNum+=2
    else: nurseNum = 1
    
  
file.close()