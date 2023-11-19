# flutter_inventory

Inventory project assignment using Flutter.


# PBP_Inventory | Assignment 7

## What are the main differences between stateless and stateful widget in Flutter?

The first difference between the stateless and stateful widget in Flutter is that the stateless widget indicates that widgets do not have a state. This means that they do not change by themselves through some internal action or behavior that is defined in the program. On the contrary, stateful widgets are widgets that change their descriptions dynamically during their lifetimes in the program. For example, the properties/initial description of the widget may not stay constant the whole time in the program and could change their state dynamically for stateful widgets. For stateless widgets, the child widget will not change by itself since it would receive its description from the parent widget.

Another key difference is that statless widgets are prone to change by external events on parent widgets in the widget tree (which represents the organization and composition of widgets within a Flutter application, where they could be nested and combined to create the UI's layout and appearance). Note that stateless widgets also provide control of how they are built to some parent widget on the widget tree. On the other hand, a stateful widget are considered immutable (they cannot be changed by external events on parent widgets in the widget tree), however, they do have company State class that represents the current state of the widget.

## Explain all widgets that you used in this assignment.

1) main.dart file:

- MaterialApp: Widget which is the the root widget of the entire application; it essentially wraps all the widgets that is required in the application and sets up the basic structure of the Flutter application to provide various configuration options. Note that the MaterialApp widget implicitly creates a Scaffold as its child widget. A Scaffold is a basic structure for a Flutter app that provides the app bar, body, and other common UI elements.

- MyHomePage: The next widget that is wrapped around the MaterialApp widget is the MyHomePage widget which is set as the home of the MaterialApp widget using the 'home' property, but is defined in the menu.dart file of the Flutter application. 

- Title: The title widget uses the 'title' property to set the title of the Flutter application. It appears as a string in the app's application bar or the task switcher.

- ThemeData: The ThemeData widget utilizes the 'theme' property from for the MaterialApp widget to set the overall theme of the application such as visual properties, colors, and typography. In this widget, you can use properties such as 'colorScheme' to define the app's color scheme, and 'useMaterial3' to indicate that the Flutter application should use Material 3 design principles.


2) menu.dart file:

- MyHomePage: This is the main widget that wraps around all other widgets within the Flutter application in the menu.dart file. Note that the MyHomePage widget extends the StatelessWidget Class/Widget; it is a widget that describes part of the user interface by building a constellation of other widgets that describe the user interface more concretely which is helpful when part of the user interface you are describing does not depend on anything other than the configuration information in the object itself and the BuildContext in which the widget is inflated.
Extending the StatelessWidget also indicates that MyHomePage does not have a state and are changed by external events on parent events in the widget tree.

- Scaffold: The Scaffold widget implements the basic material design and visual layout structure of the Flutter application. In the case of this application, the Scaffold has a body (the primary content of the Scaffold) and the appBar (an app bar to display at the top of the Scaffold). However, the Scaffold can also have a drawer, primary, bottomNavigationBar, backgroundColor, floatingActionButtonLocation, and floatingActionButton in addition.

- AppBar: The AppBar widget is material design app bar and are typically used in the the Scaffold.appBar property. This widget places the app bar as a fixed-height widget at the top of the screen. In this Flutter application, the AppBar has title denoted by the 'title' property.

- Text: The Text widget is located in the AppBar.title property to display the app's title, which is "Flutter Inventory" in this case.

- SingleChildScrollView: This widget is used to wrap the content, allowing it to be scrollable if it exceeds the available screen space. It ensures that the content can be scrolled if it doesn't fit within the viewport.

- Padding: This widget is used to add padding around its child widget, creating space around the content.

- Column: The column widget is used to arrange its children vertically, making it suitable for displaying a list of items in a column. 

- GridView.count: This widget creates a grid of items with a specified number of columns. It's used to display a grid of shop items. The items list is mapped to a list of ShopCard widgets and displayed in the grid.

