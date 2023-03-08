import 'package:bloc/bloc.dart';
import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.userRepository}) : super(const ProfileInitial()){
   _fetchUserDetails();
  }

  final UserRepository userRepository;

    Future<void>  _fetchUserDetails() async {
    try {
      final user = await userRepository.getCustomer();
      emit(ProfileSuccessful(user: user!));
    }catch (error) {
      emit(const ProfileFailure());
    }
  }

  Future<void> refetch() async {
      emit(const ProfileInProgress());
      _fetchUserDetails();
  }

  void logoutUser() async {
     try {
       await userRepository.signOut();
       emit(const ProfileLogoutOut());
     }catch (error) {
       emit(const ProfileFailure());
     }
  }
}
