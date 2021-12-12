import 'item.dart';


class User {


  List<String> inventory = [];

  void pickUpItem (Item item){
    inventory.add(item.itemName);
  }


}



