import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onbarding_event.dart';

part 'onbarding_state.dart';

class OnbardingBloc extends Bloc<OnbardingEvent, OnboardingPageState> {
  OnbardingBloc() : super(OnboardingPageState.initial()) {
    on<OnbardingEvent>(onBoardIngEvent);
  }

  Future<void> onBoardIngEvent(
      OnbardingEvent event, Emitter<OnboardingPageState> emit) async {
    if (event is OnboardingNextPage) {
      emit(OnboardingPageState(event.currentpageNo));
    }
  }
}
