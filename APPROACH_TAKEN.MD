# Toy Robot Simulator

Exercise instructions can be found in PROBLEM.md file


**LANGUAGE**
This challenge was solved using **Ruby** (_version:2.3.1p112_) and **MiniTest** was used for testing.

Here you can get the latest Ruby version:  https://www.ruby-lang.org/en/downloads/


**To run the TOY ROBOT SIMULATOR:**
<li>type in bash:  ruby ToyRobotSimulator.rb</li>
<li>follow instructions :) </li>
<li>to exit -> simply type exit</li>
<li> // To customize board size provide x and y arguments for board object in ToyRobotSimulator.rb file//</li>



**To run the TESTS:**
<li>In tests directory:</li>
<li>type in bash:  ruby test_robot_commands.rb</li>
<li>type in bash:  ruby test_user_commands.rb</li>
<li>type in bash:  ruby test_customized_board.rb</li>


![Image of Toy Robots](ToyRobot.jpg)


## APPROACH TAKEN:
  1. I strongly focused on TDD when solving this challenge, although I am aware that design and architecture is as important.
     For almost all the time I firstly wrote tests, failed and passed them trying to write as little code as possible 
     and finally refactored my code (red green refactor).
     This approach resulted and helped me to design methods that are as small as possible and easy to test.
  2. At the start I simply wanted to 'solve' robot's movements on the board and then I restricted them so that robot 
     could not fall out.
     I created test_robot_commands.rb and robot_commands.rb files. Robot class is responsible for the robot movements logic.
     I also decided that maximal values for the board size should not be hardcoded in case that someone would like to 
     extend them in the future. 
     As some of the methods should not be accessible by the Toy Robot I hide them (private methods). 

  3. Secondly I created test_user_commands.rb and execute_user_commands.rb files that are responsible for commands 
     provided by the user. gets accepts data from the standard input - the keyboard in this solution.
  4. Getting user input was a little bit more tricky for testing.
  5. As it's impossible to predict commands provided by the user I needed to create Dummy Class: DummyUserInput for my 
     TestExecuteUserCommands class.

  6. Place method was a little tricky to test as well.. I overwrote it for testing purposes with the hardcoded 
     and expected values so that other methods could be tested.
  7. To test private methods in ExecuteCommands class I opened that class in test files and tested each of them separately.
  8. I wasn't sure how to test place_command method from the ExecuteUserCommands class. 
     First test checks if that method works for the _exit_ command.
     Second test (that is actually commented out) works when _loop do_ has break in it but then expected value is equal to _nil_.
  9. User commands and arguments (x,y, face) validation was improved.
  10. In the end I thought that it's more logical to create separate Board class for customizing it's size rather than 
      providing arguments in the Robot object.
  

   
## CHALLENGES
1. Deciding how to build and separate classes.
2. Design and Architectire
3. Rotating and moving the robot.
   Methods for left and right movements are quite similar, faces are hardcoded.
   As the exercise has only few choices (4 for face // 5 for movements) using case statement works but it's not perfect.
   If assignment would extend and there would be a need for more directions/movements solution should be probably redesigned.

4. Testing user input for place and perform_commands method.



## THIGNS TO CONSIDER and what I would like to have done differently
Once I have solved this challenge, I see some of its limitations😓. 
As mentioned, if the problem grows and more directions/movements would be added this solution is not ideal.
If I had a little bit more time, I would probably think about changing case statements using polymorphism?
I would have probably redesign Robot class. Perform_commands method could take an argument - command object.
Some of the ideas can be find in things_to_consider.rb file.



## LESSONS LEARNED
This coding challenge was a great fun and lesson for me. 




Many thanks for taking the time to check my solution and the feedback.  
Cheers! 😊

