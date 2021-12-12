import 'item.dart';

class Room {
  String name;
  String description;
  List<String> roomItems;

  Room({this.name, this.description, this.roomItems});

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
    print('Items: $roomItems');}
    int option = 1;
    for (Room room in adjacentRooms){
      print('[${option++}] ${room.name}');
    } if(roomItems != null) {
      for (String roomItem in roomItems) {
        print('[${option++}] Pick up $roomItem');
      }
    }
  }

  void removeFromRoom(Item item){
    roomItems.remove(item.itemName);
  }
}