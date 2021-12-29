import 'package:cep_tdd/core/errors/expections.dart';
import 'package:cep_tdd/features/address/data/models/address_model.dart';
import 'package:dio/dio.dart';

abstract class AddressRemoteDataSource {
  Future<AddressModel> getAddress({required String cep});
}

class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  final Dio httpClient;

  const AddressRemoteDataSourceImpl({
    required this.httpClient,
  });

  @override
  Future<AddressModel> getAddress({required String cep}) async {
    try {
      final response =
          await httpClient.get('http://viacep.com.br/ws/$cep/json/');

      return AddressModel.fromJson(response.data);
    } on DioError catch (e) {
      print('Dio Error $e');

      if (e.response?.statusCode == 400) {
        throw BadRequestException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      print('Error $e');
      throw GenericException();
    }
  }
}
