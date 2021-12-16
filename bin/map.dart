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
    Room white = Entrance(description: '\nYou are in a white room with two doors in front of you.\nA blue door on your right and a green door to your left. \nSearching the room you find the following');
    Room blue = SecondRoom( description: '\nYou are in a blue room. Theres only a white door behind you.\nLooking around you find the following');
    Room green = ThirdRoom( description: '\nYou are in a green room with three doors.\nA white door behind you, a yellow door to your left and a red door in front of you.\n');
    Room yellow = FourthRoom( description: '\nYou are in a yellow room with a green door behind you.\nSearching the room you find the following');
    Room red = FinalRoom( description: '\nYou are in a red room with a green door behind you. \nIn front you is a huge tablet that asks for a password.\nMaybe there was a hint somewhere?\nYou also find the following');

    white.addAdjacentRoom(blue);
    white.addAdjacentRoom(green);
    green.addAdjacentRoom(yellow);
    green.addAdjacentRoom(red);

    firstRoom = white;
    secondRoom = blue;
    thirdRoom = green;
    fourthRoom = yellow;
    finalRoom = red;

  }

}