import xlrd
from datetime import date
from datetime import datetime
import random

workbook = xlrd.open_workbook('requires.xlsx')
worksheet = workbook.sheet_by_name('Sheet1')
file = open("requires.txt","w") 
for x in range(1, 13523):
    
    pid=worksheet.cell(x, 0).value
    eid=worksheet.cell(x, 1).value
   # datee=worksheet.cell(x, 2).value
    pid=pid.encode('utf-8')
    eid=eid.encode('utf-8')
    
    
   
   
   
   
   
   
   
   
   
   # date=str(date).encode('utf-8')
    #reaction=reaction.replace(',', '')
    #reaction=reaction.replace(')', '')
    #reaction=reaction.replace('(', '')
    #-print (allergy)
    print (pid)  
    print (eid)
   # print str(drug)
    file.write("Insert into requires" +" " + "values ('"+(pid)+"', '"+(eid)+"');\n")
file.close()