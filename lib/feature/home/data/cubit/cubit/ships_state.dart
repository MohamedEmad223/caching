part of 'ships_cubit.dart';

@immutable
sealed class ShipsState {}

final class ShipsInitial extends ShipsState {}

final class ShipsLoading extends ShipsState {}

final class LoadingMoreShips extends ShipsState {}

final class ShipsSuccess extends ShipsState {
  final List<ShipsModel> shipsData;

  ShipsSuccess({required this.shipsData});
}

final class NoMoreShips extends ShipsState {
  final List<ShipsModel> shipsData;

  NoMoreShips({required this.shipsData});
}

final class ShipsFailure extends ShipsState {
  final String errorMessage;

  ShipsFailure({required this.errorMessage});
}
