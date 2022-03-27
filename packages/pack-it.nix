{ lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "pack-it";
  version = "v0.1.0";

  src = fetchFromGitHub {
    owner = "Tom-The-Geek";
    repo = pname;
    rev = version;
    sha256 = "0a3d8a94jdz91kbnsqjdxhhrvic2k29hnbkvy2354rqmikybw5yk";
  };

  cargoSha256 = "1dz4kn7famagq04hvw3a9kjaw9j76xm3wmhv8slg4sn2idlybpcs";

  nativeBuildInputs = with pkgs; [
    pkg-config
    openssl
  ];

  buildInputs = with pkgs; [
    openssl
  ];

  meta = with lib; {
    description = "A CLI tool for managing Minecraft mods";
    homepage = "https://tom-the-geek.github.io/pack-it";
    license = licenses.unlicense;
    maintainers = [ maintainers.jo1gi ];
  };
}

