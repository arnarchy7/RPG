import 'item.dart';

class Room {
  String doorColor;
  String description;
  List<String> roomItems;

  Room({this.doorColor, this.description, this.roomItems});

  List<Room> adjacentRooms = [];

  void addAdjacentRoom(Room room){
    if(!adjacentRooms.contains(room)){
      adjacentRooms.add(room);
      room.addAdjacentRoom(this);
    }
  }

  void describeRoom(){
    print(description);
    if(roomItems != null) {
    print('Items: $roomItems\n');}

    int option = 1;
    for (Room room in adjacentRooms){
      print('[${option++}] Go through the ${room.doorColor}');
    } if(roomItems != null) {
      for (String roomItem in roomItems) {
        print('[${option++}] Pick up $roomItem');
      }
    } print('\nEnter a number for your action:');

  }

  void describeFinalRoom(){
    print(description);
    if(roomItems != null) {
      print('Items: $roomItems\n');}

    int option = 1;
    for (Room room in adjacentRooms){
      print('[${option++}] Go through the ${room.doorColor}');
    } if(roomItems != null) {
      for (String roomItem in roomItems) {
        print('[${option++}] Pick up $roomItem');
      } print('[${option++}] Guess the password');
    } print('\nEnter a number for your action:');
  }

  void removeFromRoom(Item item){
    roomItems.remove(item.itemName);
  }
}