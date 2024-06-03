import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/enities/category_response_entity.dart';
import 'package:e_commerce/domain/enities/failures_entity.dart';
import 'package:e_commerce/domain/use_cases/get_all_categories_use_case.dart';
import 'package:meta/meta.dart';

part 'home_tap_view_model_state.dart';

class HomeTapViewModelCubit extends Cubit<HomeTapViewModelState> {
  GetAllCategoriesUseCase categoriesUseCase;
  HomeTapViewModelCubit({required this.categoriesUseCase})
      : super(HomeTapViewModelInitial());

  List<CategoryEntity> categoriesList = [];
  void getAllCategories() async {
    emit(HomeTapViewModelLoading(loadingMessage: 'loading ...'));
    var either = await categoriesUseCase.invoke();
    either.fold((l) {
      emit(HomeTapViewModelError(errors: l));
    }, (r) {
      categoriesList = r.data ?? [];
      emit(HomeTapViewModelSuccess(categoryResponseEntity: r));
    });
  }
}
