import 'package:geography_app/data/models/province_model.dart';
import 'package:geography_app/data/models/lesson_model.dart';
import 'package:geography_app/data/models/quiz_model.dart';

/// Sample Geography data for 4 provinces
class SampleData {
  /// Get all sample provinces
  static List<Province> getProvinces() {
    return [
      _westernProvince(),
      _northCentralProvince(),
      _uvaProvince(),
      _centralProvince(),
      _southernProvince(),
      _northernProvince(),
      _easternProvince(),
      _northWesternProvince(),
      _sabaragamuwaProvince(),
    ];
  }

  /// Western Province Data
  static Province _westernProvince() {
    return Province(
      id: 'western',
      nameSinhala: 'බස්නාහිර පලාත',
      nameTamil: 'மேல் மாகாணம்',
      nameEnglish: 'Western Province',
      climate: 'තෙත් කලාපීය දේශගුණය (Tropical Wet Climate)',
      rainfallPattern: 'වාර්ෂිකව මි.මී. 2500ට වැඩි වර්ෂාපතනයක්. නිරිතදිග මෝසම් වාතයෙන් වැඩි වර්ෂාවක්.',
      rivers: ['කැළණි ගඟ', 'කැළුගඟ', 'බෝලගොඩ ඔය', 'බෙන්තර ගඟ'],
      agriculture: [
        'කුඹුරු වගාව',
        'පොල් වගාව',
        'රබර් වගාව',
        'එළවළු වගාව',
        'පලතුරු වගාව'
      ],
      population: 6100000,
      naturalDisasters: [
        'ගං ගැලීම් (කැළණි ගඟ)',
        'නාගරික ජල ගැලීම්',
        'නායයාම',
        'අධික වර්ෂාපතනය'
      ],
      touristAttractions: [
        'කොළඹ නගරය',
        'ගාලු මුවදොර',
        'කැළණි ගඟ',
        'නාවල පුරාවිද්‍යා ස්ථානය',
        'බුද්ධ ජයන්ති කොටුව'
      ],
      svgPath: '',
      centerLatitude: 6.9271,
      centerLongitude: 79.8612,
      imagePath: 'assets/images/western_province.jpg',
      description:
          'ශ්‍රී ලංකාවේ වඩාත්ම ජන ඝණත්වය වැඩි සහ ආර්ථික වශයෙන් වර්ධිත පළාතයි',
    );
  }

  /// North Central Province Data
  static Province _northCentralProvince() {
    return Province(
      id: 'north_central',
      nameSinhala: 'උතුරු මැද පළාත',
      nameTamil: 'வட மத்திய மாகாணம்',
      nameEnglish: 'North Central Province',
      climate: 'වියළි කලාපීය දේශගුණය (Dry Zone Climate)',
      rainfallPattern:
          'වාර්ෂිකව මි.මී. 1200-1900 අතර වර්ෂාපතනයක්. ඊසාන මෝසම් වාතයෙන් වර්ෂාව.',
      rivers: ['මහවැලි ගඟ', 'දඹදෙණිය', 'අමබන් ගඟ', 'යාන් ඔය'],
      agriculture: [
        'කුඹුරු වගාව (ප්‍රධාන)',
        'මානාව (Chena වගාව)',
        'එළවළු වගාව',
        'පළතුරු වගාව (කැජු)',
        'ගොවි වගාව'
      ],
      population: 1330000,
      naturalDisasters: ['නියං තත්ත්වය', 'වියළි බව', 'වගා අසාර්ථක තත්ත්වයන්', 'ජල හිඟය'],
      touristAttractions: [
        'අනුරාධපුර පුරාණ නගරය',
        'මිහින්තලේ',
        'රුවන්වැලි සෑය',
        'ජේතවනාරාමය',
        'ඉසුරුමුණිය',
        'රිටිගල වන සංරක්ෂණය'
      ],
      svgPath: '',
      centerLatitude: 8.3350,
      centerLongitude: 80.4037,
      imagePath: 'assets/images/north_central_province.jpg',
      description: 'පුරාණ සිංහල ශිෂ්ටාචාරයගේ මූලස්ථානය සහ වියළි කලාපයේ ප්‍රධාන කෘෂි කලාපය',
    );
  }

