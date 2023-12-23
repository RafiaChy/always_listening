import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:path/path.dart' as p;
import '../../../domain_layer/use_case/send_audio_use_case.dart';


part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeUpdateState> {
  final SendAudioUseCase sendAudioUseCase;
  AudioRecorder audioRecorder = AudioRecorder();
  String? audioPath;
  int count = 0;
  bool isAudioRecording = false;

  HomeBloc({required this.sendAudioUseCase})
      : super(HomeUpdateState.initial()) {
    on<TriggerListenEvent>(_onTriggerListenEvent);
    on<TriggerRecordEvent>(_onTriggerRecordEvent);
    on<TriggerSendAudio>(_onTriggerSendAudio);
    on<TriggerStopAudio>(_onTriggerStopAudio);
  }

  FutureOr<void> _onTriggerListenEvent(
      TriggerListenEvent event, Emitter<HomeUpdateState> emit) async {
    if (!isAudioRecording) {
      emit(state.copyWith());
      add(TriggerRecordEvent());
    } else {
      Future.delayed(const Duration(seconds: 5), () {
        add(TriggerStopAudio());
      });
    }
  }

  FutureOr<void> _onTriggerSendAudio(
      TriggerSendAudio event, Emitter<HomeUpdateState> emit) async {
    try {
      final response = await sendAudioUseCase.execute(audioPath!);
      response.fold(
          (failure) => {
                emit(state.copyWith(
                    isError: true, errorMessage: failure.message))
              },
          (r) => {
                count += 1,
                emit(state.copyWith(counter: count)),
                add(TriggerStopAudio())
              });
    } catch (e) {
      emit(state.copyWith(isError: true, errorMessage: e.toString()));
      add(TriggerStopAudio());
    }
  }

  FutureOr<void> _onTriggerRecordEvent(
      TriggerRecordEvent event, Emitter<HomeUpdateState> emit) async {
    try {
      if (await audioRecorder.hasPermission()) {
        isAudioRecording = true;
        const encoder = AudioEncoder.wav;
        const config = RecordConfig(
          encoder: encoder,
        );

        final dir = await getApplicationDocumentsDirectory();
        audioPath = p.join(
          dir.path,
          'audio_${DateTime.now().millisecondsSinceEpoch}.m4a',
        );

        await audioRecorder.start(config, path: audioPath!);
        emit(state.copyWith());
        add(TriggerSendAudio());
      }
    } catch (e) {
      emit(state.copyWith(isError: true, errorMessage: e.toString()));
      add(TriggerStopAudio());
    }
  }

  FutureOr<void> _onTriggerStopAudio(TriggerStopAudio event, Emitter<HomeUpdateState> emit) async {
    try{
      audioPath = await audioRecorder.stop();
      isAudioRecording = false;
      emit(state.copyWith());
      add(TriggerListenEvent());
    }catch(e){
      emit(state.copyWith(errorMessage: e.toString(), isError: true));
    }
  }
}
