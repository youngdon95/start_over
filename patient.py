from faker import Factory

from datetime import date
import random
 
""
"""
 
year = random.randint(1950, 2000)
month = random.randint(1, 12)
day = random.randint(1, 28)
birth_date = datetime(year, month, day)
print birth_date
"" 
file.close() 

for _ in range(0, 2):
  #file = open("testfile.txt","w")
  name=fake.address()
 # print fake.phoneNumber()
  #print fake.name()
  #file.write("Hello World" + name + ";")
  print name
  print fake.dateTimeThisCentury()
  print name
  print(fake.first_name_male())
  """
fake = Factory.create()




    
    
def gen_phone():
    first = str(random.randint(100,999))
    second = str(random.randint(1,888)).zfill(3)

    last = (str(random.randint(1,9998)).zfill(4))
    while last in ['1111','2222','3333','4444','5555','6666','7777','8888']:
        last = (str(random.randint(1,9998)).zfill(4))

    return '{}-{}-{}'.format(first,second, last)

file = open("patient.txt","w") 
for _ in xrange(500002):
      
  patientNum = str( _ + 1)
  patientId = "P-" + patientNum
  cellNumber=gen_phone()
  homeNumber = gen_phone()
  address=fake.address()
  address=address.replace(',', '')
  fname=fake.first_name_male()
  lname=fake.first_name_female()
  year = random.choice(range(1950, 2001))
  month = random.choice(range(1, 13))
  day = random.choice(range(1, 29))
 # dob = datetime.date(year, month, day)
  # dob = (str(year)+-+str(month)+-+str(day))
  birth_date = date(year,month, day)
 # print address
  #print patientId
  #file.write(fname+","+ lname)
  #file.write("Insert into patient(first_name,last_name,dob,address,cellNum,homeNum)" + "values ("+fname+","+lname+","+ str(birth_date)+","+address+","+str(cellNumber)+","+str(homeNumber)+");\n")
  file.write("Insert into patient" +" " + "values ('"+patientId+"', '"+fname+"','"+lname+"','"+ str(birth_date)+"','"+address+"','"+str(cellNumber)+"','"+str(homeNumber)+"');\n")
file.close()
  
  
  
  
  
  
  
  
  
  
  