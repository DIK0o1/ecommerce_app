import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../tabs/favorite_tab/favorite_tab.dart';
import '../../tabs/home_tab/home_tab.dart';
import '../../tabs/product_list_tab/product_list_tab.dart';
import '../../tabs/profile_tab/profile_tab.dart';

part 'home_screen_view_model_state.dart';

class HomeScreenViewModelCubit extends Cubit<HomeScreenViewModelState> {
  HomeScreenViewModelCubit() : super(HomeScreenViewModelInitial());

  // todo: handelData ----handelLogic

  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    ProductListTab(),
    FavoriteTab(),
    ProfileTab()
  ];
  void changeTabs(int newSelectedIndex){
    emit(HomeScreenViewModelInitial());
    selectedIndex = newSelectedIndex;
    emit(ChangeBottomNavigationBarState());
  }
}
