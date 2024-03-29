import '../did/did.dart';

class DIDChainModel {
  final List<DIDModel> didChain;
  const DIDChainModel({
    required this.didChain,
  });
  // Assumed map is an HTTP API resolved DIDChain
  factory DIDChainModel.fromMap(Map<String, dynamic> data) {
    assert(data.containsKey('didChain'));
    return DIDChainModel(
      didChain:
          data['didChain']!.map<DIDModel>((m) => DIDModel.fromMap(m)).toList(),
    );
  }

  factory DIDChainModel.fromDIDChain(Map<String, dynamic> data) {
    assert(data.containsKey('did_map'));
    return DIDChainModel(
      didChain: data['did_map']!.values.map<DIDModel>((val) {
      return DIDModel.fromMap({"didDocument" : val[0], "didDocumentMetadata": val[1]});
          }).toList()
    );
  }  

  Map<String, dynamic> toMap() =>
      {'didChain': didChain.map((m) => m.toMap()['data']).toList()};
}