  /// Uva Province Data
  static Province _uvaProvince() {
    return Province(
      id: 'uva',
      nameSinhala: 'ඌව පළාත',
      nameTamil: 'ஊவா மாகாணம்',
      nameEnglish: 'Uva Province',
      climate: 'අතරමැදි සහ වියළි මිශ්‍ර දේශගුණය (Intermediate Climate)',
      rainfallPattern: 'වාර්ෂිකව මි.මී. 1500-2000 අතර. දෙවන අන්තර් මෝසම් වාතයෙන් වර්ෂාව.',
      rivers: ['මහවැලි ගඟ', 'කිරිඳි ඔය', 'හෙඩා ඔය', 'බදුලු ඔය'],
      agriculture: [
        'තේ වගාව (ප්‍රධාන)',
        'කුඹුරු වගාව',
        'එළවළු වගාව',
        'ඉරිඟු වගාව',
        'අනේසි වගාව'
      ],
      population: 1310000,
      naturalDisasters: ['නායයාම', 'නියං තත්ත්වය', 'වැසි අඩු වීම', 'සුළි සුළං'],
      touristAttractions: [
        'ඇල්ල',
        'බදුල්ල',
        'දුනිද ඇල්ල',
        'බුදුරුවගල',
        'බුඩුරුවාගල',
        'හැකැඔය ජාතික වනෝද්‍යානය'
      ],
      svgPath: '',
      centerLatitude: 6.9097,
      centerLongitude: 81.1011,
      imagePath: 'assets/images/uva_province.jpg',
      description: 'තේ වගාවේ ප්‍රධාන කලාපය සහ අලංකාර කඳුකර දර්ශන',
    );
  }

  /// Central Province Data
  static Province _centralProvince() {
    return Province(
      id: 'central',
      nameSinhala: 'මධ්‍යම පළාත',
      nameTamil: 'மத்திய மாகாணம்',
      nameEnglish: 'Central Province',
      climate: 'කඳුකර දේශගුණය (Montane Climate)',
      rainfallPattern: 'වාර්ෂිකව මි.මී. 1900-2500 අතර වර්ෂාපතනයක්. දෙවන අන්තර් මෝසම් වාතයෙන් වැඩි වර්ෂාවක්.',
      rivers: ['මහවැලි ගඟ', 'කෙළණි ගඟ', 'කොත්මලේ ඔය', 'හීන් ගඟ'],
      agriculture: [
        'තේ වගාව (ප්‍රධාන)',
        'එළවළු වගාව',
        'පලතුරු වගාව',
        'මල් වගාව',
        'කුඹුරු වගාව'
      ],
      population: 2590000,
      naturalDisasters: ['නායයාම', 'අධික වර්ෂාපතනය', 'අධික සීතල', 'මිනී කන්ද'],
      touristAttractions: [
        'දළදා මාළිගාව (කඳය)',
        'පේරාදෙණිය උද්‍යානය',
        'නුවර එළිය',
        'පිදුරුතලාගල',
        'හෝර්ටන් තැන්න',
        'විශ්ව තාප වනය'
      ],
      svgPath: '',
      centerLatitude: 7.2906,
      centerLongitude: 80.6337,
      imagePath: 'assets/images/central_province.jpg',
      description: 'The heart of the country, famous for its tea plantations, cool climate, and waterfalls.',
    );
  }

  /// Southern Province Data
  static Province _southernProvince() {
    return Province(
      id: 'southern',
      nameSinhala: 'දකුණු පළාත',
      nameTamil: 'தென் මாகாணம்',
      nameEnglish: 'Southern Province',
      climate: 'තෙත් සහ වියළි කලාපීය මිශ්‍ර (Tropical Rainforest/Monsoon)',
      rainfallPattern: 'නිරිතදිග මෝසම් වර්ෂාව වැඩි වශයෙන් ලැබේ. මැයි-සැප්තැම්බර්.',
      rivers: ['නිල්වලා ගඟ', 'ගිං ගඟ', 'වලවේ ගඟ'],
      agriculture: ['කුරුඳු', 'තේ (පහතරට)', 'පොල්', 'වී'],
      population: 2500000, // Approx
      naturalDisasters: ['ගංවතුර', 'නායයාම්', 'සුනාමි අවදානම (වෙරළබඩ)'],
      touristAttractions: ['ගාල්ල කොටුව', 'යාල ජාතික වනෝද්‍යානය', 'මිරිස්ස වෙරළ', 'සින්හරාජ වනාන්තරය'],
      svgPath: '',
      centerLatitude: 6.0535,
      centerLongitude: 80.2210,
      imagePath: 'assets/images/southern_province.jpg',
      description: 'ඓතිහාසික ගාල්ල කොටුව සහ සුන්දර වෙරළ තීරයන්ට ප්‍රසිද්ධය.',
    );
  }

  /// Northern Province Data
  static Province _northernProvince() {
    return Province(
      id: 'northern',
      nameSinhala: 'උතුරු පළාත',
      nameTamil: 'வட மாகாணம்',
      nameEnglish: 'Northern Province',
      climate: 'වියළි සහ උණුසුම් දේශගුණය (Tropical Savanna)',
      rainfallPattern: 'ඊසානදිග මෝසම් වර්ෂාව (ඔක්තෝබර්-ජනවාරි). සෙසු කාලය වියළි.',
      rivers: ['කනකරායන් ආරු', 'පරන්ගි ආරු'],
      agriculture: ['රතු ලූනු', 'මිිරිස්', 'දුම්කොළ', 'මිදි', 'තල්'],
      population: 1100000, // Approx
      naturalDisasters: ['නියඟය', 'කුණාටු'],
      touristAttractions: ['යාපනය කොටුව', 'නල්ලූර් කෝවිල', 'කයිට්ස් දූපත්', 'දෙවුන්දර තුඩුව (Point Pedro)'],
      svgPath: '',
      centerLatitude: 9.6615,
      centerLongitude: 80.0255,
      imagePath: 'assets/images/northern_province.jpg',
      description: 'තල් ගස් සහ අද්විතීය සංස්කෘතියකින් හෙබි ප්‍රදේශයකි.',
    );
  }

