import 'package:bloc/bloc.dart';
import 'package:cep_tdd/features/address/domain/usecases/get_address.dart';
import 'package:equatable/equatable.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final GetAddress getAddress;
  AddressBloc(this.getAddress) : super(AddressInitial()) {
    on<GetAddressEvent>((event, emit) async {
      emit(AddressLoading());

      final result = await getAddress(
        event.cep,
      );

      emit(
        result.fold(
          (l) => AddressError(),
          (r) => AddressLoaded(),
        ),
      );
    });
  }
}
