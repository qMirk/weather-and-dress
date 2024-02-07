part of 'settings_bloc.dart';


/// Entity placeholder for SettingsState
/// {@endtemplate}
typedef SettingsEntity = Object;

/// {@template }
/// SettingsState.
/// {@endtemplate}
sealed class SettingsState extends _$SettingsStateBase {
  /// Idling state
  /// {@macro }
  const factory SettingsState.idle({
  required  Locale? locale,
  required  AppTheme? theme,
  }) = SettingsState$Idle;

  /// Processing
  /// {@macro }
  const factory SettingsState.processing({
   required  Locale? locale,
  required  AppTheme? theme,
  }) = SettingsState$Processing;

  /// Successful
  /// {@macro }
  const factory SettingsState.successful({
   required Locale locale,
   required AppTheme theme, 
    String message,
  }) = SettingsState$Successful;

  /// An error has occurred
  /// {@macro }
  const factory SettingsState.error({
  required  Locale? locale,
  required  AppTheme? theme,
  
  }) = SettingsState$Error;

  /// {@macro }
  const SettingsState({required super.locale, required super.theme, required super.message});
}

/// Idling state
/// {@nodoc}
final class SettingsState$Idle extends SettingsState with _$SettingsState {
  /// {@nodoc}
  const SettingsState$Idle({required super.locale, required super.theme, super.message = 'Idling'});
}

/// Processing
/// {@nodoc}
final class SettingsState$Processing extends SettingsState with _$SettingsState {
  /// {@nodoc}
  const SettingsState$Processing({required super.locale, required super.theme, super.message = 'Processing'});
}

/// Successful
/// {@nodoc}
final class SettingsState$Successful extends SettingsState with _$SettingsState {
  /// {@nodoc}
  const SettingsState$Successful({required super.locale, required super.theme, super.message = 'Successful'});
}

/// Error
/// {@nodoc}
final class SettingsState$Error extends SettingsState with _$SettingsState {
  /// {@nodoc}
  const SettingsState$Error({required super.locale, required super.theme, super.message = 'An error has occurred.'});
}

/// {@nodoc}
base mixin _$SettingsState on SettingsState {}

/// Pattern matching for [SettingsState].
typedef SettingsStateMatch<R, S extends SettingsState> = R Function(S state);

/// {@nodoc}
@immutable
abstract base class _$SettingsStateBase {
  /// {@nodoc}
  const _$SettingsStateBase({required this.locale, required this.theme, required this.message});

  /// Data entity payload.
  // @nonVirtual
  // final SettingsEntity? data;

/// Data entity payload.
  @nonVirtual
  final AppTheme? theme;
  
  /// Data entity payload.
  @nonVirtual
  final Locale? locale;

  /// Message or state description.
  @nonVirtual
  final String message;

  /// Has data?
  bool get hasData => locale != null;

  /// If an error has occurred?
  bool get hasError => maybeMap<bool>(orElse: () => false, error: (_) => true);

  /// Is in progress state?
  bool get isProcessing => maybeMap<bool>(orElse: () => false, processing: (_) => true);

  /// Is in idle state?
  bool get isIdling => !isProcessing;

  /// Pattern matching for [SettingsState].
  R map<R>({
    required SettingsStateMatch<R, SettingsState$Idle> idle,
    required SettingsStateMatch<R, SettingsState$Processing> processing,
    required SettingsStateMatch<R, SettingsState$Successful> successful,
    required SettingsStateMatch<R, SettingsState$Error> error,
  }) =>
      switch (this) {
        SettingsState$Idle s => idle(s),
        SettingsState$Processing s => processing(s),
        SettingsState$Successful s => successful(s),
        SettingsState$Error s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [SettingsState].
  R maybeMap<R>({
    SettingsStateMatch<R, SettingsState$Idle>? idle,
    SettingsStateMatch<R, SettingsState$Processing>? processing,
    SettingsStateMatch<R, SettingsState$Successful>? successful,
    SettingsStateMatch<R, SettingsState$Error>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [SettingsState].
  R? mapOrNull<R>({
    SettingsStateMatch<R, SettingsState$Idle>? idle,
    SettingsStateMatch<R, SettingsState$Processing>? processing,
    SettingsStateMatch<R, SettingsState$Successful>? successful,
    SettingsStateMatch<R, SettingsState$Error>? error,
  }) =>
      map<R?>(
        idle: idle ?? (_) => null,
        processing: processing ?? (_) => null,
        successful: successful ?? (_) => null,
        error: error ?? (_) => null,
      );

  @override
  int get hashCode => locale.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other);
}
