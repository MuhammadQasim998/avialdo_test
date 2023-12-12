import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipe_app/src/model/recipe_info_model.dart';
import 'package:recipe_app/src/service/api_service.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ApiService apiService = ApiService();

  // Initial state when the SearchBloc is created.
  SearchBloc() : super(SearchInitialState());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    // Process the event of searching for recipes based on ingredients.
    if (event is SearchByIngredientsEvent) {
      yield SearchLoadingState();
      try {
        List<RecipeInfoModel> recipeInfoList =
            await apiService.ingredientSearch(event.ingredients);
        yield SearchSuccessState(recipeInfoList);
      } catch (error) {
        yield SearchErrorState("Error fetching data");
      }
    }
    // Process the event of navigating to the details page for a particular recipe.
    else if (event is NavigateToDetailsEvent) {
      yield SearchNavigationState(event.recipeInfo);
    }
  }
}