- ShopItem: This is a custom class that defines the properties of a shop item, including name, icon, and color.

- ShopCard: This is a custom widget used to display each shop item as a card. It extends StatelessWidget and takes a ShopItem as a parameter. The card displays an icon, name, and responds to taps by showing a SnackBar.

- Material: The Material widget provides a Material Design background color and elevation to the card since it is responsible for the Shape and Border. Note that if any things are applied to the Material widget, it will effect the entire child.

- InkWell: The InkWell widget is used to make the card respond to taps. When tapped, it shows a SnackBar that contains the message.

- Container: This widget is used to create a container for the icon and text of each shop item. It includes padding and centers its child widgets.

- Icon: The Icon widget displays an icon based on the provided IconData. It's used to show icons for each shop item.

- SnackBar: The SnackBar widget is used to display a a temporary message that appears at the bottom of the screen when a shop item card is tapped. It shows a message indicating which item was pressed. Note that to display a snack bar, call ScaffoldMessenger.of(context).showSnackBar(), passing an instance of SnackBar that describes the message.


## Explain how you implemented the checklist above step-by-step (not just following the tutorial).

### 1. Initialize the directory for the project

To start the project, I first created a directory with the name "flutter_inventory". Afterwards, I navigated to the directory and then started a local git repository using the `git init` command. Then, I connected the local repository to the online repository on GitHub that I made called "flutter-inventory" using `git remote add origin <GitHub repo Link>` in the command terminal.


### 2. Create and initialize the Flutter application

I generated a new Flutter project using the command `flutter create flutter_inventory` and then continued to navigate to the project using `cd flutter_inventory`. I ran the Flutter application next using `flutter run` in the command terminal while in the project directory to check if the project works, and finally doing the git `add-commit-push` to the online repository on GitHub.

### 3. Organizing the project structure

Within the `flutter_inventory/lib` directory, I made a new file named `menu.dart` and imported `'package:flutter/material.dart'`. I also moved the `MyHomePage` and `_MyHomePageState` from the `main.dart` file to `menu.dart` while also importing `'package:flutter_inventory/menu.dart'` in `main.dart`.

### 4. Creating the widgets in the application

To create the widgets in the application, I modified the `main.dart` file to remove the title from the `MyHomePage()` widget (I removed the parameter `title` that says "Flutter Demo Home Page"). Following this, I changed the `MyHomePage({super.key, required this.title})` to `MyHomePage({Key? key}) : super(key: key)` in the `menu.dart` file, as well as added a `Widget build` method (while removing `final String title;` and the `State` class) in order to change the nature of the Flutter application from stateful to stateless. Note that The `MyHomePage` class represents the main page of the app.

Afterwards, add some text and cards to show the items in the Flutter application; these cards containing the text are essentially the clickable buttons. First, I defined the types in my list using the following code for the class `ShopItem`:

```dart
class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}
```
Note that I also declared a `Color` object to set different colors for each button/card in the Flutter application. Then, I added the following code under `MyHomePage({Key? key}) : super(key: key);` to add the list of items in the Flutter application:

```dart
final List<ShopItem> items = [
      ShopItem("View Items", Icons.checklist, Colors.red),
      ShopItem("Add Item", Icons.add_shopping_cart, Colors.orange),
      ShopItem("Logout", Icons.logout, Colors.yellow)
    ];
```

Following this, I decided to update the `Widget build` method in the `MyHomePage` class within the `menu.dart` file. The method creates a `Scaffold` widget, which provides a basic app structure, including an `AppBar` with the title "Flutter Inventory" and a `body` that contains a `Column`. Inside the `Column`, there is a `Text` widget displaying the shop name ("Los Pollos Hermanos"), and below that, there is a `GridView` with a 3xN (where N is the number of rows) grid layout. The grid contains cards, each of which represents a shop item. The shop items are defined as a list of `ShopItem` objects, and the `GridView` is populated with `ShopCard` widgets, one for each shop item. When a user taps on a card, a `SnackBar` is displayed to show a message indicating which item was pressed. Note that the `Scaffold` widget is made inside the `SingeChildScrollView` widget so that when the content within it exceeds the available screen space, you can make sure users can scroll through the content to view all the whole content in the `Scaffold` widget.

