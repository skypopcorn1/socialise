import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

Future<String> generateRoomCode() async {
  var _n;

  String _code = '';

  for (var i = 0; i < 6; i++) {
    int _typeInt = Random(DateTime.now().millisecond).nextInt(2);
    if (_typeInt == 0) {
      _n = alphabet[Random().nextInt(26)];
    } else {
      _n = Random().nextInt(9);
    }
    _code = '$_code$_n';
  }

  QuerySnapshot codeCheck = await _firestore
      .collection('rooms')
      .where('code', isEqualTo: _code)
      .getDocuments();

  if (codeCheck.documents.isNotEmpty) {
    // code is not unique.
    // try again for a code that doesn't exist
    generateRoomCode();
    print('docs: ${codeCheck.documents[0].data}');
  } else {
    print('code: $_code');
    return _code;
  }
}

Future<String> checkForCode({code}) async {}

const Map alphabet = {
  0: 'A',
  1: 'B',
  2: 'C',
  3: 'D',
  4: 'E',
  5: 'F',
  6: 'G',
  7: 'H',
  8: 'I',
  9: 'J',
  10: 'K',
  11: 'L',
  12: 'M',
  13: 'N',
  14: 'O',
  15: 'P',
  16: 'Q',
  17: 'R',
  18: 'S',
  19: 'T',
  20: 'U',
  21: 'V',
  22: 'W',
  23: 'X',
  24: 'Y',
  25: 'Z',
};
