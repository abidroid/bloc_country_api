part of 'country_bloc.dart';

sealed class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

final class CountryInitial extends CountryState {}

class CountryLoadingState extends CountryState {}

class CountryLoadedState extends CountryState {
  final List<CountryModel> countries;

  const CountryLoadedState({required this.countries});

  @override
  List<Object> get props => [countries];
}

class CountryErrorState extends CountryState {}
