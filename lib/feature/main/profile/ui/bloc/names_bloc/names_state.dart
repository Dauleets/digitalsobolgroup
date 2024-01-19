part of 'names_bloc.dart';

sealed class NamesProfileState extends Equatable {
  const NamesProfileState();

  @override
  List<Object> get props => [];
}

final class NamesProfileInitial extends NamesProfileState {}

final class NamesProfileLoading extends NamesProfileState {}

final class NamesProfileError extends NamesProfileState {
  final Failure failure;

  const NamesProfileError({required this.failure});
}

final class GetNameLoaded extends NamesProfileState {
  final String name;

  const GetNameLoaded({required this.name});
}

final class SaveNameLoaded extends NamesProfileState {}

final class GetFemamleLoaded extends NamesProfileState {
  final String female;

  const GetFemamleLoaded({required this.female});
}

final class SaveFemaleLoaded extends NamesProfileState {}
