%define __libtoolize :

Summary: A utility for determining file types.
Name: file
Version: 4.17
Release: 7
License: distributable
Group: Applications/File
Source0: ftp://ftp.astron.com/pub/file/file-%{version}.tar.gz
URL:	http://www.darwinsys.com/file/
Patch1: file-4.10-debian.patch
Patch2: file-selinux.patch
Patch3: file-4.17-magic.patch
Patch5: file-4.13-fsdump.patch
Patch6: file-4.13-quick.patch
Patch8: file-4.15-berkeley.patch
Patch12: file-4.16-xen.patch
Patch13: file-4.17-init-mem.patch
Patch14: file-4.17-wctype-header.patch
Patch15: file-4.17-mp3_flac.patch
Patch16: file-4.17-oracle.patch
Patch17: file-4.17-clamav.patch
Patch18: file-4.17-powerpoint.patch
Patch19: file-4.17-empty.patch
Patch20: file-4.17-bash.patch
BuildRoot: %{_tmppath}/%{name}-%{version}-root
BuildRequires: zlib-devel

%description
The file command is used to identify a particular file according to the
type of data contained by the file.  File can identify many different
file types, including ELF binaries, system libraries, RPM packages, and
different graphics formats.

You should install the file package, since the file command is such a
useful utility.

%prep
%setup -q
%patch1 -p1 -b .debian
%patch2 -p1 -b .selinux
%patch3 -p1 -b .magic
%patch5 -p1 -b .fsdump
%patch6 -p1 -b .quick
%patch8 -p1 -b .berkeley
%patch12 -p1 -b .xen
%patch13 -p1 -b .mem
%patch14 -p1 -b .wctype
%patch15 -p1 -b .mp3
%patch16 -p1 -b .oracle
%patch17 -p1 -b .clamav
%patch18 -p1 -b .powerpoint
%patch19 -p1 -b .empty
%patch20 -p1 -b .bash

iconv -f iso-8859-1 -t utf-8 < doc/libmagic.man > doc/libmagic.man_
mv doc/libmagic.man_ doc/libmagic.man

%build
CFLAGS="%{optflags} -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE" \
%configure --enable-fsect-man5
make


%install
rm -rf $RPM_BUILD_ROOT
mkdir -p ${RPM_BUILD_ROOT}%{_bindir}
mkdir -p ${RPM_BUILD_ROOT}%{_mandir}/man1
mkdir -p ${RPM_BUILD_ROOT}%{_mandir}/man5
mkdir -p ${RPM_BUILD_ROOT}%{_datadir}/misc

