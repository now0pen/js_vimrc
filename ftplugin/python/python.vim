" vim doesn't know that you are in virtualenv and won't give you
" code completion for libs only installed there. fix--
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    projec_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
