// search_bloc.dart
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipe_app/src/model/recipe_info_model.dart';
import 'package:recipe_app/src/service/api_service.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ApiService apiService = ApiService();

  SearchBloc() : super(SearchInitialState());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchByIngredientsEvent) {
      yield SearchLoadingState();
      try {
        List<RecipeInfoModel> recipeInfoList =
            await apiService.request(event.ingredients);
        yield SearchSuccessState(recipeInfoList);
      } catch (error) {
        yield SearchErrorState("Error fetching data");
      }
    } else if (event is NavigateToDetailsEvent) {
      yield SearchNavigationState(event.recipeInfo);
    }
  }
}
