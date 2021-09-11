with import <nixpkgs> {};

stdenvNoCC.mkDerivation {
  name = "sile-typesetter.org";
  nativeBuildInputs = [ sile jekyll ];
}