Next I filled the `menu.dart` file with a `ShopCard` class which was used in the `MyHomePage` class to fill in the `Scaffold` widget that has the individual shop cards. The `ShopCard` class is a stateless widget responsible for rendering the individual shop item cards. Each card is wrapped in an `InkWell` widget to make it tappable, and it displays an icon, the name of the shop item, and a background color. Other than the `ShopCard` class, the `ShopItem` class is a simple data class that represents the information about each shop item, including its name, icon, and color. Note that the `color` property inside the `Material` widget is updated from the tutorial to be `item.color` to allow each of the cards in the Flutter application to be assigned a different color.


# PBP_Inventory | Assignment 8

## Explain the difference between Navigator.push() and Navigator.pushReplacement(), accompanied by examples of the correct usage of both methods!

In Flutter, both `Navigator.push()` and `Navigator.pushReplacement()` are methods used for navigating between different screens or routes in your app. However, they serve slightly different purposes. 

`Navigator.push()` is used to push a new route onto the navigation stack (so that it is on top of the stack) using the `push()` method, which means adding a new screen on top of the current screen. Thus, the newly added route will appear and be displayed to the user. The previous screen remains in the navigation stack, and you can navigate back to it by popping the current route. It is typically used when you want to move to a new screen and provide a way for the user to navigate back to the previous screen. Note that `push()` adds a new route on top of existing routes, which is the key difference.

Example:
```dart
// Inside a button click or some user interaction
onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecondScreen()),
  );
}
```

On the other hand, `Navigator.pushReplacement()` is used to push a new route onto the navigation stack and replace the current route with the new one. The previous screen is removed from the navigation stack, so when the user presses the back button, they won't navigate back to the previous screen. Instead, they will exit the app or go to the screen that was present before the current one. It is commonly used in scenarios where you want to replace the current screen with a new one, such as after a user logs in or completes a form. Thus, the `pushReplacement()` method replaces the old route on top of the stack with a new route without altering the state of the stack elements beneath it as the key difference from `push()`

Example:
```dart
// Inside a button click or some user interaction
onPressed: () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HomeScreen()),
  );
}
```

## Explain each layout widget in Flutter and their respective usage contexts!

1. Container: The Container widget is a versatile box model that can contain other widgets and apply decoration, padding, margins, and constraints. It is commonly used to group and style child widgets.

2. Row and Column: Row and Column are flex widgets that arrange their children in a horizontal (Row) or vertical (Column) sequence. They automatically size and position their children based on the available space.

3. ListView: ListView is used to create a scrollable list of widgets. It is particularly helpful when dealing with a large number of widgets that need to be displayed in a scrollable manner.

4. GridView: GridView organizes its children in a 2D array, allowing for both horizontal and vertical scrolling. It's useful for creating a grid of widgets, like a photo gallery.

5. Stack: The Stack widget overlays multiple children, allowing them to be positioned on top of each other. It's commonly used for creating complex layouts where widgets need to be overlaid or stacked.

6. Expanded: Expanded is a flex widget that takes up the available space along the main axis within a Row, Column, or Flex. It is often used to make a child widget take up the remaining available space.

7. Flexible: Similar to Expanded, the Flexible widget allows a child to take a proportionate amount of space along the main axis. However, it provides more fine-grained control over how space is distributed among multiple flexible children.

8. Wrap: The Wrap widget organizes its children in multiple lines, wrapping to the next line when space is insufficient. It's useful when dealing with a dynamic number of widgets that might not fit in a single line.

9. SizedBox: SizedBox is a box with a specified width and height. It's often used to add space between widgets or to set explicit dimensions.

10. Card: The Card widget is a material design card. It's commonly used to present related information in a visually appealing way, with rounded corners and elevation.

