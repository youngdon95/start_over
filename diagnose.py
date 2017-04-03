import xlrd
from datetime import date
from datetime import datetime
import random

workbook = xlrd.open_workbook('diagnose.xlsx')
worksheet = workbook.sheet_by_name('Sheet1')
file = open("diagnoseInsert.txt","w") 

empNum = 2
for x in range(0, 30884):
    
    year = random.choice(range(1990, 2018))
    month = random.choice(range(1, 13))
    day = random.choice(range(1, 29))
    
    disease=worksheet.cell(x, 0).value
    pid=worksheet.cell(x, 1).value
    
    pid = int(pid)
    pidStr = str(pid)
    disease=disease.encode('utf-8')
    pidStr=pidStr.encode('utf-8')
    date_diagnosed = date(year,month, day)
    
    eid = "Doc" + str(empNum)
    patient = "P-" + str(pidStr)
    file.write("Insert into diagnose" +" " + "values ('"+(eid)+"', '"+(disease)+"','"+(patient)+"','"+str(date_diagnosed)+"');\n")
    
    if empNum <30:
        empNum += 2
    else: empNum = 2
file.close()
