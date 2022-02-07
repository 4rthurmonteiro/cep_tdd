import 'package:bloc/bloc.dart';
import 'package:cep_tdd/features/address/domain/usecases/get_address.dart';
import 'package:equatable/equatable.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final GetAddress getAddress;
  AddressCubit(this.getAddress) : super(AddressInitial());

  Future<void> requestAddressInfo(String cep) async {
    emit(AddressLoading());

    final result = await getAddress(cep);

    emit(
      result.fold(
        (l) => AddressError(),
        (r) => AddressLoaded(),
      ),
    );
  }
}
