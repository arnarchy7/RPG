class Room {
  String name;
  String description;

  Room({this.name, this.description});

  List<Room> adjacentRooms = [];

  void addAdjacentRoom(Room room){
    if(!adjacentRooms.contains(room)){
      adjacentRooms.add(room);
      room.addAdjacentRoom(this);
    }
  }

}