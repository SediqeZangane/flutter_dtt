import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dtt/core/utils/dimens.dart';
import 'package:flutter_dtt/cubit/cubit_navigation_bar.dart';
import 'package:flutter_dtt/detail/presentation/detail_screen.dart';
import 'package:flutter_dtt/home/application/home_bloc.dart';
import 'package:flutter_dtt/home/application/home_event.dart';
import 'package:flutter_dtt/home/application/home_state.dart';
import 'package:flutter_dtt/home/domain/model/house_info.dart';
import 'package:flutter_dtt/home/presentation/widget/home_empty_list.dart';
import 'package:flutter_dtt/home/presentation/widget/home_row_card.dart';
import 'package:flutter_dtt/information/presentation/information_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      context.read<HomeBloc>().add(SearchHomeEvent(textEditingController.text));
    });
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return BlocProvider<CubitNavigationBar>(
          create: (context) {
            return CubitNavigationBar();
          },
          child: BlocBuilder<CubitNavigationBar, CubitState>(
            builder: (context, cubitState) {
              return Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/icons/ic_home.svg',
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.surfaceVariant,
                            BlendMode.srcIn,
                          ),
                        ),
                        label: 'home',
                        activeIcon: SvgPicture.asset(
                          'assets/icons/ic_home.svg',
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.onSurface,
                            BlendMode.srcIn,
                          ),
                        )),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/icons/ic_info.svg',
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.surfaceVariant,
                            BlendMode.srcIn,
                          ),
                        ),
                        label: 'about',
                        activeIcon: SvgPicture.asset(
                          'assets/icons/ic_info.svg',
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.onSurface,
                            BlendMode.srcIn,
                          ),
                        )),
                  ],
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  onTap: (value) {
                    return context
                        .read<CubitNavigationBar>()
                        .onItemTapped(value);
                  },
                  currentIndex: cubitState.index,
                ),
                backgroundColor: Theme.of(context).colorScheme.background,
                body: cubitState.index == 0
                    ? _buildHome(state)
                    : const InformationScreen(),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildHome(HomeState state) {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.large,
          vertical: Dimens.small,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Dimens.homeRowSpace),
            Text('DTT REAL ESTATE',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: Dimens.homeRowSpace),
            TextField(
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: () {
                    textEditingController.clear();
                  },
                  child: Icon(
                    state.isSearching ? Icons.clear : Icons.search,
                    color: Theme.of(context).colorScheme.surfaceTint,
                  ),
                ),
                hintText: 'Search for a home',
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.w400),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(Dimens.small)),
                  borderSide: BorderSide.none,
                ),
                isDense: true,
                contentPadding: const EdgeInsets.all(Dimens.smallX),
              ),
              controller: textEditingController,
            ),
            const SizedBox(height: Dimens.smallXX),
            Expanded(
                child: state.isLoad
                    ? _buildLoading()
                    : state.listHouse.isEmpty
                        ? _buildEmpty()
                        : _buildList(state.listHouse)),
          ],
        ),
      );
    });
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildList(List<HouseInfo> listHouse) {
    return ListView.builder(
      padding: EdgeInsets.zero.copyWith(top: Dimens.smallX),
      itemBuilder: (context, index) {
        return InkWell(
          child: HomeRowCard(houseInfo: listHouse[index]),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return DetailScreen(houseInfo: listHouse[index]);
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
