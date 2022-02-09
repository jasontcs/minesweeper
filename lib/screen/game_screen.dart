import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minesweeper/bloc/game/game_bloc.dart';
import 'package:minesweeper/bloc/game/game_event.dart';
import 'package:minesweeper/bloc/game/game_state.dart';
import 'package:minesweeper/bloc/timer/timer_bloc.dart';
import 'package:minesweeper/bloc/timer/timer_state.dart';
import 'package:minesweeper/service/game/game_model.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BlocBuilder<GameBloc, GameState>(
          builder: (context, state) => Center(
            child: Text(
              state is GameActive ? state.flagLeft.toString() : '-',
            ),
          ),
        ),
        title: BlocBuilder<GameBloc, GameState>(
          builder: (context, state) {
            if (state is GameWin) return const Text('Win!');
            if (state is GameLose) return const Text('Lose!');
            if (state is GameActive) {
              return const Text('Go For It!');
            }
            return const Text('Ready To Start?');
          },
        ),
        actions: [
          BlocBuilder<TimerBloc, TimerState>(
            builder: (context, state) =>
                Center(child: Text(state.second?.toString() ?? '-')),
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<GameBloc, GameState>(
          builder: (context, state) {
            if (state is GameActive) {
              return GridView.count(
                crossAxisCount: state.width,
                children:
                    state.boxes.map((box) => MineBoxTile(box: box)).toList(),
              );
            }
            return const Text('Not Start');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.restore),
        onPressed: () => context.read<GameBloc>().add(
              GameStarted(
                width: 16,
                height: 16,
                mine: 40,
              ),
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
    return GestureDetector(
      onTap: () {
        context.read<GameBloc>().add(GameBoxOpen(position: box.position));
      },
      onSecondaryTap: () {
        context.read<GameBloc>().add(GameBoxFlag(position: box.position));
      },
      child: Card(
        color: _bgColor(box),
        child: GridTile(
          child: Center(
            child: MineBoxContent(box: box),
          ),
        ),
      ),
    );
  }
}

class MineBoxContent extends StatelessWidget {
  const MineBoxContent({Key? key, required this.box}) : super(key: key);
  final MineBox box;

  @override
  Widget build(BuildContext context) {
    switch (box.status) {
      case MineBoxStatus.close:
        return Container();
      case MineBoxStatus.open:
        return Text(box.number > 0 ? box.number.toString() : '');
      case MineBoxStatus.flag:
        return const Icon(Icons.flag);
      case MineBoxStatus.wrongFlag:
        return const Icon(Icons.flag);
      case MineBoxStatus.burst:
        return const Icon(Icons.error);
      case MineBoxStatus.otherBurst:
        return const Icon(Icons.error);
    }
  }
}
