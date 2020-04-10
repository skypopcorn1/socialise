String errorMessage(errorCode) {
  print("errorCode: $errorCode");
  if (errorCode == 'ERROR_NETWORK_REQUEST_FAILED') {
    return 'Please check your internet connection.';
  } else if (errorCode == 'ERROR_INVALID_EMAIL') {
    return 'Invalid email address entered.';
  } else if (errorCode == 'ERROR_WEAK_PASSWORD') {
    return 'Password must be at least 6 characters long.';
  } else if (errorCode == 'ERROR_WRONG_PASSWORD') {
    return 'Wrong password. Please try again.';
  } else if (errorCode == 'ERROR_EMAIL_ALREADY_IN_USE') {
    return 'Account already registered to this email.';
  } else if (errorCode == 'ERROR_USER_NOT_FOUND') {
    return 'No account registered to this email.';
  }
  return 'Something went wrong :( Please try again.';
}

String handleUnderscore(t) {
  t = t.split('_');
  return '${t[0][0].toUpperCase()}${t[0].substring(1)} ${t[1]}';
}

List addItemErrors(itemDetails) {
  List _nullFields = [];
  List _numberFields = ['daily_rate', 'deposit', 'weekly_rate', 'monthly_rate'];
//  List _listFields = ['blackouts','rules','specs', 'tags'];

  itemDetails.forEach((k, v) {
    String _updatedKey;
    if (k.contains('_')) {
      _updatedKey = handleUnderscore(k);
    } else {
      _updatedKey = '${k[0].toUpperCase()}${k.substring(1)}';
    }

    if (v != null && _numberFields.contains(k)) {
      if (v is! double) {
        _nullFields.add('$_updatedKey: not a valid number, please update');
      }
    } else if (v == null) {
      if (k == 'image_url') {
        _nullFields.add('Please add an image.');
      } else {
        _nullFields.add(_updatedKey);
      }
    }
  });
  return _nullFields;
}
