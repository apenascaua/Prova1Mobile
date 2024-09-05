import 'dart:math';

import 'package:flutter/material.dart';

class Gamepage extends StatefulWidget {
  const Gamepage({super.key});

  @override
  State<Gamepage> createState() => _GamepageState();
  
  
}
class _GamepageState extends State<Gamepage> {
  int cut = 1; 
  int hand = 2; 
  int hammer = 3; 
  int placar = 0;
  int playerScoreboard = 0;
  int machineScoreboard = 0;

  int playerMove = 0;
  int machineMove = 0;
  String resultMessage = '';

  void machineTurn() {
    final random = Random();
    machineMove = random.nextInt(3) + 1; 
  }

  void checkWinner() {
    if (playerMove == machineMove) {
      resultMessage = 'Draw!';
    } 
    else if (playerMove == hammer && machineMove == cut) {
      resultMessage = 'You Win!';
      playerScoreboard++;  
    } 
    else if (playerMove == cut && machineMove == hand) {
      resultMessage = 'You Win!';
      playerScoreboard++;  
    } 
    else if (playerMove == hand && machineMove == hammer) {
      resultMessage = 'You Win!';
      playerScoreboard++;  
    } 
    else {
      resultMessage = 'Machine Won :(';
      machineScoreboard++;  
    }
  }

  void playerTurn(int move) {
    setState(() {
      playerMove = move;
      machineTurn();
      checkWinner(); 
    });
  }
    Icon getMoveIcon(int move) {
    if (move == hammer) return Icon(Icons.handyman_rounded, size: 50);
    if (move == cut) return Icon(Icons.content_cut_rounded, size: 50);
    if (move == hand) return Icon(Icons.back_hand, size: 50);
    return Icon(Icons.question_mark, size: 50); 
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 117, 12, 4),
        title: const Text('GameShow'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Your Turn:'),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 80,
                      child: IconButton(
                        icon: Icon(Icons.handyman_rounded),
                        onPressed: () {
                          playerTurn(hammer);  
                        } ,
                      ),
                      
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: CircleAvatar(
                        radius: 80,
                        child: IconButton(
                          icon: Icon(Icons.content_cut_rounded),
                          onPressed: () {
                            playerTurn(cut);  
                          } ,
                        )
                      ),
                    ),
                  ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Center(
                       child: CircleAvatar(
                        radius: 80,
                        child: IconButton(
                          icon: Icon(Icons.back_hand),
                          onPressed: () {
                            playerTurn(hand);  
                        },
                     ),
                   ),
                 ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Machine Turn:'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 80,
                        child: getMoveIcon(machineMove), 
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text('Results: $resultMessage', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text('Player Scoreboard: $playerScoreboard', style: TextStyle(fontSize: 24)),
            Text('Machine Scoreboard: $machineScoreboard', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey,
              ),
              child: Text('Results: $resultMessage', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}