  /// Eastern Province Data
  static Province _easternProvince() {
    return Province(
      id: 'eastern',
      nameSinhala: 'නැගෙනහිර පළාත',
      nameTamil: 'கிழக்கு மாகாணம்',
      nameEnglish: 'Eastern Province',
      climate: 'වියළි හා තෙත් මිශ්‍ර (Tropical Monsoon/Savanna)',
      rainfallPattern: 'ඊසානදිග මෝසම් වර්ෂාව ලැබේ.',
      rivers: ['මහවැලි ගඟ (Delta)', 'ගල් ඔය'],
      agriculture: ['වී', 'ධීවර කර්මාන්තය', 'පොල්'],
      population: 1550000,
      naturalDisasters: ['සුනාමි අවදානම', 'ගංවතුර', 'සුළි කුණාටු'],
      touristAttractions: ['ත්‍රිකුණාමලය වරාය', 'පාසිකුඩා', 'ආරුගම් බොක්ක (Surfing)', 'කොනේෂ්වරම් කෝවිල'],
      svgPath: '',
      centerLatitude: 7.8731, // Trincomalee area
      centerLongitude: 81.3000, // Approx
      imagePath: 'assets/images/eastern_province.jpg',
      description: 'ලොව හොඳම ස්වභාවික වරායක් සහ වෙරළ තීරයන් සහිතයි.',
    );
  }

  /// North Western Province Data
  static Province _northWesternProvince() {
    return Province(
      id: 'north_western',
      nameSinhala: 'වයඹ පළාත',
      nameTamil: 'வட மேல் மாகாணம்',
      nameEnglish: 'North Western Province',
      climate: 'වියළි හා අතරමැදි (Tropical Savanna)',
      rainfallPattern: 'වසරේ වැඩි කාලයක් වියළි කාලගුණයක් පවතී.',
      rivers: ['දැදුරු ඔය', 'මා ඔය'],
      agriculture: ['පොල් (ප්‍රධාන)', 'වී', 'කජු'],
      population: 2370000,
      naturalDisasters: ['නියඟය', 'ජල හිඟය'],
      touristAttractions: ['යාපහුව', 'ඇත්ගාල විහාරය', 'මුන්නේෂ්වරම් කෝවිල', 'කල්පිටිය (Dolphin Watching)'],
      svgPath: '',
      centerLatitude: 7.7500, // Kurunegala/Puttalam area
      centerLongitude: 80.1500,
      imagePath: 'assets/images/north_western_province.jpg',
      description: 'පොල් ත්‍රිකෝණයට අයත් ප්‍රධාන ප්‍රදේශයයි.',
    );
  }

  /// Sabaragamuwa Province Data
  static Province _sabaragamuwaProvince() {
    return Province(
      id: 'sabaragamuwa',
      nameSinhala: 'සබරගමුව පළාත',
      nameTamil: 'சபரகமுவ மாகாணம்',
      nameEnglish: 'Sabaragamuwa Province',
      climate: 'තෙත් කලාපීය (Tropical Rainforest)',
      rainfallPattern: 'අධික වර්ෂාපතනයක් ලැබේ. මැණික් කර්මාන්තයට බලපායි.',
      rivers: ['කැළණි ගඟ', 'කළු ගඟ', 'වලවේ ගඟ'],
      agriculture: ['රබර්', 'තේ', 'වී', 'කුළුබඩු'],
      population: 1920000,
      naturalDisasters: ['නායයාම්', 'ගංවතුර'],
      touristAttractions: ['ශ්‍රී පාදස්ථානය (Adams Peak)', 'බෝපත් ඇල්ල', 'සින්හරාජය (කොටසක්)', 'උඩවලව'],
      svgPath: '',
      centerLatitude: 6.7000, // Ratnapura area
      centerLongitude: 80.4000,
      imagePath: 'assets/images/sabaragamuwa_province.jpg',
      description: 'මැණික් කර්මාන්තයට සහ ලෝක උරුම සිංහරාජ වනාන්තරයට ප්‍රසිද්ධයි.',
    );
  }


  /// Get sample lessons for all provinces
  static List<Lesson> getLessons() {
    return [
      ..._westernProvinceLessons(),
      ..._northCentralProvinceLessons(),
      ..._uvaProvinceLessons(),
      ..._centralProvinceLessons(),
    ];
  }

