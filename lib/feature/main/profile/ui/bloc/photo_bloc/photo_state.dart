part of 'photo_bloc.dart';

sealed class PhotoProfileState extends Equatable {
  const PhotoProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends PhotoProfileState {}

final class ProfileLoading extends PhotoProfileState {}

final class ProfileError extends PhotoProfileState {
  final Failure failure;

  const ProfileError({required this.failure});
}

final class GetAvatarLoaded extends PhotoProfileState {
  final String avatar;

  const GetAvatarLoaded({required this.avatar});
}

final class SaveAvatarLoaded extends PhotoProfileState {}
