# necessary foofoo to appease ye olde multi-headed build system
{	# deps
	system ? builtins.currentSystem,
	nixpkgs ? import <nixpkgs> { inherit system; },

	# options
	officialRelease ? true,
        cramSrc ? { outPath = ./.; rev = 0;},  	# link to this Git repo
	systems ? [ "x86_64-linux" ]			# systems to build on
}:

let
	jobs = rec {
		build = {
			cram = import ./default.nix {};
		};
	};
in jobs
