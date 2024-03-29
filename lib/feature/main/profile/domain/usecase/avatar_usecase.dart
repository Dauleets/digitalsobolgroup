import 'package:digitalsobolgroup/common/types/failures.dart';
import 'package:digitalsobolgroup/common/types/usecase.dart';
import 'package:digitalsobolgroup/feature/main/profile/domain/repositories/avatar_repostoiry.dart';
import 'package:digitalsobolgroup/injection.dart';
import 'package:dartz/dartz.dart';

class SavePhotoAvatarUsecase extends UseCase<void, String> {
  final ProfileRepository repository = sl.get<ProfileRepository>();

  SavePhotoAvatarUsecase();

  @override
  Future<Either<Failure, void>> call([String? params]) async {
    try {
      return await repository.setAvatar(params);
    } on InvalidDataFailure catch (e) {
      return Left(InvalidDataFailure(
        message: e.message,
      ));
    }
  }
}

class GetPhotoAvatarUsecase extends UseCase<String, NoParams> {
  final ProfileRepository repository = sl.get<ProfileRepository>();

  GetPhotoAvatarUsecase();

  @override
  Future<Either<Failure, String>> call([NoParams? params]) async {
    try {
      return await repository.getAvatar();
    } on InvalidDataFailure catch (e) {
      return Left(InvalidDataFailure(
        message: e.message,
      ));
    }
  }
}
