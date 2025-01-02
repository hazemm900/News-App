import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/screens/business_news_screen.dart';
import 'package:news_app/features/news/screens/science_news_screen.dart';
import 'package:news_app/features/news/screens/sports_news_screen.dart';

part 'custom_bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());

  static BottomNavBarCubit get(context) => BlocProvider.of(context);


  List<Widget> screens = [
    const BusinessNewsScreen(),
    const SportsNewsScreen(),
    const ScienceNewsScreen()
  ];

  int currentIndex = 0;

  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeCurrentIndex());
  }
}
