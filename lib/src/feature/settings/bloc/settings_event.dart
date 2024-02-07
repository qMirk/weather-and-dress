part of 'settings_bloc.dart';

/// Business Logic Component SettingsEvent
@immutable
sealed class SettingsEvent extends _$SettingsEventBase {
  const SettingsEvent();

  const factory SettingsEvent.updateLocale({
    required Locale locale,
  }) = _UpdateLocaleEvent;
  const factory SettingsEvent.updateTheme({
    required AppTheme theme,
  }) = _UpdateThemeEvent;
}

final class _UpdateLocaleEvent extends SettingsEvent {
  const _UpdateLocaleEvent({
    required this.locale,
  }) : super();

  final Locale locale;

  @override
  String toString() {
    final buffer = StringBuffer()
      ..write('SettingsEvent.fetch(')
      ..write('name: $locale, ')
      ..write(')');
    return buffer.toString();
  }
}

final class _UpdateThemeEvent extends SettingsEvent {
  const _UpdateThemeEvent({
    required this.theme,
  }) : super();

  final AppTheme theme;

  @override
  String toString() {
    final buffer = StringBuffer()
      ..write('SettingsEvent.fetch(')
      ..write('name: $theme, ')
      ..write(')');
    return buffer.toString();
  }
}

typedef SettingsEventMatch<R, E extends SettingsEvent> = R Function(E event);

abstract base class _$SettingsEventBase {
  const _$SettingsEventBase();

  R map<R>({
    required SettingsEventMatch<R, _UpdateLocaleEvent> updateLocale,
    required SettingsEventMatch<R, _UpdateThemeEvent> updateTheme,
  }) =>
      switch (this) {
        final _UpdateLocaleEvent e => updateLocale(e),
        final _UpdateThemeEvent e => updateTheme(e),
        _ => throw AssertionError(),
      };

  R maybeMap<R>({
    required R Function() orElse,
    SettingsEventMatch<R, _UpdateLocaleEvent>? updateLocale,
    SettingsEventMatch<R, _UpdateThemeEvent>? updateTheme,
  }) =>
      map<R>(
        updateLocale: updateLocale ?? (_) => orElse(),
        updateTheme: updateTheme ?? (_) => orElse(),
      );

  R? mapOrNull<R>({
    SettingsEventMatch<R, _UpdateLocaleEvent>? updateLocale,
    SettingsEventMatch<R, _UpdateThemeEvent>? updateTheme,
  }) =>
      map<R?>(
        updateLocale: updateLocale ?? (_) => null,
        updateTheme: updateTheme ?? (_) => null,
      );
}
