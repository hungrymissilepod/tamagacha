import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/*
TODO:
- Show dialog when user gets a new pet. Allow user to name pet and save it's given name
- user can give pet food to a pet
- pets can gain EXP and level up?
- pets hunger needs to decrease over a specified time (30 minutes?)
- need to keep track of last time pets hunger was checked. check again each 30 minutes and each time app is opened and foregrounded. just like how we check the steps
- users need to scan a QR code in order to get a pet (can skip this in DEV mode)
- add sound effects to; spinning the wheel, landing on an item, pet levels up, etc.
- if a pet's hunger reaches 0 they die. Show a dialog to user telling them that their pet died and remove their pet

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