  /// Western Province Lessons
  static List<Lesson> _westernProvinceLessons() {
    return [
      Lesson(
        id: 'western_climate_01',
        titleSinhala: 'බස්නාහිර පලාතේ දේශගුණය',
        titleTamil: 'மேல் மாகாணத்தின் காலநிலை',
        titleEnglish: 'Climate of Western Province',
        contentSinhala: '''
බස්නාහිර පලාතේ තෙත් කලාපීය දේශගුණයක් පවතී.

වාර්ෂික වර්ෂාපතනය මිලිමීටර් 2500ක් අධිකය.

මෙයට හේතු:
• නිරිතදිග මෝසම් වාතය (මැයි-සැප්තැම්බර්)
• මුහුදු ආසන්න පිහිටීම
• දෙවන අන්තර් මෝසම් වාතය (ඔක්තෝබර්-නොවැම්බර්)

උෂ්ණත්වය:
• සාමාන්‍යයෙන් 26°C - 31°C අතර
• ස උස්බිම් ප්‍රදේශවල අඩු

සුවිශේෂතා:
✓ වසර පුරාම ඉහළ ආර්ද්‍රතාවය
✓ නිතර වැසි
✓ තෙතමනය
        ''',
        contentTamil: '',
        contentEnglish: '',
        imagePaths: [],
        category: LessonCategory.physicalGeography,
        gradeLevel: 8,
        order: 1,
        provinceId: 'western',
        keyPoints: [
          'තෙත් කලාපය',
          'වාර්ෂික වර්ෂාපතනය > 2500mm',
          'නිරිතදිග මෝසම්',
          'ඉහළ ආර්ද්‍රතාවය'
        ],
      ),
      Lesson(
        id: 'western_rivers_02',
        titleSinhala: 'කැළණි ගඟ සහ ජල පද්ධතිය',
        titleTamil: '',
        titleEnglish: 'Kelani River and Water System',
        contentSinhala: '''
කැළණි ගඟ බස්නාහිර පලාතේ ප්‍රධානතම ගංගාවයි.

ප්‍රභවය:
• හෝටන් තැන්න (නුවරඑළිය දිස්ත්‍රික්කයේ)
• මධ්‍යම කඳුකරයේ සිට

ගමන් මාර්ගය:
1. හෝටන් → කිතුල්ගල
2. අවිස්සාවේල්ල → හන්වැල්ල
3. කදුවෙල → කොළඹ
4. කොළඹට ආසන්නයේ මුහුදට පැමිණේ

වැදගත්කම:
✓ කොළඹ නගරයට ජලය සපයයි
✓ ජලාශ්‍රිත ශක්ති උත්පාදනය (ලක්ෂපාන, කුඩන්දාන)
✓ වගා බිම් වලට වාරිමාර්ග
✓ ගංගා ප්‍රවාහනය

අනතුරු:
⚠ වසර තුළ ගං ගැලීම්
⚠ දූෂණය
        ''',
        contentTamil: '',
        contentEnglish: '',
        imagePaths: [],
        category: LessonCategory.physicalGeography,
        gradeLevel: 9,
        order: 2,
        provinceId: 'western',
        keyPoints: [
          'කැළණි ගඟ - ප්‍රධාන ගංගාව',
          'හෝටන් තැන්නේ ප්‍රභවය',
          'ජල සම්පාදනය සඳහා',
          'ගං ගැලීම් අනතුරක්'
        ],
      ),
      Lesson(
        id: 'western_population_03',
        titleSinhala: 'ජනගහනය සහ නගරීකරණය',
        titleTamil: '',
        titleEnglish: 'Population and Urbanization',
        contentSinhala: '''
බස්නාහිර පලාත ශ්‍රී ලංකාවේ වඩාත සිම ජනගහනය ඇති ප්‍රදේශයයි.

ජනගහනය: ~6.1 මිලියන

ජන ඝණත්වය:
• ඉතා ඉහළ (වර්ග කි.මී.ට ~1600 දෙනා)
• කොළඹ දිස්ත්‍රික්කයේ වැඩියෙන්ම

ප්‍රධාන නගර:
1. කොළඹ (වාණිජ අගනුවර)
2. ගම්පහ
3. කෑගල්ල

නගරීකරණය:
✓ ශ්‍රී ලංකාවේ වඩාත්ම නගරගත කලාපය
✓ කර්මාන්ත, වාණිජ, සේවා කේන්ද්‍රය
✓ රැකියා අවස්ථා බහුල

ගැටළු:
⚠ අධික ජනහනය
⚠ ගමනාගමන තදබදය
⚠ පරිසර දූෂණය
⚠ නිවාස හිඟය
        ''',
        contentTamil: '',
        contentEnglish: '',
        imagePaths: [],
        category: LessonCategory.humanGeography,
        gradeLevel: 10,
        order: 3,
        provinceId: 'western',
        keyPoints: [
          'ජනගහනය ~6.1 මිලියන',
          'ඉහළතම ජන ඝණත්වය',
          'කොළඹ - වාණිජ අගනුවර',
          'නගරීකරණ ගැටළු'
        ],
      ),
    ];
  }

