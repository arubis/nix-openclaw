{
  lib,
  stdenvNoCC,
  fetchzip,
}:

stdenvNoCC.mkDerivation {
  pname = "openclaw-app";
  version = "2026.3.24";

  src = fetchzip {
    url = "https://github.com/openclaw/openclaw/releases/download/v2026.3.24/OpenClaw-2026.3.24.zip";
    hash = "sha256-41YYzWEzNPmFuCL0EPGbkb6WrzqP0QH5i4G17zHMAv0=";
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
