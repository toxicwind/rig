{
  description = "The Rig Agent OS";
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-flake.url = "github:juspay/rust-flake";
  };
  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        inputs.rust-flake.flakeModules.default
        inputs.rust-flake.flakeModules.nixpkgs
      ];
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        lib,
        ...
      }: {
        rust-project.src = lib.sources.cleanSource ./.;
        rust-project.defaults.perCrate.crane.args.nativeBuildInputs = with pkgs; [
          clang
          perl
          pkg-config
        ];
        rust-project.defaults.perCrate.crane.args.buildInputs = with pkgs; [
          clang
          openssl
          perl
          pkg-config
        ];
        rust-project.crates.rig-desktop.crane.args.nativeBuildInputs = with pkgs; [
          pkg-config
          wrapGAppsHook3
        ];
        rust-project.crates.rig-desktop.crane.args.buildInputs = with pkgs; [
          atk
          glib
          gtk3
          libayatana-appindicator
          openssl
          pkg-config
          webkitgtk_4_1
        ];
        rust-project.crates.rig-desktop.crane.args.preFixup = ''
          gappsWrapperArgs+=(
            --prefix LD_LIBRARY_PATH : "${pkgs.libayatana-appindicator}/lib"
          )
        '';

        packages.default = self'.packages.rig-cli;
        apps = {
          rig-cli = {
            program = "${self'.packages.rig-cli}/bin/rig";
            meta.description = "CLI tool for the Rig Agent OS";
          };
          rig-desktop = {
            program = "${self'.packages.rig-desktop}/bin/rig-desktop";
            meta.description = "Native desktop application for the Rig Agent OS (Tauri 2.0)";
          };
          default = self'.apps.rig-cli;
        };
      };
      flake = {
      };
    };
}
