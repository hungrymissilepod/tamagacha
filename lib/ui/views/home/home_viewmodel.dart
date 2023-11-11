import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/*
TODO:
- display pedometer data on screen
- Fix bug with deleting a pet. It currently deletes all duplicate pets
- Show dialog when user gets a new pet. Allow user to name pet and save it's given name
- give user coins based on number of steps taken
- user can give pet food to a pet
- pets can gain EXP and level up
- users need to scan a QR code in order to get a pet (can skip this in DEV mode)
- add sound effects to; spinning the wheel, landing on an item, pet levels up, etc.

IMPROVEMENTS:
- Add refresh button to refetch user step data
- Add debouncer to fetch user step data every 30 seconds
- Add listener for when app is foregrounded, then fetch user step data
*/

class HomeViewModel extends BaseViewModel {
  final PageController pageController = PageController(initialPage: 0);

  int selectedPage = 0;

  void onPageChanged(int index) {
    selectedPage = index;
    rebuildUi();
  }

  void onBottomNavBarTapped(int value) {
    if ((selectedPage - value).abs() > 1) {
      _jumpToPage(value);
    } else {
      _animateToPage(value);
    }
  }

  void _animateToPage(int value) {
    selectedPage = value;
    pageController.animateToPage(
      value,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeIn,
    );
    rebuildUi();
  }

  void _jumpToPage(int value) {
    selectedPage = value;
    pageController.jumpToPage(value);
    rebuildUi();
  }
}
