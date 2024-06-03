import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/enities/category_response_entity.dart';
import 'package:e_commerce/domain/enities/failures_entity.dart';

abstract class HomeTapRepository {
  Future<Either<FailuresEntity, CategoryResponseEntity>>getCategories();
}