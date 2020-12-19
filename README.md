# MICHAEL DART - T1A3 - Terminal Application

## Introduction
Welcome to the READMe document that covers the Quiz Application I have created.
<br>
<br>

## R3 - Referenced Sources
- [Mike Dane - Building a Quiz | Ruby | Tutorial 32 - YouTube Tutorial](https://www.youtube.com/watch?v=kNFMNE8O8Vc)
- [JairoAussie - Sport League Application - GitHub Repository](https://github.com/JairoAussie/sports-league)
- [VarshaBapat - Library Application - GitHub Repository](https://github.com/VarshaBapat/library_app)
<br>
<br>

## R4 - Source Control
Please view my source control via GitHub:
[MichaelDaart_T1A3](https://github.com/mdart86/MichaelDart_T1A3)
<br>
<br>

## **THE SOFTWARE DEVELOPMENT PLAN**

## R5 - Purpose and Scope of the application
The Quiz App application I have created is a fun and easy for users to expand their knowledge through a series of multiple choice questions in an interactive way targeting any person who has an interest in learning about a particular topic.
<br>

On the first login to the Quiz App, the user will be able to create their own profile to individually identify themselves. A returning user will be able to be access their profile and a list of completed quizzes and scores will be displayed from previous quizzes.
<br>

The multiple choice questions will be set out into categories based on a particular topic (ie. Capital Cities). These categories are listed into a separate menu which is accessed off the main menu. Passing into the chosen quiz category, the user will be able to select from three different levels, Easy, Medium and Hard. Once a level has been selected they will be able to answer a series of questions in this category. The user is not restricted to starting at the easiest category however the menu follows a top to bottom layout to guide the user to the easiest category first.
<br>

After a quiz is completed, the user will be returned to the Quiz menu of the category they have selected from which they can choose to either take the next quiz on the list, or navigate to a different category via the menu options to complete a quiz in a different category. 
<br>

One feature the user will notice is the ability to access the stored scores menu directly from the Quiz menu. Whilst this can also be accessed from the Main Menu, this feature has been added to improve the functionality of the application to prevent the user from doubling back to the Main Menu
<br>

An Exit option, located in the main menu will allow the user to exit the Quiz App, with their completed quizzes and scores saved for their return.
<br>
<br>
<br>

## R6 - Three Features of the application
### Feature 1 - Menu Options - *Loops and Case Statements*
A key feature to the app is the multi level menu. This feature forms the back bone of the app to guide the user through every part of the app also allowing them to exit. All of the menu options are controlled by a number system of options stored in separate **arrays**. The user will be allowed to select from options printed out to them, these options are controlled by a **while loop**. The main menu and the "sub-menus" all have their own **while loops** to ensure the user is able to select an option. Each menu is controlled by series of **case statements** which validates the users option and performs the next action of the ap they have selected.
<br>
<br>

### Feature 2 - Create Profile - *Instance Variables*
The user will be able to create a profile of their own within the app to allow, storing their information (and future feature- quiz history) for future visits. When the user navigates to this area, they will be asked a series of questions:
- First name
- Last name
- Where they are from 
- Age
<br>

All these details are stored in separate **instance variables**. Two of the **instance variables** are used to confirm to the user via a **printed statement** that their profile has been created.
<br>
<br>

### Feature 3 - Gentle Messages - *Error Handling*
No one's perfect, even though we may not like to admit! That is why this app helps guide the user when something is not quite right in their selection. This app will **rescue** you! Yes it's that smart! 
<br>

One area where this **rescue** feature happens is when the user hasn't entered all the details required to create their profile. Looking at the below Ruby code, it's fairly easy to work out what is going on:
<br>

```rb
    begin
		validate_details(member_details)
    rescue
        puts "Please complete all details required, we'll keep them safe for you ;)"
        return false
    end
```

<br>
<br>





