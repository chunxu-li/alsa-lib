dnl Check for ALSA driver package.
AC_DEFUN(ALSA_CHECK_DRIVER, [
myprefix=$prefix
if test "$myprefix" = "NONE"; then
  myprefix=$ac_default_prefix
fi
OLD_CFLAGS="$CFLAGS"
CFLAGS="-I$myprefix/include"
AC_MSG_CHECKING(for alsa-driver package)

AC_TRY_COMPILE([
#include <linux/asound.h>
],[
void main(void)
{
#if !defined( SND_PROTOCOL_VERSION ) || !defined( SND_PROTOCOL_UNCOMPATIBLE )
#error not found
#else
  exit(0);
#endif
}
],
  AC_MSG_RESULT(present),
  [AC_MSG_RESULT(not found);
   AC_MSG_ERROR([Install alsa-driver v0.2.0pre6+ package first...])]
)
CFLAGS="$OLD_CFLAGS"
])
