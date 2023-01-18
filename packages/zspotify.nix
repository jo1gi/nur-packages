{ pkgs, stdenv, lib, fetchFromGitHub }:
with pkgs.python3Packages;


let
  protobuf-lib = (import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/ee01de29d2f58d56b1be4ae24c24bd91c5380cea.tar.gz";
    }) {}).python3Packages.protobuf;

  librespot-python = buildPythonPackage rec {
    pname = "librespot-python";
    version = "0.0.7";

    src = fetchFromGitHub {
      owner = "kokarare1212";
      repo = "librespot-python";
      rev = "v${version}";
      sha256 = "sha256-/92NKw+zi05422THAfgeTcwnW57CUZuIn8Op7hd9QBg=";
    };

    preConfigure = ''
      sed -e 's/==.*//g' -i requirements.txt
    '';

    propogatedBuildInputs = [
      defusedxml
      protobuf-lib
      pycryptodomex
      pyogg
      requests
      websocket-client
      zeroconf
    ];

    doCheck = false;
  };

  music-tag = buildPythonPackage rec {
    pname = "music-tag";
    version = "0.4.3";

    src = fetchFromGitHub {
      owner = "KristoforMaynard";
      repo = "music-tag";
      rev = version;
      sha256 = "sha256-8i6sLSv7wWOIXbdSfnLVTLRCyziJWehdTYrz5irLpdI=";
    };

    propagatedBuildInputs = [ mutagen ];
  };
in
buildPythonApplication rec {
  pname = "zspotify";
  version = "1.9.7";

  src = fetchFromGitHub {
    owner = "jsavargas";
    repo = "zspotify";
    rev = "v${version}";
    sha256 = "sha256-peK0lgZpsuIkagbBFzSaOsxMgvFkVy+SFGoREZpupr4=";
  };

  propogatedBuildInputs = [
    pkgs.ffmpeg

    librespot-python
    mutagen
    music-tag
    pydub
    pillow
    tqdm
    appdirs
  ];

  doCheck = false;
}
