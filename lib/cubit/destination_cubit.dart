import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app/models/destination_model.dart';
import 'package:travel_app/services/destination_service.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  // Note: Fetch destinations
  void fetchDestinations() async {
    try {
      // Note: Change state to loading
      emit(DestinationLoading());

      // Note: Fetch destinations
      List<DestinationModel> destinations =
          await DestinationService().fetchDestinations();

      // Note: Change state to success
      emit(DestinationSuccess(destinations));
    } catch (e) {
      // Note: Change state to failed
      emit(DestinationFailed(e.toString()));
    }
  }
}
