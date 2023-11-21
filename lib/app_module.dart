import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova/repositories/storage_repository.dart';
import 'package:prova/services/shared_preferences_service.dart';
import 'functionalities/login/controller/login_page_controller.dart';
import 'functionalities/login/view/login_page.dart';
import 'functionalities/save_text/controller/save_text_controller.dart';
import 'functionalities/save_text/view/save_text_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<LoginController>(LoginController.new);
    i.addSingleton<SaveTextController>(SaveTextController.new);
    i.addSingleton<SharedPreferenceService>(SharedPreferenceService.new);
    i.addSingleton(LocalStorage.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const LoginPage());
    r.child('/saveTextPage', child: (context) => const SaveTextPage());
  }
}
