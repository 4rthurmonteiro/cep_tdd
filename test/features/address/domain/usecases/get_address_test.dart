import 'package:cep_tdd/core/errors/failure.dart';
import 'package:cep_tdd/features/address/domain/entities/address.dart';
import 'package:cep_tdd/features/address/domain/repositories/address_repository.dart';
import 'package:cep_tdd/features/address/domain/usecases/get_address.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAddressRepository extends Mock implements AddressRepository {}

void main() {
  late final MockAddressRepository mockAddressRepository;
  late final GetAddress getAddress;

  const tCep = '57020070';
  const tPublicPlace = 'Teste';
  const tComplement = '';
  const tDistrict = '';
  const tUf = 'AL';
  const tIbge = '';
  const tDDD = '82';

  const tAddressOne = Address(
    cep: tCep,
    publicPlace: tPublicPlace,
    complement: tComplement,
    district: tDistrict,
    uf: tUf,
    ibge: tIbge,
    ddd: tDDD,
  );

  setUpAll(
    () {
      mockAddressRepository = MockAddressRepository();
      getAddress = GetAddress(
        addressRepository: mockAddressRepository,
      );
    },
  );

  test(
    'should return an address when is called with success',
    () async {
      when(() => mockAddressRepository.getAddress(cep: tCep)).thenAnswer(
        (_) async => const Right(
          tAddressOne,
        ),
      );

      final failureOrResult = await getAddress.call(tCep);

      expect(failureOrResult.isRight(), isTrue);
    },
  );

  test(
    'should return a failure when is called with error',
    () async {
      when(() => mockAddressRepository.getAddress(cep: tCep)).thenAnswer(
        (_) async => Left(
          ServerFailure(),
        ),
      );

      final failureOrResult = await getAddress.call(tCep);

      expect(failureOrResult.isLeft(), isTrue);
    },
  );
}