## List the form input elements you used in this assignment and explain why you used these input elements!

### In the assignment, two widgets were utilized for the input elements:
1. `TextFormField` 
This is a type of widget in the form a `FormField` that contains a `TextField`. The widget is specifically used for handling text input as a string from the user when they enter the input into the `FormField` and is commonly used in forms. It is essentially also a combination of `TextField` and `Form` and also includes built-in validation formatting.

2. `Form`
The `Form` widget is a widget that acts as a container for grouping and validating multiple forms. It helps in managing input data from the user in the state of a form as well as provides methods to validate and save them in the Flutter application.


### Input elements for each item in the form

The input elements here correspond to the elements in our Django model from the previous assignments (specifically the inputs used for the form to add each item into the website/database). The reason that I utilized these input elements is that it is rather general and fits the theme of the Flutter application of Los Pollos Hermanos, a chicken shop application. Each item or menu is thus dedicated a name, price, amount, and description, which also corresponds to the django model.

1. `name`: The name of the menu item
2. `price`: The price of the menu item
3. `amount`: The amount of the menu item in the view items page/inventory
4. `description`: The description of each menu item in the view items page/inventory


## How is clean architecture implemented in a Flutter application?

Clean architechture is a concept that focuses on desgining software systems that are independent from any external dependencies. It essentially targets to decouple business logic from the user interface and external frameworks in order to make the application highly maintanable and testable. Therefore, it could be deduced that clean architechture aims to achieve separation of concerns in developing an application without conflicting any dependencies.

In the context of Flutter, clean architecture can be implemented by dividing the application into different layers: Presentation Layer, Domain Layer, and Data Layer. Each layer has its specific responsibilities and dependencies:

1. Presentation Layer (UI): Within this layer reside the components responsible for user interaction, including widgets, screens, and views. Its primary role is to manage user input and display the user interface. The presentation layer is designed to operate independently of the intricacies of business logic and data access implementation.

2. Domain Layer (Business Logic): Serving as the application's core business logic, the domain layer houses crucial elements like use cases, entities, and business rules. Use cases define the operations within the application, while entities represent the fundamental objects in the domain, defining both their behavior and state. Note that the domain layer remains neutral and uninfluenced by any specific framework or technology.

3. Data Layer: Tasked with data retrieval and storage, the data layer is comprised repositories and data sources. Repositories act as a bridge for accessing and manipulating data (by providing an abstraction layer), defining the contract or interface for data operations. The actual implementation of these operations occurs in data sources, which can be diverse entities like remote APIs, local databases, or other external data providers. By doing so, the data layer acts as a protective barrier, shielding the domain layer from the intricacies of data storage and retrieval.

Through these different layers, the goal of separation of concerns could be achieved and thus enables unit testing of the business logic of the application in isolation (of one layer from another). Note taht you can write tests with for the Domain Layer in order to test functionalities that are important without actually needing to interact with the app's UI. This ensures a more reliable and faster way to test the application, as well as making the application's code more scalable and maintainable in the future.


## Explain how you implemented the checklist above step-by-step! (not just following the tutorial)

### 1. Creating a Menu Drawer for Navigation in the Flutter application

To start creating the Menu Drawer, I firstly created a new folder called `widgets` in the `lib` directory of my project and created a new dart file called `left_drawer.dart`. In that file, I imported the necessary files into it such as the `import 'package:flutter/material.dart';` as well as the `menu.dart` and `item_form.dart` files since I will be navigating to the `MyHomePage()` and `ItemFormPage()` (or previously named the `ShopFormPage`) from the left drawer navigation. The file also contains a stateless widget with the class called `LeftDrawer` (which extends `StatelessWidget`), and has a widget that returns `Drawer()` which has a `ListView()` and some children that contain the `DrawerHeader()` widget and the `Padding()`, `Text()`, and `ListTile()` widgets for the navigation buttons. 

