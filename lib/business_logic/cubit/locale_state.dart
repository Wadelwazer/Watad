part of 'locale_cubit.dart';

class ChangeLocaleState {
  final Locale locale;
  ChangeLocaleState({
    required this.locale,
  });
}

abstract class LocalState {}

class LocalInitial extends LocalState {}