  /// North Central Province Lessons
  static List<Lesson> _northCentralProvinceLessons() {
    return [
      Lesson(
        id: 'nc_climate_01',
        titleSinhala: 'වියළි කලාපීය දේශගුණය',
        titleTamil: '',
        titleEnglish: 'Dry Zone Climate',
        contentSinhala: '''
උතුරු මැද පළාත වියළි කලාපයට අයත් වේ.

වර්ෂාපතනය:
• වාර්ෂිකව මි.මී. 1200-1900 අතර
• ඊසාන මෝසම් වාතයෙන් (දෙසැම්බර්-පෙබරවාරි)

උෂ්ණත්වය:
• ඉතා උෂ්ණ (29°C - 35°C)
• මාර්තු-මැයි මාසවල වැඩියෙන්ම උණුසුම්

සුවිශේෂතා:
✓ අඩු වර්ෂාපතනය
✓ දිගු වියළි කාලය
✓ ඉහළ උෂ්ණත්වය
✓ නියං තත්ත්වය පවතී

ඉතිහාසය:
පුරාණ සිංහල රජවරුන් වැව් හා ඇළ මාර්ග හදා වාරිමාර්ග පද්ධතිය ගොඩනැගුවා.
        ''',
        contentTamil: '',
        contentEnglish: '',
        imagePaths: [],
        category: LessonCategory.physicalGeography,
        gradeLevel: 8,
        order: 1,
        provinceId: 'north_central',
        keyPoints: [
          'වියළි කලාපය',
          'වර්ෂාපතනය 1200-1900mm',
          'ඉහළ උෂ්ණත්වය',
          'නියං තත්ත්වය'
        ],
      ),
      Lesson(
        id: 'nc_irrigation_02',
        titleSinhala: 'පුරාණ වාරිමාර්ග පද්ධතිය',
        titleTamil: '',
        titleEnglish: 'Ancient Irrigation System',
        contentSinhala: '''
උතුරු මැද පළාත පුරාණ වාරිමාර්ග තාක්ෂණයේ මධ්‍යයයි.

ප්‍රධාන වැව්:
1. පාරාක්‍රම සමුද්‍රය (පොලොන්නරුව)
2. තිස්ස වැව (අනුරාධපුරය)
3. නුවර වැව
4. බසවකුලම වැව

විශේෂතා:
✓ 2000 වසරකට පෙර ඉදිකළ
✓ විද්‍යාත්මක ඉංජිනේරු සැලසුම්
✓ ජලය ගබඩා කිරීම
✓ අභ්‍යන්තර ඇළ පද්ධතිය

වාරිමාර්ග ක්‍රමය:
වැව → යාල → ඉස්මානා → කුඹුරු

අද භාවිතය:
• කුඹුරු වගාවට
• ජලාශ්‍රිත ශක්තිය (මහවැලි ව්‍යාපෘතිය)
• පානීය ජලය
        ''',
        contentTamil: '',
        contentEnglish: '',
        imagePaths: [],
        category: LessonCategory.humanGeography,
        gradeLevel: 10,
        order: 2,
        provinceId: 'north_central',
        keyPoints: [
          'පාරාක්‍රම සමුද්‍රය',
          'පුරාණ වැව් පද්ධතිය',
          'වියළි කලාපයේ කෘෂිකර්මය',
          'ඉංජිනේරු ශිල්පය'
        ],
      ),
    ];
  }

