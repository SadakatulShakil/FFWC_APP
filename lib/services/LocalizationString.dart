import 'package:get/get.dart';

class LocalizationString extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {

      //Bottom Nav Bar
      'home': 'Home',
      'flood_info': 'Flood Info',
      'flood_alert': 'Flood Alert',
      'profile': 'Profile',

      //Login Page
      'app_name': 'FFWC App',
      'welcome_login': 'LOGIN',
      'login_greetings': 'Please login safely to your account',
      'welcome_message': 'Welcome to the FFWC App',
      'mobile_no_hint': 'Enter Mobile Number',
      'login_btn': 'Login',

      //Otp Page
      'otp_title': 'OTP VERIFICATION',
      'otp_message': 'Enter the OTP sent to:',
      'wait': 'Wait ',
      'after_wait': ' seconds to send new code.',
      'resend_otp': 'RESEND CODE',

      //Dashboard
      'location_text': 'Mirpur DOHS, Dhaka, Bangladesh',
      'temperature': '32',
      'base': '°C',
      'low': '28°C',
      'high': '35°C',
      'wind': '15%',
      'weather_condition': 'Pretty Cloudy',
      'feels_like': 'Feels Like 36°C',
      'marquee_text': '🚨 Flood Alert: (23 June 2025) Water levels in the Teesta, Dharla, and Dudhkumar rivers may rise over the next 2 days and may flow near the warning level (close to danger level) in the next 48 hours. ✦✦ See daily reports for detailed forecasts.',

      //Profile
      'profile_title': 'Profile',
      'profile_info': 'Profile Info',
      'settings': 'Settings',
      'profile_logout': 'Logout',
      'profile_info_name': 'Full Name',
      'profile_info_email': 'Email Address',
      'profile_info_address': 'Address',
      'profile_info_update_button': 'Update Profile Info',
      'profile_language_select': 'Select Language',
      'theme_select': 'Select Theme',
      'profile_logout_text': 'Logging out? We will be here when you are back!',
      'confirm_btn': 'Confirm',

      // Additional strings
      'station_condition': 'Station Condition',
      'other_features': 'Other Features',
      'severe_flood': 'Severe Flood',
      'flood': 'Flood',
      'warning': 'Warning',
      'normal': 'Normal',
      'severe_mz': 'More than 1 m above danger level',
      'flood_mz': 'Its Above danger level',
      'warning_mz': 'Within 50 cm below danger level',
      'normal_mz': 'More than 50 cm below danger level',
      'forecast_bulletin': 'Forecast & Bulletin',
      'rainfall_info': 'Rainfall Information',
      'water_level_forecast': 'Water Level Forecast',
      'inundation_map': 'Inundation Map',

      //Station information
      'last_update_news': 'Last Update: Sunday, 24 June 2024, 9:00 PM',
      'map_view': 'Map View',
      'list_view': 'List View',
      'search_text': 'Search by Station Name',
      'no_results_found': 'No results found',

