import 'package:cep_tdd/core/errors/failure.dart';
import 'package:cep_tdd/features/address/domain/entities/address.dart';
import 'package:dartz/dartz.dart';

abstract class AddressRepository {
  Future<Either<Failure, Address>> getAddress({
    required String cep,
  });
}
