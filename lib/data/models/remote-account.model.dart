import 'package:minhascontas/data/http/http-error.dart';
import 'package:minhascontas/domain/entities/account.entity.dart';

class RemoteAccountModel {
  final String accessToken;

  RemoteAccountModel(this.accessToken);

  factory RemoteAccountModel.fromJson(Map json) {
    if (!json.containsKey('accessToken')) {
      throw HttpError.invalidData;
    }

    return RemoteAccountModel(json ['accessToken']);
  }

  AccountEntity toEntity() => AccountEntity(accessToken);
}