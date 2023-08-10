import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

class ParseFfiErrorResult {
  final FfiError varient;
  final String info;
  ParseFfiErrorResult(this.varient,this.info);
}

enum FfiError {
  failedToDeserialise("JSON Deserialisation Error"),
  failedToCreateDID("DID Create Error"),
  failedToAttestdDID("dDID Attest Error"),
  failedToResolveDID("DID Resolve Error"),
  failedToVerifyDID("DID Verify Error"),
  failedToVerifyCredential("DID Verify Credential Error"),

  unrecognisedFfiExceptionCode("No FFiError enum varient implimented for this exception code");

  const FfiError(this.code);
  final String code;

  static ParseFfiErrorResult parseFfiError(FfiException err) {
    var parts = err.message.split(":");
    final code = parts.removeAt(0);
    final info = parts.join(":");
    for (final errVarient in FfiError.values) {
      if (code == errVarient.code) {
        return ParseFfiErrorResult(errVarient, info);
      }
    }
    return ParseFfiErrorResult(FfiError.unrecognisedFfiExceptionCode, info);
  }
  
}

