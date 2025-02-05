// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `camera`
  String get camera {
    return Intl.message('camera', name: 'camera', desc: '', args: []);
  }

  /// `Search for people`
  String get searchForUsers {
    return Intl.message(
      'Search for people',
      name: 'searchForUsers',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `IGTV`
  String get IGTV {
    return Intl.message('IGTV', name: 'IGTV', desc: '', args: []);
  }

  /// `Shop`
  String get shop {
    return Intl.message('Shop', name: 'shop', desc: '', args: []);
  }

  /// `Style`
  String get style {
    return Intl.message('Style', name: 'style', desc: '', args: []);
  }

  /// `Sports`
  String get sports {
    return Intl.message('Sports', name: 'sports', desc: '', args: []);
  }

  /// `Auto`
  String get auto {
    return Intl.message('Auto', name: 'auto', desc: '', args: []);
  }

  /// `Music`
  String get music {
    return Intl.message('Music', name: 'music', desc: '', args: []);
  }

  /// `No Users found`
  String get noUsers {
    return Intl.message('No Users found', name: 'noUsers', desc: '', args: []);
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `change theme`
  String get changeTheme {
    return Intl.message(
      'change theme',
      name: 'changeTheme',
      desc: '',
      args: [],
    );
  }

  /// `posts`
  String get posts {
    return Intl.message('posts', name: 'posts', desc: '', args: []);
  }

  /// `Followers`
  String get followers {
    return Intl.message('Followers', name: 'followers', desc: '', args: []);
  }

  /// `Following`
  String get following {
    return Intl.message('Following', name: 'following', desc: '', args: []);
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Archive`
  String get archive {
    return Intl.message('Archive', name: 'archive', desc: '', args: []);
  }

  /// `Your Activity`
  String get yourActivity {
    return Intl.message(
      'Your Activity',
      name: 'yourActivity',
      desc: '',
      args: [],
    );
  }

  /// `Nametag`
  String get nameTag {
    return Intl.message('Nametag', name: 'nameTag', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Close Friends`
  String get closeFriends {
    return Intl.message(
      'Close Friends',
      name: 'closeFriends',
      desc: '',
      args: [],
    );
  }

  /// `Discover People`
  String get discoverPeople {
    return Intl.message(
      'Discover People',
      name: 'discoverPeople',
      desc: '',
      args: [],
    );
  }

  /// `Open Facebook`
  String get openFacebook {
    return Intl.message(
      'Open Facebook',
      name: 'openFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `You`
  String get you {
    return Intl.message('You', name: 'you', desc: '', args: []);
  }

  /// `Change Language`
  String get changeLang {
    return Intl.message(
      'Change Language',
      name: 'changeLang',
      desc: '',
      args: [],
    );
  }

  /// `Name       `
  String get name {
    return Intl.message('Name       ', name: 'name', desc: '', args: []);
  }

  /// `UserName`
  String get userName {
    return Intl.message('UserName', name: 'userName', desc: '', args: []);
  }

  /// `Website    `
  String get website {
    return Intl.message('Website    ', name: 'website', desc: '', args: []);
  }

  /// `Bio            `
  String get bio {
    return Intl.message('Bio            ', name: 'bio', desc: '', args: []);
  }

  /// `Switch to Professional Account`
  String get switchToProf {
    return Intl.message(
      'Switch to Professional Account',
      name: 'switchToProf',
      desc: '',
      args: [],
    );
  }

  /// `Private Information`
  String get privateInfo {
    return Intl.message(
      'Private Information',
      name: 'privateInfo',
      desc: '',
      args: [],
    );
  }

  /// `Email       `
  String get email {
    return Intl.message('Email       ', name: 'email', desc: '', args: []);
  }

  /// `Phone      `
  String get phone {
    return Intl.message('Phone      ', name: 'phone', desc: '', args: []);
  }

  /// `Gender    `
  String get gender {
    return Intl.message('Gender    ', name: 'gender', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `Change Profile Photo`
  String get changeProfilePic {
    return Intl.message(
      'Change Profile Photo',
      name: 'changeProfilePic',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
