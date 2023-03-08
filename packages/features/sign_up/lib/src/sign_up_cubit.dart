import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:form_fields/form_fields.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({
    required this.userRepository
}) : super(const SignUpState());

  final UserRepository userRepository;

  void onEmailChanged(String newValue) {
    final previousEmail = state.email;
    final shouldValidate = previousEmail.invalid;
    final newState = state.copyWith(
      email: shouldValidate
          ? Email.validated(
        newValue,
        isAlreadyRegistered: newValue == previousEmail.value
            ? previousEmail.isAlreadyRegistered
            : false,
      )
          : Email.unvalidated(
        newValue,
      ),
    );
    emit(newState);
  }

  void onEmailUnfocused() {
    final newState = state.copyWith(
      email: Email.validated(
        state.email.value,
        isAlreadyRegistered: state.email.isAlreadyRegistered,
      ),
    );

    emit(newState);
  }

  void onPasswordChanged(String newValue) {
    final previousPassword = state.password;
    final shouldValidate = previousPassword.invalid;
    final newState = state.copyWith(
      password: shouldValidate
          ? Password.validated(
        newValue,
      )
          : Password.unvalidated(
        newValue,
      ),
    );

    emit(newState);
  }

  void onPasswordUnfocused() {
    final newState = state.copyWith(
      password: Password.validated(
        state.password.value,
      ),
    );
    emit(newState);
  }

  void onPasswordConfirmationChanged(String newValue) {
    final previousPasswordConfirmation = state.passwordConfirmation;
    final shouldValidate = previousPasswordConfirmation.invalid;
    final newState = state.copyWith(
      passwordConfirmation: shouldValidate
          ? PasswordConfirmation.validated(
        newValue,
        password: state.password,
      )
          : PasswordConfirmation.unvalidated(
        newValue,
      ),
    );
    emit(newState);
  }

  void onPasswordConfirmationUnfocused() {
    final newState = state.copyWith(
      passwordConfirmation: PasswordConfirmation.validated(
        state.passwordConfirmation.value,
        password: state.password,
      ),
    );
    emit(newState);
  }

  void onSubmit() async {

    final email = Email.validated(
      state.email.value,
      isAlreadyRegistered: state.email.isAlreadyRegistered,
    );

    final password = Password.validated(
      state.password.value,
    );

    final passwordConfirmation = PasswordConfirmation.validated(
      state.passwordConfirmation.value,
      password: password,
    );

    final isFormValid = Formz.validate([
      email,
      password,
      passwordConfirmation,
    ]) ==
        FormzStatus.valid;

    final newState = state.copyWith(
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
      submissionStatus: isFormValid ? SubmissionStatus.inProgress : null,
    );

    emit(newState);

    if (isFormValid) {
      try {
        await userRepository.signUpCustomer(
          email.value,
          password.value,
        );


        final newState = state.copyWith(
          submissionStatus: SubmissionStatus.success,
        );
        emit(newState);
      } catch (error) {
        final newState = state.copyWith(
          submissionStatus: error is! EmailAlreadyInUseException
              ? SubmissionStatus.error
              : SubmissionStatus.idle,

          email: error is EmailAlreadyInUseException
              ? Email.validated(
            email.value,
            isAlreadyRegistered: true,
          )
              : state.email,
        );

        emit(newState);
      }
    }
  }


}
