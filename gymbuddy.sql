--
-- Database: `gymbuddy`
--

-- --------------------------------------------------------

--
-- Table structure for table `Daily_Info`
--

CREATE TABLE `Daily_Info` (
  `Daily_Info_ID` varchar(20) NOT NULL,
  `User_ID` varchar(20) NOT NULL,
  `Sleep_Duration` int(11) NOT NULL,
  `Callories_Consumed` int(11) NOT NULL,
  `WaterIntake` int(11) NOT NULL,
  `Weight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Daily_Info`
--

INSERT INTO `Daily_Info` (`Daily_Info_ID`, `User_ID`, `Sleep_Duration`, `Callories_Consumed`, `WaterIntake`, `Weight`) VALUES
('180', 'vc1238@nyu.edu', 6, 1000, 2, 102),
('22:25:25', 'vc1238@nyu.edu', 7, 300, 1, 102),
('743', 'vc1238@nyu.edu', 6, 400, 1, 102),
('795', 'vc1238@nyu.edu', 4, 400, 4, 102),
('950', 'vc1238@nyu.edu', 6, 500, 5, 102);

-- --------------------------------------------------------

--
-- Table structure for table `Exercise`
--

CREATE TABLE `Exercise` (
  `Exercise_name` varchar(50) NOT NULL,
  `Difficulty` varchar(20) NOT NULL,
  `Instructions` text NOT NULL,
  `Type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Exercise`
--

INSERT INTO `Exercise` (`Exercise_name`, `Difficulty`, `Instructions`, `Type`) VALUES
('Band Bent-Over Row', 'Beginner', 'Grab a low-resistance band and set it out on the ground. Stand on the middle of the band, grabbing the two ends in either hand with a pronated (overhand) grip, hinging at the hips and slightly bending your knees in an athletic stance. Make sure that your back isn\'t rounded. Squeeze your back to pull the band ends simultaneously to your chest, or as close as the band allows. Pause for a moment at the top of the motion, then slowly return to the original position, working against the band\'s resistance. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Pull Day'),
('Barbell Row (bent over)', 'Intermediate', 'Holding a barbell with a pronated grip (palms facing down), bend your knees slightly and bring your torso forward, by bending at the waist, while keeping the back straight until it is almost parallel to the floor. Tip: Make sure that you keep the head up. The barbell should hang directly in front of you as your arms hang perpendicular to the floor and your torso. This is your starting position. Now, while keeping the torso stationary, breathe out and lift the barbell to you. Keep the elbows close to the body and only use the forearms to hold the weight. At the top contracted position, squeeze the back muscles and hold for a brief pause. Then inhale and slowly lower the barbell back to the starting position. Repeat for the recommended amount of repetitions. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Pull Day'),
('Barbell Side Lunge', 'Intermediate', 'Stand with your legs under your hips and hold a barbell on your back. Step your right leg out to the side and lower your body as you bend your knee, keeping your left leg straight. Drive yourself back up to starting position and repeat on the other side. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Heavy Day'),
('Bench Press (Barbell)', 'Intermediate', 'The bench press is performed while lying face up on a bench, by pushing a weight away from the chest. The weights are put on a barbell. This is a compound exercise that also involves the triceps and the front deltoids, also recruits the upper and lower back muscles, and traps. The bench press is the king of all upper body exercises and is one of the most popular chest exercises in the world. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Push Day'),
('Bent Over Two-Dumbbell Row', 'Advanced', 'With a dumbbell in each hand (palms facing your torso), bend your knees slightly and bring your torso forward by bending at the waist; as you bend make sure to keep your back straight until it is almost parallel to the floor. Tip: Make sure that you keep the head up. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Pull Day'),
('Bodyweight Dips', 'Intermediate', 'Grab the bars and jump up. Dip. Lower your body by bending your arms. Break Parallel. Go down until your shoulders are below your elbows at the bottom. Rise Up. Lift your body back up to the starting position by straightening your arms. Lockout. Balance yourself with your shoulders over your hands. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Push Day'),
('Bulgarian Split Squat (bodyweight)', 'Beginner', 'Stand facing away from the bench. Have one leg resting on the bench behind you, laces down. Squat with your standing leg until the knee of your trailing leg almost touches the floor. Push up through your front foot to return to the start position. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Heavy Day'),
('Butterfly Machine', 'Beginner', 'Sit on the machine with your back flat on the pad. Take hold of the handles. Tip: Your upper arms should be positioned parallel to the floor; adjust the machine accordingly. This will be your starting position. Push the handles together slowly as you squeeze your chest in the middle. Breathe out during this part of the motion and hold the contraction for a second. Return back to the starting position slowly as you inhale until your chest muscles are fully stretched. Repeat for the recommended amount of repetitions. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Push Day'),
('Cable overhead triceps extension', 'Advanced', 'Attach a rope to a low pulley. After selecting an appropriate weight, grasp the rope with both hands and face away from the cable. Position your hands behind your head with your elbows point straight up. Your elbows should start out flexed, and you can stagger your stance and lean gently away from the machine to create greater stability. This will be your starting position. To perform the movement, extend through the elbow while keeping the upper arm in position, raising your hands above your head. Squeeze your triceps at the top of the movement, and slowly lower the weight back to the start position. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Push Day'),
('Decline bench press (barbell)', 'Intermediate', 'The decline bench press is performed while lying face up on a decline bench, by pushing a weight away from the chest. The weights are put on a barbell. This is a compound exercise that also involves the triceps and the front deltoids, also recruits the upper and lower back muscles, and traps. The bench press is the king of all upper body exercises and is one of the most popular chest exercises in the world. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep).', 'Push Day'),
('Dip machine', 'Beginner', 'Sit down on the dip machine. Put your hands on the grips. Push down and up continuously. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Push Day'),
('Dumbell Bench Press', 'Advanced', 'Dumbbell bench-press is performed while lying face up on a bench, by pushing a weight away from the chest. The weight will be in the form of dumbbells which allows for better muscle contraction. This is a compound exercise that also involves the triceps and the front deltoids, also recruits the upper and lower back muscles, and traps. The bench press is the king of all upper body exercises and is one of the most popular chest exercises in the world. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Push Day'),
('Dumbell Decline Bench Press', 'Advanced', 'The decline bench press is performed while lying face up on a bench, by pushing a weight away from the chest. The weights are in a form of dumbbells. This is a compound exercise that also involves the triceps and the front deltoids, also recruits the upper and lower back muscles, and traps. The bench press is the king of all upper body exercises and is one of the most popular chest exercises in the world. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep).', 'Push Day'),
('Dumbell Flies', 'Advanced', 'Pick up the dumbbells off the floor using a neutral grip (palms facing in). Position the ends of the dumbbells in your hip crease, and sit down on the bench. To get into position, lay back and keep the weights close to your chest. Once you are in position, take a deep breath, then press the dumbbells to lockout at the top. Slightly retract your shoulder blades, unlock your elbows, and slowly lower the dumbbells laterally while maintaining the angle at your elbow. Once the dumbbells reach chest level, reverse the movement by squeezing your pecs together and bringing the dumbbells back to their starting position. Without allowing the dumbbells to touch, start the next repetition, and continue until the set is completed. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Push Day'),
('Front weighted squats', 'Advanced', 'Begin with the barbell across the front side of your shoulders. Place your fingertips under the barbell just outside of your shoulders and drive your elbows up. Keeping your chest up and core tight, bend at your hips and knees to lower into a squat until your thighs are parallel to the ground. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Heavy Day'),
('Goblet Squat', 'Intermediate', 'Stand with your legs wider than your shoulders and hold a dumbbell with both hands in line with your thighs. Stick your backside out, bend your knees and lower yourself into a squat until the dumbbell touches the floor. Drive back up and repeat. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Heavy Day'),
('Incline Bench Press (Barbell)', 'Intermediate', 'The incline bench press is performed while lying face up on an incline bench, by pushing a weight away from the chest. The weights are put on a barbell. It focuses on the upper chest. This is a compound exercise that also involves the triceps and the front deltoids, also recruits the upper and lower back muscles, and traps. The bench press is the king of all upper body exercises and is one of the most popular chest exercises in the world. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Push Day'),
('Incline Dumbbell Press', 'Advanced', 'Incline dumbbell bench-press is performed while lying face up on an incline bench, by pushing a weight away from the chest. The weight will be in the form of dumbbells which allows for better muscle contraction. This is a compound exercise that targets upper chest and that also involves the triceps and the front deltoids, also recruits the upper and lower back muscles, and traps. The bench press is the king of all upper body exercises and is one of the most popular chest exercises in the world. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Push Day'),
('Kettlebell swings', 'Advanced', 'Stand behind kettlebell with feet slightly wider apart than shoulder width. Bend over at hip with knees bent and back straight. Extend arm downward and grasp kettlebell handle with overhand grip. Lift kettlebell off of floor and pull forearm against inner thighs while keeping hips and knees bent with low back taut. Drive hips forward, torso upright, and knees straight so kettlebell is pushed forward and upward. Allow kettlebell to swing back down. As kettlebell approaches lower position, fold at hips while bending knees. Forearm makes contact with inner thigh permitting kettlebell to swing back under hips. Immediately repeat movement and continue to swing kettlebell. Maintain shoulder to eye level height swings. Swing kettlebell back down between legs. Allow kettlebell to swing forward, but do not extend hips and knees (as would be required to continue the swing). Slow kettlebell\'s swing and place on floor in original deadlift posture. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Pull Day'),
('Lat Pulldown', 'Beginner', 'Sit at a lat pulldown station and grab the bar with an overhand grip that\'s just beyond shoulder width. Your arms should be completely straight and your torso upright. Pull your shoulder blades down and back, and bring the bar to your chest. Pause, then slowly return to the starting position. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Pull Day'),
('Machine bench press', 'Beginner', 'While using the bench press machine, grip the handles near your chest, palms facing downward. Engage abs and keep spine straight. Action EXHALE: Push the handles forward by straightening at the elbows. INHALE: Slowly bend the elbows to return to the start position, with hands near the chest, to complete one rep. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Push Day'),
('Machine Incline Bench Press', 'Beginner', 'While using the incline bench press machine, grip the handles near your chest, palms facing downward. Engage abs and keep spine straight. Action EXHALE: Push the handles forward by straightening at the elbows. INHALE: Slowly bend the elbows to return to the start position, with hands near the chest, to complete one rep. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Push Day'),
('Pull up machine', 'Beginner', 'Adjust the weight on the machine until you can do an assisted pull up with it. Use the pull up machine to climb on the padded seat with your knees until the seat lowers. Grab the pull-up bar with the palms of your hands facing forward. For a medium grip, your hands should be spaced at shoulder width. Both arms should be extended in front of you holding the bar at the chosen grip.\r\nYou\'ll want to bring your torso back about 30 degrees while creating a curvature in your lower back and sticking your chest out. This will be your starting position. Now, exhale and pull your torso up until your head is above your hands. Concentrate on squeezing your shoulder blades back and down as you reach the top contracted position. After a brief moment at the top contracted position, inhale and slowly lower your torso back to the starting position with your arms extended and your lats fully stretched.Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Pull Day'),
('Pull ups', 'Intermediate', 'Grab the pull-up bar with the palms of your hands facing forward. For a medium grip, your hands should be spaced at shoulder width. Both arms should be extended in front of you holding the bar at the chosen grip. You\'ll want to bring your torso back about 30 degrees while creating a curvature in your lower back and sticking your chest out. This will be your starting position. Now, exhale and pull your torso up until your head is above your hands. Concentrate on squeezing your shoulder blades back and down as you reach the top contracted position. After a brief moment at the top contracted position, inhale and slowly lower your torso back to the starting position with your arms extended and your lats fully stretched. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep).  ', 'Pull Day'),
('Renegade Row', 'Intermediate', 'The renegade row is all about maximizing the utility of a position to the highest degree. Take two high bang-for-your-buck moves, like the plank and pushup, and make them even useful by adding more elements to work different muscle groups. Work with light dumbbells here — maintaining the proper spinal position is just as important and rowing the weight. DO THIS: Grab a pair of light dumbbells and about as much space as you would need to perform pushups. Get in a plank position with your feet spread wide, gripping the dumbbells with your palms facing parallel to each other. Squeeze your glutes and core to maintain a strong spinal alignment, looking at the floor ahead of you. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Pull Day'),
('Single Leg Curl', 'Beginner', 'Lie face down on the leg curl machine with your heels against the lower pad and the bench against your thighs. Bend one knee to pull the pad up towards your backside as far as possible, then return to the start position and repeat on the other side.', 'Heavy Day'),
('Smith Machine Weighted Squats', 'Intermediate', 'Approach the smith machine and load the weights on each side before beginning the exercise. Begin with the barbell supported on top of the traps. The chest should be up and the head facing forward. Adopt a hip-width stance with the feet turned out as needed. Descend by flexing the knees, refraining from moving the hips back as much as possible. This requires that the knees travel forward. Ensure that they stay align with the feet. The goal is to keep the torso as upright as possible. Continue all the way down, keeping the weight on the front of the heel. At the moment the upper legs contact the lower legs reverse the motion, driving the weight upward. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Heavy Day'),
('Squat (bodyweight)', 'Beginner', 'The chest should be up and the head facing forward. Adopt a hip-width stance with the feet turned out as needed. Descend (squad down) by flexing the knees, refraining from moving the hips back as much as possible. This requires that the knees travel forward. Ensure that they stay align with the feet. The goal is to keep the torso as upright as possible. Continue all the way down, keeping the weight on the front of the heel. At the moment the upper legs contact the lower legs reverse the motion, driving the weight upward. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Heavy Day'),
('Standing Cable Fly', 'Intermediate', 'Set both pulleys directly at (or slightly above) shoulder height and select the desired weight. Grasp both handles with a neutral grip and take a step forward to split the stance. Press the handles to lockout while flexing the pecs and extending the elbows. Keep a slight bend in the elbows, move entirely at the shoulder joint, and slowly allow the arms to open while the pecs stretch. Return to the starting position by flexing your pecs and bringing the handles together at chest height. Slowly lower back to the starting position and repeat for the desired number of repetitions. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). \r\n\r\n', 'Push Day'),
('Weighted dips', 'Advanced', 'First grab a belt and connect a weight to it (approximately 20% of your body weight). Grab the bars and jump up. Dip. Lower your body by bending your arms. Break Parallel. Go down until your shoulders are below your elbows at the bottom. Rise Up. Lift your body back up to the starting position by straightening your arms. Lockout. Balance yourself with your shoulders over your hands. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Push Day'),
('Weighted pullups', 'Advanced', 'Attach a weight to a dip belt and secure it around your waist. Grab the pull-up bar with the palms of your hands facing forward. For a medium grip, your hands should be spaced at shoulder width. Both arms should be extended in front of you holding the bar at the chosen grip. You\'ll want to bring your torso back about 30 degrees while creating a curvature in your lower back and sticking your chest out. This will be your starting position. Now, exhale and pull your torso up until your head is above your hands. Concentrate on squeezing your shoulder blades back and down as you reach the top contracted position. After a brief moment at the top contracted position, inhale and slowly lower your torso back to the starting position with your arms extended and your lats fully stretched. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). \r\n', 'Pull Day'),
('Weighted Squat', 'Advanced', 'Begin with the barbell supported on top of the traps. The chest should be up and the head facing forward. Adopt a hip-width stance with the feet turned out as needed. Descend by flexing the knees, refraining from moving the hips back as much as possible. This requires that the knees travel forward. Ensure that they stay align with the feet. The goal is to keep the torso as upright as possible. Continue all the way down, keeping the weight on the front of the heel. At the moment the upper legs contact the lower legs reverse the motion, driving the weight upward.  Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Heavy Day'),
('|Barbell Bulgarian Split Squat|', 'Advanced', 'Stand facing away from the bench, holding a barbell across your upper back. Have one leg resting on the bench behind you, laces down. Squat with your standing leg until the knee of your trailing leg almost touches the floor. Push up through your front foot to return to the start position. Select the weight with which you can perform 8-12 repetitions. Perform exercise until failure but not more than 12 (cannot perform another rep). ', 'Heavy Day');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `email` varchar(20) NOT NULL,
  `name` varchar(10) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `lifestyle` varchar(10) NOT NULL,
  `experience_level` varchar(10) NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `password` varchar(20) NOT NULL,
  `BMI` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`email`, `name`, `surname`, `age`, `gender`, `lifestyle`, `experience_level`, `height`, `weight`, `password`, `BMI`) VALUES
('hello@nyu.edu', 'Hello', 'Hello', 1, 'Male', 'Active', 'Beginner', 1.8, 79, '123', 0),
('hj@nyu.edu', 'hello', 'helo', 21, 'Female', 'Active', 'Beginner', 120, 21, '123', 20),
('kj123@.nyu.edu', 'Kelly', 'Jenner', 23, 'Female', 'Active', 'Beginner', 2, 54, '345', 0),
('tr1328@nyu.edu', 'Teona', 'Ristova', 22, 'Female', 'Sedetary', 'Beginner', 163, 104, '123', 11),
('vc1238@nyu.edu', 'Vlad', 'Cherevkov', 22, 'Male', 'Active', 'Advanced', 197, 102, '123', 44);

-- --------------------------------------------------------

--
-- Table structure for table `Workout`
--

CREATE TABLE `Workout` (
  `workout_ID` varchar(20) NOT NULL,
  `duration_minutes` int(11) NOT NULL,
  `number_of_exercises` int(11) NOT NULL,
  `difficulty` varchar(20) NOT NULL,
  `avg_calories_burnt` int(11) NOT NULL,
  `Type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Workout`
--

INSERT INTO `Workout` (`workout_ID`, `duration_minutes`, `number_of_exercises`, `difficulty`, `avg_calories_burnt`, `Type`) VALUES
('1', 60, 6, 'Advanced', 600, 'Push Day'),
('2', 50, 5, 'Intermediate', 550, 'Push Day'),
('3', 40, 4, 'Beginner', 450, 'Push Day'),
('4', 60, 3, 'Advanced', 700, 'Pull Day'),
('5', 50, 3, 'Intermediate', 650, 'Pull Day'),
('6', 40, 3, 'Beginner', 600, 'Pull Day'),
('7', 60, 3, 'Advanced', 750, 'Heavy Day'),
('8', 50, 3, 'Intermediate', 700, 'Heavy Day'),
('9', 40, 3, 'Beginner', 650, 'Heavy Day');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Daily_Info`
--
ALTER TABLE `Daily_Info`
  ADD PRIMARY KEY (`Daily_Info_ID`(10)),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `Exercise`
--
ALTER TABLE `Exercise`
  ADD PRIMARY KEY (`Exercise_name`(10));

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `Workout`
--
ALTER TABLE `Workout`
  ADD PRIMARY KEY (`workout_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Daily_Info`
--
ALTER TABLE `Daily_Info`
  ADD CONSTRAINT `daily_info_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `User` (`email`);
