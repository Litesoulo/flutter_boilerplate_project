import 'dart:async';

import '../../../di/service_locator.dart';
import '../../repository/post/post_repository.dart';
import '../../repository/user/user_repository.dart';
import '../../usecase/post/delete_post_usecase.dart';
import '../../usecase/post/find_post_by_id_usecase.dart';
import '../../usecase/post/get_post_usecase.dart';
import '../../usecase/post/insert_post_usecase.dart';
import '../../usecase/post/udpate_post_usecase.dart';
import '../../usecase/user/is_logged_in_usecase.dart';
import '../../usecase/user/login_usecase.dart';
import '../../usecase/user/save_login_in_status_usecase.dart';

mixin UseCaseModule {
  static Future<void> configureUseCaseModuleInjection() async {
    // user:--------------------------------------------------------------------
    sl.registerSingleton<IsLoggedInUseCase>(
      IsLoggedInUseCase(sl<UserRepository>()),
    );
    sl.registerSingleton<SaveLoginStatusUseCase>(
      SaveLoginStatusUseCase(sl<UserRepository>()),
    );
    sl.registerSingleton<LoginUseCase>(
      LoginUseCase(sl<UserRepository>()),
    );

    // post:--------------------------------------------------------------------
    sl.registerSingleton<GetPostUseCase>(
      GetPostUseCase(sl<PostRepository>()),
    );
    sl.registerSingleton<FindPostByIdUseCase>(
      FindPostByIdUseCase(sl<PostRepository>()),
    );
    sl.registerSingleton<InsertPostUseCase>(
      InsertPostUseCase(sl<PostRepository>()),
    );
    sl.registerSingleton<UpdatePostUseCase>(
      UpdatePostUseCase(sl<PostRepository>()),
    );
    sl.registerSingleton<DeletePostUseCase>(
      DeletePostUseCase(sl<PostRepository>()),
    );
  }
}
