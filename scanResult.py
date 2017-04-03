
file = open("testImage.txt","w") 
resultTest = "res-"

imageNum = 1
for s in range(10,111):
    resultNum = s
    resultId = resultTest + (str(resultNum))    
    imageUrl = '/image' + str(imageNum) + '.jpg'
#print imageUrl
    file.write("Insert into scanResult" + " " + "values ('"+resultId+"'," + " '" + imageUrl +"');\n")
    if imageNum <11:
        imageNum+=1
    else: imageNum = 1
    #print imageUrl
#file.write("Insert into scanResult" + " " + "values ('"+resultId+"', '"+blob_value+"');\n")
file.close()