%define __libtoolize :

Summary: A utility for determining file types.
Name: file
Version: 3.37
Release: 7
License: distributable
Group: Applications/File
Source0: ftp://ftp.astron.com/pub/file/file-%{version}.tar.gz
Patch0: file-3.27-rh.patch
Patch1: file-3.33-ia64.patch
Patch3: file-3.30-fnovfl.patch
Patch4: file-3.35-elf.patch
Patch5: file-3.37-perlfix.patch
Patch6: file-3.37-missint.patch
Source1: file-3.37-mng.patch
BuildRoot: %{_tmppath}/%{name}-%{version}-root

%description
The file command is used to identify a particular file according to the
type of data contained by the file.  File can identify many different
file types, including ELF binaries, system libraries, RPM packages, and
different graphics formats.

You should install the file package, since the file command is such a
useful utility.

%prep
%setup -q
%patch0 -p1
%patch1 -p1 -b .ia64
%patch5 -p1 
%patch6 -p1 -b .missint

%build
CFLAGS="%{optflags} -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE"

%configure --enable-fsect-man5
make


%install
rm -rf $RPM_BUILD_ROOT
mkdir -p ${RPM_BUILD_ROOT}%{_bindir}
mkdir -p ${RPM_BUILD_ROOT}%{_mandir}/man1
mkdir -p ${RPM_BUILD_ROOT}%{_mandir}/man5
mkdir -p ${RPM_BUILD_ROOT}%{_datadir}

patch -p1 < %SOURCE1

%makeinstall

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root)
%{_bindir}/*
%{_datadir}/magic*
%{_mandir}/man*/*

%changelog
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
