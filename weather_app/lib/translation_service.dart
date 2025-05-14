import 'package:translator/translator.dart';

class TranslationService {
  static final _translator = GoogleTranslator();
  static final _cache = <String, String>{};

  static Future<String> translate(String text, String to) async {
    final cacheKey = '$text-$to';

    if (_cache.containsKey(cacheKey)) {
      return _cache[cacheKey]!;
    }

    try {
      final translation = await _translator.translate(text, to: to);
      _cache[cacheKey] = translation.text;
      return translation.text;
    } catch (e) {
      print('Translation error: $e');
      return text; // Return original text on error
    }
  }

  static Future<void> preCacheTranslations(List<String> texts, String to) async {
    for (final text in texts) {
      await translate(text, to);
    }
  }
}