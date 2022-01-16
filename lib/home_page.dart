import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCross = true;
  String? message, currentTurn = "Cross Turn's";
  List<String>? gameState;

  //init asset image

  AssetImage cross = const AssetImage("images/cross.png");
  AssetImage circle = const AssetImage("images/circle.png");
  AssetImage edit = const AssetImage("images/edit.png");

  @override
  void initState() {
    super.initState();
    setState(() {
      gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty"
      ];
    });
    message = "";
  }

  resetGame() {
    setState(() {
      gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty"
      ];
    });
    message = "";
    isCross = true;
    getCurrentTurn();
  }

  AssetImage getImage(String value) {
    switch (value) {
      case "empty":
        return edit;
      case "cross":
        return cross;
      case "circle":
        return circle;
      default:
        return edit;
    }
  }

  playGame(int index) {
    if (gameState?[index] == "empty") {
      setState(() {
        if (isCross) {
          gameState?[index] = "cross";
        } else {
          gameState?[index] = "circle";
        }
        isCross = !isCross;
        checkWin();
      });
    }
  }

  checkWin() {
    if ((gameState?[0] != "empty") &&
        (gameState?[0] == gameState?[1]) &&
        (gameState?[1] == gameState?[2])) {
      setState(() {
        message = "${gameState?[0]} wins game";
      });
    } else if ((gameState?[3] != "empty") &&
        (gameState?[3] == gameState?[4]) &&
        (gameState?[4] == gameState?[5])) {
      setState(() {
        message = "${gameState?[3]} wins game";
      });
    } else if ((gameState?[6] != "empty") &&
        (gameState?[6] == gameState?[7]) &&
        (gameState?[7] == gameState?[8])) {
      setState(() {
        message = "${gameState?[6]} wins game";
      });
    } else if ((gameState?[0] != "empty") &&
        (gameState?[0] == gameState?[3]) &&
        (gameState?[3] == gameState?[6])) {
      setState(() {
        message = "${gameState?[0]} wins game";
      });
    } else if ((gameState?[1] != "empty") &&
        (gameState?[1] == gameState?[4]) &&
        (gameState?[4] == gameState?[7])) {
      setState(() {
        message = "${gameState?[1]} wins game";
      });
    } else if ((gameState?[2] != "empty") &&
        (gameState?[2] == gameState?[5]) &&
        (gameState?[5] == gameState?[8])) {
      setState(() {
        message = "${gameState?[2]} wins game";
      });
    } else if ((gameState?[0] != "empty") &&
        (gameState?[0] == gameState?[4]) &&
        (gameState?[4] == gameState?[8])) {
      setState(() {
        message = "${gameState?[0]} wins game";
      });
    } else if ((gameState?[2] != "empty") &&
        (gameState?[2] == gameState?[4]) &&
        (gameState?[4] == gameState?[6])) {
      setState(() {
        message = "${gameState?[2]} wins game";
      });
    } else if (!gameState!.contains("empty")) {
      setState(() {
        message = "Game draw";
      });
    }
    getCurrentTurn();
  }

  getCurrentTurn() {
    if (isCross) {
      setState(() {
        currentTurn = "Cross Turn's";
      });
    } else {
      setState(() {
        currentTurn = "Circle Turn's";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TicTacToe"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "$currentTurn",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0),
              itemCount: gameState?.length,
              itemBuilder: (context, i) => Container(
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                // color: Colors.amber,
                height: 100,
                width: 100,
                child: MaterialButton(
                  onPressed: () => playGame(i),
                  child: Image(image: getImage(gameState![i])),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                '$message',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              color: Colors.purple,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              onPressed: resetGame,
              child: Text(
                'Reset Game',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.purple[100]),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

class $ {}
