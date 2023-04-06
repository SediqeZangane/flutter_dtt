abstract class HomeEvent {}

class LoadHomeEvent implements HomeEvent {}

class SearchHomeEvent implements HomeEvent{
  final String searchText;

  SearchHomeEvent(this.searchText);
}