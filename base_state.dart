import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'model_class/list_of_food_courts.dart';

@immutable
abstract class UserFoodCourtState extends Equatable {}
//data loading state
class UserLoadingState extends UserFoodCourtState {
  UserLoadingState();

  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserFoodCourtState {
  UserLoadedState(this.foodCourtList);
  final List<Foodcourt> foodCourtList;

  @override
  List<Object?> get props => [foodCourtList];
}

class UserErrorState extends UserFoodCourtState {
  UserErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
