part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class GenerateAiImageEvent extends AppEvent{
  String prompt;
  GenerateAiImageEvent(this.prompt);
}
