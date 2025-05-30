class TextInputValidator {
  static String? validateStringSize({
    required String? characters,
    required int minSize,
    required int maxSize,
    required String ifEmpty,
    required String wrongSize,
  }) {
    if (characters == null || characters.trim().isEmpty) {
      return ifEmpty;
    } else if (characters.trim().length < minSize ||
        characters.trim().length > maxSize) {
      return wrongSize;
    }
    return null;
  }

  static String? validateDateTime({
    required String? characters,
    required String ifEmpty,
    String notDateTime = "",
  }) {
    if (characters == null || characters.trim().isEmpty) {
      return ifEmpty; // Valid date
    } else if (DateTime.tryParse(characters) == null) {
      return notDateTime;
    }
    return null;
  }

  static String? validateOnlyDouble({
    required String? characters,
    required String ifEmpty,
    String notNumber = "",
    String ifMinSize = '',
    String ifBiggerOrSmaller = "",
    int minSize = 0,
    int maxSize = 0,
  }) {
    if (characters == null || characters.trim().isEmpty) {
      return ifEmpty;
    }
    if (double.tryParse(characters) == null) {
      return notNumber;
    }
    if (!(minSize == 0 && maxSize == 0)) {
      if (double.parse(characters.trim()) < minSize ||
          double.parse(characters.trim()) > maxSize) {
        return ifBiggerOrSmaller;
      }
    }
    if (ifMinSize.isNotEmpty) {
      if (double.parse(characters.trim()) <= minSize) {
        return ifMinSize;
      }
    }
    return null;
  }

  static String? validateOnlyInt({
    required String? characters,
    required String ifEmpty,
    String ifBiggerOrSmaller = "",
    String notNumber = "",
    String ifMinSize = '',
    int minSize = 0,
    int maxSize = 0,
  }) {
    if (characters == null || characters.isEmpty) {
      return ifEmpty;
    }
    if (int.tryParse(characters) == null) {
      return notNumber;
    }
    if (!(minSize == 0 && maxSize == 0)) {
      if (int.parse(characters.trim()) < minSize ||
          int.parse(characters.trim()) > maxSize) {
        return ifBiggerOrSmaller;
      }
    }
    if (ifMinSize.isNotEmpty) {
      if (int.parse(characters.trim()) <= minSize) {
        return ifMinSize;
      }
    }
    return null;
  }

  static String? validateURLhttps({
    required String? characters,
    required String ifEmpty,
    required String ifnotURL,
  }) {
    final urlRegex = RegExp(
      r'^(https?:\/\/)?(www\.)?[\w-]+\.[a-z]{2,63}(:\d{1,5})?([\/?#][^\s]*)?$',
      caseSensitive: true,
    );
    if (characters == null || characters.isEmpty) {
      return ifEmpty;
    }
    if (!urlRegex.hasMatch(characters.trim())) {
      return ifnotURL;
    }
    return null;
  }
}
