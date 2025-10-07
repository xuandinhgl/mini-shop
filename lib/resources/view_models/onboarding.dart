import 'package:provider/provider.dart';

class OnboardingModel {
  bool visited;

  OnboardingModel({this.visited = false});

  void setIsFirst(bool value) {
    visited = value;
  }
}
