import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar', 'am', 'tr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
    String? amText = '',
    String? trText = '',
  }) =>
      [enText, arText, amText, trText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // chatpage
  {
    's0hj5ywl': {
      'en': 'Garee Shahada Chat',
      'am': 'Garee Shahada ውይይት',
      'ar': 'دردشة جاري الشهادة',
      'tr': 'Garee Shahada Chat',
    },
    'gkvipqjw': {
      'en': 'Search',
      'am': 'ፈልግ',
      'ar': 'يبحث',
      'tr': 'Aramak',
    },
    'mhwqoyt2': {
      'en': 'Active Now',
      'am': 'አሁን ንቁ',
      'ar': 'نشط الآن',
      'tr': 'Şu Anda Aktif',
    },
    '0jjfbca7': {
      'en': 'Recent Chats',
      'am': 'የቅርብ ጊዜ ውይይቶች',
      'ar': 'المحادثات الأخيرة',
      'tr': 'Son Sohbetler',
    },
    'bt8hqaji': {
      'en': 'Home',
      'am': 'ቤት',
      'ar': 'بيت',
      'tr': 'Ev',
    },
  },
  // signin
  {
    'vi81wiye': {
      'en': 'Create Account',
      'am': 'መለያ ፍጠር',
      'ar': 'إنشاء حساب',
      'tr': 'Hesap oluşturmak',
    },
    'jurdasxo': {
      'en': 'Create Account',
      'am': 'መለያ ፍጠር',
      'ar': 'إنشاء حساب',
      'tr': 'Hesap oluşturmak',
    },
    'fzvjm7r8': {
      'en': 'Let\'s get started by filling out the form below.',
      'am': 'ከዚህ በታች ያለውን ቅጽ በመሙላት እንጀምር።',
      'ar': 'لنبدأ بملء النموذج أدناه.',
      'tr': 'Aşağıdaki formu doldurarak başlayalım.',
    },
    'mtmxxlu4': {
      'en': 'Username with out space',
      'am': 'ስም',
      'ar': 'اسم',
      'tr': 'İsim',
    },
    'gn27jo6q': {
      'en': 'Email',
      'am': 'ኢሜይል',
      'ar': 'بريد إلكتروني',
      'tr': 'E-posta',
    },
    'h9vb72dn': {
      'en': 'Your phone number',
      'am': 'ስም',
      'ar': 'اسم',
      'tr': 'İsim',
    },
    'eqfv6q5m': {
      'en': 'Password',
      'am': 'የይለፍ ቃል',
      'ar': 'كلمة المرور',
      'tr': 'Şifre',
    },
    'iful9f1j': {
      'en': 'Repeat/Confirm Password',
      'am': 'የይለፍ ቃል ድገም/አረጋግጥ',
      'ar': 'كرر/تأكيد كلمة المرور',
      'tr': 'Şifreyi Tekrarla/Onayla',
    },
    'khhuhtgn': {
      'en': 'Name is required',
      'am': 'ስም ያስፈልጋል',
      'ar': 'الاسم مطلوب',
      'tr': 'İsim gereklidir',
    },
    'dye8lwyw': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'oviiwfvm': {
      'en': 'Email is required',
      'am': 'ኢሜል ያስፈልጋል',
      'ar': 'البريد الإلكتروني مطلوب',
      'tr': 'E-posta gereklidir',
    },
    't56owtov': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    '4ogkjxjf': {
      'en': 'Did you entered correct phone number?',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'ghlmbhnd': {
      'en': 'Please choose an option from the dropdown',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'lvkd8bmi': {
      'en': 'Password is required',
      'am': 'የይለፍ ቃል ያስፈልጋል',
      'ar': 'كلمة المرور مطلوبة',
      'tr': 'Şifre gerekli',
    },
    'htzwqg15': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'r9htfs31': {
      'en': 'Confirm Password is required',
      'am': 'የይለፍ ቃል አረጋግጥ ያስፈልጋል',
      'ar': 'تأكيد كلمة المرور مطلوب',
      'tr': 'Şifreyi Onayla gereklidir',
    },
    '57u9eob9': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'nqxvrh02': {
      'en': 'Create Account',
      'am': 'እንጀምር',
      'ar': 'البدء',
      'tr': 'Başlayın',
    },
    'nqiv6j44': {
      'en': 'Or sign up with',
      'am': 'ወይም በ ይመዝገቡ',
      'ar': 'أو قم بالتسجيل مع',
      'tr': 'Veya kaydolun',
    },
    'gvs8ejov': {
      'en': 'Continue with Google',
      'am': 'በGoogle ይቀጥሉ',
      'ar': 'متابعة مع جوجل',
      'tr': 'Google ile devam edin',
    },
    'gon9nybf': {
      'en': 'Continue with Apple',
      'am': 'በአፕል ይቀጥሉ',
      'ar': 'متابعة مع Apple',
      'tr': 'Apple ile devam edin',
    },
    'zwnkq2ex': {
      'en': 'Log In',
      'am': 'ግባ',
      'ar': 'تسجيل الدخول',
      'tr': 'Giriş yapmak',
    },
    'ik4vdr4a': {
      'en': 'Welcome Back',
      'am': 'እንኳን ደህና መጣህ',
      'ar': 'مرحبًا بعودتك',
      'tr': 'Tekrar hoşgeldiniz',
    },
    'sfbgfizv': {
      'en': 'Fill out the information below in order to access your account.',
      'am': 'መለያዎን ለመድረስ ከዚህ በታች ያለውን መረጃ ይሙሉ።',
      'ar': 'قم بملء المعلومات أدناه لتتمكن من الوصول إلى حسابك.',
      'tr': 'Hesabınıza erişebilmek için lütfen aşağıdaki bilgileri doldurun.',
    },
    '7ewow9bz': {
      'en': 'Email',
      'am': 'ኢሜይል',
      'ar': 'بريد إلكتروني',
      'tr': 'E-posta',
    },
    '9pvih8a0': {
      'en': 'Password',
      'am': 'የይለፍ ቃል',
      'ar': 'كلمة المرور',
      'tr': 'Şifre',
    },
    't2tuyjm0': {
      'en': 'Email is required',
      'am': 'ኢሜል ያስፈልጋል',
      'ar': 'البريد الإلكتروني مطلوب',
      'tr': 'E-posta gereklidir',
    },
    'xy7en0px': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'ziqowp8l': {
      'en': 'Password is required',
      'am': 'የይለፍ ቃል ያስፈልጋል',
      'ar': 'كلمة المرور مطلوبة',
      'tr': 'Şifre gerekli',
    },
    'nts1qsq5': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'h8a5jrk5': {
      'en': 'Sign In',
      'am': 'ይግቡ',
      'ar': 'تسجيل الدخول',
      'tr': 'Giriş Yap',
    },
    '7609cs8w': {
      'en': 'Or sign in with',
      'am': 'ወይም በመለያ ይግቡ',
      'ar': 'أو قم بتسجيل الدخول باستخدام',
      'tr': 'Veya ile giriş yapın',
    },
    '9otqn21i': {
      'en': 'Continue with Google',
      'am': 'በGoogle ይቀጥሉ',
      'ar': 'متابعة مع جوجل',
      'tr': 'Google ile devam edin',
    },
    'smkcrtjo': {
      'en': 'Continue with Apple',
      'am': 'በአፕል ይቀጥሉ',
      'ar': 'متابعة مع Apple',
      'tr': 'Apple ile devam edin',
    },
    '33d75lo9': {
      'en': 'Home',
      'am': 'ቤት',
      'ar': 'بيت',
      'tr': 'Ev',
    },
  },
  // edit_profile
  {
    '01okhds1': {
      'en': 'Your Name',
      'am': 'የእርስዎ ስም',
      'ar': 'اسمك',
      'tr': 'Adınız',
    },
    '7y24629b': {
      'en': 'Add Your Email',
      'am': 'ኢሜልዎን ያክሉ',
      'ar': 'أضف بريدك الإلكتروني',
      'tr': 'E-postanızı Ekleyin',
    },
    'k5rxqlt5': {
      'en': 'Add Your Phone number',
      'am': 'ስልክ ቁጥርህን ጨምር',
      'ar': 'أضف رقم هاتفك',
      'tr': 'Telefon numaranızı ekleyin',
    },
    'qom0ubgu': {
      'en': 'Your Name is required',
      'am': 'የእርስዎ ስም ያስፈልጋል',
      'ar': 'اسمك مطلوب',
      'tr': 'Adınız gereklidir',
    },
    'ah870gu6': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'z68vkh75': {
      'en': 'Add Your Email is required',
      'am': 'ኢሜልዎን ማከል ያስፈልጋል',
      'ar': 'أضف بريدك الإلكتروني مطلوب',
      'tr': 'E-postanızı ekleyin gereklidir',
    },
    'k2lwv952': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    '2lgonqwu': {
      'en': 'Add Your Phone number is required',
      'am': 'ስልክ ቁጥርህን ማከል ያስፈልጋል',
      'ar': 'أضف رقم هاتفك مطلوب',
      'tr': 'Telefon numaranızı eklemeniz gerekiyor',
    },
    'kvl46j14': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'y1zt5wcg': {
      'en': 'Save Changes',
      'am': 'ለውጦችን ያስቀምጡ',
      'ar': 'حفظ التغييرات',
      'tr': 'Değişiklikleri Kaydet',
    },
    'y8cz92xd': {
      'en': 'Edit Profile',
      'am': 'መገለጫ አርትዕ',
      'ar': 'تعديل الملف الشخصي',
      'tr': 'Profili Düzenle',
    },
  },
  // Profile
  {
    'rvglsewk': {
      'en': 'Edit',
      'am': 'አርትዕ',
      'ar': 'يحرر',
      'tr': 'Düzenlemek',
    },
    'h4liltf7': {
      'en': 'Log out',
      'am': 'ውጣ',
      'ar': 'تسجيل الخروج',
      'tr': 'Çıkış yap',
    },
    'c3w08y9w': {
      'en': 'Profile',
      'am': 'መገለጫ',
      'ar': 'حساب تعريفي',
      'tr': 'Profil',
    },
  },
  // chat
  {
    'f6w9tkpv': {
      'en': 'Your message here...',
      'am': 'መልእክትህ እዚህ...',
      'ar': 'رسالتك هنا...',
      'tr': 'Mesajınız burada...',
    },
    '04r904z6': {
      'en': 'Home',
      'am': 'ቤት',
      'ar': 'بيت',
      'tr': 'Ev',
    },
  },
  // UsersScreen
  {
    '3kpy6ivi': {
      'en': 'Search',
      'am': 'ፈልግ',
      'ar': 'يبحث',
      'tr': 'Aramak',
    },
    'twzayavs': {
      'en': 'Active Now',
      'am': 'አሁን ንቁ',
      'ar': 'نشط الآن',
      'tr': 'Şu Anda Aktif',
    },
    '4ui83cpp': {
      'en': 'Recent Chats',
      'am': 'የቅርብ ጊዜ ውይይቶች',
      'ar': 'المحادثات الأخيرة',
      'tr': 'Son Sohbetler',
    },
    'iyr0w54v': {
      'en': 'Garee Shahada Chat',
      'am': 'Garee Shahada ውይይት',
      'ar': 'دردشة جاري الشهادة',
      'tr': 'Garee Shahada Chat',
    },
    'no8356zo': {
      'en': 'Home',
      'am': 'ቤት',
      'ar': 'بيت',
      'tr': 'Ev',
    },
  },
  // settings
  {
    'azjhdzhz': {
      'en': 'Edit Profile',
      'am': 'መገለጫ አርትዕ',
      'ar': 'تعديل الملف الشخصي',
      'tr': 'Profili Düzenle',
    },
    'jfcgba25': {
      'en': 'Change theme',
      'am': 'ጭብጥ ቀይር',
      'ar': 'تغيير الثيم',
      'tr': 'Temayı değiştir',
    },
    '40nmspdx': {
      'en': 'Logout',
      'am': 'ውጣ',
      'ar': 'تسجيل الخروج',
      'tr': 'Çıkış yap',
    },
    '6z67djfi': {
      'en': 'Delete Account',
      'am': 'መለያ ሰርዝ',
      'ar': 'حذف الحساب',
      'tr': 'Hesabı Sil',
    },
    'j0njwvae': {
      'en': 'Assalamu-aleykum',
      'am': 'አሰላሙ-አለይኩም',
      'ar': 'السلام عليكم',
      'tr': 'Assalamu-aleykum',
    },
    'ou7vb78s': {
      'en': 'Profile',
      'am': 'መገለጫ',
      'ar': 'حساب تعريفي',
      'tr': 'Profil',
    },
  },
  // AskBot
  {
    '7v7km53e': {
      'en': 'Conversations',
      'am': 'ውይይቶች',
      'ar': 'المحادثات',
      'tr': 'Konuşmalar',
    },
    '3wxzf7fa': {
      'en': 'Clear History',
      'am': 'ታሪክ አጽዳ',
      'ar': 'مسح التاريخ',
      'tr': 'Geçmişi Temizle',
    },
    'fo5yvntg': {
      'en':
          'Bot generated responses maybe inaccurate or misleading, Be sure to double check responses.',
      'am':
          'Bot የመነጩ ምላሾች ትክክል ላይሆኑ ወይም አሳሳች ሊሆኑ ይችላሉ፣ ምላሾችን በእጥፍ ማረጋገጥዎን እርግጠኛ ይሁኑ።',
      'ar':
          'قد تكون الاستجابات التي يولدها الروبوت غير دقيقة أو مضللة، لذا تأكد من التحقق من الاستجابات جيدًا.',
      'tr':
          'Bot tarafından oluşturulan yanıtlar yanlış veya yanıltıcı olabilir. Yanıtları iki kez kontrol ettiğinizden emin olun.',
    },
    'g96fgvoe': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'aj8sgern': {
      'en': 'Ask a question',
      'am': 'ጥያቄ ጠይቅ',
      'ar': 'اطرح سؤالا',
      'tr': 'Bir soru sor',
    },
    'jcpc1e46': {
      'en': 'Garee Shahada ChatBot',
      'am': 'Garee Shahada ChatBot',
      'ar': 'روبوت الدردشة غاري شهادة',
      'tr': 'Garee Shahada ChatBot',
    },
    '6tdcatl8': {
      'en': 'Home',
      'am': 'ቤት',
      'ar': 'بيت',
      'tr': 'Ev',
    },
  },
  // relax
  {
    'klmu2zaf': {
      'en': 'Please close one\nplayer when\nopening the  other',
      'am': 'እባክዎ አንዱን ይዝጉ\nተጫዋች መቼ\nሌላውን መክፈት',
      'ar': 'يرجى إغلاق أحد المشغلين عند فتح الآخر',
      'tr': 'Lütfen bir\noyuncuyu açarken diğerini\nkapatınız',
    },
    '98rfbk43': {
      'en': 'Online Audios',
      'am': 'የመስመር ላይ ኦዲዮዎች',
      'ar': 'الصوتيات على الإنترنت',
      'tr': 'Çevrimiçi Sesler',
    },
    '8efgw3fe': {
      'en': 'Garee Shahadaa Relax',
      'am': 'Garee Shahadaa ዘና ይበሉ',
      'ar': 'جاري شهادة استرخي',
      'tr': 'Garee Shahadaa Relax',
    },
  },
  // videoplayer
  {
    '0c5frluo': {
      'en': 'Garee Shahadaa Watch',
      'am': 'Garee Shahadaa Watch',
      'ar': 'جاري الشهادة ووتش',
      'tr': 'Garee Shahadaa İzle',
    },
  },
  // AboutUs
  {
    'lgcon3dq': {
      'en': 'مرحباً بكم في',
      'am': 'مرحبات بكم في',
      'ar': 'مرحباً بكم في',
      'tr': 'مرحباً بكم في',
    },
    'a096oaea': {
      'en': 'Garee Shahadaa',
      'am': 'ጋሬ ሻሃዳኣ',
      'ar': 'جاري الشهادة',
      'tr': 'Garee Shahadaa',
    },
    'yipyw5jv': {
      'en':
          '\\\"ادْعُ إِلَىٰ سَبِيلِ رَبِّكَ بِالْحِكْمَةِ وَالْمَوْعِظَةِ الْحَسَنَةِ\\\"',
      'am':
          '\\\"ادْعُ إِلَىٰ سَبِيلِ رَبِّكَ بِالْحِكْمَةِ وَالْمَوْعِظَةِ الْحَسَنَةِ\\\"',
      'ar':
          '\\\"ادْعُ إِلَى سَبِيلِ رَبِّكَ بِالْحِكْمَةِ وَالْمَوْعِظَةِ الْحَسَنَةِ\\\"',
      'tr':
          '\\\"ادْعُ إِلَىٰ سَبِيلِ رَبِّكَ بِالْحِكْمَةِ وَالْمَوْعِظَةِ الْحَسَنَةِ\\\"',
    },
    'hew77nx4': {
      'en':
          '\\\"Invite to the way of your Lord with wisdom and good instruction\\\" - Quran 16:125',
      'am': '\"ወደ ጌታህ መንገድ በጥበብና በመልካም ግሳጼ ጥራ\" - ቁርአን 16:125',
      'ar':
          '\"ادْعُ إِلَى سَبِيلِ رَبِّكَ بِالْحِكْمَةِ وَالْمَوْعِظَةِ الْحَسَنَةِ\" - القرآن 16:125',
      'tr':
          '\\\"Rabbinin yoluna hikmetle ve güzel öğütle davet et\\\" - Kur\'an 16:125',
    },
    'b8rnxe5x': {
      'en': 'Update Your phone and Name',
      'am': 'ሻሃዳ ሪከርድስ Facebook',
      'ar': 'تسجيلات الشهادة فيسبوك',
      'tr': 'Şehadet Kayıtları Facebook',
    },
    'jxav7j10': {
      'en': 'Change Your Settings',
      'am': 'ሻሃዳ ሪከርድስ Facebook',
      'ar': 'تسجيلات الشهادة فيسبوك',
      'tr': 'Şehadet Kayıtları Facebook',
    },
    'b5bnxce0': {
      'en': 'من نحن',
      'am': 'من نحن',
      'ar': 'من نحن',
      'tr': 'من نحن',
    },
    'nxnx3zlg': {
      'en': 'Who We Are',
      'am': 'እኛ ማን ነን',
      'ar': 'من نحن',
      'tr': 'Biz Kimiz',
    },
    'ixv6f2gf': {
      'en':
          'Garee Shahadaa is a dedicated Islamic da\'wa organization serving the Oromia region and beyond. Our mission is to promote the beautiful message of Islam through the testimony of faith (Shahada), comprehensive Islamic education, and fostering unity among the Muslim ummah.',
      'am':
          'ጋሬ ሻሃዳ በኦሮሚያ ክልል እና ከዚያም በላይ በማገልገል ላይ ያለ ኢስላማዊ የዳዕዋ ድርጅት ነው። የኛ ተልእኮ የእስልምናን ውብ መልእክት በእምነት ምስክርነት (ሻሃዳ)፣ አጠቃላይ ኢስላማዊ ትምህርት እና በሙስሊሙ ህዝበ ሙስሊሙ መካከል አንድነትን ማጎልበት ነው።',
      'ar':
          'Garee Shahadaa هي منظمة دعوة إسلامية متخصصة تخدم منطقة أوروميا وخارجها. مهمتنا هي تعزيز رسالة الإسلام الجميلة من خلال شهادة الإيمان (الشهادة)، والتعليم الإسلامي الشامل، وتعزيز الوحدة بين الأمة الإسلامية.',
      'tr':
          'Garee Shahadaa, Oromia bölgesi ve ötesine hizmet veren özel bir İslami davet kuruluşudur. Misyonumuz, imanın şahitliği (Şehadet), kapsamlı İslami eğitim ve Müslüman ümmeti arasındaki birliği teşvik ederek İslam\'ın güzel mesajını tanıtmaktır.',
    },
    '1kcc11is': {
      'en':
          'We believe in spreading the light of Islam with wisdom, compassion, and understanding. Through our various programs and initiatives, we strive to create a strong, knowledgeable, and united Muslim community that serves as a beacon of hope and guidance for all.',
      'am':
          'የእስልምናን ብርሃን በጥበብ፣ በርህራሄ እና በማስተዋል በማስፋፋት እናምናለን። በተለያዩ ፕሮግራሞቻችን እና ተነሳሽኖቻችን ጠንካራ፣ እውቀት ያለው እና ለሁሉም የተስፋ ብርሃን ሆኖ የሚያገለግል ሙስሊም ማህበረሰብ ለመፍጠር እንጥራለን።',
      'ar':
          'نؤمن بنشر نور الإسلام بالحكمة والرحمة والفهم. ومن خلال برامجنا ومبادراتنا المتنوعة، نسعى جاهدين لبناء مجتمع إسلامي قوي، واعي، وموحد، يكون منارة أمل وهداية للجميع.',
      'tr':
          'İslam\'ın ışığını hikmet, şefkat ve anlayışla yaymaya inanıyoruz. Çeşitli programlarımız ve girişimlerimiz aracılığıyla, herkes için bir umut ve rehberlik ışığı görevi gören güçlü, bilgili ve birlik içinde bir Müslüman topluluğu yaratmaya çalışıyoruz.',
    },
    'k6buyjfv': {
      'en': 'Our Mobile Application',
      'am': 'የእኛ የሞባይል መተግበሪያ',
      'ar': 'تطبيقنا المحمول',
      'tr': 'Mobil Uygulamamız',
    },
    'mzvoifx2': {
      'en':
          'Download and Share our free mobile application - a comprehensive tool designed to strengthen your Islamic journey. Access inspiring Islamic videos, join live da\'wa sessions, and contribute to our noble cause through secure donation features.',
      'am':
          'የእኛን ነፃ የሞባይል መተግበሪያ ያውርዱ እና ያካፍሉ - ኢስላማዊ ጉዞዎን ለማጠናከር የተነደፈ አጠቃላይ መሳሪያ። አነቃቂ ኢስላማዊ ቪዲዮዎችን ይድረሱ፣ የቀጥታ የዳዕዋ ክፍለ ጊዜዎችን ይቀላቀሉ እና ደህንነታቸው በተጠበቁ የልገሳ ባህሪያት ለመልካም አላማችን አስተዋፅዖ ያድርጉ።',
      'ar':
          'حمّل وشارك تطبيقنا المجاني للهواتف المحمولة - أداة شاملة مصممة لتعزيز رحلتك الإسلامية. استمتع بمقاطع فيديو إسلامية ملهمة، وانضم إلى جلسات دعوية مباشرة، وساهم في قضيتنا النبيلة من خلال ميزات تبرع آمنة.',
      'tr':
          'Ücretsiz mobil uygulamamızı indirin ve paylaşın - İslami yolculuğunuzu güçlendirmek için tasarlanmış kapsamlı bir araç. İlham verici İslami videolara erişin, canlı davet oturumlarına katılın ve güvenli bağış özellikleriyle asil davamıza katkıda bulunun.',
    },
    'd9tpguog': {
      'en':
          '💚 Use and share this app to earn continuous ajr (reward) from Allah!',
      'am': '💚 ቀጣይነት ያለው አጅር (ሽልማት) ከአላህ ዘንድ ለማግኘት ይህንን መተግበሪያ ይጠቀሙ እና ያካፍሉ!',
      'ar': '💚 استخدم هذا التطبيق وشاركه لتحصل على أجر مستمر من الله!',
      'tr':
          '💚 Allah\'tan sürekli ecrinizi (sevginizi) kazanmak için bu uygulamayı kullanın ve paylaşın!',
    },
    'mlysbxob': {
      'en': 'Support Our Da\'wa',
      'am': 'ዳዕዋችንን ደግፉ',
      'ar': 'ادعم دعوتنا',
      'tr': 'Davamızı Destekleyin',
    },
    'pacy7n7g': {
      'en':
          'Your generous donations help us continue spreading the message of Islam and supporting our community programs. Every contribution, no matter the size, is a sadaqah jariyah that will benefit you in this life and the hereafter.',
      'am':
          'ያደረጋችሁት ልግስና የእስልምናን መልእክት በማሰራጨት እና የማህበረሰቡን ፕሮግራሞቻችንን እንድንደግፍ ያግዘናል። ማንኛውም አስተዋጽዖ መጠኑ ምንም ይሁን ምን በቅርቢቱም ሆነ በአኼራ የሚጠቅምህ ሶደቃህ ጃሪያህ ነው።',
      'ar':
          'تبرعاتكم السخية تُساعدنا على مواصلة نشر رسالة الإسلام ودعم برامجنا المجتمعية. كل مساهمة، مهما كان حجمها، صدقة جارية تُفيدكم في الدنيا والآخرة.',
      'tr':
          'Cömert bağışlarınız, İslam mesajını yaymaya ve toplum programlarımızı desteklemeye devam etmemize yardımcı oluyor. Miktarı ne olursa olsun her bağış, hem bu dünyada hem de ahirette size fayda sağlayacak bir sadaka-i cariyedir.',
    },
    'ftmwf2ld': {
      'en': 'CBE',
      'am': 'ንግድ ባንክ',
      'ar': 'وسام الإمبراطورية البريطانية',
      'tr': 'CBE',
    },
    '6cs1sxv9': {
      'en': 'Commercial Bank of Ethiopia',
      'am': 'የኢትዮጵያ ንግድ ባንክ',
      'ar': 'البنك التجاري الإثيوبي',
      'tr': 'Etiyopya Ticaret Bankası',
    },
    'q26hizhk': {
      'en': '1000 564 884 557',
      'am': '10000 XXXXXXXXX',
      'ar': '10000 XXXXXXXXX',
      'tr': '10000 XXXXXXXXX',
    },
    'x9wb8ul3': {
      'en': 'Behayilu Belachew (Ustaz Ferhan Name malet new )',
      'am': 'ጋሬ ሻሃዳ ኦሮሚያ',
      'ar': 'جاري شهادة أوروميا',
      'tr': 'Garee Shahadaa Oromia',
    },
    '2vbr3h3y': {
      'en': '🤲 Donate for the sake of Allah and earn continuous ajr!',
      'am': '🤲 ለአላህ ብላችሁ ለግሱ እና ቀጣይነት ያለው አጅርን ያግኙ!',
      'ar': '🤲 تبرع في سبيل الله واكسب أجرًا مستمرًا!',
      'tr': '🤲 Allah rızası için bağış yapın ve sürekli ecr kazanın!',
    },
    'us100vb8': {
      'en': 'Contact Us',
      'am': 'ያግኙን',
      'ar': 'اتصل بنا',
      'tr': 'Bize Ulaşın',
    },
    '09blr2co': {
      'en': 'info@gareeshahaadaa.org',
      'am': 'info@gareeshahaadaa.org',
      'ar': 'info@gareeshahaadaa.org',
      'tr': 'info@gareeshahaadaa.org',
    },
    '2o05xsal': {
      'en': '+251-974844650',
      'am': '+251-974844650',
      'ar': '+251-974844650',
      'tr': '+251-974844650',
    },
    'uk1k761b': {
      'en': 'Ethiopia Oromia Sheger city',
      'am': 'Ethiopia ኦሮሚያ ሸገር ከተማ',
      'ar': 'إثيوبيا أوروميا مدينة شغر',
      'tr': 'Etiyopya Oromia Şeger şehri',
    },
    '16yldp51': {
      'en':
          'We\'re here to serve you and answer any questions about Islam or our programs.',
      'am':
          'እኛ እርስዎን ለማገልገል እና ስለ እስልምና ወይም ስለ ፕሮግራሞቻችን ማንኛውንም ጥያቄ ለመመለስ እዚህ መጥተናል።',
      'ar': 'نحن هنا لخدمتكم والإجابة على أي أسئلة حول الإسلام أو برامجنا.',
      'tr':
          'İslam veya programlarımız hakkında her türlü sorunuza cevap vermek ve size hizmet etmek için buradayız.',
    },
    '9t4ngxvv': {
      'en': 'About the Developer',
      'am': 'ስለ ገንቢው',
      'ar': 'نبذة عن المطور',
      'tr': 'Geliştirici Hakkında',
    },
    'fm7igj8n': {
      'en':
          'This application was developed free of charge by Seyfadin Abdela, seeking only the pleasure of Allah (SWT). Please remember us in your du\'a (prayers).',
      'am':
          'ይህ መተግበሪያ የአላህን (ሱ.ወ) ውዴታ ብቻ በመፈለግ በሰይፋዲን አብደላ የተዘጋጀ ነው። በዱዓህ (በሶላትህ) አስታውስን።',
      'ar':
          'طُوِّر هذا التطبيق مجانًا من قِبل سيف الدين عبد الله، ابتغاء مرضاة الله تعالى. لا تنسونا من دعائكم.',
      'tr':
          'Bu uygulama, yalnızca Allah\'ın (cc) rızasını gözeterek Seyfadin Abdela tarafından ücretsiz olarak geliştirilmiştir. Lütfen dualarınızda bizi unutmayın.',
    },
    'kmdpzmpn': {
      'en':
          'FlutterFlow developers interested in Islamic projects can contact: seyfstreamline.com',
      'am':
          'በኢስላማዊ ፕሮጀክቶች ላይ ፍላጎት ያላቸው የFlutterFlow ገንቢዎች ማነጋገር ይችላሉ: seyfstreamline.com',
      'ar':
          'يمكن لمطوري FlutterFlow المهتمين بالمشاريع الإسلامية الاتصال بـ: seyfstreamline.com',
      'tr':
          'İslami projelerle ilgilenen FlutterFlow geliştiricileri şu adrese başvurabilir: seyfstreamline.com',
    },
    '6mogsf11': {
      'en': '+251 942435009 | Seyfstremline.com',
      'am': '+251 942435009 | Seyfstremline.com',
      'ar': '+251 942435009 | Seyfstremline.com',
      'tr': '+251 942435009 | Seyfstremline.com',
    },
    'i4dndo2y': {
      'en': 'بارك الله فيكم',
      'am': 'بارك الله فيكم',
      'ar': 'بارك الله فيكم',
      'tr': 'بارك الله فيكم',
    },
    '9nkiycdr': {
      'en': '© 2025 Garee Shahadaa Application. All rights reserved.',
      'am': '© 2025 Garee Shahadaa መተግበሪያ። ሁሉም መብቶች የተጠበቁ ናቸው።',
      'ar': '© 2025 تطبيق جاري الشهادة. جميع الحقوق محفوظة.',
      'tr': '© 2025 Garee Shahadaa Uygulaması. Her hakkı saklıdır.',
    },
    's15sj3e2': {
      'en':
          'May Allah accept our efforts and guide us all to the straight path.',
      'am': 'አላህ ጥረታችንን ተቀብሎ ሁላችንንም ወደ ቀጥተኛው መንገድ ይምራን።',
      'ar':
          'نسأل الله أن يتقبل منا ومنكم صالح الأعمال ويهدينا جميعا إلى الصراط المستقيم.',
      'tr': 'Allah gayretlerimizi kabul etsin ve hepimizi doğru yola iletsin.',
    },
    '3sotkxys': {
      'en': 'GareeShahdaa.org',
      'am': 'ሻሃዳ ሪከርድስ Facebook',
      'ar': 'تسجيلات الشهادة فيسبوك',
      'tr': 'Şehadet Kayıtları Facebook',
    },
    'd1xu35br': {
      'en': 'Shahada Official Facebook',
      'am': 'ሻሃዳ ኦፊሴላዊ ፌስቡክ',
      'ar': 'الشهادة الرسمية على الفيسبوك',
      'tr': 'Şehadet Resmi Facebook',
    },
    'xymhp833': {
      'en': 'Garee Shahada on Youtube',
      'am': 'በ Youtube ላይ Garee Shahada',
      'ar': 'جاري شهادة على اليوتيوب',
      'tr': 'Garee Shahada Youtube\'da',
    },
    '63lvm2er': {
      'en': 'Garee Shahadaa On Tiktok',
      'am': 'Garee Shahadaa በቲክቶክ ላይ',
      'ar': 'جاري الشهادة على تيك توك',
      'tr': 'Garee Shahadaa On Tiktok',
    },
    '3behkvor': {
      'en': 'Shahada Records Facebook',
      'am': 'ሻሃዳ ሪከርድስ Facebook',
      'ar': 'تسجيلات الشهادة فيسبوك',
      'tr': 'Şehadet Kayıtları Facebook',
    },
    '1te6iaym': {
      'en': 'About Garee Shahadaa',
      'am': 'ስለ Garee Shahadaa',
      'ar': 'عن جاري الشهادة',
      'tr': 'Garee Shahadaa Hakkında',
    },
  },
  // postlists
  {
    '6qsonla3': {
      'en': 'Garee Shahada Talks',
      'am': 'Garee Shahada ንግግሮች',
      'ar': 'جاري شهادة يتحدث',
      'tr': 'Garee Shahada Konuşmaları',
    },
    '6r3uraym': {
      'en': 'Comments',
      'am': 'አስተያየቶች',
      'ar': 'تعليقات',
      'tr': 'Yorumlar',
    },
    'fe78pha9': {
      'en': 'Post Comment',
      'am': 'አስተያየት ይለጥፉ',
      'ar': 'نشر التعليق',
      'tr': 'Yorum Gönder',
    },
  },
  // createpost
  {
    '9j6oeq2h': {
      'en': 'Create Post',
      'am': 'ልጥፍ ፍጠር',
      'ar': 'إنشاء منشور',
      'tr': 'Gönderi Oluştur',
    },
    'i5cqqe7x': {
      'en': 'Share your thoughts with Garee Shahada Community',
      'am': 'ሀሳባችሁን ለጋሬ ሻሃዳ ማህበረሰብ አካፍሉን',
      'ar': 'شارك أفكارك مع مجتمع جاري شهادة',
      'tr': 'Düşüncelerinizi Garee Shahada Topluluğu ile paylaşın',
    },
    'cxa08buh': {
      'en': 'Post Type',
      'am': 'የመለጠፍ አይነት',
      'ar': 'نوع المنشور',
      'tr': 'Gönderi Türü',
    },
    '5ibgy1rc': {
      'en': 'General',
      'am': 'አጠቃላይ',
      'ar': 'عام',
      'tr': 'Genel',
    },
    '9dhe9ti9': {
      'en': 'Select post type',
      'am': 'የልጥፍ አይነት ይምረጡ',
      'ar': 'حدد نوع المنشور',
      'tr': 'Gönderi türünü seçin',
    },
    '6bomjvtd': {
      'en': 'General',
      'am': 'አጠቃላይ',
      'ar': 'عام',
      'tr': 'Genel',
    },
    'fy2a2ndm': {
      'en': 'Question',
      'am': 'ጥያቄ',
      'ar': 'سؤال',
      'tr': 'Soru',
    },
    'u7kyizpg': {
      'en': 'Announcement',
      'am': 'ማስታወቂያ',
      'ar': 'إعلان',
      'tr': 'Duyuru',
    },
    'w0d8m928': {
      'en': 'Islam Knowledge',
      'am': 'ጠቃሚ ምክሮች እና ምክሮች',
      'ar': 'نصائح وإرشادات',
      'tr': 'İpuçları ve Tavsiyeler',
    },
    'sb3rg8x9': {
      'en': 'Title of Your Post',
      'am': 'የልጥፍዎ ርዕስ',
      'ar': 'عنوان منشورك',
      'tr': 'Gönderinizin Başlığı',
    },
    'ke6ueakf': {
      'en': 'write summery or title of your post',
      'am': 'የልጥፍዎ የበጋ ወቅት ወይም ርዕስ',
      'ar': 'ملخص أو عنوان منشورك',
      'tr': 'Yazınızın özeti veya başlığı',
    },
    'br0xt0rv': {
      'en': 'What\'s on your mind?',
      'am': 'ምን እያሰብክ ነው?',
      'ar': 'ما الذي يدور في ذهنك؟',
      'tr': 'Aklınızdan ne geçiyor?',
    },
    'xtmm77fh': {
      'en': 'Share your thoughts, ask questions, or start a discussion...',
      'am': 'ሃሳብዎን ያካፍሉ፣ ጥያቄ ይጠይቁ ወይም ውይይት ይጀምሩ...',
      'ar': 'شارك بأفكارك، اطرح الأسئلة، أو ابدأ مناقشة...',
      'tr':
          'Düşüncelerinizi paylaşın, soru sorun veya bir tartışma başlatın...',
    },
    'rl3jvqs9': {
      'en': 'The summery or title of your post is required',
      'am': 'የልጥፍዎ የበጋ ወቅት ወይም ርዕስ ያስፈልጋል',
      'ar': 'مطلوب ملخص أو عنوان منشورك',
      'tr': 'Gönderinizin özeti veya başlığı gereklidir',
    },
    '23khujkx': {
      'en': 'Please wite the details in below box',
      'am': 'እባክዎን ዝርዝሩን ከዚህ በታች ባለው ሳጥን ውስጥ ይፃፉ',
      'ar': 'يرجى كتابة التفاصيل في المربع أدناه',
      'tr': 'Lütfen ayrıntıları aşağıdaki kutuya yazın',
    },
    '3l35x8qq': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'rf32xhkv': {
      'en':
          'Share your thoughts, ask questions, or start a discussion... is required',
      'am': 'ሃሳብዎን ያካፍሉ፣ ጥያቄ ይጠይቁ ወይም ውይይት ይጀምሩ... ያስፈልጋል',
      'ar': 'شارك بأفكارك، اطرح الأسئلة، أو ابدأ مناقشة... مطلوب',
      'tr':
          'Düşüncelerinizi paylaşın, soru sorun veya bir tartışma başlatın... gereklidir',
    },
    '7ivt1qfq': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    '6qil25uo': {
      'en': 'Share Post',
      'am': 'ፖስት አጋራ',
      'ar': 'شارك المنشور',
      'tr': 'Gönderiyi Paylaş',
    },
  },
  // empty_message
  {
    '1rxbgzef': {
      'en':
          'You didn\'t connected with\nyour friends yet, Click on\n+ icon at top \nand serch for ur friend',
      'am': '',
      'ar': '',
      'tr': '',
    },
  },
  // deleteAccount
  {
    'hq923081': {
      'en': 'Are you sure you want\nto Delete your account?',
      'am': 'እርግጠኛ ኖት ይፈልጋሉ\nመለያዎን ለመሰረዝ?',
      'ar': 'هل أنت متأكد أنك تريد حذف حسابك؟',
      'tr': 'Hesabınızı silmek istediğinizden emin misiniz?',
    },
    'okyucvut': {
      'en': 'Cancel',
      'am': 'ሰርዝ',
      'ar': 'يلغي',
      'tr': 'İptal etmek',
    },
    'u31yjxrx': {
      'en': 'Delete',
      'am': 'ሰርዝ',
      'ar': 'يمسح',
      'tr': 'Silmek',
    },
  },
  // logOut
  {
    'yql69eut': {
      'en': 'Are you sure you want\nto log out?',
      'am': 'እርግጠኛ ኖት ይፈልጋሉ\nለመውጣት?',
      'ar': 'هل أنت متأكد أنك تريد تسجيل الخروج؟',
      'tr': 'Çıkış yapmak istediğinizden emin misiniz?',
    },
    't0g810u7': {
      'en': 'Cancel',
      'am': 'ሰርዝ',
      'ar': 'يلغي',
      'tr': 'İptal etmek',
    },
    'jxt6iyem': {
      'en': 'Log Out',
      'am': 'ውጣ',
      'ar': 'تسجيل الخروج',
      'tr': 'Oturumu Kapat',
    },
  },
  // more
  {
    '5swygwvz': {
      'en': 'Delete Chat',
      'am': 'ውይይትን ሰርዝ',
      'ar': 'حذف الدردشة',
      'tr': 'Sohbeti Sil',
    },
    'yotsd7mf': {
      'en': 'Block User',
      'am': 'ተጠቃሚን አግድ',
      'ar': 'حظر المستخدم',
      'tr': 'Kullanıcıyı Engelle',
    },
  },
  // postvideo
  {
    '4f8u01xo': {
      'en': 'Publish New Video',
      'am': 'አዲስ ቪዲዮ ያትሙ',
      'ar': 'نشر فيديو جديد',
      'tr': 'Yeni Videoyu Yayınla',
    },
    '1aed3eu3': {
      'en': 'Write The Video Title',
      'am': 'የቪዲዮ ርዕስ ጻፍ',
      'ar': 'اكتب عنوان الفيديو',
      'tr': 'Video Başlığını Yazın',
    },
    'vpmgonja': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'venzukx0': {
      'en': 'insert the 11 characters of youtube video',
      'am': 'የዩቲዩብ ቪዲዮ 11 ቁምፊዎችን አስገባ',
      'ar': 'أدخل 11 حرفًا من فيديو اليوتيوب',
      'tr': 'YouTube videosunun 11 karakterini ekle',
    },
    'jto7ekic': {
      'en': 'Add title here is required',
      'am': 'ርዕስ እዚህ ማከል ያስፈልጋል',
      'ar': 'إضافة العنوان هنا مطلوب',
      'tr': 'Buraya başlık eklemek zorunludur',
    },
    'o7b656g3': {
      'en': 'please enter full Tilte',
      'am': 'እባክዎ ሙሉ Tilte ያስገቡ',
      'ar': 'الرجاء إدخال Tilte الكامل',
      'tr': 'Lütfen Tilte\'nin tamamını girin',
    },
    'shdgxyfg': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'e1lm6qdd': {
      'en': 'add video Id here is required',
      'am': 'የቪዲዮ መታወቂያ እዚህ ማከል ያስፈልጋል',
      'ar': 'أضف معرف الفيديو هنا مطلوب',
      'tr': 'buraya video kimliği eklemek zorunludur',
    },
    'k09brt5m': {
      'en': 'minimum is 11 character',
      'am': 'ዝቅተኛው 11 ቁምፊ ነው።',
      'ar': 'الحد الأدنى هو 11 حرفًا',
      'tr': 'minimum 11 karakter',
    },
    '2opd1lqb': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'xj4vzm25': {
      'en': 'Create the video',
      'am': 'ቪዲዮውን ይፍጠሩ',
      'ar': 'إنشاء الفيديو',
      'tr': 'Videoyu oluşturun',
    },
  },
  // commentbottomsheet
  {
    'jdmhl9g1': {
      'en': 'Comments',
      'am': 'አስተያየቶች',
      'ar': 'تعليقات',
      'tr': 'Yorumlar',
    },
    '1rs56dpl': {
      'en': 'What\'s on your mind?',
      'am': 'ምን እያሰብክ ነው?',
      'ar': 'ما الذي يدور في ذهنك؟',
      'tr': 'Aklınızdan ne geçiyor?',
    },
    'zuore5pv': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
  },
  // AddaAudio
  {
    'ecmsr67g': {
      'en': 'Add New Audio',
      'am': 'አዲስ ኦዲዮ ያክሉ',
      'ar': 'إضافة صوت جديد',
      'tr': 'Yeni Ses Ekle',
    },
    '26w4u62f': {
      'en': 'Insert Audio Title',
      'am': 'የድምጽ ርዕስ አስገባ',
      'ar': 'إدراج عنوان الصوت',
      'tr': 'Ses Başlığını Ekle',
    },
    '1hrqy0ya': {
      'en':
          'Insert Audio Link it only plays online! upload to catbox.moe and take the link',
      'am': 'የድምጽ ማገናኛን አስገባ በመስመር ላይ ብቻ ይጫወታል!',
      'ar': 'أدخل رابط الصوت ليتم تشغيله عبر الإنترنت فقط!',
      'tr': 'Ses Bağlantısını Ekle sadece çevrimiçi oynatılır!',
    },
    'eml11jvi': {
      'en': 'Add title here is required',
      'am': 'ርዕስ እዚህ ማከል ያስፈልጋል',
      'ar': 'إضافة العنوان هنا مطلوب',
      'tr': 'Buraya başlık eklemek zorunludur',
    },
    '0zzxpyas': {
      'en': 'please enter full Tilte',
      'am': 'እባክዎ ሙሉ Tilte ያስገቡ',
      'ar': 'الرجاء إدخال Tilte الكامل',
      'tr': 'Lütfen Tilte\'nin tamamını girin',
    },
    '85109ru5': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    's6x10ny6': {
      'en': 'add video Id here is required',
      'am': 'የቪዲዮ መታወቂያ እዚህ ማከል ያስፈልጋል',
      'ar': 'أضف معرف الفيديو هنا مطلوب',
      'tr': 'buraya video kimliği eklemek zorunludur',
    },
    'gdzp7m9g': {
      'en': 'minimum is 11 character',
      'am': 'ዝቅተኛው 11 ቁምፊ ነው።',
      'ar': 'الحد الأدنى هو 11 حرفًا',
      'tr': 'minimum 11 karakter',
    },
    '63mf7zto': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'tefgtpne': {
      'en': 'Add Audio',
      'am': 'ኦዲዮ ያክሉ',
      'ar': 'إضافة الصوت',
      'tr': 'Ses Ekle',
    },
  },
  // Miscellaneous
  {
    'iggtb5db': {
      'en': 'Allow us to show notification',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'no9si425': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'dmw2ewet': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'bomziphd': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'zlulrwge': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'lpp6otpe': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'em86ccgu': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'o0r1zeoz': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'em92rzvb': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'rgm8urca': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'pshwtjam': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    '2433bgkv': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'ap09bqp9': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'w6u2zmbo': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'y8f5z1zo': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'jv30bwbn': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'r4wxy21l': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    '1ecvzfng': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'qhrn3ugq': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'teh3xl7a': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    '685fay6p': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    '1y7qy7ew': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'tyzxfdfy': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'yly22bw2': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    '0mdowe7b': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
    'vyba20tv': {
      'en': '',
      'am': '',
      'ar': '',
      'tr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
