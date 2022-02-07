import 'package:cep_tdd/core/errors/expections.dart';
import 'package:cep_tdd/features/address/data/datasources/address_remote_datasource.dart';
import 'package:cep_tdd/features/address/domain/entities/address.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late AddressRemoteDataSource addressRemoteDataSource;
  late MockDio mockDio;
  setUp(
    () {
      mockDio = MockDio();
      addressRemoteDataSource = AddressRemoteDataSourceImpl(
        httpClient: mockDio,
      );
    },
  );
  group(
    'getAddress',
    () {
      const tCep = '57020070';
      const tPublicPlace = 'Teste';
      const tComplement = '';
      const tDistrict = '';
      const tUf = 'AL';
      const tIbge = '';
      const tDDD = '82';

      const tAddress = Address(
        cep: tCep,
        publicPlace: tPublicPlace,
        complement: tComplement,
        district: tDistrict,
        uf: tUf,
        ibge: tIbge,
        ddd: tDDD,
      );

      const tData = {
        "cep": "57020-070",
        "logradouro": "Rua do Sol",
        "complemento": "",
        "bairro": "Centro",
        "localidade": "Maceió",
        "uf": "AL",
        "ibge": "2704302",
        "gia": "",
        "ddd": "82",
        "siafi": "2785"
      };

      test(
        'should get address model when called',
        () async {
          when(
            () => mockDio.get(
              'http://viacep.com.br/ws/$tCep/json/',
            ),
          ).thenAnswer((_) async => Response(
                data: tData,
                requestOptions: RequestOptions(
                  path: '',
                ),
              ));

          final result = await addressRemoteDataSource.getAddress(cep: tCep);

          expect(result, isNotNull);
        },
      );

      test(
        'should throw bad request exception when called',
        () async {
          when(
            () => mockDio.get(
              'http://viacep.com.br/ws/$tCep/json/',
            ),
          ).thenThrow(
            DioError(
              response: Response(
                statusCode: 400,
                requestOptions: RequestOptions(
                  path: '',
                ),
              ),
              requestOptions: RequestOptions(
                path: '',
              ),
            ),
          );

          // final result = await addressRemoteDataSource.getAddress(cep: tCep);

          expect(() => addressRemoteDataSource.getAddress(cep: tCep),
              throwsA(isA<BadRequestException>()));

          // expect(result, isA<BadRequestException>());
        },
      );
    },
  );
}
