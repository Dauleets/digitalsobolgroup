import 'package:digitalsobolgroup/common/types/failures.dart';
import 'package:digitalsobolgroup/feature/main/profile/data/datasoruce/names/avatar_datasource.dart';
import 'package:digitalsobolgroup/feature/main/profile/data/datasoruce/photo/avatar_datasource.dart';
import 'package:digitalsobolgroup/feature/main/profile/domain/repositories/avatar_repostoiry.dart';
import 'package:digitalsobolgroup/injection.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final PhotoStorage profileRemoteDataSource = sl.get<PhotoStorage>();
  final NamesStorage namesStorage = sl.get<NamesStorage>();
  @override
  Future<Either<Failure, String>> getAvatar() async {
    try {
      final response = await profileRemoteDataSource.getPhotoPath();
      if (response != null) {
        return Right(response);
      } else {
        throw InvalidDataFailure(message: 'фото аватара не найдено');
      }
    } on InvalidDataFailure catch (error) {
      return Left(InvalidDataFailure(message: error.message));
    }
  }

  @override
  Future<Either<Failure, void>> setAvatar(String? url) async {
    try {
      final response = await profileRemoteDataSource.savePhotoPath(url);
      return Right(response);
    } on InvalidDataFailure catch (error) {
      return Left(InvalidDataFailure(message: error.message));
    }
  }

  @override
  Future<Either<Failure, String>> getNameUser() async {
    try {
      final response = await namesStorage.getNameUser();
      if (response != null) {
        return Right(response);
      } else {
        throw InvalidDataFailure(message: 'фото аватара не найдено');
      }
    } on InvalidDataFailure catch (error) {
      return Left(InvalidDataFailure(message: error.message));
    }
  }

  @override
  Future<Either<Failure, void>> setNameUser(String? url) async {
    try {
      final response = await namesStorage.saveNameUser(url);
      return Right(response);
    } on InvalidDataFailure catch (error) {
      return Left(InvalidDataFailure(message: error.message));
    }
  }

  @override
  Future<Either<Failure, String>> getFemaleUser() async {
    try {
      final response = await namesStorage.getFemaleUser();
      if (response != null) {
        return Right(response);
      } else {
        throw InvalidDataFailure(message: 'фото аватара не найдено');
      }
    } on InvalidDataFailure catch (error) {
      return Left(InvalidDataFailure(message: error.message));
    }
  }

  @override
  Future<Either<Failure, void>> setFemaleUser(String? url) async {
    try {
      final response = await namesStorage.saveFemaleUser(url);
      return Right(response);
    } on InvalidDataFailure catch (error) {
      return Left(InvalidDataFailure(message: error.message));
    }
  }
}
