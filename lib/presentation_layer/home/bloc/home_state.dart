part of 'home_bloc.dart';


@freezed
class HomeUpdateState with _$HomeUpdateState {
  const factory HomeUpdateState({
    required int counter,
    required List<String> transcripts,
    required bool isError,
    required String errorMessage

  }) = _HomeUpdateState;

  factory HomeUpdateState.initial() => const HomeUpdateState(
    counter: 0,
      transcripts: [],
      isError: false,
    errorMessage: ""
   );
}
