import 'app_configurations/app_environments.dart';
import 'common/enum_manager.dart';
import 'root_app.dart';

void main(){
  AppEnvironments.setUpEnvironments(Environment.dev);
  mainDelegateForEnvironments();
}