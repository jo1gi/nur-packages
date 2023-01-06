{ pkgs }:

{
  AAXtoMP3 = pkgs.callPackage ./packages/aaxtomp3.nix {};
  audible-cli = pkgs.callPackage ./packages/audible-cli.nix {};
  marksman = pkgs.callPackage ./packages/marksman/default.nix {};
  pack-it = pkgs.callPackage ./packages/pack-it.nix {};
}
