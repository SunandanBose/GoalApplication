# GoalApplication

FrontEnd Server(GoalReminder)  (Need To research)
(React Server)
Login/SignUp [SignUp Password, email-id, Name]
1. Input Goals /Todo List 
	Input short Term Goals(Name is Optional), Long Term Goal, Target for STG(Days)[Calendar for frontend], Target for LTG(Days)[Calendar for frontend]
	Submit Button -> GoalProcessingService[POST /saveGoals]

2. Update Daily/Weekly Todo List
	Short Term Goal Name, Description(Optional), Completion Checkbox, Submit Button
	Submit Button->[POST /dailyFeed]



Express Server(GoalProcessingService)  (Need To research)
Login[Sign Up POST/signUp] [Login GET/login]
1. Validate and Save data in DB[POST /saveGoals]
2. Send Daily Update In Calendar[POST /dailyFeed]
3. Trigger Python Server on any change in data of DB


Python Server(GoalAnalyzer)  (Need To research)

1. Run Query for Analystics (Doable)
	-How regularly he is completeing goals
	-percentage completion(STG and LTG)
	-Estimated Completion Time
	-Target Completeion Time
	-Daily effort increase percentage if he is lacking, if on/ahead track send perfect as default
2. Store Analytics Data in DB (Need To research)


Shell Script  (Need To research)
1.Collect Data from DB
2.Trigger Mail



Schema-> Reminder (Doable)
Tables :
User 
	-Username(emailid)
	-password(Encrypted)
	-Name
Goal
	-User->username
	-id
	-createdTime
	-updatedTime
	-target(Date)
	-GoalType->id
	-description

GoalType
	-id
	-type

dailyfeed
	-id
	-User->username
	-Goal->id
	-Descrption
	-CompletedTime

GoalAnalysis
	-user-id
	-regularity
	-estimatedcompletion
	-targetcompletion
	-effort
	-stgcompletion
	-ltgcompletion



Estimations:

FrontEnd Server(GoalReminder)
- Research - 
- Implementation - 

Express Server(GoalProcessingService)
- Research - 2hrs
- Implementation - 3.5hrs

Python Server(GoalAnalyzer)
- Research - 2hrs
- Implementation - 3.5hrs

Shell Script
- Research - 1hr
- Implementation - 1hr