The `DrawerHeader()` section was colored orange using `color: Colors.orange` as well as filled with text such as "Flutter Inventory" and "Write all your Menu Item needs here!" in the `Column()` widget that contains `Text()` widgets for the text. Below the `DrawerHeader()` widget, the two `ListTile()` widgets were present for the buttons that go to `MyHomePage()` and `ItemFormPage()` respectively. The first `ListTile()` button contains a `Navigator.pushReplacement()` widget which routes/directs the user to go to `MyHomePage()` whenever clicked via the `onTap` input in `ListTile()`, and this button replaces the screen display/route top of the stack with a new route to the `MyHomePage()` screen when it is clicked. The second `ListTile()` contains a button that also uses the `Navigator.pushReplacement()` method when `onTap`, but instead redirects the user to the `ItemFormPage()` as their new route. After finishing the left drawer, I added this to the `menu.dart` page by adding a `drawer` parameter of the `Scaffold()` widget using `drawer: const LeftDrawer()`.


### 2. Creating an Item Form with Input Elements and Displaying the Data

A new file in the `lib` directory called `item_form.dart` was created which had two main classes. The first class is the `ItemFormPage` which extends the `StatefulWidget`, indicating that the `ItemFormPage` can dynamically change its state, and also the `_ItemFormPageState` which extends `State<ItemFormPage>` so that it could dynamically change the state of the `ItemFormPage`. Within the `_ItemFormPageState`, I defined several class attribute variables which serve as the input fields, namely `_formKey`, `_name`, `_amount`, `_price`, `_description`. Below these input fields that I created, there was the main `Widget()` function that contained a `Scaffold()` (which replaced the `Placeholder()` in the tutorial) consisting of the `AppBar()`, `LeftDrawer()` parameter on the `AppBar()`, and a `Form()` widget that has a `Column()` widget with 4 `Padding()` widgets containing a `TextFormField()` for the name, price, amount, and description of the Menu Item for the user to input in the page. 

Note that the `onChanged` and `validator` parameters were used in each of the `TextFormField()` widgets to detect whenever there is a change in the `TextFormField()` for `onChanged`, and to validate the content of `TextFormField()` and return a string using an if-statement in case of an error for `validator`. I also used `null-safety` with `String?` (to indicate that the variable can contain either a `String` or `null`) and `value!` (to indicate that the variable is guaranted not to be `null`) in the `validator` and `onChanged`. Next, I created a button as the subsequent child of the `Column()` and wrapped the button with `Padding()` and `Align()`. I made it so that this button also saves to the database using an instance of an `Item` and the `add()` method (in constrast to not saving in the tutorial) when after the popup (using the `AlertDialog` widget that displays the Name, Price, Amount, Description that the user has inputted in the form field) displays after clicking the button using the following code:

```dart
if (_formKey.currentState!.validate()) {
    Item.add(
    Name: _name,
    Price: _price,
    Amount: _amount,
    Description: _description,
  );
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Item successfully saved'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text('Name: $_name'),
              Text('Price: $_price'),
              Text('Amount: $_amount'),
              Text('Description: $_description'),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
_formKey.currentState!.reset();
}
```

### 3. Adding the Navigation to Buttons

I modified the `onTap` attribute of the `InkWell` within the `ShopItem()` widget in `menu.dart` to allow the navigation to another route in the Flutter application. The button was an "AddItem" button which uses the `Navigator.push()` method (which pushes a new screen/display onto the stack in the Flutter application) that routes the user to the `ItemFormPage()` if the user wishs to add an item. 

### 4. Implementing clean architecture by refactoring files

I created a new file called `item_card.dart` in the `widgets` directory, and then moved all of the `ShopItem` contents from `menu.dart` into the `item_card.dart` file. Furthermore, I imported the `item_form.dart` page in the `item_card.dart` using `import 'package:flutter_inventory/screens/item_form.dart';` so that its classes could be referenced. A new folder called `screens` in the `lib` directory was also made, at which I moved the `menu.dart` and `item_form.dart` files into that folder and refactored the files so that they can have the necessary imports. Furthermore, I created a new folder called `models` in the `lib` directory to contain the `item.dart` file to indicate the model for each item to be saved into the database. This refactoring of files implements clean architecture as it separates the Presentation Layer, Domain Layer, and Data Layer. 

