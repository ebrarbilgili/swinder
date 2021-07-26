import 'package:mobx/mobx.dart';
import '../../../core/cache/shared/shared_pref_cache.dart';

part 'choose_sex_viewmodel.g.dart';

class ChooseSexViewModel = _ChooseSexViewModelBase with _$ChooseSexViewModel;

abstract class _ChooseSexViewModelBase with Store {
  @observable
  int? sex;
  @observable
  int? choosesex;

  @observable
  bool chooseControl = false;

  @observable
  bool isAccepted = false;

  @action
  void onPressedYourGender(String gender, int number) {
    sex = number;
    print('sex: $sex');
  }

  @action
  void onPressedPreferGender(String gender, int number) {
    choosesex = number;
    print('choosesex: $choosesex');
  }

  void onPressAccepted(bool value) {
    isAccepted = value;

    SharedPreferencesConstant.instance.setBoolValue('isAccepted', isAccepted);
  }

  @action
  void onPressedGoButton() {
    chooseControl = true;
  }
}
