import 'package:provider/provider.dart';

//Blueprint för Items - hur ser arkitekturen för ett Item ut
class TodoItem {
  String title;
  bool done;

  TodoItem({required this.title, this.done = false});

  void ifDone(item) {
    done = !done;
  }

  void checkCompletion(item) {
    if (item.isCompleted = true) {
    }
  }
}