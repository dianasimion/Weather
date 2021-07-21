part of actions;

@freezed
class GetLocation with _$GetLocation implements AppAction {
  const factory GetLocation() = GetLocationStart;

  const factory GetLocation.successful(Location location) = GetLocationSuccessful;

  @Implements(ErrorAction)
  const factory GetLocation.error(Object error, StackTrace stackTrace) = GetLocationError;
}

// class GetLocation {
//   @override
//   String toString() {
//     return 'GetLocation{}';
//   }
// }
//
// class GetLocationSuccessful {
//   GetLocationSuccessful(this.location);
//
//   final Location location;
//
//   @override
//   String toString() {
//     return 'GetLocationSuccessful{location: $location}';
//   }
// }
//
// class GetLocationError {
//   GetLocationError(this.error);
//
//   final dynamic error;
//
//   @override
//   String toString() {
//     return 'GetLocationError{error: $error}';
//   }
// }
