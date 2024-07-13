import 'package:sesac_ton/data/data_source/register_data_source/register_data_source.dart';
import 'package:sesac_ton/data/repository/register_repository/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterDataSource registerDataSource;

  RegisterRepositoryImpl(this.registerDataSource);

  @override
  Future<void> registerUser() => registerDataSource.testApi();
}