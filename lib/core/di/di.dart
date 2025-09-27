import 'package:shop_app/core/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

var getIt = GetIt.instance ; /// انا كريت variable  لل app كلو عشان اشتغل بية

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();  ///لازم configureDependencies() دية  اعرفها الفانكشن دية في ال التطبيق روح عرفها في ال main  هنا بقا بقا هتتعمل لوحدها مش زي ال news لازم اعرف كل حاجة لا انا هاعمل Injectable@ واكتبها كدا وخلاص واكتبها بردوا عند الحاجة الي عايز تعرفها لل get it زي commerceservices  انا كتبت حاجتين عشان هناك عشان اعرفهم عند ال get it ل Injectable@ and @factoryMethod  وهوا هيعملها لوحدها