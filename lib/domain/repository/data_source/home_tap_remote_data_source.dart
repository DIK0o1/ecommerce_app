import 'package:dartz/dartz.dart';
import '../../enities/category_response_entity.dart';
import '../../enities/failures_entity.dart';

abstract class HomeTapRemoteDataSource{
  Future<Either<FailuresEntity, CategoryResponseEntity>>getCategories();

}