String authErrorsString(String? errorCode) {
  switch (errorCode) {
    case 'INVALID_CREDENTIALS':
      return 'Email e/ou senha inválidos';
    case 'Invalid session token':
      return 'Token inválido';
    case 'INVALID_FULLNAME':
      return 'Ocorreu um erro ao cadastrar o usuário: Nome inválido.';
    case 'INVALID_PHONE':
      return 'Ocorreu um erro ao cadastrar o usuário: Celular inválido.';
    case 'INVALID_CPF':
      return 'Ocorreu um erro ao cadastrar o usuário: CPF inválido.';
    default:
      return 'Um erro indefinido ocorreu';
  }
}
