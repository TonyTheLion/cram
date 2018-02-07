{ system ? builtins.currentSystem,
  prefix ? "$out" }:

with import <nixpkgs> { inherit system; };

stdenv.mkDerivation rec {
	name = "cramtest";
	env = buildEnv { name = name; paths = nativeBuildInputs; };
	nativeBuildInputs = [
		python3
	];
	
	src = ./.;
	
	# build
	buildPhase = ''
		python3 setup.py build	
	'';

	installPhase = '' 
		python3 setup.py install --prefix="${prefix}" --force
	'';
}
