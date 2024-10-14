part of 'onbarding_bloc.dart';

sealed class OnbardingEvent extends Equatable {
  const OnbardingEvent();
}

class OnboardingNextPage extends OnbardingEvent {
  int currentpageNo;
  OnboardingNextPage(this.currentpageNo);
  @override
  List<Object?> get props => [currentpageNo];
}
