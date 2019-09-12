{ pkgs }:
let
 # self tests for holonix
 # mostly smoke tests on various platforms
 name = "hn-test";

 script = pkgs.writeShellScriptBin name ''
bats ./test/github-release.bats
bats ./test/nix-shell.bats
bats ./test/rust-manifest-list-unpinned.bats
'';

in
{
 buildInputs = [
  script
  # test system for bash
  # https://github.com/sstephenson/bats
  pkgs.bats
 ];
}
