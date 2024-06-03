import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/domain/enities/category_response_entity.dart';
import 'package:e_commerce/domain/enities/failures_entity.dart';
import 'package:e_commerce/domain/repository/data_source/home_tap_remote_data_source.dart';

class HomeRemoteDataSourceImp implements HomeTapRemoteDataSource{
  ApiManager apiManager;

  HomeRemoteDataSourceImp({required this.apiManager});

  @override
  Future<Either<FailuresEntity, CategoryResponseEntity>> getCategories() async{
    var either = await apiManager.getCategories();
    return either.fold((l){
      return Left(l);
    }, (r){
      return Right(r);
    });
  }

}