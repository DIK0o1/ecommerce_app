import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/repository/repository/home_tap_repository.dart';

import '../enities/category_response_entity.dart';
import '../enities/failures_entity.dart';

class GetAllCategoriesUseCase{
  HomeTapRepository homeTapRepository;

  GetAllCategoriesUseCase({required this.homeTapRepository});

  Future<Either<FailuresEntity, CategoryResponseEntity>> invoke(){
    return homeTapRepository.getCategories();
  }
}