/// Screen status enum
/// [loading] - Screen is loading
/// [error] - Screen has error
/// [success] - Screen is success
/// [initial] - Screen is initial
///
/// Example:
/// ```
/// ScreenStatus currentStatus = ScreenStatus.initial;
/// if (currentStatus == ScreenStatus.initial) {
/// setState(() {
///  currentStatus = ScreenStatus.loading;
///  == API CALL ==
/// currentStatus = ScreenStatus.success;
/// });
///  if (currentStatus == ScreenStatus.loading) {
/// return CircularProgressIndicator();
/// }
/// if (currentStatus == ScreenStatus.success) {
/// return Text('Success');
/// }
///
/// ```
///
enum ScreenStatus {
  loading,
  error,
  success,
  initial,
}
