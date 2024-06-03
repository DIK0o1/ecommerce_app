import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/enities/category_response_entity.dart';
import 'package:e_commerce/domain/enities/failures_entity.dart';
import 'package:e_commerce/domain/repository/data_source/home_tap_remote_data_source.dart';
import 'package:e_commerce/domain/repository/repository/home_tap_repository.dart';

class HomeTapRepositoryImpl implements HomeTapRepository{
  HomeTapRemoteDataSource homeTapRemoteDataSource;

  HomeTapRepositoryImpl({required this.homeTapRemoteDataSource});

  @override
  Future<Either<FailuresEntity, CategoryResponseEntity>> getCategories() {
    return homeTapRemoteDataSource.getCategories();
  }

}