import xlrd
from datetime import date
from datetime import datetime
import random

workbook = xlrd.open_workbook('testResult.xlsx')
worksheet = workbook.sheet_by_name('Sheet1')
file = open("testResult.txt","w") 
for x in range(0, 250000):
    
    pid=worksheet.cell(x, 0).value
    rid=worksheet.cell(x, 1).value
    proid=worksheet.cell(x, 2).value
    did=worksheet.cell(x, 3).value
    
    datee=worksheet.cell(x, 4).value
    datee2=worksheet.cell(x, 5).value
    pid=pid.encode('utf-8')
    rid=rid.encode('utf-8')
    proid=proid.encode('utf-8')
    did=did.encode('utf-8')
    dateR = xlrd.xldate.xldate_as_datetime(datee,workbook.datemode)
    dateR2 = xlrd.xldate.xldate_as_datetime(datee2,workbook.datemode)
    dateRegistered = dateR.date()
    dateRegistered2 = dateR2.date()
    print pid,rid,proid,did, dateRegistered,dateRegistered2
    #registered = str(dateRegistered)
    #date=date.encode('utf-8')
    #book = xlrd.open_workbook("myfile.xls")
    #sh = book.sheet_by_index(0)
    #a1 = sh.cell_value(rowx=0, colx=0)
    #a1_as_datetime = datetime.datetime(*xlrd.xldate_as_tuple(date, workbook.datemode))
   # print registered
    #print pid,did,mid,dateRegistered    
   
   
   
   
   
   
   # date=str(date).encode('utf-8')
    #reaction=reaction.replace(',', '')
    #reaction=reaction.replace(')', '')
    #reaction=reaction.replace('(', '')
    #-print (allergy)
    #print (aid)  
 #   print (date)
   # print str(drug)pid,rid,proid,did, dateRegistered,dateRegistered2
    file.write("Insert into testResult" +" " + "values ('"+(pid)+"', '"+(rid)+"','"+(proid)+"','"+(did)+"','"+str(dateRegistered)+"','"+str(dateRegistered2)+"');\n")
file.close()






