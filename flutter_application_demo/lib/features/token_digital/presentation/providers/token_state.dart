class TokenState {
  final String token;
  final int remainingSeconds;
  final bool isGenerating;

  const TokenState({
    this.token = '',
    this.remainingSeconds = 30,
    this.isGenerating = false,
  });

  TokenState copyWith({
    String? token,
    int? remainingSeconds,
    bool? isGenerating,
  }) {
    return TokenState(
      token: token ?? this.token,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      isGenerating: isGenerating ?? this.isGenerating,
    );
  }
}
