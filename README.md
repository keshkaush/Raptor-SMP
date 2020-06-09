# SMP-20
SMP-20(A Stock Market Analysis Project -College Minor Project )
The major components of this project’s architecture include- 
1. Historical data analysis deep learning model.
2. Sentimental analysis machine learning model 
3. Firebase to store the output of the model
4. A computer server running the models periodically 
5. User interface using flutter

FRONT-END: FLUTTER(SMP-20)

Build a splash screen with app icon for android and iOS and change web icon also,this app fully run in android and iOS and web(partially due to lack of package). 
Create a dahboard page with some swiped topic.
Back-end development between firebase and python connected with flutter.
Secondly created a database screen where we attached out Project Individual Report and SRS Document(Local asset as PDF Format)
Thirdly we design a particular stock list design which is also divided into 5 pages;
First one called JSON data where we attached present and historical JSON raw file according to positive, negative, and neutral statement analyzed by back-end. 
Then, the next page is present data page where it analyzed locally by present JSON files.
Then the third and fourth page analyzed historical and people comments data from online by firebase-storage and back-end process.
And the last one page ; a online Indian news portal; which is updated by a outside API(collected from Internet randomly)
The 4th main page is the team page where the page display out team members picture and contribution in the project briefly.
The most important part of front end is 4 main part page was attached by curved bottom navigation and the stock list part was attached by navigation bloc.
The app-size also be minimized(i.e. 13.1 MB).

BACK-END: PYTHON(SMP-20)

This included creation of one model based on Long Short-Term memory Deep learning for historical data analysis and future price prediction and one model based on Multinomial Naive Bayes for Sentimental Analysis. Both the models were created on Jupyter notebook using Python 3.7
For automation, i.e. for periodical running of the python models so as to ensure an updated output is displayed everytime, the python scripts are made to run every 15 minutes everyday on a computer using task scheduler. 

<img src="https://user-images.githubusercontent.com/50980605/84104867-44f2b700-aa34-11ea-87a4-8990e2a99e7f.jpeg">
