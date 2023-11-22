import 'package:bloc_country_api/models/country_model.dart';
import 'package:bloc_country_api/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CountryRepository _countryRepository;
  CountryBloc(this._countryRepository) : super(CountryInitial()) {
    on<LoadCountryEvent>((event, emit) async {
      emit(CountryLoadingState());

      try {
        final countries = await _countryRepository.getCountries();
        emit(CountryLoadedState(countries: countries));
      } catch (e, st) {
        print(e.toString());
        print(st.toString());
        emit(CountryErrorState());
      }
    });
  }
}
