import 'package:equatable/equatable.dart';

import 'package:aezakmi/common/types/failures.dart';
import 'package:aezakmi/feature/main/profile/domain/usecase/avatar_usecase.dart';
import 'package:aezakmi/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoProfileBloc extends Bloc<PhotoProfileEvent, PhotoProfileState> {
  final GetPhotoAvatarUsecase getPhotoAvatarUsecase =
      sl.get<GetPhotoAvatarUsecase>();
  final SavePhotoAvatarUsecase savePhotoAvatarUsecase =
      sl.get<SavePhotoAvatarUsecase>();
  PhotoProfileBloc() : super(ProfileInitial()) {
    on<GetAvatarEvent>((event, emit) async {
      emit(ProfileLoading());
      final response = await getPhotoAvatarUsecase.call();
      response.fold(
        (failure) => emit(ProfileError(failure: failure)),
        (ok) => emit(GetAvatarLoaded(avatar: ok)),
      );
    });
    on<SaveAvatarEvent>((event, emit) async {
      emit(ProfileLoading());
      final response = await savePhotoAvatarUsecase.call(event.path);
      response.fold(
        (failure) => emit(ProfileError(failure: failure)),
        (ok) => emit(SaveAvatarLoaded()),
      );
    });
  }
}
