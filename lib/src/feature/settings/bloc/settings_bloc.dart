import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:weather_and_dress/src/feature/app/model/app_theme.dart';
import 'package:weather_and_dress/src/feature/settings/data/locale_repository.dart';
import 'package:weather_and_dress/src/feature/settings/data/theme_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

/// Business Logic Component SeetingsBLoC
class SettingsBLoC extends Bloc<SettingsEvent, SettingsState> {
  SettingsBLoC({
    required LocaleRepository localeRepository,
    required ThemeRepository themeRepository,
    required SettingsState initialState,
  })  : _localeRepo = localeRepository,
        _themeRepo = themeRepository,
        super(initialState) {
    on<SettingsEvent>(
      (event, emit) => event.map<Future<void>>(
        updateTheme: (event) => _updateTheme(event, emit),
        updateLocale: (event) => _updateLocale(event, emit),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  LocaleRepository _localeRepo;
  final ThemeRepository _themeRepo;

  /// Fetch event handler
  Future<void> _updateTheme(
    _UpdateThemeEvent event,
    Emitter<SettingsState> emitter,
  ) async {
    emitter(
      SettingsState.processing(
        theme: state.theme,
        locale: state.locale,
      ),
    );

    try {
      await _themeRepo.setTheme(event.theme);

      emitter(
        SettingsState.idle(theme: event.theme, locale: state.locale),
      );
    } on Object catch (e) {
      emitter(
        SettingsState.error(
          theme: state.theme,
          locale: state.locale,
        ),
      );
      rethrow;
    }
  }

  Future<void> _updateLocale(
    _UpdateLocaleEvent event,
    Emitter<SettingsState> emitter,
  ) async {
    emitter(
      SettingsState.processing(
        theme: state.theme,
        locale: state.locale,
      ),
    );

    try {
      await _localeRepo.setLocale(event.locale);

      emitter(
        SettingsState.idle(theme: state.theme, locale: event.locale),
      );
    } on Object catch (e) {
      emitter(
        SettingsState.error(
          theme: state.theme,
          locale: state.locale,
        ),
      );
      rethrow;
    }
  }
}

class SeetingsEvent {}
