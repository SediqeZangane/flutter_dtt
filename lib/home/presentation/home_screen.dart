import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dtt/detail/presentation/detail_screen.dart';
import 'package:flutter_dtt/home/application/home_bloc.dart';
import 'package:flutter_dtt/home/application/home_event.dart';
import 'package:flutter_dtt/home/application/home_state.dart';
import 'package:flutter_dtt/home/domain/model/house_model.dart';
import 'package:flutter_dtt/home/presentation/widget/home_empty_list.dart';
import 'package:flutter_dtt/home/presentation/widget/home_row_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text('DTT REAL ESTATE',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 50),
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.surfaceTint,
                    ),
                    hintText: 'Search for a home',
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (String searchText) =>
                      context.read<HomeBloc>().add(SearchHomeEvent(searchText)),
                ),
                Expanded(
                    child: state.isLoad
                        ? _buildLoading()
                        : state.listHouse.isEmpty
                            ? _buildEmpty()
                            : _buildList(state.listHouse)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildList(List<HouseModel> listHouse) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return InkWell(
          child: HomeRowCard(houseModel: listHouse[index]),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return DetailScreen(houseModel: listHouse[index]);
              },
            ));
          },
        );
      },
      itemCount: listHouse.length,
    );
  }

  Widget _buildEmpty() {
    return const HomeEmptyList();
  }
}
