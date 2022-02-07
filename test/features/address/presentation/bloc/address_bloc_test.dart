import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:cep_tdd/core/errors/failure.dart';
import 'package:cep_tdd/features/address/domain/entities/address.dart';
import 'package:cep_tdd/features/address/domain/usecases/get_address.dart';
import 'package:cep_tdd/features/address/presentation/bloc/address_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetAddress extends Mock implements GetAddress {}

void main() {
  final mockGetAddress = MockGetAddress();
  const tCep = '';
  late AddressBloc addressBloc;

  setUp(() {
    addressBloc = AddressBloc(mockGetAddress);
  });

  setUpAll(() {
    when(() => mockGetAddress.call(tCep)).thenAnswer(
      (invocation) => Future.value(
        const Right(
          Address(
            cep: tCep,
            publicPlace: '',
            complement: 'complement',
            district: 'district',
            uf: 'uf',
            ibge: 'ibge',
            ddd: 'ddd',
          ),
        ),
      ),
    );
  });

  tearDown(() {
    addressBloc.close();
  });

  test('check inital state', () {
    expect(addressBloc.state, AddressInitial());
  });

  // test('check  state success', () {
  //   addressBloc.add(const GetAddressEvent(tCep));

  //   expect(addressBloc.state, AddressLoaded());
  // });

  blocTest<AddressBloc, AddressState>(
    'emits [AddressLoading, AddressLoaded] when nothing is added',
    build: () => addressBloc,
    act: (bloc) => bloc.add(const GetAddressEvent(tCep)),
    expect: () => [isA<AddressLoading>(), isA<AddressLoaded>()],
  );

  blocTest<AddressBloc, AddressState>(
    'emits [AddressLoading, AddressLoaded] when nothing is added',
    build: () => addressBloc,
    setUp: () {
      when(() => mockGetAddress.call(tCep)).thenAnswer(
        (invocation) => Future.value(
          Left(ServerFailure()),
        ),
      );
    },
    act: (bloc) => bloc.add(const GetAddressEvent(tCep)),
    expect: () => [isA<AddressLoading>(), isA<AddressError>()],
  );

  // blocTest(
  //   'emits [1] when CounterIncrementPressed is added',
  //   build: () => CounterBloc(),
  //   act: (bloc) => bloc.add(CounterIncrementPressed()),
  //   expect: () => [1],
  // );
}
