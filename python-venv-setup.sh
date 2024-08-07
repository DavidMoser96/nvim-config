#!/usr/bin/fish

echo (pwd)
set VENV_CREATION_OUTPUT (python -m venv .venv)
if not test "$VENV_CREATION_OUTPUT" = ""
  echo "venv creation failed with the following output:"
  echo $VENV_CREATION_OUTPUT
  return 1
end

set SOURCE_VENV (source .venv/bin/activate.fish)
if not test "$SOURCE_VENV" = ""
  echo "venv sourcing failed:"
  echo $SOURCE_VENV
  return 1
end

pip install --upgrade pip



if pip install -r requirements.txt
  echo "python environment successfully set up!"
else
  echo "pip requirement installation failed"
end
