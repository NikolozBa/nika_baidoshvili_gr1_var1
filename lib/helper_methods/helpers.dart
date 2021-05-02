import 'package:nika_baidoshvili_gr1_var1/data/clothes_model.dart';
import 'package:nika_baidoshvili_gr1_var1/data/dummy_data.dart';

class Helpers{

  static addClothes(Clothes item){
    DUMMY_DATA.add(item);
  }

  static deleteClothes(Clothes item){
    DUMMY_DATA.removeWhere((element) => element==item);
  }

  static editItem(Clothes item, int index) {
    DUMMY_DATA.replaceRange(index, index + 1, [item]);
  }

}
