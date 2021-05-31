abstract class INavigatorService {
  Future<void> navigatorToPage({String path, Object data});
  Future<void> navigatorToPageClear({String path, Object data});
}
