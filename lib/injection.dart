import 'package:digitalsobolgroup/feature/main/profile/data/datasoruce/names/avatar_datasource.dart';
import 'package:digitalsobolgroup/feature/main/profile/data/datasoruce/names/avatar_datasource_impl.dart';
import 'package:digitalsobolgroup/feature/main/profile/data/datasoruce/photo/avatar_datasource.dart';
import 'package:digitalsobolgroup/feature/main/profile/data/datasoruce/photo/avatar_datasource_impl.dart';
import 'package:digitalsobolgroup/feature/main/profile/data/repository/avatar_repository_impl.dart';
import 'package:digitalsobolgroup/feature/main/profile/domain/repositories/avatar_repostoiry.dart';
import 'package:digitalsobolgroup/feature/main/profile/domain/usecase/avatar_usecase.dart';
import 'package:digitalsobolgroup/feature/main/profile/domain/usecase/names_usecase.dart';
import 'package:digitalsobolgroup/feature/main/profile/ui/bloc/names_bloc/names_bloc.dart';
import 'package:digitalsobolgroup/feature/main/profile/ui/bloc/photo_bloc/photo_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //profile:
  sl.registerLazySingleton<PhotoStorage>(() => PhotoStorageImpl());
  sl.registerLazySingleton<NamesStorage>(() => NamesStorageImpl());
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl());
  sl.registerLazySingleton(() => SavePhotoAvatarUsecase());
  sl.registerLazySingleton(() => GetPhotoAvatarUsecase());
  sl.registerLazySingleton(() => GetNameUserUsecase());
  sl.registerLazySingleton(() => SaveNameUserUsecase());
  sl.registerLazySingleton(() => GetFemaleUserUsecase());
  sl.registerLazySingleton(() => SaveFemaleUserUsecase());
  sl.registerLazySingleton(() => PhotoProfileBloc());
  sl.registerLazySingleton(() => NamesProfileBloc());
}
