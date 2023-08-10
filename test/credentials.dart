import 'package:trustchain_dart/src/credentials/credential.dart';
import 'package:test/test.dart';

void credentialsTest () {
  group('CredentialModel', () {
    test('.toMap() encodes to map', () {
      final credential = CredentialModel(
          id: 'uuid', alias: null, image: 'image', data: {'issuer': 'did:...'});
      final m = credential.toMap();

      expect(
          m,
          equals({
            'id': 'uuid',
            'alias': null,
            'image': 'image',
            'data': {'issuer': 'did:...'}
          }));
    });

    test('.fromMap() with only data field should generate an id', () {
      final m = {
        'data': {'issuer': 'did:...'}
      };
      final credential = CredentialModel.fromMap(m);
      expect(credential.id, isNotEmpty);
      expect(credential.data, equals(m['data']));
    });

    test('.fromMap() with id should not generate a new id', () {
      final m = {
        'id': 'uuid',
        'data': {'issuer': 'did:...'}
      };
      final credential = CredentialModel.fromMap(m);
      expect(credential.id, equals('uuid'));
    });
  });
}
