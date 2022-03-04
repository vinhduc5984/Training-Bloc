import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen_bloc/src/bloc/contract_bloc.dart/contract_bloc_event.dart';
import 'package:login_screen_bloc/src/bloc/contract_bloc.dart/contract_bloc_state.dart';
import 'package:login_screen_bloc/src/repositories/contract_repository.dart';

class ContractBloc extends Bloc<ContractEvent, ContractState> {
  final ContractRepository contractRepository;
  ContractBloc(ContractState initialState, this.contractRepository)
      : super(initialState);
  @override
  Stream<ContractState> mapEventToState(ContractEvent event) async* {
    if (event is LoadContract) {
      yield ContractLoading();
      var response = await contractRepository.getDataContract(event.param);
      if (response!.result.length == 0)
        yield EndPageLoad();
      else {
        yield ContractLoaded(contracts: response.result);
      }
    }
  }
}