%makeinstall
rm -f ${RPM_BUILD_ROOT}%{_libdir}/*.la

ln -s file/magic ${RPM_BUILD_ROOT}%{_datadir}/magic
ln -s file/magic.mime ${RPM_BUILD_ROOT}%{_datadir}/magic.mime
ln -s ../magic ${RPM_BUILD_ROOT}%{_datadir}/misc/magic 

%clean
rm -rf $RPM_BUILD_ROOT

%post -p /sbin/ldconfig

%postun -p /sbin/ldconfig

%files
%defattr(-,root,root)
%doc LEGAL.NOTICE README
%{_bindir}/*
%{_datadir}/magic*
%{_datadir}/file
%{_datadir}/misc/*
%{_mandir}/man[15]/*

%{_includedir}/magic.h
%{_mandir}/man3/*
%{_libdir}/libmagic.*

%changelog
* Fri Aug 18 2006 Martin Bacovsky <mbacovsk@redhat.com> - 4.17-7
- fix recognition of bash script with embed awk (#202185)

* Thu Aug 03 2006 Martin Bacovsky <mbacovsk@redhat.com> - 4.17-6
- fix gziped empty file (#72986)

* Wed Jul 12 2006 Jesse Keating <jkeating@redhat.com> - 4.17-5.1
- rebuild

* Mon Jul 10 2006 Radek Vokal <rvokal@redhat.com> 4.17-5
- fix powerpoint mine (#190373) <vonsch@gmail.com>

* Wed May 24 2006 Radek VokÃ¡l <rvokal@redhat.com> 4.17-4
- /usr/share/file is owned by package (#192858)
- fix magic for Clamav files (#192406)

* Fri Apr 21 2006 Radek VokÃ¡l <rvokal@redhat.com> 4.17-3
- add support for OCFS or ASM (#189017)

* Tue Mar 14 2006 Radek VokÃ¡l <rvokal@redhat.com> 4.17-2
- fix segfault when compiling magic
- add check for wctype.h
- fix for flac and mp3 files

* Mon Mar 13 2006 Radek VokÃ¡l <rvokal@redhat.com> 4.17-1
- upgrade to file-4.17, patch clean-up

* Fri Feb 10 2006 Jesse Keating <jkeating@redhat.com> - 4.16-6.2
- bump again for double-long bug on ppc(64)

* Tue Feb 07 2006 Jesse Keating <jkeating@redhat.com> - 4.16-6.1
- rebuilt for new gcc4.1 snapshot and glibc changes

* Sun Feb 04 2006 Radek VokÃ¡l <rvokal@redhat.com> 4.16-6
- xen patch, recognizes Xen saved domain

* Fri Jan 13 2006 Radek Vokal <rvokal@redhat.com> 4.16-5
- fix for 64bit arrays

* Fri Dec 09 2005 Jesse Keating <jkeating@redhat.com>
- rebuilt

* Tue Nov 29 2005 Radek Vokal <rvokal@redhat.com> - 4.16-4
- printf utf8 filenames and don't use isprint() (#174348)

* Tue Nov 08 2005 Radek Vokal <rvokal@redhat.com> - 4.16-3
- remove .la files (#172633)

* Mon Oct 31 2005 Radek Vokal <rvokal@redhat.com> - 4.16-2
- fix core files output, show "from" (#172015)

* Tue Oct 18 2005 Radek Vokal <rvokal@redhat.com> - 4.16-1
- upgrade to upstream

* Mon Oct 03 2005 Radek Vokal <rvokal@redhat.com> - 4.15-4
- file output for Berkeley DB gains Cracklib (#168917)

* Mon Sep 19 2005 Radek Vokal <rvokal@redhat.com> - 4.15-3
- small fix in previously added patch, now it works for multiple params

* Mon Sep 19 2005 Radek Vokal <rvokal@redhat.com> - 4.15-2
- print xxx-style only once (#168617)

* Thu Aug 09 2005 Radek Vokal <rvokal@redhat.com> - 4.15-1
- upgrade to upstream 

* Tue Aug 09 2005 Radek Vokal <rvokal@redhat.com> - 4.14-4
- mime for mpeg and aac files fixed (#165323)

* Fri Aug 05 2005 Radek Vokal <rvokal@redhat.com> - 4.14-3
- mime for 3ds files removed, conflicts with text files (#165165)

* Fri Jul 22 2005 Radek Vokal <rvokal@redhat.com> - 4.14-2
- fixed mime types recognition (#163866) <mandriva.org>

* Thu Jul 14 2005 Radek Vokal <rvokal@redhat.com> - 4.14-1
- sync with upstream, patch clean-up

* Mon Jul 04 2005 Radek Vokal <rvokal@redhat.com> - 4.13-5
- fixed reiserfs check (#162378)

* Mon Apr 11 2005 Radek Vokal <rvokal@redhat.com> - 4.13-4
- check Cyrus files before Apple Quicktime movies (#154342) 

* Mon Mar 07 2005 Radek Vokal <rvokal@redhat.com> - 4.13-3
- check for shared libs before fs dump files (#149868)

* Fri Mar 04 2005 Radek Vokal <rvokal@redhat.com> - 4.13-2
- gcc4 rebuilt

* Tue Feb 15 2005 Radek Vokal <rvokal@redhat.com> - 4.13-1
- new version, fixing few bugs, patch clean-up
- consistent output for bzip files (#147440)

* Mon Jan 24 2005 Radek Vokal <rvokal@redhat.com> - 4.12-3
- core64 patch fixing output on core files (#145354) <kzak@redhat.com>
- minor change in magic patch

* Mon Jan 03 2005 Radek Vokal <rvokal@redhat.com> - 4.12-2
- fixed crashes in threaded environment (#143871) <arjanv@redhat.com>

* Thu Dec 02 2004 Radek Vokal <rvokal@redhat.com> - 4.12-1
- upgrade to file-4.12
- removed Tim's patch, tuned magic patch

* Sat Nov 20 2004 Miloslav Trmac <mitr@redhat.com> - 4.10-4
- Convert libmagic.3 to UTF-8

* Thu Nov 18 2004 Radek Vokal <rvokal@redhat.com> 4.10-3
- set of patches from debian.org
- new magic types (#128763)
- zlib added to BuildReq (#125294)

* Tue Oct 12 2004 Tim Waugh <twaugh@redhat.com> 4.10-2
- Fixed occasional segfault (bug #131892).

* Wed Aug 11 2004 Radek Vokal <rvokal@redhat.com>
- zlib patch deleted, note patch deleted, rh patch updated, debian patch updated
- upgrade to file-4.10

* Tue Jun 15 2004 Elliot Lee <sopwith@redhat.com>
- rebuilt

* Mon May 10 2004 Jakub Jelinek <jakub@redhat.com>
- fix ELF note handling (#109495)

* Tue Mar 23 2004 Karsten Hopp <karsten@redhat.de> 4.07-3 
- add docs (#115966)

* Tue Mar 02 2004 Elliot Lee <sopwith@redhat.com>
- rebuilt

* Fri Feb 13 2004 Elliot Lee <sopwith@redhat.com>
- rebuilt

* Sun Jan 18 2004 Jeff Johnson <jbj@jbj.org> 4.07-1
- upgrade to 4.07.
- deal gracefully with unreadable files (#113207).
- detect PO files (from Debian).

* Tue Dec 16 2003 Jeff Johnson <jbj@jbj.org> 4.06-1
- upgrade to file-4.06.

* Mon Nov 10 2003 Tim Waugh <twaugh@redhat.com> 4.02-4
- Minimal fix for busy loop problem (bug #109495).

* Mon Oct 13 2003 Jeff Johnson <jbj@jbj.org> 4.05-1
- upgrade to 4.05.

* Thu Oct  9 2003 Jeff Johnson <jbj@jbj.org> 4.02-3
- use zlib rather than exec'ing gzip.

-* Thu Aug 28 2003 Dan Walsh <dwalsh@redhat.com>
-- Add Selinux support.

* Wed Jun 04 2003 Elliot Lee <sopwith@redhat.com>
- rebuilt

* Sat May 24 2003 Florian La Roche <Florian.LaRoche@redhat.de>
- add ldconfig to post/postun

* Mon Apr 21 2003 Jeff Johnson <jbj@redhat.com> 4.02-1
- upgrade to file-4.02.

* Thu Feb 27 2003 Jeff Johnson <jbj@redhat.com> 3.39-9
- check size read from elf header (#85297).

* Tue Feb 18 2003 Matt Wilson <msw@redhat.com> 3.39-8
- add FHS compatibility symlink from /usr/share/misc/magic -> ../magic
  (#84509)

* Fri Feb 14 2003 Jeff Johnson <jbj@redhat.com> 3.39-7
- the "real" fix to the vorbis/ogg magic details (#82810).

* Mon Jan 27 2003 Jeff Johnson <jbj@redhat.com> 3.39-6
- avoid vorbis/ogg magic details (#82810).

* Wed Jan 22 2003 Tim Powers <timp@redhat.com> 3.39-5
- rebuilt

* Sun Jan 12 2003 Nalin Dahyabhai <nalin@redhat.com> 3.39-4
- PT_NOTE, take 3

* Fri Jan 10 2003 Nalin Dahyabhai <nalin@redhat.com> 3.39-3
- don't barf in ELF headers with align = 0

* Tue Jan  7 2003 Nalin Dahyabhai <nalin@redhat.com> 3.39-2
- don't get lost when looking at PT_NOTE sections

* Sat Oct 26 2002 Jeff Johnson <jbj@redhat.com> 3.39-1
- update to 3.39.

* Fri Jun 21 2002 Tim Powers <timp@redhat.com>
- automated rebuild

* Thu May 23 2002 Tim Powers <timp@redhat.com>
- automated rebuild

* Mon May  6 2002 Trond Eivind Glomsrød <teg@redhat.com> 3.37-6
- Don't use an old magic.mime 
- Add mng detection (#64229)

* Tue Feb 26 2002 Trond Eivind Glomsrød <teg@redhat.com> 3.37-5
- Rebuild

* Mon Jan 14 2002 Trond Eivind Glomsrød <teg@redhat.com> 3.37-4
- Fix missing include of <stdint.h> (#58209)

* Tue Dec 11 2001 Trond Eivind Glomsrød <teg@redhat.com> 3.37-2
- Add CFLAGS to handle large files (#53576)

* Mon Dec 10 2001 Trond Eivind Glomsrød <teg@redhat.com> 3.37-1
- 3.37
- s/Copyright/License/
- build with --enable-fsect-man5, drop patch
- disable two old patches

* Fri Jul 06 2001 Florian La Roche <Florian.LaRoche@redhat.de>
- revert a patch to Magdir/elf, which breaks many libtool scripts
  in several rpm packages

* Mon Jun 25 2001 Crutcher Dunnavant <crutcher@redhat.com>
- iterate to 3.35

* Sun Jun 24 2001 Elliot Lee <sopwith@redhat.com>
- Bump release + rebuild.

* Sun Nov 26 2000 Jeff Johnson <jbj@redhat.com>
- update to 3.33.

* Mon Aug 14 2000 Preston Brown <pbrown@redhat.com>
- Bill made the patch but didn't apply it. :)

* Mon Aug 14 2000 Bill Nottingham <notting@redhat.com>
- 'ASCII text', not 'ASCII test' (#16168)

* Mon Jul 31 2000 Jeff Johnson <jbj@redhat.com>
- fix off-by-1 error when creating filename for use with -i.
- include a copy of GNOME /etc/mime-types in %{_datadir}/magic.mime (#14741).

* Sat Jul 22 2000 Jeff Johnson <jbj@redhat.com>
- install magic as man5/magic.5 with other formats (#11172).

* Wed Jul 12 2000 Prospector <bugzilla@redhat.com>
- automatic rebuild

* Wed Jun 14 2000 Jeff Johnson <jbj@redhat.com>
- FHS packaging.

* Tue Apr 14 2000 Bernhard Rosenkraenzer <bero@redhat.com>
- 3.30

* Wed Feb 16 2000 Cristian Gafton <gafton@redhat.com>
- add ia64 patch from rth

* Mon Feb  7 2000 Bill Nottingham <notting@redhat.com>
- handle compressed manpages
- update to 3.28

* Mon Aug 23 1999 Jeff Johnson <jbj@redhat.com>
- identify ELF stripped files correctly (#4665).
- use SPARC (not sparc) consistently throughout (#4665).
- add entries for MS Office files (#4665).

* Thu Aug 12 1999 Jeff Johnson <jbj@redhat.com>
- diddle magic so that *.tfm files are identified correctly.

* Tue Jul  6 1999 Jeff Johnson <jbj@redhat.com>
- update to 3.27.

* Mon Mar 22 1999 Preston Brown <pbrown@redhat.com>
- experimental support for realmedia files added

* Sun Mar 21 1999 Cristian Gafton <gafton@redhat.com> 
- auto rebuild in the new build environment (release 5)

* Fri Mar 19 1999 Jeff Johnson <jbj@redhat.com>
- strip binary.

* Fri Nov 27 1998 Jakub Jelinek <jj@ultra.linux.cz>
- add SPARC V9 magic.

* Tue Nov 10 1998 Jeff Johnson <jbj@redhat.com>
- update to 3.26.

* Mon Aug 24 1998 Jeff Johnson <jbj@redhat.com>
- update to 3.25.
- detect gimp XCF versions.

* Thu May 07 1998 Prospector System <bugs@redhat.com>
- translations modified for de, fr, tr

* Wed Apr 08 1998 Erik Troan <ewt@redhat.com>
- updated to 3.24
- buildrooted

* Mon Jun 02 1997 Erik Troan <ewt@redhat.com>
- built against glibc

* Mon Mar 31 1997 Erik Troan <ewt@redhat.com>
- Fixed problems caused by 64 bit time_t.

* Thu Mar 06 1997 Michael K. Johnson <johnsonm@redhat.com>
- Improved recognition of Linux kernel images.
