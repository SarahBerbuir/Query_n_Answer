# Query_n_Answer
An IOS app that takes queries and responds by using Machine Learning and Firebase.

## Future plans for development
It is planned to run machine learning code in Python on the backend of Firebase. Google functions can be used to respond more precisely to the questions of the users. 

### Other possible enhancements:
* A chat function instead of the one question one answer structure
* Through the already integrated rating of the answers for the history, more machine learning algorithms can be used and eventually models can be trained through the rating of the users to improve the answer quality.
* The tiles of the history can be filled out again by the user, so that favorite questions can be stored.
* Users can be connected and chat with each other


## Development of the app and used technologies

!["test"](Logo_Background.png)

The user interface of the app was written in SwiftUI and designed in a pleasant and minimal way by using a logo and two consistent colors. 
There is a login and create user function. Through Firebase it is possible to have an overview of users and to include user-related functions in further developments. By the implementation the functionality of Firebase and FirebaseAuth was learned.
A TabView made views more understandable. The app contains a home view, a view for personal queries and a view for the history of already executed queries. 

### Query View
In the view of the personal queries an answer is entered and by clicking on the Ask button the question is searched in a collection of Firestore to display the answer stored there in the GUI. The user can rate the answer and add it to the history by clicking on the button, which means that the app creates a new document in a collection with the parameters question, answer, rating and date. 

### History View
Within the history view the collection is read by Firestore and displayed in a list. With the delete button the document can be deleted from the collection.




