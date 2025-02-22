{ fetchFromGitHub
, lib
, libnl
, libpcap
, pkg-config
, stdenv
}:
stdenv.mkDerivation rec {
  pname = "nmrpflash";
  version = "0.9.21";

  src = fetchFromGitHub {
    owner  = "jclehner";
    repo   = "nmrpflash";
    rev    = "v${version}";
    sha256 = "sha256-nW+VD2a0vmgODbJi4H8Esnq502bEkeCKjXQi23DfdqA=";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ libnl libpcap ];

  PREFIX = "${placeholder "out"}";
  STANDALONE_VERSION = version;

  preInstall = ''
    mkdir -p $out/bin
  '';

  meta = with lib; {
    description = "Netgear Unbrick Utility";
    homepage = "https://github.com/jclehner/nmrpflash";
    license = licenses.gpl3;
    maintainers = with maintainers; [ dadada ];
    platforms = platforms.unix;
  };
}
