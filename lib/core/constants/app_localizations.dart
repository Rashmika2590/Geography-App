/// Multi-language support helper class
class AppLocalizations {
  // Common
  static String loading(String lang) {
    switch (lang) {
      case 'si': return 'පූරණය වෙමින්...';
      case 'ta': return 'ஏற்றுகிறது...';
      default: return 'Loading...';
    }
  }

  static String error(String lang) {
    switch (lang) {
      case 'si': return 'දෝෂයක්';
      case 'ta': return 'பிழை';
      default: return 'Error';
    }
  }

  static String retry(String lang) {
    switch (lang) {
      case 'si': return 'නැවත උත්සාහ කරන්න';
      case 'ta': return 'மீண்டும் முயற்சிக்கவும்';
      default: return 'Retry';
    }
  }

  static String next(String lang) {
    switch (lang) {
      case 'si': return 'ඊළඟ';
      case 'ta': return 'அடுத்து';
      default: return 'Next';
    }
  }

  static String previous(String lang) {
    switch (lang) {
      case 'si': return 'පෙර';
      case 'ta': return 'முந்தைய';
      default: return 'Previous';
    }
  }

  static String finish(String lang) {
    switch (lang) {
      case 'si': return 'අවසන්';
      case 'ta': return 'முடி';
      default: return 'Finish';
    }
  }

  static String start(String lang) {
    switch (lang) {
      case 'si': return 'ආරම්භ කරන්න';
      case 'ta': return 'தொடங்கு';
      default: return 'Start';
    }
  }

  // Home
  static String homeTitle(String lang) {
    switch (lang) {
      case 'si': return 'ශ්‍රී ලංකාව';
      case 'ta': return 'இலங்கை';
      default: return 'Sri Lanka';
    }
  }

  static String selectProvince(String lang) {
    switch (lang) {
      case 'si': return 'පළාතක් තෝරන්න';
      case 'ta': return 'மாகாணத்தை தேர்ந்தெடுக்கவும்';
      default: return 'Select Province';
    }
  }

  // Lessons
  static String lessons(String lang) {
    switch (lang) {
      case 'si': return 'පාඩම්';
      case 'ta': return 'பாடங்கள்';
      default: return 'Lessons';
    }
  }

  static String lessonCompleted(String lang) {
    switch (lang) {
      case 'si': return 'පාඩම සම්පූර්ණයි';
      case 'ta': return 'பாடம் நிறைவு';
      default: return 'Lesson Completed';
    }
  }

  static String markComplete(String lang) {
    switch (lang) {
      case 'si': return 'සම්පූර්ණ ලෙස සලකුණු කරන්න';
      case 'ta': return 'முடிந்ததாக குறி';
      default: return 'Mark Complete';
    }
  }

  static String completed(String lang) {
    switch (lang) {
      case 'si': return 'සම්පූර්ණ';
      case 'ta': return 'முடிந்தது';
      default: return 'Completed';
    }
  }

  static String physicalGeography(String lang) {
    switch (lang) {
      case 'si': return 'භෞතික භූගෝලය';
      case 'ta': return 'இயற்பியல் புவியியல்';
      default: return 'Physical Geography';
    }
  }

  static String humanGeography(String lang) {
    switch (lang) {
      case 'si': return 'මානව භූගෝලය';
      case 'ta': return 'மனித புவியியல்';
      default: return 'Human Geography';
    }
  }

  static String environmentalGeography(String lang) {
    switch (lang) {
      case 'si': return 'පරිසර භූගෝලය';
      case 'ta': return 'சுற்றுச்சூழல் புவியியல்';
      default: return 'Environmental Geography';
    }
  }

  // Quizzes
  static String quizzes(String lang) {
    switch (lang) {
      case 'si': return 'ප්‍රශ්නාවලි';
      case 'ta': return 'வினாக்கள்';
      default: return 'Quizzes';
    }
  }

  static String quizCompleted(String lang) {
    switch (lang) {
      case 'si': return 'ප්‍රශ්නාවලිය අවසන්!';
      case 'ta': return 'வினா முடிந்தது!';
      default: return 'Quiz Completed!';
    }
  }

  static String yourScore(String lang) {
    switch (lang) {
      case 'si': return 'ඔබේ ලකුණු';
      case 'ta': return 'உங்கள் மதிப்பெண்';
      default: return 'Your Score';
    }
  }

  static String points(String lang) {
    switch (lang) {
      case 'si': return 'ලකුණු';
      case 'ta': return 'புள்ளிகள்';
      default: return 'Points';
    }
  }

  static String level(String lang) {
    switch (lang) {
      case 'si': return 'මට්ටම';
      case 'ta': return 'நிலை';
      default: return 'Level';
    }
  }

  // Province Info
  static String climate(String lang) {
    switch (lang) {
      case 'si': return 'දේශගුණය';
      case 'ta': return 'காலநிலை';
      default: return 'Climate';
    }
  }

  static String rainfall(String lang) {
    switch (lang) {
      case 'si': return 'වර්ෂාපතනය';
      case 'ta': return 'மழை';
      default: return 'Rainfall';
    }
  }

  static String rivers(String lang) {
    switch (lang) {
      case 'si': return 'ගංගා';
      case 'ta': return 'ஆறுகள்';
      default: return 'Rivers';
    }
  }

  static String agriculture(String lang) {
    switch (lang) {
      case 'si': return 'කෘෂිකර්මය';
      case 'ta': return 'விவசாயம்';
      default: return 'Agriculture';
    }
  }

  static String population(String lang) {
    switch (lang) {
      case 'si': return 'ජනගහනය';
      case 'ta': return 'மக்கள்தொகை';
      default: return 'Population';
    }
  }

  static String naturalDisasters(String lang) {
    switch (lang) {
      case 'si': return 'ස්වාභාවික විපත්';
      case 'ta': return 'இயற்கை பேரிடர்கள்';
      default: return 'Natural Disasters';
    }
  }

  static String touristAttractions(String lang) {
    switch (lang) {
      case 'si': return 'සංචාරක ආකර්ෂණ';
      case 'ta': return 'சுற்றுலா இடங்கள்';
      default: return 'Tourist Attractions';
    }
  }

  // Map & Legend
  static String provinceMap(String lang) {
    switch (lang) {
      case 'si': return 'පළාත් සිතියම';
      case 'ta': return 'மாகாண வரைபடம்';
      default: return 'Province Map';
    }
  }

  static String wetZone(String lang) {
    switch (lang) {
      case 'si': return 'තෙත් කලාපය';
      case 'ta': return 'ஈரமான மண்டலம்';
      default: return 'Wet Zone';
    }
  }

  static String dryZone(String lang) {
    switch (lang) {
      case 'si': return 'වියළි කලාපය';
      case 'ta': return 'உலர்ந்த மண்டலம்';
      default: return 'Dry Zone';
    }
  }

  static String montaneZone(String lang) {
    switch (lang) {
      case 'si': return 'කඳුකර කලාපය';
      case 'ta': return 'மலை மண்டலம்';
      default: return 'Montane Zone';
    }
  }

  // Card Labels
  static String million(String lang) {
    switch (lang) {
      case 'si': return 'මිලියන';
      case 'ta': return 'மில்லியன்';
      default: return 'Million';
    }
  }

  static String progressLabel(String lang) {
    switch (lang) {
      case 'si': return 'ප්‍රගතිය';
      case 'ta': return 'முன்னேற்றம்';
      default: return 'Progress';
    }
  }
}
