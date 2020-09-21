import 'package:covid_19/screens/home.dart';
import 'package:covid_19/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final HomeViewModel _homeViewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      body: Home(data: _homeViewModel.data),
    );
  }
}