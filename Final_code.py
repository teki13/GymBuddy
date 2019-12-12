import os
import time
import pymysql.cursors
from datetime import datetime
import random

#Connect to the DB
def create_connection():
	return pymysql.connect(host='localhost',
                       port = 8889,
                       user='root',
                       password='root',
                       db='gymbuddy',
                       charset='utf8mb4',
                       cursorclass=pymysql.cursors.DictCursor)


class User():
	def __init__(self, email, name, surname, age, gender, lifestyle, expLvl, height, weight, password):
		self.email = email
		self.name = name
		self.surname = surname
		self.age = age
		self.gender = gender
		self.lifestyle = lifestyle
		self.expLvl = expLvl
		self.height = height
		self.weight = weight
		self.password = password
		self.bmi = round(weight/height/height, 1)

class Workout():
	def __init__(self, typ, difficulty, avCallBurnt, duration, numOfExc, excercises):
		self.typ = typ
		self.difficulty = difficulty
		self.avCallBurnt = avCallBurnt
		self.duration = duration
		self.numOfExc = numOfExc
		self.excercises = excercises

	def displayExcercise(self, num):
		while True:
			self.excercises[num].display()

			print("\nOptions:")
			print("1. Continue")
			print("2. Go back")
			print("3. Quit")

			choice = input()

			if choice == "1":
				num+=1
				if num == self.numOfExc:
					print("\nCongratulations, you finished the workout!")
					time.sleep(3)
					displayMenu()
					break
				else:
					self.excercises[num].display()
			elif choice == "2":
				num-=1
				if num<0:
					self.display()
					break
				else:
					self.excercises[num].display()
			elif choice == "3":
				displayMenu()
				break

	def display(self):
		while True:
			os.system("clear")
			print(f"{self.typ} workout statistics:")
			print(f"Workout duration is: {self.duration}")
			print(f"Number of excercises is: {self.numOfExc}")
			print(f"Difficulty of workout is: {self.difficulty}")
			print(f"Average callories burnt during workout are: {self.avCallBurnt}")
			print("\nExcercises:")
			for excercise in self.excercises:
				print(excercise.name)

			print("\nOptions:")
			print("1. Start workout")
			print("2. Go back to the main menu")

			choice = input()
			i = 0

			if choice == "1":
				self.displayExcercise(i)
				break
			elif choice == "2":
				displayMenu()
				break

class Excercise():
	def __init__(self, name, difficulty, desc, type):
		self.name = name
		self.difficulty = difficulty
		self.desc = desc
		self.type = type

	def display(self):
		os.system("clear")
		print(f"{self.name}\n")
		print(f"Difficulty of this excercise: {self.difficulty}")
		print(f"\n{self.desc}")

workouts = []
user = User

def getData(email):
	global workouts
	global user
	#GET ALL DATA FROM FROM DB
	# workouts = [Workout("Push Day", "Easy", 300, 60, 3, [Excercise("Push ups", "Easy", "You should do 20 push ups."), Excercise("Chest press", "Medium", "You should do 10 repetitions on a chest press."), Excercise("Trademill", "Easy", "You should run for 10 minutes.")]), Workout("Pull Day", "Advanced", 420, 40, 2, [Excercise("Football", "Easy", "You should do football drills."), Excercise("Bench", "Beginner", "Work our on a bench for a while.")]), Workout("Heavy Day", "Hard", 500, 45, 2, [Excercise("Biceps curl", "Hard", "You should do 10 repetitions."), Excercise("Chest press", "Medium", "You should do 10 repetitions on a chest press.")])]
	# user = User(a, b, c...)
	conn = create_connection()
	cursor = conn.cursor()

	query = 'SELECT * FROM user WHERE email = %s'
	cursor.execute(query,(email))

	data = cursor.fetchone()

	cursor.close()

	#initilazie the object
	user = User(data['email'],data['name'],data['surname'],data['age'],data['gender'],data['lifestyle'],data['experience_level'],data['height'],data['weight'],data['password'])
	
	#find the workout for this user based on their experience level
	#extract the workout
	cursor = conn.cursor()
	
	query = 'SELECT * FROM workout WHERE difficulty = %s'
	cursor.execute(query,user.expLvl)

	workout = cursor.fetchall()

	cursor.close()

	#extract the exercises
	cursor = conn.cursor()
	query = 'SELECT * FROM Exercise WHERE Difficulty = %s'
	cursor.execute(query,user.expLvl)

	exercises = cursor.fetchall()

	cursor.close()

	#create exercise objects
	exercise_array = []

	for i in exercises:
		new_exerc = Excercise(i['Exercise_name'], i['Difficulty'], i['Instructions'], i['Type'])
		exercise_array.append(new_exerc)
	
	for i in workout:
		mult_exer =[]
		for j in exercise_array:
			if i['Type'] == j.type:
				mult_exer.append(j)
		
		new_workout = Workout(i['Type'],i['difficulty'],i['avg_calories_burnt'],i['duration_minutes'],i['number_of_exercises'],mult_exer)
		workouts.append(new_workout)

	for i in workouts:
		print(i.typ)


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
		login = input("Login: ")
		password = input("Password: ")

		print("Login", login)
		print("Password", password)

		conn = create_connection()

		cursor = conn.cursor()

		query = 'SELECT * FROM user WHERE email = %s and password = %s'
		cursor.execute(query, (login,password))

		data = cursor.fetchone()

		cursor.close()

		#if user inside database redirect to Menu
		if(data):
			getData(login)
			return displayMenu()
		#if user is not in the database display below options
		else:
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
		print("Please enter your preffered login and password: ")
		login = input("Login: ")
		password = input("Password: ")
		name = input("Name: ")
		surname = input("Surname: ")
		age = input("Age: ")
		gender = input("Gender (Female or Male): ")
		lifestyle = input("Lifestyle (Active, Moderately Active, Sedentary): ")
		experience_level = input("Experience Level (Beginner, Intermediate, Advanced): ")
		height = input("Height (in meters): ")
		weight = input("Weight (in kilograms): ")
		BMI = 0

		conn = create_connection()

		#Query the database
		cursor = conn.cursor()

		query = 'SELECT * FROM user WHERE email = %s'
		cursor.execute(query,(login))

		data = cursor.fetchone()

		#check if the user is an already existing user
		if(data):
			print("This user already exists")
			cursor = conn.close()
			time.sleep(3)
			return displayLogin()
		#otherwise input into the databse
		else: 
		
			ins = 'INSERT INTO user VALUES(%s, %s, %s,%s, %s,%s,%s,%s,%s,%s,%s)'
			cursor.execute(ins, (login,name,surname,age,gender,lifestyle,experience_level,height,weight,password,BMI))
			conn.commit()
			cursor.close()
			getData(login)

		

			print(f"\nWelcome to Gym Buddy {login}!")
			time.sleep(3)
			displayMenu()
			break

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
			displayWorkoutMenu()
			break
		elif choice == "3":
			displayBMI()
			break
		elif choice == "4":
			displayLogin()
			break
		elif choice == "5":
			break


