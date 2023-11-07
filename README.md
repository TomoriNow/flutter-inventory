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