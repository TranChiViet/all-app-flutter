import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wakelock/wakelock.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());

  Timer? _timer;

  startTimer([int? time]){
    Wakelock.enable();
    if(time != null){
      emit(TimerProgress(time));
    }else{
      emit(const TimerProgress(0));
    }
    _timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }
  onTick(Timer timer){
    if(state is TimerProgress){
      TimerProgress wip = state as TimerProgress;
      if(wip.elapsed !<10){
        emit(TimerProgress(wip.elapsed!+1));
      }else{
        _timer!.cancel();
        Wakelock.disable();
        emit(const TimerInitial());
      }
    }
  }
}
