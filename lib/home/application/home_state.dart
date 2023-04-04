class HomeState {
  final bool isLoad;

  HomeState.init() : isLoad = false;

  HomeState({required this.isLoad});

  HomeState copyWith({bool? isLoad}) =>
      HomeState(isLoad: isLoad ?? this.isLoad);
}
