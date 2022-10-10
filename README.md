# Query_n_Answer
An IOS app that takes queries and responds by using Machine Learning and Firebase. 

<img width="150" alt="Query View" src="https://user-images.githubusercontent.com/83503396/194856984-d2c6b550-610c-4ec3-b9ff-e8467bc3adcb.png"> 


## Future plans for development
It is planned to run machine learning code in Python on the backend of Firebase. Google functions can be used to respond more precisely to the questions of the users. 

### Other possible enhancements:
* A chat function instead of the one question one answer structure
* Through the already integrated rating of the answers for the history, more machine learning algorithms can be used and eventually models can be trained through the rating of the users to improve the answer quality.
* The tiles of the history can be filled out again by the user, so that favorite questions can be stored.
* Users can be connected and chat with each other



## Development of the app and used technologies

[<img src="https://user-images.githubusercontent.com/83503396/194854723-4a01c5dc-e79f-4d26-8e45-c6a556f88921.png" width="60"/>](https://user-images.githubusercontent.com/83503396/194854723-4a01c5dc-e79f-4d26-8e45-c6a556f88921.png)
[<img src="https://user-images.githubusercontent.com/83503396/194854821-963fbe7a-b83e-433d-83d1-76b1a8618145.png" width="75"/>](https://user-images.githubusercontent.com/83503396/194854821-963fbe7a-b83e-433d-83d1-76b1a8618145.png)
[<img src="https://user-images.githubusercontent.com/83503396/194854785-898e2b51-11a1-4386-9988-3f1d8e26a063.png" width="250"/>](https://user-images.githubusercontent.com/83503396/194854785-898e2b51-11a1-4386-9988-3f1d8e26a063.png)


The user interface of the app was written in SwiftUI and designed in a pleasant and minimal way by using a logo and two consistent colors. 
There is a login and create user function. Through Firebase it is possible to have an overview of users and to include user-related functions in further developments. By the implementation the functionality of Firebase and FirebaseAuth was learned.
A TabView made views more understandable. The app contains a home view, a view for personal queries and a view for the history of already executed queries. 


### <img width="35" alt="Home View" src="https://user-images.githubusercontent.com/83503396/194856460-98208d3d-2397-4bcc-987c-c50413bed2db.png"> Home View
In this view a description of the purpose of the app is given.

### <img width="35" alt="Query View" src="https://user-images.githubusercontent.com/83503396/194856435-9cb6d31d-ede0-4423-a3e3-6325d1f7f073.png"> Query View
In the view of the personal queries an answer is entered and by clicking on the Ask button the question is searched in a collection of Firestore to display the answer stored there in the GUI. The user can rate the answer and add it to the history by clicking on the button, which means that the app creates a new document in a collection with the parameters question, answer, rating and date. 

### <img width="35" alt="History View" src="https://user-images.githubusercontent.com/83503396/194856417-cc6745b4-c75a-423f-8842-c83e96319b08.png"> History View
Within the history view the collection is read by Firestore and displayed in a list. With the delete button the document can be deleted from the collection.




