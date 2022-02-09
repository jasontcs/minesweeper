import 'package:flutter/material.dart';
import 'package:minesweeper/service/timer/timer_service.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String second = '-';

  @override
  void initState() {
    super.initState();
    TimerService.instance.time.listen((value) {
      setState(() {
        second = value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => TimerService.instance.start(),
            icon: Icon(Icons.ac_unit),
          ),
          IconButton(
            onPressed: () => TimerService.instance.stop(),
            icon: Icon(Icons.ac_unit),
          ),
          IconButton(
            onPressed: () => TimerService.instance.reset(),
            icon: Icon(Icons.ac_unit),
          ),
        ],
      ),
      body: Center(
        child: Text(second),
      ),
    );
  }
}
