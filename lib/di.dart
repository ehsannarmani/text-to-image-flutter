

import 'package:asmr_text_to_image_ai/data/data_source/api.dart';
import 'package:asmr_text_to_image_ai/data/repository/app_repo.dart';
import 'package:asmr_text_to_image_ai/logic/bloc/app_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setup(){
  //inject dio
  locator.registerSingleton(Dio());

  // inject api
  locator.registerSingleton(Api(locator()));

  // inject repositories
  locator.registerSingleton(AppRepo(locator()));

  // inject bloc's
  locator.registerSingleton(AppBloc(locator()));
}