### 5. Bonus

The `item.dart` file is modified as the following where there is an `Item` class with attributes `Name`, `Price`, `Amount`, and `Description`, and the `Item` method as an `add()` which allows adding items into the database. This could be seen from `listItem.add(Item())`:

```dart
class Item {
  static List<Item> listItem = [];
  String Name;
  int Price;
  int Amount;
  String Description;

  Item({
    required this.Name,
    required this.Price,
    required this.Amount,
    required this.Description,
  });

  static void add({
    required Name,
    required Price,
    required Amount,
    required Description,
  }) {
    listItem.add(Item(
      Name: Name,
      Price: Price,
      Amount: Amount,
      Description: Description,
    ));
  }
}
```

Next, I created a `view_item.dart` file in the `screens` directory using the following code that displays the items added from the `item_form.dart` file in a `Card()` widget containing `Padding()` with `Column()` and `Row()` for each item to be displayed:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_inventory/widgets/left_drawer.dart';
import 'package:flutter_inventory/models/item.dart';

class ViewItemPage extends StatefulWidget {
  const ViewItemPage({super.key});

  @override
  State<ViewItemPage> createState() => _ViewItemPageState();
}

class _ViewItemPageState extends State<ViewItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('View Items'),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: SingleChildScrollView(
            child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: Item.listItem.map((Item P) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            P.Name,
                            style: const TextStyle(fontSize: 24.0),
                          ),
                          Text(
                            "Price: ${P.Price}",
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            "Amount: ${P.Amount}",
                            style: const TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            P.Description,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        )));
  }
}
```

I also modified the `left_drawer.dart` file to include a `ListTile()` that navigates to the `ViewItemPage()` using the following `Navigator` code:

```dart
ListTile(
  leading: const Icon(Icons.checklist),
  title: const Text('View Items'),
  // redirect to ViewItemPage
  onTap: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ViewItemPage(),
      ),
    );
  },
),
```

Finally, I added the "View Items" item in the `item_card.dart` file and used the `Navigator.push()` method to create a routing to the `ViewItemPage()`:

```dart
if (item.name == "View Items") {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ViewItemPage()
      ),
    );
}
```

# PBP_Inventory | Assignment 9

## Can we retrieve JSON data without creating a model first? If yes, is it better than creating a model before retrieving JSON data?

Yes, in flutter we can retrieve JSON data without creating a model first since we can just create a JSON string within a function or class of a file that we are working on, and use the `dart:convert` library to parse JSON data into Dart objects for our Flutter application dynamically without having to create a specific model. For example:

```dart
import 'dart:convert';

