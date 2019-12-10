import os
import time
import pymysql.cursors

conn = pymysql.connect(host='localhost',
                       port = 8889,
                       user='root',
                       password='root',
                       db='GymBuddy',
                       charset='utf8mb4',
                       cursorclass=pymysql.cursors.DictCursor)




def displayMenu():
	while True:
		os.system("clear")
		print("Welcome to the Gym Buddy App, type a number to choose what are you going to do:")
		print("1. Enter your daily statistics")
		print("2. Choose a workout")
		print("3. View your BMI")
		print("4. Log out")
		print("5. Quit")
		choice = input()

		if choice == "1":
			displayDailyStats()
			break
		elif choice == "2":
			break
		elif choice == "3":
			displayBMI()
			break
		elif choice == "4":
			displayLogin()
			break
		elif choice == "5":
			break

def displayStart():
	while True:
		os.system("clear")
		print("Gym Buddy")
		
		print("Please login or register to our application.\n")
		print("Options:")
		print("1. Login")
		print("2. Register")
		print("3. Quit")

		choice = input()

		if choice == "1":
			displayLogin()
			break
		elif choice == "2":
			displayRegister()
			break
		elif choice == "3":
			break;

def displayLogin():
	while True:
		os.system("clear")
		print("Gym Buddy")
		email = input("Login: ")
		password = input("Password: ")


		#check if the login and password in DB
		cursor = conn.cursor()

		query = 'SELECT * FROM user WHERE email = %s and password = %s'
		cursor.execute(query, (email,password))

		data = cursor.fetchone()
		print(data)

		cursor.close()

		if(data):
			return displayMenu()
		else: 


		# else:
			print("\nLogin or Password were invalid, please reenter them or register.\n")
			print("Options:")
			print("1. Enter your credentials again")
			print("2. Register")
			print("3. Quit")

			choice = input()

			if choice == "1":
				displayLogin()
				break
			elif choice == "2":
				displayRegister()
				break
			elif choice == "3":
				break;

def displayRegister():
	while True:
		os.system("clear")
		print("Please enter your preffered email and password: ")
		email = input("Login: ")
		password = input("Password: ")
		name = input("Name: ")
		surname = input("Surname: ")
		age = input("Age: ")
		gender = input("Gender (Female or Male): ")
		lifestyle = input("Lifestyle (Active, Moderately Active, Sedentary): ")
		experience_level = input("Experience Level (Beginner, Intermediate, Advanced)")
		height = input("Height (in meters): ")
		weight = input("Weight (in kilograms)")
		BMI = 0

		#check for types, ranges etc
		cursor = conn.cursor()

		query = 'SELECT * FROM user WHERE email = %s'
		cursor.execute(query,(email))

		data = cursor.fetchone()

		if(data):
			print("This user already exists")
			cursor = conn.close()
			time.sleep(3)
			return displayRegister()
		else: 
			ins = 'INSERT INTO user VALUES(%s, %s, %s,%s, %s,%s,%s,%s,%s,%s,%s)'
			cursor.execute(ins, (email,name,surname,age,gender,lifestyle,experience_level,height,weight,password,BMI))
			conn.commit()
			cursor.close()

		

		
		# after login and password are saved to DB do to menu

			print(f"\nWelcome to Gym Buddy {email}!")
			time.sleep(3)
			displayMenu()
			break

def displayBMI():
	while True:
		os.system("clear")

		# bmi = get it from DB
		bmi = 0

		print(f"Your last recorder BMI was {bmi}.\n")
		print("Options:")
		print("1. Enter your measurements again")
		print("2. Go back to the main menu")

		choice = input()

		if choice == "1":
			calculateBMI()
			break
		elif choice == "2":
			displayMenu()
			break

def calculateBMI():
	while True:
		os.system("clear")
		print("Please enter your measurements:")
		weight = input("Your weight in kilograms: ")
		height = input("Your height in meters: ")

		if (weight.isdigit() or isFloat(weight)) and (height.isdigit() or isFloat(height)):
			BMI_calculated = round(float(weight)/float(height)/float(height), 1)
			#insert BMI in DB
			#cursor = conn.cursor()

			print(f"\nYour current BMI is {round(float(weight)/float(height)/float(height), 1)}\n")
			print("Options:")
			print("1. Enter your measurements again")
			print("2. Go back to the main menu")

			choice = input()

			if choice == "1":
				calculateBMI()
				break
			elif choice == "2":
				displayMenu()
				break

def isFloat(str):
	try:
	    float(str)
	    return True
	except ValueError:
	    return False


def displayDailyStats():
	while True:
		os.system("clear")
		print("Please enter your today's statistics:")
		callories = input("Number of callories consumed: ")
		water = input("Glasses of water consumed: ")
		sleep = input("How many hours have you slept for tonight: ")

		if callories.isdigit() and water.isdigit() and sleep.isdigit():

			# send stats to DB

			os.system("clear")
			print("Your daily statistics:")
			if int(callories) < 2200:
				print(f"You should eat {2200 - int(callories)} more callories today.")
			else:
				print(f"You already ate {int(callories) - 2200} more callories than you should have today.")
			if int(water) < 8:
				print(f"You should drink {8 - int(water)} more glasses of water today.")
			else:
				print(f"You already had {int(water) - 8} extra glasses of water today.")
			if int(sleep) < 7:
				print(f"You should get {7 - int(sleep)} more hours of sleep today.\n")
			else:
				print(f"You already got {int(sleep) - 7} extra hours of sleep today.\n")

			print("Options:")
			print("1. Go back to the main menu")
			choice = input()

			if choice == "1":
				displayMenu()

displayStart()