      //Pdf Page
      'pdf_page': 'PDF Preview',
      'go_to_page': 'Go to Page',
      'page_number': 'Enter Page Number',
      'cancel': 'Cancel',
      'go': 'Go',

    },
    'bn_BD': {

      //Bottom Nav Bar
      'home': 'হোম',
      'flood_info': 'বন্যা তথ্য',
      'flood_alert': 'বন্যা সতর্কতা',
      'profile': 'প্রোফাইল',

      //Login Page
      'app_name': 'এফএফডব্লিউসি অ্যাপ',
      'welcome_login': 'লগইন',
      'login_greetings': 'আপনার অ্যাকাউন্টে নিরাপদে লগইন করুন',
      'welcome_message': 'এফএফডব্লিউসি অ্যাপে আপনাকে স্বাগতম',
      'mobile_no_hint': 'মোবাইল নম্বর লিখুন',
      'login_btn': 'লগইন',

      //Otp Page
      'otp_title': 'ওটিপি যাচাইকরণ',
      'otp_message': 'আপনার ওটিপি লিখুন যা পাঠানো হয়েছে: ',
      'wait': 'অপেক্ষা করুন ',
      'after_wait': ' সেকেন্ড নতুন কোড পাঠানোর জন্য',
      'resend_otp': 'কোড পুনরায় পাঠান',

      //Dashboard
      'location_text': 'মিরপুর ডিওএইচএস, ঢাকা, বাংলাদেশ',
      'temperature': '৩২',
      'base': '°সে',
      'low': '২৮°সে',
      'high': '৩৫°সে',
      'wind': '১৫%',
      'weather_condition': 'আংশিক মেঘলা',
      'feels_like': '৩৬° সেলসিয়াস মনে হচ্ছে',
      'marquee_text': '🚨 বন্যা সতর্কতা: (২৩ জুন ২০২৫) তিস্তা, ধরলা ও দুধকুমার নদীসমূহের পানি আগামী ০২ দিন বৃদ্ধি পেতে পারে এবং আগামী ৪৮ ঘণ্টায় তিস্তা নদীর পানি সতর্কসীমায় (বিপদসীমার কাছাকাছি) প্রবাহিত হতে পারে। ✦✦ বিস্তারিত পূর্বাভাসের জন্য দৈনিক প্রতিবেদন দেখুন।',

      //Profile
      'profile_title': 'প্রোফাইল',
      'profile_info': 'প্রোফাইল তথ্য',
      'settings': 'সেটিংস',
      'profile_logout': 'লগ আউট',
      'profile_info_name': 'পুরো নাম',
      'profile_info_email': 'ইমেল ঠিকানা',
      'profile_info_address': 'ঠিকানা',
      'profile_info_update_button': 'প্রোফাইল তথ্য হালনাগাদ করুন',
      'profile_language_select': 'ভাষা নির্বাচন করুন',
      'theme_select': 'থিম নির্বাচন করুন',
      'profile_logout_text': 'লগ আউট করতে চান? আমরা আবার দেখা হবে যখন আপনি ফিরে আসবেন!',
      'confirm_btn': 'নিশ্চিত করুন',

      // Additional strings
      'station_condition': 'স্টেশনের বর্তমান অবস্থা',
      'other_features': 'অন্যান্য বৈশিষ্ট্য',
      'severe_flood': 'তীব্র বন্যা',
      'flood': 'বন্যা',
      'warning': 'সতর্কতা',
      'normal': 'স্বাভাবিক',
      'severe_mz': 'বিপদসীমার ১ মিটার উপরে',
      'flood_mz': 'পানি বিপদসীমার উপরে',
      'warning_mz': 'বিপদসীমার ৫০ সেন্টিমিটার নিচে',
      'normal_mz': 'বিপদসীমার ৫০ সেন্টিমিটার নিচে',
      'forecast_bulletin': 'পূর্বাভাস ও বুলেটিন',
      'rainfall_info': 'বৃষ্টিপাতের তথ্য',
      'water_level_forecast': 'জলস্তরের পূর্বাভাস',
      'inundation_map': 'জলাবদ্ধতা মানচিত্র',

      //Station information
      'last_update_news': 'সর্বশেষ আপডেট: রবিবার ২৪ জুন, ২০২৪ রাত ৯.০০ টা',
      'map_view': 'মানচিত্র দেখুন',
      'list_view': 'তালিকা দেখুন',
      'search_text': 'স্টেশন অনুসারে অনুসন্ধান করুন',
      'no_results_found': 'কোন ফলাফল পাওয়া যায়নি',

      //Pdf Page
      'pdf_page': 'পিডিএফ প্রিভিউ',
      'go_to_page': 'পৃষ্ঠায় যান',
      'page_number': 'পৃষ্ঠা নম্বর লিখুন',
      'cancel': 'বাতিল',
      'go': 'যাও',
    }
  };
}
