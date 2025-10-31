import 'package:film_app/feature/home/data/models/ships_model.dart';
import 'package:film_app/feature/home/data/repo/ship_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ships_state.dart';

class ShipsCubit extends Cubit<ShipsState> {
  ShipsCubit(this.shipsRepo) : super(ShipsInitial());

  final ShipsRepo shipsRepo;
  final List<ShipsModel> allShips = [];
  int page = 1;
  bool hasMore = true; 

  static ShipsCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> fetchAllShips(String path) async {
    if (!hasMore) return;

    if (page == 1) {
      emit(ShipsLoading());
    } else {
      emit(LoadingMoreShips());
    }

    final result = await shipsRepo.fetchAllShips(path, page: page);

    result.fold(
      (failure) {
        emit(ShipsFailure(errorMessage: failure.errorMessage));
      },
      (shipsModel) {
        final newShips = shipsModel.ships ?? [];

        allShips.addAll(newShips);

        hasMore = shipsModel.hasNextPage ?? false;

        page++;

        if (!hasMore) {
          emit(NoMoreShips(shipsData: List.from(allShips)));
        } else {
          emit(ShipsSuccess(shipsData: List.from(allShips)));
        }
      },
    );
  }

  Future<void> refreshShips(String path) async {
    page = 1;
    hasMore = true;
    allShips.clear();
    await fetchAllShips(path);
  }
}
