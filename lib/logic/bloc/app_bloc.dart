import 'dart:async';
import 'dart:typed_data';

import 'package:asmr_text_to_image_ai/data/data_source/base_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repository/app_repo.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppRepo _repo;

  AppBloc(this._repo) : super(AppState(generatedImage: null)) {
    on<GenerateAiImageEvent>((event, emit) async {
      emit(state.copyWith(generatedImage: BaseModel.loading()));
      try{
        var result = await _repo.generateImage(event.prompt);
        if(result != null){
          emit(state.copyWith(generatedImage: BaseModel.success(result)));
        }else{
          emit(state.copyWith(generatedImage: BaseModel.failed("Something went wrong...")));
        }
      }catch(e){
        emit(state.copyWith(generatedImage: BaseModel.failed("Check your connection...")));
      }
    });
  }
}