  /// Uva Province Lessons
  static List<Lesson> _uvaProvinceLessons() {
    return [
      Lesson(
        id: 'uva_tea_01',
        titleSinhala: 'තේ වගාව - ඌව පළාතේ ආර්ථිකය',
        titleTamil: '',
        titleEnglish: 'Tea Cultivation - Economy of Uva',
        contentSinhala: '''
ඌව පළාත ශ්‍රී ලංකාවේ ප්‍රධාන තේ නිෂ්පාදන කලාපයයි.

ඌව තේ:
• ලෝක ප්‍රසිද්ධ රසය
• විශේෂ ගුණාත්මකභාවය
• අපනයන වටිනාකම ඉහළ

වගාවට සුදුසු කොන්දේසි:
✓ උස් බිම් (600-1800m)
✓ සිසිල් දේශගුණය
✓ මධ්‍යස්ථ වර්ෂාපතනය
✓ බිමේ ජල බැස යාම හොඳ

ප්‍රධාන තේ කලාප:
1. බදුල්ල
2. හාල්දුම්මුල්ල
3. බණ්ඩාරවෙල
4. වෙල්ලවාය

ආර්ථික වැදගත්කම:
• විදේශ විනිමය ඉපැයීම
• රැකියා (වතු කම්කරුවන්)
• කෘෂි අපනයන ආදායම
        ''',
        contentTamil: '',
        contentEnglish: '',
        imagePaths: [],
        category: LessonCategory.humanGeography,
        gradeLevel: 11,
        order: 1,
        provinceId: 'uva',
        keyPoints: [
          'ඌව තේ ලොව ප්‍රසිද්ධ',
          'උස් බිම් වගාව',
          'අපනයන ආදායම',
          'වතු කම්කරුවන්'
        ],
      ),
      Lesson(
        id: 'uva_landslides_02',
        titleSinhala: 'නායයාම් - පරිසර අනතුර',
        titleTamil: '',
        titleEnglish: 'Landslides - Environmental Hazard',
        contentSinhala: '''
ඌව පළාත නායයාම් සඳහා ඉහළ අවදානමක් ඇත.

හේතු:
• කඳුකර භූමි ප්‍රදේශ
• අධික වර්ෂාපතනය
• අස්ථීර බෑවුම්
• වන විනාශය
• පාංශු ඛාදනය

අධික අවදනම් ප්‍රදේශ:
⚠ බදුල්ල දිස්ත්‍රික්කය
⚠ මොණරාගල දිස්ත්‍රික්කය
⚠ දැඹදිව, හාල්දුම්මුල්ල

ආරක්ෂණ ක්‍රම:
✓ බෑවුම් ස්ථායීකරණය
✓ ජල බැස යාම වැඩිදියුණු කිරීම
✓ ගස් සිටුවීම
✓ ඉදිකිරීම් නියාම කිරීම

පූර්ව අනතුරු ඇඟවීම:
• වර්ෂාපතනය නිරීක්ෂණය
• භූමිය සෙලවීම
• ප්‍රජාව දැනුවත් කිරීම
        ''',
        contentTamil: '',
        contentEnglish: '',
        imagePaths: [],
        category: LessonCategory.environmentalGeography,
        gradeLevel: 10,
        order: 2,
        provinceId: 'uva',
        keyPoints: [
          'කඳුකර නායයාම්',
          'වර්ෂාව + බෑවුම්',
          'වන විනාශය හේතුවක්',
          'ආරක්ෂණ ක්‍රම අවශ්‍යයි'
        ],
      ),
    ];
  }

  /// Get sample quizzes for all provinces
  static List<Quiz> getQuizzes() {
    return [
      ..._westernProvinceQuizzes(),
      ..._northCentralProvinceQuizzes(),
      ..._uvaProvinceQuizzes(),
      ..._centralProvinceQuizzes(),
    ];
  }

  /// Central Province Lessons
  static List<Lesson> _centralProvinceLessons() {
    return [
      Lesson(
        id: 'central_mahaweli_01',
        titleSinhala: 'මහවැලි ගඟ - ශ්‍රී ලංකාවේ දිගම ගංගාව',
        titleTamil: '',
        titleEnglish: 'Mahaweli River - Longest River in Sri Lanka',
        contentSinhala: '''
මහවැලි ගඟ ශ්‍රී ලංකාවේ දිගම සහ ප්‍රධානතම ගංගාවයි.

දිග: කි.මී. 335ක් පමණ

ප්‍රභවය:
• හත්දෙණිය කන්ද (තේතුල්පොත් කන්ද)
• මධ්‍යම කඳුකරයේ උස්බිම් ප්‍රද��ශයේ

ගමන් මාර්ගය:
1. හත්දෙණිය → නුවර එළිය
2. කඳය → මාතලේ
3. මන්නාරම → පොළොන්නරුව
4. ත්‍රිකුණාමලය අසල මුහුදට බසී යනවා

මහවැලි ව්‍යාපෘතිය:
✓ ශ්‍රී ලංකාවේ විශාලතම සංවර්ධන ව්‍යාපෘතිය
✓ ජලාශ්‍රිත විදුලිය (70% ක් පමණ)
✓ වැව්: වික්ටෝරියා, රන්ටඹේ, කෝට්මලේ
✓ වාරිමාර්ග සඳහා ජලය

වැදගත්කම:
• විදුලිය උත්පාදනය
• වගා බිම් සඳහා වාරිමාර්ග
• ජලාශ්‍රිත සංචාරක ක්‍රියාකාරකම්
        ''',
        contentTamil: '',
        contentEnglish: '',
        imagePaths: [],
        category: LessonCategory.physicalGeography,
        gradeLevel: 9,
        order: 1,
        provinceId: 'central',
        keyPoints: [
          'දිගම ගංගාව - 335km',
          'හත්දෙණිය කන්දේ ප්‍රභවය',
          'මහවැලි ව්‍යාපෘතිය',
          'විදුලිය සහ වාරිමාර්ග'
        ],
      ),
      Lesson(
        id: 'central_tea_02',
        titleSinhala: 'ශ්‍රී ලංකාවේ තේ කර්මාන්තය',
        titleTamil: '',
        titleEnglish: 'Tea Industry of Sri Lanka',
        contentSinhala: '''
මධ්‍යම පළාත ශ්‍රී ලංකාවේ තේ කර්මාන්තයේ හදවත.

තේ වගාවේ ඉතිහාසය:
• 1867 - ජේම්ස් ටේලර්් විසින් ලූලෙකැන්දර වතුගොඩවලින් ආරම්භ කරන ලදී
• කෝපි වතු නාශවීමෙන් පසු තේ ප්‍රධාන භෝගය බවට පත්විය

තේ වගාවට සුදුසු කොන්දේසි:
✓ උස 600m - 2200m අතර
✓ සිසිල් දේශගුණය (15°C - 25°C)
✓ ඉහළ වර්ෂාපතනය (මි.මී. 1900+)
✓ බිම් නොගැලපෙන්න වුවත් බැස යයි

තේ වර්ග:
1. Low Grown (අඩු උස) - 600m ට අඩු
2. Medium Grown (මධ්‍යම උස) - 600m - 1200m
3. High Grown (ඉහළ උස) - 1200m +

ප්‍රධාන තේ වගා කලාප:
• නුවර එළිය
• හත්ටන්
• බදුල්ල
• ඩම්බුල

ආර්ථික වැදගත්කම:
• විදේශ විනිමය ඉපැයීම
• වෘත්තීය සේවක සංඛ්‍යාව ඉහළ
• ශ්‍රී ලංකාව ලොව 4 වන තේ අපනයනකරු
        ''',
        contentTamil: '',
        contentEnglish: '',
        imagePaths: [],
        category: LessonCategory.humanGeography,
        gradeLevel: 10,
        order: 2,
        provinceId: 'central',
        keyPoints: [
          '1867 සිට තේ වගාව',
          'උස සහ උෂ්ණත්වය වැදගත්',
          'නුවර එළිය ප්‍රධාන කලාපය',
          'ලොව 4 වන අපනයනකරු'
        ],
      ),
    ];
  }


