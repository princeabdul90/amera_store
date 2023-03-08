
/*
part 'profile_event.dart';
part 'profile_state.dart';


class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required this.userRepository,
  }) : super(
          const ProfileInProgress(),
        ) {
    on<ProfileStarted>((_, emit) async {

    });
    on<ProfileSignedOut>((_, emit) async {
      final currentState = state as ProfileLoaded;
      final newState = currentState.copyWith(
        isSignOutInProgress: true,
      );

      emit(newState);

      await userRepository.signOut();
    });
  }

  final UserRepository userRepository;
}

 */
