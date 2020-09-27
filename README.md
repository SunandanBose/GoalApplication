# GoalApplication

FrontEnd Server(GoalReminder)  (Need To research)<br/>
(React Server)<br/>
Login/SignUp [SignUp Password, email-id, Name]<br/>
1. Input Goals /Todo List <br/>
	Input short Term Goals(Name is Optional), Long Term Goal, Target for STG(Days)[Calendar for frontend], Target for LTG(Days)[Calendar for frontend]
	Submit Button -> GoalProcessingService[POST /saveGoals]

2. Update Daily/Weekly Todo List<br/>
	Short Term Goal Name, Description(Optional), Completion Checkbox, Submit Button
	Submit Button->[POST /dailyFeed]



Express Server(GoalProcessingService)  (Need To research)<br/>
Login[Sign Up POST/signUp] [Login GET/login]<br/>
1. Validate and Save data in DB[POST /saveGoals]
2. Send Daily Update In Calendar[POST /dailyFeed]
3. Trigger Python Server on any change in data of DB


Python Server(GoalAnalyzer)  (Need To research)<br/>

1. Run Query for Analytics (Doable)<br/>
	-How regularly he is completing goals
	-percentage completion(STG and LTG)
	-Estimated Completion Time
	-Target Completion Time
	-Daily effort increase percentage if he is lacking, if on/ahead track send perfect as default
2. Store Analytics Data in DB (Need To research)<br/>


Shell Script  (Need To research)<br/>
1.Collect Data from DB
2.Trigger Mail



Schema-> Reminder (Doable)<br/>
Tables :
User <br/>
	- Username(emailid)
	- password(Encrypted)
	- Name
Goal<br/>
	- User->username<br/>
	- id<br/>
	- createdTime<br/>
	- updatedTime<br/>
	- target(Date)<br/>
	- GoalType->id<br/>
	- description<br/>

GoalType<br/>
	- id<br/>
	- type<br/>

dailyfeed<br/>
	- id<br/>
	- User->username<br/>
	- Goal->id<br/>
	- Descrption<br/>
	- CompletedTime<br/>

GoalAnalysis<br/>
	- user-id<br/>
	- regularity<br/>
	- estimatedcompletion<br/>
	- targetcompletion<br/>
	- effort<br/>
	- stgcompletion<br/>
	- ltgcompletion<br/>



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

**Google Calendar**
[Video Referece](https://www.youtube.com/watch?v=zrLf4KMs71E&ab_channel=TheLifeOfADev)
[Git Reference](https://github.com/CamSkiTheDev/Google-Calendar-NodeJS-App/blob/master/index.js)

