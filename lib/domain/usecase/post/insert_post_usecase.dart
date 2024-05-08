import '../../../core/domain/usecase/use_case.dart';
import '../../entity/post/post.dart';
import '../../repository/post/post_repository.dart';

class InsertPostUseCase extends UseCase<int, Post> {
  final PostRepository _postRepository;

  InsertPostUseCase(this._postRepository);

  @override
  Future<int> call({required params}) {
    return _postRepository.insert(params);
  }
}
