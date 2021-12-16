import 'dart:io';
import 'item.dart';
import 'room.dart';
import 'user.dart';
import 'map.dart';


void main(List<String> arguments) {

 GameEngine().whiteRoomEngine();


}


class GameEngine {
 User user = User();
 Map map = Map();

 bool run = true;

 void whiteRoomEngine() {
  Item hammer = Item(itemName: 'hammer');


  while (run) {
   map.firstRoom.describeRoom();
   String input = stdin.readLineSync();

   if (input == '1') {
    blueRoomEngine();
   }
   else if (input == '2') {
    greenRoomEngine();
   }
    else if (input == '3') {
    user.pickUpItem(hammer);
    map.firstRoom.removeFromRoom(hammer);
   }// cheat code for testing purposes
    else if (input == '69'){
     redRoomEngine();
   }
  }
 }

 void blueRoomEngine(){
  Item key = Item(itemName: 'key');


  while (run) {
   map.secondRoom.describeRoom();
   String input = stdin.readLineSync();

   if (input == '1') {
    whiteRoomEngine();
   }
   else if (input == '2') {
    user.pickUpItem(key);
    map.secondRoom.removeFromRoom(key);
   }
  }
 }

void greenRoomEngine(){

 while (run) {
  map.thirdRoom.describeRoom();
  String input = stdin.readLineSync();

  if (input == '1') {
   whiteRoomEngine();
  }
  else if (input == '2') {
   yellowRoomEngine();
  }
  else if (input == '3') {
   if(user.inventory.contains('key')){
    print('\nThe door is locked. You open it with your key.');
    redRoomEngine();
   }else{
    print('\nThe door is locked. Maybe there is a key somewhere.');
   }
  }
 }
}

void yellowRoomEngine(){
 Item clay = Item(itemName: 'a block of clay');

 if(user.inventory.contains('flashlight')) {

  while (run) {
   map.fourthRoom.describeRoom();
   String input = stdin.readLineSync();

   if (input == '1') {
    greenRoomEngine();
   }
   else if (input == '2') {
    if(user.inventory.contains('hammer')){
     user.pickUpItem(clay);
     map.fourthRoom.removeFromRoom(clay);
     print('\nYou shake it and hear something is inside of it.\nYou take your hammer and break it.'
         '\nInside you find a note that reads:\n\n"The answer to the Ultimate Question of Life, the Universe, and Everything?"');
    }
    else{
     print('\nYou shake it and hear something is inside of it. Maybe you could break it with the right tool?\n');
    }
   }
  }
 }
 else{
  print("\nThe room is completely dark. You can't see anything.\nMaybe you can find a light source in another room\n");
  int option = 1;
  for (Room room in map.fourthRoom.adjacentRooms){
   print('[${option++}] Go through the ${room.doorColor}');}
  print('\nEnter a number for your action');
  String input = stdin.readLineSync();
  if(input=='1'){
   greenRoomEngine();
  }
 }
}

void redRoomEngine() {
 Item flashlight = Item(itemName: 'flashlight');

  while (run) {
   map.finalRoom.describeFinalRoom();
   String input = stdin.readLineSync();

  if (input == '1') {
   greenRoomEngine();
  }
  else if (input == '2'){
   if (user.inventory.contains('flashlight')){
   guessPassword();
   } else{
   user.pickUpItem(flashlight);
   map.finalRoom.removeFromRoom(flashlight); }
  }
  else if (input == '3') {
   guessPassword();
  }
 }
}

void guessPassword(){
 print('\nEnter password:');
 String password = stdin.readLineSync();
 if (password == '42') {
  endEngine();
 } else {
  print('\nWrong password!');
 }
}

void endEngine(){
 run = false;
 print('\nPassword accepted. Congratulations!');
 // Code to open video from the source below:
 // https://stackoverflow.com/questions/33027000/launching-a-web-browser-from-command-line-dart-script#:~:text=Process.run(%22start%22%2C%20%5Burl%5D%2C%20runInShell%3A%20true)%3B
 Process.run("start", ['https://www.youtube.com/watch?v=dQw4w9WgXcQ'], runInShell: true);
 }

}


