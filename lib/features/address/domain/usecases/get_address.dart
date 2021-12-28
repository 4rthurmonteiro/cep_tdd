import 'package:cep_tdd/core/errors/failure.dart';
import 'package:cep_tdd/core/usecases/usecase.dart';
import 'package:cep_tdd/features/address/domain/entities/address.dart';
import 'package:cep_tdd/features/address/domain/repositories/address_repository.dart';
import 'package:dartz/dartz.dart';

class GetAddress implements UseCase<Address, String> {
  final AddressRepository addressRepository;

  const GetAddress({
    required this.addressRepository,
  });

  @override
  Future<Either<Failure, Address>> call(String params) =>
      addressRepository.getAddress(
        cep: params,
      );
}
