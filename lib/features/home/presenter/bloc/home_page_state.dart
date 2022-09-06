part of 'home_page_bloc.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.initial() = _Initial;
  const factory HomePageState.loading() = LoadingState;
  const factory HomePageState.loaded({required PostCodeEntity postCodeEntity}) =
      LoadedState;
  const factory HomePageState.error(String error) = ErrorState;
}
