import 'package:aezakmi/common/types/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, String>> getAvatar();
  Future<Either<Failure, void>> setAvatar(String? url);
  Future<Either<Failure, String>> getNameUser();
  Future<Either<Failure, void>> setNameUser(String? url);
  Future<Either<Failure, String>> getFemaleUser();
  Future<Either<Failure, void>> setFemaleUser(String? url);
}