def displayBMI():
	while True:
		os.system("clear")

		global user
		conn = create_connection()

		cursor = conn.cursor()

		query = '''SELECT BMI FROM user WHERE email = %s'''
		cursor.execute(query,(user.email))

		data = cursor.fetchone()
		cursor.close()

		print(f"Your last recorder BMI was {data['BMI']}.\n")

		#display the results and the ideal BMI range
		if(data['BMI']>= 18.5 and data['BMI'] <= 24.9):
			print("Your BMI is in the ideal range!")
		elif(data['BMI'] < 18.5):
			print("You are underweight and below the ideal range. The ideal range is between 18.5 and 24.9")
		else:
			print("You are above the ideal range. The ideal range is between 18.5 and 24.9")

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
	global user

	while True:
		os.system("clear")
		print("Please enter your measurements:")
		weight = input("Your weight in kilograms: ")
		height = input("Your height in meters: ")

		if (weight.isdigit() or isFloat(weight)) and (height.isdigit() or isFloat(height)):
			print(f"\nYour current BMI is {round(float(weight)/float(height)/float(height), 1)}\n")

			BMI_calculated = round(float(weight)/float(height)/float(height), 1)

			conn = create_connection()
			cursor = conn.cursor()

			#Update the database by inserting the new calculated BMI
			ins = '''UPDATE user SET BMI = %s WHERE email = %s'''
			cursor.execute(ins,(BMI_calculated,user.email))

			conn.commit()
			cursor.close()

			#display the results and the ideal BMI range
			if(BMI_calculated>= 18.5 and BMI_calculated <= 24.9):
				print("Your BMI is in the ideal range!")
			elif(BMI_calculated < 18.5):
				print("You are underweight and below the ideal range. The ideal range is between 18.5 and 24.9")
			else:
				print("You are above the ideal range. The ideal range is between 18.5 and 24.9")

			user.weight = weight
			user.height = height
			user.bmi = round(float(weight)/float(height)/float(height), 1)
		#SEND UPDATED USER TO DB 

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

	global user

	while True:
		os.system("clear")
		print("Please enter your today's statistics:")
		callories = input("Number of callories consumed: ")
		water = input("Glasses of water consumed: ")
		sleep = input("How many hours have you slept for tonight: ")

		if callories.isdigit() and water.isdigit() and sleep.isdigit():
			conn = create_connection()

			now = datetime.now()
			dt_string = now.strftime("%H:%M:%S/%d/%m/%Y/") # unique date_id 
			unique = str(random.randint(1, 1000))
			#insert the newly inserted daily statistics into the database
			cursor = conn.cursor()
			ins = 'INSERT INTO Daily_Info VALUES(%s,%s,%s,%s,%s,%s)'
			cursor.execute(ins,(unique,user.email,sleep,callories,water,user.weight))
			conn.commit()
			cursor.close()

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
				break

def displayWorkoutMenu():
	while True:
		os.system("clear")
		print("Choose your workout plan: ")
		print("1. Push Day")
		print("2. Pull Day")
		print("3. Heavy Day")
		print("4. Go back to the main menu")

		choice = input()

		if choice == "1":
			displayWorkouts("Push")
			break
		elif choice == "2":
			displayWorkouts("Pull")
			break
		elif choice == "3":
			displayWorkouts("Heavy")
			break;
		elif choice =="4":
			displayMenu()
			break;

def displayWorkouts(workoutType):
	os.system("clear")
	if workoutType == "Push":
		workouts[0].display()
	elif workoutType == "Pull":
		workouts[1].display()
	elif workoutType == "Heavy":
		workouts[2].display()

#getData()
displayStart()




