part of 'app_bloc.dart';

class AppState{
  final BaseModel<Uint8List>? generatedImage;
  AppState({required this.generatedImage});

  AppState copyWith({BaseModel<Uint8List>? generatedImage}){
    return AppState(generatedImage: generatedImage ?? this.generatedImage);
  }
}
