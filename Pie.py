# month = int(input("Enter Month: "))
# day = int(input("Enter Day: "))
# while True:
#     for i in range(month):
#         if (month == 1):
#             month1 = "January" 
#         elif (month == 2):
#             month1 = "Febuary"  
#         elif(month == 3):
#             month1 ="March"
#         elif(month == 4):
#             month1 = "April"  
#         elif month == 5:
#             month1 = "June"
#         elif month == 6:
#             month1 = "July" 
#         elif month == 7:
#             month1 = "August"
#         elif month == 8:
#             month1 = "September"
#         elif month == 9:
#             month1 = "October"
#         elif month == 10:
#             month1 = "November"
#         elif month == 11:
#             month1 = "December"
#         elif month == 12:
#             month1 = "January"
#     break

# while True:
#     for i in range(month):
#         if ((month == 12 and day == 16) and (month <=3 and day <= 15)):
#             season = "Winter"
#         elif ((month >= 3 and day <= 16) and (month <= 6 and day<=15)):
#             season = "Spring"
#         elif ((month >= 6 and day <= 16) and (month <= 9 and day <= 15)):
#             season = "Summer"
#         elif ((month >= 9 and day <= 16 ) and (month <= 12 and day <= 15)):
#             season = "Fall"        
#     break
    

# while True:
#     for i in range(day):
#         if day >= 4 or day <= 20:
#             ordinull = "th"
#         elif day == 1 and day == 21 and day == 31:
#             ordinall = "st"
#         elif day == 2 and day == 22:
#             ordinall = "nd"
#         elif day == 3 and day == 23:
#             ordinall = "rd"
#     break


# print(f"""{day}{ordinull} Month of {month1} and it is {season} Season.  
#     """)
arr =  [9, 0, 0, 9, 1, 2, 0, 1, 0, 1, 0, 3, 0, 1, 9, 0, 0, 0, 0, 9]
arr2 = []
arr3 = []
for i in arr:
    if i != 0:
        arr2.append(i)
    else:
        arr3.append(i)
finalarr = arr2+arr3
print(finalarr)
    
        
