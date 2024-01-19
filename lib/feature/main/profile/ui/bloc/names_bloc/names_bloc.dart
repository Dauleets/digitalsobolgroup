import 'package:aezakmi/feature/main/profile/domain/usecase/names_usecase.dart';
import 'package:equatable/equatable.dart';

import 'package:aezakmi/common/types/failures.dart';
import 'package:aezakmi/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'names_event.dart';
part 'names_state.dart';

class NamesProfileBloc extends Bloc<NamesProfileEvent, NamesProfileState> {
  final GetNameUserUsecase getNameUserUsecase = sl.get<GetNameUserUsecase>();
  final SaveNameUserUsecase saveNameUserUsecase = sl.get<SaveNameUserUsecase>();
  final GetFemaleUserUsecase getFemaleUserUsecase =
      sl.get<GetFemaleUserUsecase>();
  final SaveFemaleUserUsecase saveFemaleUserUsecase =
      sl.get<SaveFemaleUserUsecase>();
  NamesProfileBloc() : super(NamesProfileInitial()) {
    on<GetNameEvent>((event, emit) async {
      emit(NamesProfileInitial());
      final response = await getNameUserUsecase.call();
      response.fold(
        (failure) => emit(NamesProfileError(failure: failure)),
        (ok) => emit(GetNameLoaded(name: ok)),
      );
    });
    on<SaveNameEvent>((event, emit) async {
      emit(NamesProfileInitial());
      final response = await saveNameUserUsecase.call(event.name);
      response.fold(
        (failure) => emit(NamesProfileError(failure: failure)),
        (ok) => emit(SaveNameLoaded()),
      );
    });
    on<GetFemaleEvent>((event, emit) async {
      emit(NamesProfileInitial());
      final response = await getFemaleUserUsecase.call();
      response.fold(
        (failure) => emit(NamesProfileError(failure: failure)),
        (ok) => emit(GetFemamleLoaded(female: ok)),
      );
    });
    on<SaveFemaleEvent>((event, emit) async {
      emit(NamesProfileInitial());
      final response = await saveFemaleUserUsecase.call(event.female);
      response.fold(
        (failure) => emit(NamesProfileError(failure: failure)),
        (ok) => emit(SaveFemaleLoaded()),
      );
    });
  }
}
