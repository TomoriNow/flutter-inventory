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