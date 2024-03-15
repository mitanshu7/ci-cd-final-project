  #!/bin/bash
  set -e
  python -m pip install --upgrade pip wheel
  pip install -r requirements.txt
  nosetests $(params.args)