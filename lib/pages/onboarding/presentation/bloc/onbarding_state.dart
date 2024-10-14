part of 'onbarding_bloc.dart';

final class OnboardingPageState extends Equatable {
  factory OnboardingPageState.initial() {
    return const OnboardingPageState(0);
  }

  final int currentPage;
  const OnboardingPageState(this.currentPage);

  @override
  List<Object> get props => [currentPage];
}
