import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

class HttpAdapter {
  final Client client;

  HttpAdapter(this.client);

  Future<void> request({
    required Uri uri,
    required String method
  }) async {
    await client.post(uri);
  }
}

class ClientSpy extends Mock implements Client {}

void main() {
  group('post', () {
    test('Should call post with correct values', () async {
      final client = ClientSpy();
      final sut = HttpAdapter(client);
      final uri = Uri.parse(faker.internet.httpUrl());

      await sut.request(uri: uri, method: 'post');

      verify(client.post(uri));
    });
  });
}