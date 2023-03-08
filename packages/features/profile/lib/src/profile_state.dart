part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
   const ProfileState();

}

class ProfileInitial extends ProfileState {
   const ProfileInitial();

  @override
  List<Object> get props => [];
}

class ProfileInProgress extends ProfileState {
  const ProfileInProgress();

  @override
  List<Object> get props => [];
}

class ProfileSuccessful extends ProfileState {

  const ProfileSuccessful({required this.user,});

  final Customer user;


  @override
  List<Object?> get props => [user,];

}


class ProfileFailure extends ProfileState {
  const ProfileFailure();
  @override
  List<Object> get props => [];
}

class ProfileLogoutOut extends ProfileState {
  const ProfileLogoutOut();

  @override
  List<Object?> get props => [];
}
