part of 'test_cubit.dart';

@immutable
sealed class TestState {
  String na = "aaa";
}

final class TestInitial extends TestState {}

class TestLoaded extends TestState {
  TestLoaded(na);
}
