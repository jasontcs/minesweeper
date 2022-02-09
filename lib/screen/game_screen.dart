import 'package:flutter/material.dart';
import 'package:minesweeper/service/game/game_model.dart';
import 'package:minesweeper/service/game/game_service.dart';
import 'package:minesweeper/service/timer/timer_service.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String second = '-';
  List<MineBox> boxes = [];

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
        child: GridView.count(
          crossAxisCount: 6,
          children: boxes.map((box) => MineBoxTile(box: box)).toList(),
        ),
      ),
    );
  }
}

class MineBoxTile extends StatelessWidget {
  const MineBoxTile({
    Key? key,
    required this.box,
  }) : super(key: key);

  final MineBox box;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onLongPress: () {},
        child: GridTile(
          header: Text(box.isMine ? 'Mine' : '-'),
          child: Center(child: Text(box.status.toString())),
          footer: Text(box.number.toString()),
        ),
      ),
    );
  }
}