  /// Western Province Quizzes
  static List<Quiz> _westernProvinceQuizzes() {
    return [
      Quiz(
        id: 'western_q1',
        questionSinhala: 'බස්නාහිර පලාතේ දේශගුණය කුමක්ද?',
        questionTamil: '',
        questionEnglish: 'What is the climate of Western Province?',
        type: QuizType.multipleChoice,
        options: [
          'තෙත් කලාපීය',
          'වියළි කලාපීය',
          'අතරමැදි',
          'කඳුකර'
        ],
        correctAnswer: 'තෙත් කලාපීය',
        explanationSinhala:
            'බස්නාහිර පලාතේ තෙත් කලාපීය දේශගුණයක් පවතී. වාර්ෂිකව මි.මී. 2500කට වැඩි වර්ෂාපතනයක් ලැබේ.',
        explanationTamil: '',
        explanationEnglish: '',
        points: 10,
        provinceId: 'western',
        difficultyLevel: 1,
      ),
      Quiz(
        id: 'western_q2',
        questionSinhala: 'බස්නාහිර පලාතේ ප්‍රධාන ගංගාව කුමක්ද?',
        questionTamil: '',
        questionEnglish: 'What is the main river of Western Province?',
        type: QuizType.multipleChoice,
        options: [
          'කැළණි ගඟ',
          'මහවැලි ගඟ',
          'කැලු ගඟ',
          'ජින් ගඟ'
        ],
        correctAnswer: 'කැළණි ගඟ',
        explanationSinhala:
            'කැළණි ගඟ බස්නාහිර පලාතේ ප්‍රධානතම ගංගාවයි. හෝටන් තැන්නේ සිට මුහුදට ගලා බසියි.',
        explanationTamil: '',
        explanationEnglish: '',
        points: 10,
        provinceId: 'western',
        difficultyLevel: 1,
      ),
      Quiz(
        id: 'western_q3',
        questionSinhala: 'බස්නාහිර පලාතේ ජනගහනය කාකුද?',
        questionTamil: '',
        questionEnglish: '',
        type: QuizType.multipleChoice,
        options: [
          'මිලියන 3',
          'මිලියන 6.1',
          'මිලියන 1.3',
          'මිලියන 2.5'
        ],
        correctAnswer: 'මිලියන 6.1',
        explanationSinhala:
            'බස්නාහිර පලාතේ ජනගහනය මිලියන 6.1 පමණ වේ. එය ශ්‍රී ලංකාවේ වැඩිම ජනගහනය ඇති පළාතයි.',
        explanationTamil: '',
        explanationEnglish: '',
        points: 10,
        provinceId: 'western',
        difficultyLevel: 2,
      ),
    ];
  }

