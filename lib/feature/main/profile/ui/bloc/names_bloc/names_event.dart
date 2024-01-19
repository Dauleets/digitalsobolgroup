part of 'names_bloc.dart';

sealed class NamesProfileEvent extends Equatable {
  const NamesProfileEvent();

  @override
  List<Object> get props => [];
}

class GetNameEvent extends NamesProfileEvent {}

class SaveNameEvent extends NamesProfileEvent {
  final String? name;

  const SaveNameEvent({required this.name});
}

class GetFemaleEvent extends NamesProfileEvent {}

class SaveFemaleEvent extends NamesProfileEvent {
  final String? female;

  const SaveFemaleEvent({required this.female});
}
