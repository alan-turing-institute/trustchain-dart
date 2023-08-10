import 'dart:io';
import 'dart:convert';
import 'package:trustchain_dart/src/chain/chain.dart';
import 'package:trustchain_dart/src/did/did.dart';
import 'package:test/test.dart';

// import 'package:http/http.dart' as http;

final httpDidChainExample =
  jsonDecode(File('test/data/http_resolved_chain_example.json').readAsStringSync());

final didChainExample =
  jsonDecode(File('test/data/chain_example.json').readAsStringSync());

void chainTest() {
  group('DIDChainModel', () {
    test('.toMap() encodes a DIDChainModel to map', () {
      final didChain = DIDChainModel(didChain: [
        DIDModel(
            did: 'did:ion:test:...',
            endpoint: 'http://someendpoint.ac.uk',
            data: {'did': 'did:...'})
      ]);

      expect(
          didChain.toMap(),
          equals({
            'didChain': [
              {'did': 'did:...'}
            ]
          }));
    });

    test('.fromMap() should convert a DIDChainModel from map', () {
      final didChain = DIDChainModel.fromMap(httpDidChainExample);
      expect(didChain.didChain, isNotEmpty);
      expect(didChain.toMap(), equals(httpDidChainExample));
    });

    test('.fromDIDChain() should build a DIDChainModel from a serialized Rust DIDChain struct', () {
      final didChain = DIDChainModel.fromDIDChain(didChainExample);
      expect(didChain.didChain, isNotEmpty);
    });
  });

  // Uncomment to test querying a local didChain endpoint:
  // test('test that did chain from endpoint is valid map', () async {
  //   var url =
  //       'http://127.0.0.1:8081/did/chain/did:ion:test:EiAtHHKFJWAk5AsM3tgCut3OiBY4ekHTf66AAjoysXL65Q';
  //   var val = jsonDecode((await http.get(Uri.parse(url))).body);
  //   final didChainUrl = DIDChainModel.fromMap(val);
  //   final didChain = DIDChainModel.fromMap(DID_CHAIN_EXAMPLE);
  //   identical(didChainUrl, didChain);
  // });
}
