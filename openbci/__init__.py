#from .cyton import OpenBCICyton
#from .plugins import *
import sys # Min
from .utils import *
from .wifi import OpenBCIWiFi
if sys.platform.startswith("linux"):
    from .ganglion import OpenBCIGanglion
