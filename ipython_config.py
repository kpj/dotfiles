# auto-import (pip install ipython-autoimport)
c.InteractiveShellApp.exec_lines.append(
    "try:\n    %load_ext ipython_autoimport\nexcept ImportError: pass")
