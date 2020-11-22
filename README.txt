QuizApp is an app that features an interactive trivia game.

When a user opens the app, they select a category, and then a series of 10 random questions in that category will appear one after the other. The user selects the answers they believe are correct, and if they select the correct answer this adds to their score.

If the answer selected is correct, the background of the view turns green. If it is wrong, the background turns red as an indicator.

The score is shown at the end, where a user is prompted to enter their name. On the next screen, a log of past scores along with the user's names and categories will be shown. Then the user can quit and return to the main screen to play again.

Requirements, and how they are fulfilled:

1. TableView Usage

	The TableView requirement is fulfilled twice. Initially, the main view controller shows a TableView filled with different categories to choose from. Then, once on is chosen, a new TableView is shown, containing answers (3 wrong, 1 right - in a random order) to a question. This TableView is reloaded with new questions and answers until the end of the round.

2. Multiscreen Application

	QuizApp contains many view controllers. First, the main view controller that shows the categories. Then, a view controller for the questions and answers, which is reloaded until the game is over, then a view controller shows the score, and finally there is a view controller for the Saved Scores page. In total, there are 4 VCs.

3. API Integration

	I integrated a "Quiz API," which generates a JSON string of a list of random questions based on a category selected, and within this list of questions each item has a question string and a list of answer strings, with one correct and three incorrect. In the main view controller, I made a list of categories, each with a different endpoint (URL) corresponding to the category. Once a category is selected, the corresponding endpoint is used to load 10 random multiple choice questions and answers. This is used to keep score and determine which color is shown (based on the user's answer selection). 

4. One Complex Component

	The complex component I chose was to use persistence and UserDefaults to allow users to save their score in a Score Board view controller. After completing a quiz, when a user enters their name and clicks "save," they are taken to a screen which presents a list of UserDefaults. Their score is added to this list, in which each item is a string that contains the user's name, score, and category. When the app is closed, this list is maintained. 
sary

Hope you enjoy using QuizApp! Thanks AppDev team for all your help.

Julia Bernstein

