import 'package:digitalsobolgroup/common/types/failures.dart';
import 'package:digitalsobolgroup/common/types/usecase.dart';
import 'package:digitalsobolgroup/feature/main/profile/domain/repositories/avatar_repostoiry.dart';
import 'package:digitalsobolgroup/injection.dart';
import 'package:dartz/dartz.dart';

class GetNameUserUsecase extends UseCase<String, NoParams> {
  final ProfileRepository repository = sl.get<ProfileRepository>();

  GetNameUserUsecase();

  @override
  Future<Either<Failure, String>> call([NoParams? params]) async {
    try {
      return await repository.getNameUser();
    } on InvalidDataFailure catch (e) {
      return Left(InvalidDataFailure(
        message: e.message,
      ));
    }
  }
}

class GetFemaleUserUsecase extends UseCase<String, NoParams> {
  final ProfileRepository repository = sl.get<ProfileRepository>();

  GetFemaleUserUsecase();

  @override
  Future<Either<Failure, String>> call([NoParams? params]) async {
    try {
      return await repository.getFemaleUser();
    } on InvalidDataFailure catch (e) {
      return Left(InvalidDataFailure(
        message: e.message,
      ));
    }
  }
}

class SaveNameUserUsecase extends UseCase<void, String> {
  final ProfileRepository repository = sl.get<ProfileRepository>();

  SaveNameUserUsecase();

  @override
  Future<Either<Failure, void>> call([String? params]) async {
    try {
      return await repository.setNameUser(params);
    } on InvalidDataFailure catch (e) {
      return Left(InvalidDataFailure(
        message: e.message,
      ));
    }
  }
}

class SaveFemaleUserUsecase extends UseCase<void, String> {
  final ProfileRepository repository = sl.get<ProfileRepository>();

  SaveFemaleUserUsecase();

  @override
  Future<Either<Failure, void>> call([String? params]) async {
    try {
      return await repository.setFemaleUser(params);
    } on InvalidDataFailure catch (e) {
      return Left(InvalidDataFailure(
        message: e.message,
      ));
    }
  }
}
