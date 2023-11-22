import 'package:bloc_country_api/blocs/country/country_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  @override
  void initState() {
    BlocProvider.of<CountryBloc>(context).add(LoadCountryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country List'),
      ),
      body: BlocBuilder<CountryBloc, CountryState>(
        builder: (context, state) {
          if (state is CountryLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is CountryLoadedState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                  itemCount: state.countries.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 80,
                            child: SvgPicture.network(
                              state.countries[index].flag!,
                            ),
                          ),
                          const SizedBox(width: 16,),
                          Text(state.countries[index].name!),
                        ],
                      ),
                    );
                  }),
            );
          }

          if (state is CountryErrorState) {
            return const Center(child: Text('Something went wrong'));
          }

          return Container();
        },
      ),
    );
  }
}
