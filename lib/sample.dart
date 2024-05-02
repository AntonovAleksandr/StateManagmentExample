int sampleFunc(int a, int b) {
  return a + b;
}

int secondSampleFunc({required int a, int? b}) {
  return a + (b ?? 0);
}

void hello() {
  print("Hello world");
}
