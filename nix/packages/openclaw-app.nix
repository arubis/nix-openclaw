{
  lib,
  stdenvNoCC,
  fetchzip,
}:

stdenvNoCC.mkDerivation {
  pname = "openclaw-app";
  version = "2026.3.28-beta.1";

  src = fetchzip {
    url = "https://github.com/openclaw/openclaw/releases/download/v2026.3.28-beta.1/OpenClaw-2026.3.28-beta.1.zip";
    hash = "sha256-UoePmgP6JSCCq3WoRtG+6to/drWwgJYF81Y8bckFl4k=";
    stripRoot = false;
  };

  dontUnpack = true;

  installPhase = "${../scripts/openclaw-app-install.sh}";

  meta = with lib; {
    description = "OpenClaw macOS app bundle";
    homepage = "https://github.com/openclaw/openclaw";
    license = licenses.mit;
    platforms = platforms.darwin;
  };
}
