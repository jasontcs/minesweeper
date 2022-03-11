String formatDuration(int totalSeconds) {
  final duration = Duration(seconds: totalSeconds);
  final minutes = duration.inMinutes;
  final seconds = totalSeconds % 60;
  return minutes > 0 ? '${minutes}m ${seconds}s' : '${seconds}s';
}
