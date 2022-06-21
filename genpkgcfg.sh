#!/bin/sh

. ./config.sh

cat > slhdr_cwrap.pc << EOF
prefix=${prefix}
libdir=${libdir}
includedir=${incdir}
slhdr_dir=${slhdr_dir}
deplibs=${deplibs}

Name: SL_HDR wrap
Description: A C wrapper around SL-HDR Lib
Version: ${MAJOR}.${MINOR}.${REVISION}
Requires:
Requires.private:
Conflicts:
Libs: -L\${libdir} -lslhdr_cwrap
Libs.private: -L\${slhdr_dir} \${deplibs}
Cflags: -I\${includedir}
EOF
