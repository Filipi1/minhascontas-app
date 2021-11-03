import 'package:minhascontas/domain/helpers/domain-error.helper.dart';
import 'package:minhascontas/domain/usecases/usecases.dart';
import 'package:minhascontas/data/http/http.dart';
import 'package:minhascontas/data/usecases/remote-authentication.usecase.dart';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  late RemoteAuthentication sut;
  late HttpClientSpy httpClient;
  late String url;
  late AuthenticationParams authenticationParams;

  Map mockValidData() => {'accessToken': faker.guid.guid(), 'name': faker.person.name()};

  PostExpectation mockRequest() =>  when(httpClient.request(url: url, method: "post", body: {
    'email': authenticationParams.email,
    'password': authenticationParams.password
  }));

  void mockHttpData(Map data) {
    mockRequest().thenAnswer((_) async => data);
  }

  void mockHttpError(HttpError error) {
    mockRequest().thenThrow(error);
  }

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
    authenticationParams = AuthenticationParams(
        email: faker.internet.email(), password: faker.internet.password());

    mockHttpData(mockValidData());
  });

  test("Should call HttpClient with correct URL", () async {
    await sut.auth(authenticationParams);
    verify(httpClient.request(url: url, method: 'post', body: {
      'email': authenticationParams.email,
      'password': authenticationParams.password
    }));
  });

  test("Should throw UnexpectedError if HttpClient returns 400", () async {
    mockHttpError(HttpError.badRequest);
    final future = sut.auth(authenticationParams);
    expect(future, throwsA(DomainError.unexpected));
  });

  test("Should throw UnexpectedError if HttpClient returns 404", () async {
    mockHttpError(HttpError.notFound);
    final future = sut.auth(authenticationParams);
    expect(future, throwsA(DomainError.unexpected));
  });

  test("Should throw UnexpectedError if HttpClient returns 500", () async {
    mockHttpError(HttpError.serverError);
    final future = sut.auth(authenticationParams);
    expect(future, throwsA(DomainError.unexpected));
  });

  test("Should throw InvalidCredentialsError if HttpClient returns 401", () async {
    mockHttpError(HttpError.unauthorized);
    final future = sut.auth(authenticationParams);
    expect(future, throwsA(DomainError.invalidCredentials));
  });

  test("Should return an Account if HttpClient returns 200", () async {
    final validData = mockValidData();
    mockHttpData(validData);
    final account = await sut.auth(authenticationParams);

    expect(account.token, validData['accessToken']);
  });

  test("Should throw UnexpectedError if HttpClient returns 200 with invalid data", () async {
    mockHttpData({ 'invalid_key' : 'invalid_data' });
    final future = sut.auth(authenticationParams);
    expect(future, throwsA(DomainError.unexpected));
  });
}
