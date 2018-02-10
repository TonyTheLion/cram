{ system ? builtins.currentSystem,
  prefix ? "$out" }:

with import <nixpkgs> { inherit system; };

( let

cram = python35.pkgs.buildPythonPackage rec {
	pname = "cram";
	version = "0.7";
	nativeBuildInputs = [
		python3
	];

	src = ./.;

	doCheck = false;
};

in python35.withPackages (ps: with ps;  [ cram pexpect ])
)

## add .env at the end to make it work in nix-shell
## creating a python env only in the nix-shell

## to install use 'nix-env -if default.nix'
## See https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/python.md
## for details
