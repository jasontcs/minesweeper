import 'package:flutter/material.dart';
import 'package:minesweeper/bloc/game/game_bloc.dart';
import 'package:minesweeper/model/game_model.dart';

class MineBoxTile extends StatelessWidget {
  const MineBoxTile({
    Key? key,
    required this.box,
    required this.side,
  }) : super(key: key);

  final MineBox box;
  final double side;

  Color _bgColor(MineBox box) {
    switch (box.status) {
      case MineBoxStatus.close:
        return Colors.grey;
      case MineBoxStatus.open:
        return Colors.white;
      case MineBoxStatus.flag:
        return Colors.grey;
      case MineBoxStatus.wrongFlag:
        return Colors.redAccent;
      case MineBoxStatus.burst:
        return Colors.red;
      case MineBoxStatus.otherBurst:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: side,
      height: side,
      child: GestureDetector(
        onSecondaryTap: () {
          context.read<GameBloc>().add(GameBoxFlag(position: box.position));
        },
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: _bgColor(box),
            padding: EdgeInsets.zero,
            onPrimary: Colors.black,
            onSurface: Colors.blue,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            elevation: 2,
          ),
          onPressed: () {
            context.read<GameBloc>().add(GameBoxOpen(position: box.position));
          },
          child: GridTile(
            child: Center(
              child: MineBoxContent(box: box),
            ),
          ),
        ),
      ),
    );
  }
}

class MineBoxContent extends StatelessWidget {
  const MineBoxContent({Key? key, required this.box}) : super(key: key);
  final MineBox box;

  Color _numberColor(int num) {
    List<Color> data = [
      Colors.transparent,
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.indigo,
      Colors.deepPurple,
      Colors.teal,
      Colors.black,
      Colors.blueGrey,
    ];
    return data[num];
  }

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: const IconThemeData(size: 20),
      child: Builder(
        builder: (context) {
          switch (box.status) {
            case MineBoxStatus.close:
              return Container();
            case MineBoxStatus.open:
              return Text(
                box.number.toString(),
                style: TextStyle(color: _numberColor(box.number)),
              );
            case MineBoxStatus.flag:
              return const Icon(Icons.flag);
            case MineBoxStatus.wrongFlag:
              return const Icon(Icons.flag);
            case MineBoxStatus.burst:
              return const Icon(Icons.error);
            case MineBoxStatus.otherBurst:
              return const Icon(Icons.error);
          }
        },
      ),
    );
  }
}