  /// North Central Province Quizzes
  static List<Quiz> _northCentralProvinceQuizzes() {
    return [
      Quiz(
        id: 'nc_q1',
        questionSinhala: 'උතුරු මැද පළාත අයත් වන්නේ කුමන කලාපයටද?',
        questionTamil: '',
        questionEnglish: '',
        type: QuizType.multipleChoice,
        options: [
          'වියළි කලාපය',
          'තෙත් කලාපය',
          'අතරමැදි කලාපය',
          'කඳුකර කලාපය'
        ],
        correctAnswer: 'වියළි කලාපය',
        explanationSinhala:
            'උතුරු මැද පළාත වියළි කලාපයට අයත් වේ. වාර්ෂික වර්ෂාපතනය මි.මී. 1200-1900 අතර වේ.',
        explanationTamil: '',
        explanationEnglish: '',
        points: 10,
        provinceId: 'north_central',
        difficultyLevel: 1,
      ),
      Quiz(
        id: 'nc_q2',
        questionSinhala: 'පාරාක්‍රම සමුද්‍රය පිහිටා ඇත්තේ කොහිද?',
        questionTamil: '',
        questionEnglish: '',
        type: QuizType.multipleChoice,
        options: [
          'පොලොන්නරුව',
          'අනුරාධපුරය',
          'කොළඹ',
          'බදුල්ල'
        ],
        correctAnswer: 'පොලොන්නරුව',
        explanationSinhala:
            'පාරාක්‍රම සමුද්‍රය පොලොන්නරුවේ පිහිටි පුරාණ වැවකි. මහරජු පාරාක්‍රමබාහු විසින් ඉදිකරන ලදී.',
        explanationTamil: '',
        explanationEnglish: '',
        points: 10,
        provinceId: 'north_central',
        difficultyLevel: 2,
      ),
    ];
  }

  /// Uva Province Quizzes
  static List<Quiz> _uvaProvinceQuizzes() {
    return [
      Quiz(
        id: 'uva_q1',
        questionSinhala: 'ඌව පළාතේ ප්‍රධානතම කෘෂි භෝගය කුමක්ද?',
        questionTamil: '',
        questionEnglish: '',
        type: QuizType.multipleChoice,
        options: [
          'තේ',
          'රතන්',
          'පොල්',
          'කුරුඳු'
        ],
        correctAnswer: 'තේ',
        explanationSinhala:
            'තේ වගාව ඌව පළාතේ ප්‍රධාන කෘෂි භෝගයයි. ඌව තේ ලොව ප්‍රසිද්ධ වේ.',
        explanationTamil: '',
        explanationEnglish: '',
        points: 10,
        provinceId: 'uva',
        difficultyLevel: 1,
      ),
      Quiz(
        id: 'uva_q2',
        questionSinhala: 'ඌව පළාතේ ප්‍රධාන ස්වාභාවික අනතුර කුමක්ද?',
        questionTamil: '',
        questionEnglish: '',
        type: QuizType.multipleChoice,
        options: [
          'නායයාම්',
          'ගං ගැලීම්',
          'නියං තත්ත්වය',
          'සුනාමි'
        ],
        correctAnswer: 'නායයාම්',
        explanationSinhala:
            'නායයාම් ඌව පළාතේ ප්‍රධාන ස්වාභාවික අනතුරයි. කඳුකර භූමිය සහ වර්ෂාපතනය හේතුවෙන් ඇති වේ.',
        explanationTamil: '',
        explanationEnglish: '',
        points: 10,
        provinceId: 'uva',
        difficultyLevel: 2,
      ),
    ];
  }

  /// Central Province Quizzes
  static List<Quiz> _centralProvinceQuizzes() {
    return [
      Quiz(
        id: 'central_q1',
        questionSinhala: 'ශ්‍රී ලංකාවේ දිගම ගංගාව කුමක්ද?',
        questionTamil: '',
        questionEnglish: '',
        type: QuizType.multipleChoice,
        options: [
          'මහවැලි ගඟ',
          'කැළණි ගඟ',
          'කැලු ගඟ',
          'ගින් ගඟ'
        ],
        correctAnswer: 'මහවැලි ගඟ',
        explanationSinhala:
            'මහවැලි ගඟ ශ්‍රී ලංකාවේ දිගම ගංගාවයි. එය කි.මී. 335ක් දිගින් යුක්තය.',
        explanationTamil: '',
        explanationEnglish: '',
        points: 10,
        provinceId: 'central',
        difficultyLevel: 1,
      ),
      Quiz(
        id: 'central_q2',
        questionSinhala: 'මධ්‍යම පළාතේ ප්‍රධානතම කෘෂි භෝගය කුමක්ද?',
        questionTamil: '',
        questionEnglish: '',
        type: QuizType.multipleChoice,
        options: [
          'තේ',
          'රබර්',
          'පොල්',
          'කුරුඳු'
        ],
        correctAnswer: 'තේ',
        explanationSinhala:
            'තේ වගාව මධ්‍යම පළාතේ ප්‍රධාන කෘෂි භෝගයයි. නුවර එළිය, හත්ටන්, බදුල්ල ප්‍රධාන තේ වගා කලාප වේ.',
        explanationTamil: '',
        explanationEnglish: '',
        points: 10,
        provinceId: 'central',
        difficultyLevel: 1,
      ),
    ];
  }
}

