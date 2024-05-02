sealed class Action {
  final int count;

  Action({required this.count});
}

class IncrementAction extends Action {
  IncrementAction({
    required super.count,
  });
}

class ResetAction extends Action {
  ResetAction({required super.count});
}
