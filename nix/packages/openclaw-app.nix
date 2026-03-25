{
  lib,
  stdenvNoCC,
  fetchzip,
}:

stdenvNoCC.mkDerivation {
  pname = "openclaw-app";
  version = "2026.3.23";

  src = fetchzip {
    url = "https://github.com/openclaw/openclaw/releases/download/v2026.3.23/OpenClaw-2026.3.23.zip";
    hash = "sha256-kpS/fJxNnZaQQwafNVy0nFkFFN3JWvq7EGasVGA0c5E=";
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
