{ lib
, buildPythonPackage
, fetchPypi
, pandoc
, pytestCheckHook
, pythonOlder
, requests
, setuptools
}:

buildPythonPackage rec {
  pname = "publicsuffixlist";
  version = "0.10.0.20231104";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-p+sOaRfp2IDdXL6eotCrSHu91i+mAwavmqELa5nDB7c=";
  };

  nativeBuildInputs = [
    setuptools
  ];

  passthru.optional-dependencies = {
    update = [
      requests
    ];
    readme = [
      pandoc
    ];
  };

  nativeCheckInputs = [
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "publicsuffixlist"
  ];

  pytestFlagsArray = [
    "publicsuffixlist/test.py"
  ];

  meta = with lib; {
    description = "Public Suffix List parser implementation";
    homepage = "https://github.com/ko-zu/psl";
    license = licenses.mpl20;
    maintainers = with maintainers; [ fab ];
  };
}
