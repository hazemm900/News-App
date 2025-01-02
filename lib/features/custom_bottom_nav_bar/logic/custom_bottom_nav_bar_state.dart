part of 'custom_bottom_nav_bar_cubit.dart';

@immutable
sealed class BottomNavBarState {}

final class BottomNavBarInitial extends BottomNavBarState {}

final class ChangeCurrentIndex extends BottomNavBarState {}