void main() {
  String jsonString = '{"name": "Stephen Curry", "age": 35}';
  
  // Parse JSON string into a dynamic Dart object
  dynamic jsonData = json.decode(jsonString);
  
  // Access data without a predefined model
  print('Name: ${jsonData["name"]}, Age: ${jsonData["age"]}');
}
```

However, it is better to create a model before retrieving JSON data due to several drawbacks. These include a lack of type safety (that means lacking compile-time checking since if the structure of the JSON data changes or if there are errors in the data, we will only discover them at runtime which may lead to runtime errors), lack of readability in our code (since creating a model in a separate Dart file ensures a clear and structured representation of data to make it more readable and maintainable), and a lack of separation of concerns (because if the model sits in one file with other widgets in the app, it may lead to unwanted conflicts such as inability to isolate and test the model with other widgets that may use the same model). Therefore, it is better to create a model before retrieving JSON data because it ensures code organization, maintainability, and separation of concerns. 

## Explain the function of CookieRequest and explain why a CookieRequest instance needs to be shared with all components in a Flutter application.

`CookieRequest` is a class (or library) from the `pbp_django_auth` package that is used to handle authentication-related requests, specifically for logging in, logging out, and HTTP request handling with cookies inside of our Flutter application. `CookieRequest` manages the cookies or tokens required for authentication with the Django backend server.

A `CookieRequest` instance needs to be shared with all components in a Flutter application through a `Provider` because this ensures that all components can interact and access with the same authentication state made by `CookieRequest`. This ensures that changes in the login status, user data, as well as cookies are consistently reflected throughout the application. Futhermore, centralizing authentication by sharing an instance of `CookieRequest` with all components in the Flutter app can increase code efficiency, redundancy, and streamlines user experience (since cookies/tokens can be tracked easily as they are centralized). 

## Explain the mechanism of fetching data from JSON until it can be displayed on Flutter.

The mechanism of fetching data from JSON until it can be displayed on Flutter involves several steps. First, the Flutter application typically uses a networking library, such as `pbp_django_auth` or `http`, to make an HTTP request to the server hosting the JSON data. This request is usually in the form of a GET request (for unsecure requests that do not involve sensitive information such as search results of a page) or a POST request (for secure requests that have sensitive information such as from login/register forms), and it fetches the JSON data from the server.

Once the data is retrieved, it will often be in the form a JSON string. This JSON string must be parsed/serialized and converted into a Dart object so that it could be used on Flutter. There are 2 ways of doing this; to use manual serialization and automated serialization using code generation. Manual serialization involves using Flutter's built-in `dart:convert` library that includes a straightforward JSON encoder and decoder which are `jsonDecode()` and `jsonEncode()`. However, we call the `jsonDecode()` function with the JSON string as an argument to convert the string into a Dart object. The function returns a `Map<String, dynamic>`, meaning that we do not know the values until runtime. We can also serialize JSON inside our model classes using `fromJson()` and `toJson()`. Automated serialization of JSON strings on the other hand uses a library called `json_serializable`, an automated source code generator that generates the JSON serialization boilerplate, to decode the JSON string. 

After decoding the JSON string and parsing them into Dart objects, we use the Flutter widgets to display the data in the user interface. Widgets like ListView, GridView, and ListTile are commonly employed to present lists of data, while Text and Image widgets are used to display individual pieces of information on the Flutter application.

## Explain the authentication mechanism from entering account data on Flutter to Django authentication completion and the display of menus on Flutter.

The authentication mechanism between Flutter and Django involves a series of steps to securely manage user account data and perform authentication, ultimately leading to the display of menus in the Flutter application. When a user enters their account data (username and password) in the Flutter app, the app communicates with the Django backend through an HTTP request, typically a POST request to the authentication endpoint. The request includes the user's credentials and is sent to the Django server, which uses the provided information to authenticate the user.

In the Django backend, the authentication process involves verifying the username and password against the stored user data. Django uses its built-in authentication system, which includes hashing and salting passwords for security. If the provided credentials are valid, the Django server generates an authentication token or sets a session to track the user's authenticated state.

The Django server then sends a response back to the Flutter app, indicating the success or failure of the authentication attempt. If authentication is successful, the response may include additional user data or an authentication token for future secure communication. In case of failure, an appropriate error message is sent.

Upon receiving the authentication response, the Flutter app interprets the result and updates its local state accordingly. If authentication is successful, the app transitions to a menu display page, such as displaying different menus or features accessible to the authenticated user. This transition is often managed through Flutter's navigation system, directing the user to the appropriate screen.

Throughout this process, secure communication practices, such as HTTPS, should be implemented to protect user data during transmission. Additionally, proper error handling and user feedback mechanisms ensure a smooth user experience, with error messages displayed when authentication fails. Overall, the authentication mechanism involves a coordinated exchange of data between Flutter and Django, ensuring the security and integrity of user account information.

## List all the widgets you used in this assignment and explain their respective functions.



## Explain how you implement the checklist above step by step! (not just following the tutorial).