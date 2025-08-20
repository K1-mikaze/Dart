{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = with pkgs; [
    flutter
    chromium
    jdk17
  ];

  shellHook = "echo Welcome to the Flutter development environment";

  CHROME_EXECUTABLE = "${pkgs.chromium}/bin/chromium";
  JAVA_HOME = "${pkgs.jdk17}/lib/openjdk/bin";
}
