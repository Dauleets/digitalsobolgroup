part of 'photo_bloc.dart';

sealed class PhotoProfileEvent extends Equatable {
  const PhotoProfileEvent();

  @override
  List<Object> get props => [];
}

class GetAvatarEvent extends PhotoProfileEvent {}

class SaveAvatarEvent extends PhotoProfileEvent {
  final String? path;

  const SaveAvatarEvent({required this.path});
}
