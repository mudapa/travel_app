import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app/models/transaction_model.dart';
import 'package:travel_app/services/transaction_service.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  // Note: Create Transaction
  void createTransaction(TransactionModel transaction) async {
    try {
      emit(TransactionLoading());

      await TransactionService().createTransaction(transaction);

      emit(const TransactionSuccess([]));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  // Note: Fetch Transactions
  void fetchTransactions() async {
    try {
      // Note: Change state to loading
      emit(TransactionLoading());

      // Note: Fetch Transactions
      List<TransactionModel> transactions =
          await TransactionService().fetchTransactions();

      // Note: Change state to success
      emit(TransactionSuccess(transactions));
    } catch (e) {
      // Note: Change state to failed
      emit(TransactionFailed(e.toString()));
    }
  }
}
