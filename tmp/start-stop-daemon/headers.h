/*
 * header.h
 * Dirty little file to include header files w/out autotools.
 *
 * Copyright 1999-2004 Gentoo Foundation
 * Distributed under the terms of the GNU General Public License v2
 * $Header: /var/cvsroot/gentoo-src/rc-scripts/src/headers.h,v 1.1 2004/12/23 19:15:06 vapier Exp $
 */

/* Common includes */
#define HAVE_TIOCNOTTY
#define HAVE_SETSID

/* OS-specific includes */
#if defined(__linux__)
# define HAVE_SYS_SYSMACROS_H
# define HAVE_ERROR_H
#endif

/* Now we actually include crap ;) */
#ifdef HAVE_ERROR_H
# include <error.h>
#endif
#ifdef HAVE_SYS_SYSMACROS_H
# include <sys/sysmacros.h>
#endif
