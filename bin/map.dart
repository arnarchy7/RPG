import 'final_room.dart';
import 'fourth_room.dart';
import 'second_room.dart';
import 'room.dart';
import 'entrance.dart';
import 'third_room.dart';


class Map {

  Room firstRoom;
  Room secondRoom;
  Room thirdRoom;
  Room fourthRoom;
  Room finalRoom;


  Map() {
    Room entrance = Entrance(description: 'You are in a white room with two doors in front of you.\nA blue door on your right and a green door to your left. \nSearching the room you find the following');
    Room roomTwo = SecondRoom( description: 'You are in a blue room. Theres only a white door behind you.\nLooking around you find the following');
    Room roomThree = ThirdRoom( description: 'You are in a green room with three doors.\nA white door behind you, a yellow door to your left and a red door in front of you.');
    Room roomFour = FourthRoom( description: 'You are in a yellow room with a green door behind you.\nSearching the room you find the following');
    Room roomFinal = FinalRoom( description: 'You are in a red room with a green door behind you. \nIn front you is a huge tablet that asks for a password.\nMaybe there was a hint somewhere');

    entrance.addAdjacentRoom(roomTwo);
    entrance.addAdjacentRoom(roomThree);
    roomThree.addAdjacentRoom(roomFour);
    roomThree.addAdjacentRoom(roomFinal);

    firstRoom = entrance;
    secondRoom = roomTwo;
    thirdRoom = roomThree;
    fourthRoom = roomFour;
    finalRoom = roomFinal;

  }

}