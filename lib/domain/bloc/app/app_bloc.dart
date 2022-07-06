import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:example/authentication_flow/authentication_flow.dart';


import '../../models/user_model.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {


  AppBloc() : super(AppState.unauthenticated()) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
  }

  void _onUserChanged(
    AppUserChanged event,
    Emitter<AppState> emit,
  ) {}

  void _onLogoutRequested(
    AppLogoutRequested event,
    Emitter<AppState> emit,
  ) {}
}
