// search_event.dart
part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchByIngredientsEvent extends SearchEvent {
  final String ingredients;

  SearchByIngredientsEvent(this.ingredients);
}

class NavigateToDetailsEvent extends SearchEvent {
  final RecipeInfoModel recipeInfo;

  NavigateToDetailsEvent(this.recipeInfo);
}
