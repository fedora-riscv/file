#!/bin/bash

mkdir tmp
cd db
for d in * ; do
	mkdir ../tmp/$d
	for f in $d/* ; do
		if [[ ${f: -11} != ".source.txt" ]]; then
			file $1 $f | sed -n -e "s:$f\: ::p" | sed 's/,//g' > ../tmp/$f.my
		fi
	done
done

cd ..

. /usr/bin/rhts-environment.sh 
. /usr/share/beakerlib/beakerlib.sh 

PACKAGE="file"

rlJournalStart

	rlPhaseStartSetup
        rlAssertRpm $PACKAGE
    rlPhaseEnd

    rlPhaseStartTest "accdb"
        rlAssertNotDiffer "reference/accdb/database.accdb.ref" "tmp/accdb/database.accdb.my"
    rlPhaseEnd

    rlPhaseStartTest "ade"
        rlAssertNotDiffer "reference/ade/ms_access_project_encoded.ade.ref" "tmp/ade/ms_access_project_encoded.ade.my"
    rlPhaseEnd

    rlPhaseStartTest "adp"
        rlAssertNotDiffer "reference/adp/ms_access_project.adp.ref" "tmp/adp/ms_access_project.adp.my"
    rlPhaseEnd

    rlPhaseStartTest "ani"
        rlAssertNotDiffer "reference/ani/animated_cursor.ani.ref" "tmp/ani/animated_cursor.ani.my"
    rlPhaseEnd

    rlPhaseStartTest "AppleDouble"
        rlAssertNotDiffer "reference/AppleDouble/AppleDouble.ref" "tmp/AppleDouble/AppleDouble.my"
    rlPhaseEnd

    rlPhaseStartTest "asa"
        rlAssertNotDiffer "reference/asa/global.asa.ref" "tmp/asa/global.asa.my"
    rlPhaseEnd

    rlPhaseStartTest "asp"
        rlAssertNotDiffer "reference/asp/policies_part.asp.ref" "tmp/asp/policies_part.asp.my"
    rlPhaseEnd

    rlPhaseStartTest "bas"
        rlAssertNotDiffer "reference/bas/PILES_START.bas.ref" "tmp/bas/PILES_START.bas.my"
    rlPhaseEnd

    rlPhaseStartTest "bat"
        rlAssertNotDiffer "reference/bat/build.bat.ref" "tmp/bat/build.bat.my"
    rlPhaseEnd

    rlPhaseStartTest "bin"
        rlAssertNotDiffer "reference/bin/vax.ref" "tmp/bin/vax.my"
    rlPhaseEnd

    rlPhaseStartTest "bmp"
        rlAssertNotDiffer "reference/bmp/InstallerHeader.bmp.ref" "tmp/bmp/InstallerHeader.bmp.my"
    rlPhaseEnd

    rlPhaseStartTest "bz2"
        rlAssertNotDiffer "reference/bz2/test.txt.bz2.ref" "tmp/bz2/test.txt.bz2.my"
    rlPhaseEnd

    rlPhaseStartTest "cab"
    rlPhaseEnd

    rlPhaseStartTest "cmd"
        rlAssertNotDiffer "reference/cmd/wp_batch_example.cmd.ref" "tmp/cmd/wp_batch_example.cmd.my"
    rlPhaseEnd

    rlPhaseStartTest "cnt"
        rlAssertNotDiffer "reference/cnt/help-contents.cnt.ref" "tmp/cnt/help-contents.cnt.my"
    rlPhaseEnd

    rlPhaseStartTest "com"
        rlAssertNotDiffer "reference/com/kssf.com.ref" "tmp/com/kssf.com.my"
    rlPhaseEnd

    rlPhaseStartTest "cpl"
        rlAssertNotDiffer "reference/cpl/ac3filter_first4k.cpl.ref" "tmp/cpl/ac3filter_first4k.cpl.my"
    rlPhaseEnd

    rlPhaseStartTest "cpp"
        rlAssertNotDiffer "reference/cpp/test.cpp.ref" "tmp/cpp/test.cpp.my"
    rlPhaseEnd

    rlPhaseStartTest "crt"
        rlAssertNotDiffer "reference/crt/server.crt.ref" "tmp/crt/server.crt.my"
    rlPhaseEnd

    rlPhaseStartTest "cur"
        rlAssertNotDiffer "reference/cur/cursor.cur.ref" "tmp/cur/cursor.cur.my"
    rlPhaseEnd

    rlPhaseStartTest "dat"
        rlAssertNotDiffer "reference/dat/winmail.dat.ref" "tmp/dat/winmail.dat.my"
    rlPhaseEnd

    rlPhaseStartTest "db"
        rlAssertNotDiffer "reference/db/sqlite3.db.ref" "tmp/db/sqlite3.db.my"
        rlAssertNotDiffer "reference/db/thumbs.db.ref" "tmp/db/thumbs.db.my"
    rlPhaseEnd

    rlPhaseStartTest "dbf"
        rlAssertNotDiffer "reference/dbf/biblio.dbf.ref" "tmp/dbf/biblio.dbf.my"
    rlPhaseEnd

    rlPhaseStartTest "deb"
        rlAssertNotDiffer "reference/deb/p.deb.ref" "tmp/deb/p.deb.my"
    rlPhaseEnd

    rlPhaseStartTest "diso"
        rlAssertNotDiffer "reference/diso/foo.diso.ref" "tmp/diso/foo.diso.my"
    rlPhaseEnd

    rlPhaseStartTest "dll"
        rlAssertNotDiffer "reference/dll/SDL2.dll.ref" "tmp/dll/SDL2.dll.my"
    rlPhaseEnd

    rlPhaseStartTest "dmp"
        rlAssertNotDiffer "reference/dmp/mdmp.dmp.ref" "tmp/dmp/mdmp.dmp.my"
    rlPhaseEnd

    rlPhaseStartTest "doc"
        rlAssertNotDiffer "reference/doc/word_document.doc.ref" "tmp/doc/word_document.doc.my"
        rlAssertNotDiffer "reference/doc/word_document_with_autostart_macro.doc.ref" "tmp/doc/word_document_with_autostart_macro.doc.my"
    rlPhaseEnd

    rlPhaseStartTest "docm"
        rlAssertNotDiffer "reference/docm/encrypted.docm.ref" "tmp/docm/encrypted.docm.my"
        rlAssertNotDiffer "reference/docm/word_document.docm.ref" "tmp/docm/word_document.docm.my"
        rlAssertNotDiffer "reference/docm/word_document_with_autostart_macro.docm.ref" "tmp/docm/word_document_with_autostart_macro.docm.my"
    rlPhaseEnd

    rlPhaseStartTest "docx"
        rlAssertNotDiffer "reference/docx/encrypted.docx.ref" "tmp/docx/encrypted.docx.my"
        rlAssertNotDiffer "reference/docx/word_document.docx.ref" "tmp/docx/word_document.docx.my"
    rlPhaseEnd

    rlPhaseStartTest "dot"
        rlAssertNotDiffer "reference/dot/word_document.dot.ref" "tmp/dot/word_document.dot.my"
        rlAssertNotDiffer "reference/dot/word_document_with_autostart_macro.dot.ref" "tmp/dot/word_document_with_autostart_macro.dot.my"
    rlPhaseEnd

    rlPhaseStartTest "dotm"
        rlAssertNotDiffer "reference/dotm/word_document.dotm.ref" "tmp/dotm/word_document.dotm.my"
        rlAssertNotDiffer "reference/dotm/word_document_with_autostart_macro.dotm.ref" "tmp/dotm/word_document_with_autostart_macro.dotm.my"
    rlPhaseEnd

    rlPhaseStartTest "dotx"
        rlAssertNotDiffer "reference/dotx/word_document.dotx.ref" "tmp/dotx/word_document.dotx.my"
    rlPhaseEnd

    rlPhaseStartTest "drpm"
        rlAssertNotDiffer "reference/drpm/foo1.drpm.ref" "tmp/drpm/foo1.drpm.my"
        rlAssertNotDiffer "reference/drpm/foo2.drpm.ref" "tmp/drpm/foo2.drpm.my"
    rlPhaseEnd

    rlPhaseStartTest "DS_Store"
        rlAssertNotDiffer "reference/DS_Store/DS_Store.ref" "tmp/DS_Store/DS_Store.my"
    rlPhaseEnd

    rlPhaseStartTest "dump"
        rlAssertNotDiffer "reference/dump/evolocal.odb.ref" "tmp/dump/evolocal.odb.my"
    rlPhaseEnd

    rlPhaseStartTest "elf"
        rlAssertNotDiffer "reference/elf/a.ref" "tmp/elf/a.my"
        rlAssertNotDiffer "reference/elf/filter.ref" "tmp/elf/filter.my"
        rlAssertNotDiffer "reference/elf/hello-aarch64-executable.ref" "tmp/elf/hello-aarch64-executable.my"
        rlAssertNotDiffer "reference/elf/library-now.so.ref" "tmp/elf/library-now.so.my"
        rlAssertNotDiffer "reference/elf/new-keyctl.debug.ref" "tmp/elf/new-keyctl.debug.my"
        rlAssertNotDiffer "reference/elf/old-keyctl.debug.ref" "tmp/elf/old-keyctl.debug.my"
        rlAssertNotDiffer "reference/elf/pie-test.ref" "tmp/elf/pie-test.my"
        rlAssertNotDiffer "reference/elf/ppm.ref" "tmp/elf/ppm.my"
    rlPhaseEnd

    rlPhaseStartTest "exe"
        rlAssertNotDiffer "reference/exe/e5f5fdb10c8bb35d3219a87516147e15.exe.ref" "tmp/exe/e5f5fdb10c8bb35d3219a87516147e15.exe.my"
    rlPhaseEnd

    rlPhaseStartTest "filesystems"
        rlAssertNotDiffer "reference/filesystems/bootsector.ref" "tmp/filesystems/bootsector.my"
        rlAssertNotDiffer "reference/filesystems/ext4.ref" "tmp/filesystems/ext4.my"
        rlAssertNotDiffer "reference/filesystems/filetest.ref" "tmp/filesystems/filetest.my"
        rlAssertNotDiffer "reference/filesystems/lvm2.ref" "tmp/filesystems/lvm2.my"
        rlAssertNotDiffer "reference/filesystems/ntfs.ref" "tmp/filesystems/ntfs.my"
        rlAssertNotDiffer "reference/filesystems/swap-ia64.ref" "tmp/filesystems/swap-ia64.my"
        rlAssertNotDiffer "reference/filesystems/swap-ppc.ref" "tmp/filesystems/swap-ppc.my"
    rlPhaseEnd

    rlPhaseStartTest "frm"
        rlAssertNotDiffer "reference/frm/help_relation.frm.ref" "tmp/frm/help_relation.frm.my"
    rlPhaseEnd

    rlPhaseStartTest "gif"
        rlAssertNotDiffer "reference/gif/1.gif.ref" "tmp/gif/1.gif.my"
    rlPhaseEnd

    rlPhaseStartTest "gz"
        rlAssertNotDiffer "reference/gz/abc1.gz.ref" "tmp/gz/abc1.gz.my"
        rlAssertNotDiffer "reference/gz/abc2.gz.ref" "tmp/gz/abc2.gz.my"
        rlAssertNotDiffer "reference/gz/a.gz.ref" "tmp/gz/a.gz.my"
    rlPhaseEnd

    rlPhaseStartTest "h"
        rlAssertNotDiffer "reference/h/a.h.ref" "tmp/h/a.h.my"
        rlAssertNotDiffer "reference/h/basic_string.h.ref" "tmp/h/basic_string.h.my"
        rlAssertNotDiffer "reference/h/gclosure.h.ref" "tmp/h/gclosure.h.my"
        rlAssertNotDiffer "reference/h/gfileattribute.h.ref" "tmp/h/gfileattribute.h.my"
        rlAssertNotDiffer "reference/h/gfile.h.ref" "tmp/h/gfile.h.my"
        rlAssertNotDiffer "reference/h/gsocketaddressenumerator.h.ref" "tmp/h/gsocketaddressenumerator.h.my"
        rlAssertNotDiffer "reference/h/gunixmounts.h.ref" "tmp/h/gunixmounts.h.my"
        rlAssertNotDiffer "reference/h/stl_map.h.ref" "tmp/h/stl_map.h.my"
        rlAssertNotDiffer "reference/h/stl_queue.h.ref" "tmp/h/stl_queue.h.my"
        rlAssertNotDiffer "reference/h/stl_stack.h.ref" "tmp/h/stl_stack.h.my"
    rlPhaseEnd

    rlPhaseStartTest "hlp"
        rlAssertNotDiffer "reference/hlp/biochlr2.hlp.ref" "tmp/hlp/biochlr2.hlp.my"
    rlPhaseEnd

    rlPhaseStartTest "hta"
        rlAssertNotDiffer "reference/hta/access.hta.ref" "tmp/hta/access.hta.my"
        rlAssertNotDiffer "reference/hta/hello_world.hta.ref" "tmp/hta/hello_world.hta.my"
    rlPhaseEnd

    rlPhaseStartTest "html"
        rlAssertNotDiffer "reference/html/index_first4k.html.ref" "tmp/html/index_first4k.html.my"
    rlPhaseEnd

    rlPhaseStartTest "chm"
        rlAssertNotDiffer "reference/chm/index_start.chm.ref" "tmp/chm/index_start.chm.my"
    rlPhaseEnd

    rlPhaseStartTest "icm"
        rlAssertNotDiffer "reference/icm/bluish.icc.ref" "tmp/icm/bluish.icc.my"
        rlAssertNotDiffer "reference/icm/sRGB.icm.ref" "tmp/icm/sRGB.icm.my"
    rlPhaseEnd

    rlPhaseStartTest "ico"
        rlAssertNotDiffer "reference/ico/pixel-install.ico.ref" "tmp/ico/pixel-install.ico.my"
    rlPhaseEnd

    rlPhaseStartTest "img"
        rlAssertNotDiffer "reference/img/initrd1.img.ref" "tmp/img/initrd1.img.my"
        rlAssertNotDiffer "reference/img/qed.img.ref" "tmp/img/qed.img.my"
        rlAssertNotDiffer "reference/img/vdi.img.ref" "tmp/img/vdi.img.my"
    rlPhaseEnd

    rlPhaseStartTest "ins"
        rlAssertNotDiffer "reference/ins/internet_connection_settings.ins.ref" "tmp/ins/internet_connection_settings.ins.my"
        rlAssertNotDiffer "reference/ins/setup.ins.ref" "tmp/ins/setup.ins.my"
    rlPhaseEnd

    rlPhaseStartTest "iso"
        rlAssertNotDiffer "reference/iso/x.iso.ref" "tmp/iso/x.iso.my"
    rlPhaseEnd

    rlPhaseStartTest "isp"
        rlAssertNotDiffer "reference/isp/self-created.isp.ref" "tmp/isp/self-created.isp.my"
    rlPhaseEnd

    rlPhaseStartTest "java"
        rlAssertNotDiffer "reference/java/CreateMdb.java.ref" "tmp/java/CreateMdb.java.my"
    rlPhaseEnd

    rlPhaseStartTest "jpc"
        rlAssertNotDiffer "reference/jpc/testing.jpc.ref" "tmp/jpc/testing.jpc.my"
        rlAssertNotDiffer "reference/jpc/test.jpc.ref" "tmp/jpc/test.jpc.my"
    rlPhaseEnd

    rlPhaseStartTest "jpg"
        rlAssertNotDiffer "reference/jpg/lime-cat.jpg.ref" "tmp/jpg/lime-cat.jpg.my"
    rlPhaseEnd

    rlPhaseStartTest "js"
        rlAssertNotDiffer "reference/js/smartmobile.js.ref" "tmp/js/smartmobile.js.my"
    rlPhaseEnd

    rlPhaseStartTest "jse"
        rlAssertNotDiffer "reference/jse/smartmobile.jse.ref" "tmp/jse/smartmobile.jse.my"
    rlPhaseEnd

    rlPhaseStartTest "kernels"
        rlAssertNotDiffer "reference/kernels/s390x.ref" "tmp/kernels/s390x.my"
        rlAssertNotDiffer "reference/kernels/x86_64.ref" "tmp/kernels/x86_64.my"
    rlPhaseEnd

    rlPhaseStartTest "lnk"
    rlPhaseEnd

    rlPhaseStartTest "lsm"
        rlAssertNotDiffer "reference/lsm/sysstate.lsm.ref" "tmp/lsm/sysstate.lsm.my"
    rlPhaseEnd

    rlPhaseStartTest "lua"
        rlAssertNotDiffer "reference/lua/mod_actions_http.lua.ref" "tmp/lua/mod_actions_http.lua.my"
    rlPhaseEnd

    rlPhaseStartTest "mach-o"
        rlAssertNotDiffer "reference/mach-o/PythonLauncher.ref" "tmp/mach-o/PythonLauncher.my"
    rlPhaseEnd

    rlPhaseStartTest "mc"
        rlAssertNotDiffer "reference/mc/submit.mc.ref" "tmp/mc/submit.mc.my"
    rlPhaseEnd

    rlPhaseStartTest "mdb"
        rlAssertNotDiffer "reference/mdb/a.mdb.ref" "tmp/mdb/a.mdb.my"
        rlAssertNotDiffer "reference/mdb/self-created.mdb.ref" "tmp/mdb/self-created.mdb.my"
    rlPhaseEnd

    rlPhaseStartTest "mde"
        rlAssertNotDiffer "reference/mde/encoded_db.mde.ref" "tmp/mde/encoded_db.mde.my"
    rlPhaseEnd

    rlPhaseStartTest "mid"
        rlAssertNotDiffer "reference/mid/notes.mid.ref" "tmp/mid/notes.mid.my"
    rlPhaseEnd

    rlPhaseStartTest "misc"
        rlAssertNotDiffer "reference/misc/ansi2knr.ref" "tmp/misc/ansi2knr.my"
        rlAssertNotDiffer "reference/misc/core.ref" "tmp/misc/core.my"
        rlAssertNotDiffer "reference/misc/core2.ref" "tmp/misc/core2.my"
        rlAssertNotDiffer "reference/misc/mysql-bin-replication-log.ref" "tmp/misc/mysql-bin-replication-log.my"
        rlAssertNotDiffer "reference/misc/openvpn.ref" "tmp/misc/openvpn.my"
        rlAssertNotDiffer "reference/misc/p_cert.ref" "tmp/misc/p_cert.my"
        rlAssertNotDiffer "reference/misc/p_clear.ref" "tmp/misc/p_clear.my"
        rlAssertNotDiffer "reference/misc/p_pass.ref" "tmp/misc/p_pass.my"
        rlAssertNotDiffer "reference/misc/RPM-GPG-KEY-fedora-14-primary.ref" "tmp/misc/RPM-GPG-KEY-fedora-14-primary.my"
        rlAssertNotDiffer "reference/misc/scc-text.ref" "tmp/misc/scc-text.my"
        rlAssertNotDiffer "reference/misc/selinux_policy.ref" "tmp/misc/selinux_policy.my"
        rlAssertNotDiffer "reference/misc/zeros.ref" "tmp/misc/zeros.my"
    rlPhaseEnd

    rlPhaseStartTest "mkv"
        rlAssertNotDiffer "reference/mkv/matroska_test.mkv.ref" "tmp/mkv/matroska_test.mkv.my"
        rlAssertNotDiffer "reference/mkv/sample.mkv.ref" "tmp/mkv/sample.mkv.my"
    rlPhaseEnd

    rlPhaseStartTest "mng"
        rlAssertNotDiffer "reference/mng/jabber_connecting.mng.ref" "tmp/mng/jabber_connecting.mng.my"
    rlPhaseEnd

    rlPhaseStartTest "mo"
        rlAssertNotDiffer "reference/mo/a.mo.ref" "tmp/mo/a.mo.my"
    rlPhaseEnd

    rlPhaseStartTest "mono"
        rlAssertNotDiffer "reference/mono/Mono.TextTemplating.dll.ref" "tmp/mono/Mono.TextTemplating.dll.my"
        rlAssertNotDiffer "reference/mono/TextTransform.exe.ref" "tmp/mono/TextTransform.exe.my"
    rlPhaseEnd

    rlPhaseStartTest "mp3"
        rlAssertNotDiffer "reference/mp3/house_lo.mp3.ref" "tmp/mp3/house_lo.mp3.my"
    rlPhaseEnd

    rlPhaseStartTest "msc"
        rlAssertNotDiffer "reference/msc/ms_management_console.msc.ref" "tmp/msc/ms_management_console.msc.my"
    rlPhaseEnd

    rlPhaseStartTest "msi"
        rlAssertNotDiffer "reference/msi/SampleFirst_full.msi.ref" "tmp/msi/SampleFirst_full.msi.my"
    rlPhaseEnd

    rlPhaseStartTest "msp"
        rlAssertNotDiffer "reference/msp/Patch_full.msp.ref" "tmp/msp/Patch_full.msp.my"
    rlPhaseEnd

    rlPhaseStartTest "mst"
        rlAssertNotDiffer "reference/mst/wix_transform_full.mst.ref" "tmp/mst/wix_transform_full.mst.my"
    rlPhaseEnd

    rlPhaseStartTest "myi"
        rlAssertNotDiffer "reference/myi/event.MYI.ref" "tmp/myi/event.MYI.my"
    rlPhaseEnd

    rlPhaseStartTest "ods"
        rlAssertNotDiffer "reference/ods/test.ods.ref" "tmp/ods/test.ods.my"
    rlPhaseEnd

    rlPhaseStartTest "ogg"
        rlAssertNotDiffer "reference/ogg/fiba1.ogg.ref" "tmp/ogg/fiba1.ogg.my"
    rlPhaseEnd

    rlPhaseStartTest "patch"
        rlAssertNotDiffer "reference/patch/a.patch.ref" "tmp/patch/a.patch.my"
        rlAssertNotDiffer "reference/patch/b.patch.ref" "tmp/patch/b.patch.my"
        rlAssertNotDiffer "reference/patch/parser571033.patch.ref" "tmp/patch/parser571033.patch.my"
    rlPhaseEnd

    rlPhaseStartTest "pbm"
    rlPhaseEnd

    rlPhaseStartTest "pcd"
        rlAssertNotDiffer "reference/pcd/photo_cd.pcd.ref" "tmp/pcd/photo_cd.pcd.my"
    rlPhaseEnd

    rlPhaseStartTest "pdf"
        rlAssertNotDiffer "reference/pdf/mailman-admin.pdf.ref" "tmp/pdf/mailman-admin.pdf.my"
    rlPhaseEnd

    rlPhaseStartTest "pfa"
        rlAssertNotDiffer "reference/pfa/bchb.pfa.ref" "tmp/pfa/bchb.pfa.my"
    rlPhaseEnd

    rlPhaseStartTest "pfb"
        rlAssertNotDiffer "reference/pfb/a010013l.pfb.ref" "tmp/pfb/a010013l.pfb.my"
    rlPhaseEnd

    rlPhaseStartTest "pif"
        rlAssertNotDiffer "reference/pif/command.pif.ref" "tmp/pif/command.pif.my"
    rlPhaseEnd

    rlPhaseStartTest "pl"
        rlAssertNotDiffer "reference/pl/apxs.ref" "tmp/pl/apxs.my"
        rlAssertNotDiffer "reference/pl/arg_shebang.pl.ref" "tmp/pl/arg_shebang.pl.my"
        rlAssertNotDiffer "reference/pl/ConfigLocal_PM.pl.ref" "tmp/pl/ConfigLocal_PM.pl.my"
        rlAssertNotDiffer "reference/pl/enc2xs.ref" "tmp/pl/enc2xs.my"
        rlAssertNotDiffer "reference/pl/Makefile_PL.pl.ref" "tmp/pl/Makefile_PL.pl.my"
    rlPhaseEnd

    rlPhaseStartTest "pm"
        rlAssertNotDiffer "reference/pm/Find.pm.ref" "tmp/pm/Find.pm.my"
        rlAssertNotDiffer "reference/pm/Html.pm.ref" "tmp/pm/Html.pm.my"
        rlAssertNotDiffer "reference/pm/Select.pm.ref" "tmp/pm/Select.pm.my"
    rlPhaseEnd

    rlPhaseStartTest "png"
        rlAssertNotDiffer "reference/png/adhoc1.png.ref" "tmp/png/adhoc1.png.my"
    rlPhaseEnd

    rlPhaseStartTest "po"
        rlAssertNotDiffer "reference/po/rev0.0.po.ref" "tmp/po/rev0.0.po.my"
        rlAssertNotDiffer "reference/po/rev0.1.po.ref" "tmp/po/rev0.1.po.my"
        rlAssertNotDiffer "reference/po/rev1.1.po.ref" "tmp/po/rev1.1.po.my"
        rlAssertNotDiffer "reference/po/test.po.ref" "tmp/po/test.po.my"
    rlPhaseEnd

    rlPhaseStartTest "pot"
        rlAssertNotDiffer "reference/pot/presentation.pot.ref" "tmp/pot/presentation.pot.my"
        rlAssertNotDiffer "reference/pot/presentation_with_autostart_macro.pot.ref" "tmp/pot/presentation_with_autostart_macro.pot.my"
    rlPhaseEnd

    rlPhaseStartTest "potm"
        rlAssertNotDiffer "reference/potm/presentation.potm.ref" "tmp/potm/presentation.potm.my"
        rlAssertNotDiffer "reference/potm/presentation_with_autostart_macro.potm.ref" "tmp/potm/presentation_with_autostart_macro.potm.my"
    rlPhaseEnd

    rlPhaseStartTest "potx"
        rlAssertNotDiffer "reference/potx/presentation.potx.ref" "tmp/potx/presentation.potx.my"
    rlPhaseEnd

    rlPhaseStartTest "ppa"
        rlAssertNotDiffer "reference/ppa/presentation_non_auto_macros.ppa.ref" "tmp/ppa/presentation_non_auto_macros.ppa.my"
    rlPhaseEnd

    rlPhaseStartTest "ppam"
        rlAssertNotDiffer "reference/ppam/presentation_non_auto_macros.ppam.ref" "tmp/ppam/presentation_non_auto_macros.ppam.my"
    rlPhaseEnd

    rlPhaseStartTest "ppd"
        rlAssertNotDiffer "reference/ppd/Generic-PDF_Printer-PDF.ppd.ref" "tmp/ppd/Generic-PDF_Printer-PDF.ppd.my"
    rlPhaseEnd

    rlPhaseStartTest "ppm"
        rlAssertNotDiffer "reference/ppm/a.ppm.ref" "tmp/ppm/a.ppm.my"
    rlPhaseEnd

    rlPhaseStartTest "pps"
        rlAssertNotDiffer "reference/pps/presentation.pps.ref" "tmp/pps/presentation.pps.my"
        rlAssertNotDiffer "reference/pps/presentation_with_autostart_macro.pps.ref" "tmp/pps/presentation_with_autostart_macro.pps.my"
    rlPhaseEnd

    rlPhaseStartTest "ppsm"
        rlAssertNotDiffer "reference/ppsm/presentation.ppsm.ref" "tmp/ppsm/presentation.ppsm.my"
        rlAssertNotDiffer "reference/ppsm/presentation_with_autostart_macro.ppsm.ref" "tmp/ppsm/presentation_with_autostart_macro.ppsm.my"
    rlPhaseEnd

    rlPhaseStartTest "ppsx"
        rlAssertNotDiffer "reference/ppsx/presentation.ppsx.ref" "tmp/ppsx/presentation.ppsx.my"
    rlPhaseEnd

    rlPhaseStartTest "ppt"
        rlAssertNotDiffer "reference/ppt/encrypted.ppt.ref" "tmp/ppt/encrypted.ppt.my"
        rlAssertNotDiffer "reference/ppt/presentation.ppt.ref" "tmp/ppt/presentation.ppt.my"
        rlAssertNotDiffer "reference/ppt/presentation_with_autostart_macro.ppt.ref" "tmp/ppt/presentation_with_autostart_macro.ppt.my"
    rlPhaseEnd

    rlPhaseStartTest "pptm"
        rlAssertNotDiffer "reference/pptm/encrypted.pptm.ref" "tmp/pptm/encrypted.pptm.my"
        rlAssertNotDiffer "reference/pptm/presentation.pptm.ref" "tmp/pptm/presentation.pptm.my"
        rlAssertNotDiffer "reference/pptm/presentation_with_autostart_macro.pptm.ref" "tmp/pptm/presentation_with_autostart_macro.pptm.my"
    rlPhaseEnd

    rlPhaseStartTest "pptx"
        rlAssertNotDiffer "reference/pptx/encrypted.pptx.ref" "tmp/pptx/encrypted.pptx.my"
        rlAssertNotDiffer "reference/pptx/presentation.pptx.ref" "tmp/pptx/presentation.pptx.my"
    rlPhaseEnd

    rlPhaseStartTest "ps"
        rlAssertNotDiffer "reference/ps/filtered-test.ps.ref" "tmp/ps/filtered-test.ps.my"
    rlPhaseEnd

    rlPhaseStartTest "py"
        rlAssertNotDiffer "reference/py/gtk_label_autowrap.py.ref" "tmp/py/gtk_label_autowrap.py.my"
        rlAssertNotDiffer "reference/py/music.py.ref" "tmp/py/music.py.my"
        rlAssertNotDiffer "reference/py/Switchboard.py.ref" "tmp/py/Switchboard.py.my"
    rlPhaseEnd

    rlPhaseStartTest "pyc"
        rlAssertNotDiffer "reference/pyc/config.pyc.ref" "tmp/pyc/config.pyc.my"
        rlAssertNotDiffer "reference/pyc/handle.pyc.ref" "tmp/pyc/handle.pyc.my"
    rlPhaseEnd

    rlPhaseStartTest "rar"
        rlAssertNotDiffer "reference/rar/encrypted-hidden-filenames.rar.ref" "tmp/rar/encrypted-hidden-filenames.rar.my"
        rlAssertNotDiffer "reference/rar/encrypted.rar.ref" "tmp/rar/encrypted.rar.my"
        rlAssertNotDiffer "reference/rar/normal.rar.ref" "tmp/rar/normal.rar.my"
        rlAssertNotDiffer "reference/rar/rar-v4-archive.rar.ref" "tmp/rar/rar-v4-archive.rar.my"
    rlPhaseEnd

    rlPhaseStartTest "rb"
        rlAssertNotDiffer "reference/rb/docbook.rb.ref" "tmp/rb/docbook.rb.my"
    rlPhaseEnd

    rlPhaseStartTest "reg"
        rlAssertNotDiffer "reference/reg/windows_registry.reg.ref" "tmp/reg/windows_registry.reg.my"
    rlPhaseEnd

    rlPhaseStartTest "rpm"
        rlAssertNotDiffer "reference/rpm/a.rpm.ref" "tmp/rpm/a.rpm.my"
        rlAssertNotDiffer "reference/rpm/ppc.rpm.ref" "tmp/rpm/ppc.rpm.my"
        rlAssertNotDiffer "reference/rpm/ppc64.rpm.ref" "tmp/rpm/ppc64.rpm.my"
        rlAssertNotDiffer "reference/rpm/src.rpm.ref" "tmp/rpm/src.rpm.my"
        rlAssertNotDiffer "reference/rpm/s390.rpm.ref" "tmp/rpm/s390.rpm.my"
        rlAssertNotDiffer "reference/rpm/s390x.rpm.ref" "tmp/rpm/s390x.rpm.my"
    rlPhaseEnd

    rlPhaseStartTest "rtf"
        rlAssertNotDiffer "reference/rtf/word_document.rtf.ref" "tmp/rtf/word_document.rtf.my"
    rlPhaseEnd

    rlPhaseStartTest "s"
        rlAssertNotDiffer "reference/s/boring-asm.s.ref" "tmp/s/boring-asm.s.my"
    rlPhaseEnd

    rlPhaseStartTest "scr"
        rlAssertNotDiffer "reference/scr/SlideShow.scr.ref" "tmp/scr/SlideShow.scr.my"
    rlPhaseEnd

    rlPhaseStartTest "sct"
        rlAssertNotDiffer "reference/sct/editor_addin.sct.ref" "tmp/sct/editor_addin.sct.my"
    rlPhaseEnd

    rlPhaseStartTest "shb"
        rlAssertNotDiffer "reference/shb/win_document_shortcut_full.shb.ref" "tmp/shb/win_document_shortcut_full.shb.my"
    rlPhaseEnd

    rlPhaseStartTest "shs"
        rlAssertNotDiffer "reference/shs/win_scrap_file_full.shs.ref" "tmp/shs/win_scrap_file_full.shs.my"
    rlPhaseEnd

    rlPhaseStartTest "so"
        rlAssertNotDiffer "reference/so/libtables.so.ref" "tmp/so/libtables.so.my"
    rlPhaseEnd

    rlPhaseStartTest "svg"
        rlAssertNotDiffer "reference/svg/esc.svg.ref" "tmp/svg/esc.svg.my"
    rlPhaseEnd

    rlPhaseStartTest "tar.gz"
    rlPhaseEnd

    rlPhaseStartTest "tdb"
        rlAssertNotDiffer "reference/tdb/test.tdb.ref" "tmp/tdb/test.tdb.my"
    rlPhaseEnd

    rlPhaseStartTest "tex"
        rlAssertNotDiffer "reference/tex/pl-refcard.tex.ref" "tmp/tex/pl-refcard.tex.my"
        rlAssertNotDiffer "reference/tex/sk-survival.tex.ref" "tmp/tex/sk-survival.tex.my"
        rlAssertNotDiffer "reference/tex/test_latex.tex.ref" "tmp/tex/test_latex.tex.my"
    rlPhaseEnd

    rlPhaseStartTest "tga"
        rlAssertNotDiffer "reference/tga/bloom.tga.ref" "tmp/tga/bloom.tga.my"
        rlAssertNotDiffer "reference/tga/Font.tga.ref" "tmp/tga/Font.tga.my"
    rlPhaseEnd

    rlPhaseStartTest "tgz"
    rlPhaseEnd

    rlPhaseStartTest "thmx"
        rlAssertNotDiffer "reference/thmx/presentation.thmx.ref" "tmp/thmx/presentation.thmx.my"
    rlPhaseEnd

    rlPhaseStartTest "tif"
        rlAssertNotDiffer "reference/tif/note.tif.ref" "tmp/tif/note.tif.my"
    rlPhaseEnd

    rlPhaseStartTest "timezone"
        rlAssertNotDiffer "reference/timezone/localtime.ref" "tmp/timezone/localtime.my"
    rlPhaseEnd

    rlPhaseStartTest "ts"
        rlAssertNotDiffer "reference/ts/test1.ts.ref" "tmp/ts/test1.ts.my"
        rlAssertNotDiffer "reference/ts/test2.ts.ref" "tmp/ts/test2.ts.my"
        rlAssertNotDiffer "reference/ts/test3.ts.ref" "tmp/ts/test3.ts.my"
    rlPhaseEnd

    rlPhaseStartTest "ttf"
        rlAssertNotDiffer "reference/ttf/NanumGothic.ttf.ref" "tmp/ttf/NanumGothic.ttf.my"
    rlPhaseEnd

    rlPhaseStartTest "txt"
        rlAssertNotDiffer "reference/txt/dsn_15.txt.ref" "tmp/txt/dsn_15.txt.my"
        rlAssertNotDiffer "reference/txt/magic-bug-sample.txt.ref" "tmp/txt/magic-bug-sample.txt.my"
        rlAssertNotDiffer "reference/txt/msg-6505-1.txt.ref" "tmp/txt/msg-6505-1.txt.my"
        rlAssertNotDiffer "reference/txt/timestamp.txt.ref" "tmp/txt/timestamp.txt.my"
    rlPhaseEnd

    rlPhaseStartTest "ulaw"
        rlAssertNotDiffer "reference/ulaw/star.ulaw.ref" "tmp/ulaw/star.ulaw.my"
    rlPhaseEnd

    rlPhaseStartTest "vb"
        rlAssertNotDiffer "reference/vb/HelloWorld.vb.ref" "tmp/vb/HelloWorld.vb.my"
    rlPhaseEnd

    rlPhaseStartTest "vbe"
        rlAssertNotDiffer "reference/vbe/DateName.vbe.ref" "tmp/vbe/DateName.vbe.my"
    rlPhaseEnd

    rlPhaseStartTest "vbs"
        rlAssertNotDiffer "reference/vbs/DateName.vbs.ref" "tmp/vbs/DateName.vbs.my"
    rlPhaseEnd

    rlPhaseStartTest "wav"
        rlAssertNotDiffer "reference/wav/b0456.wav.ref" "tmp/wav/b0456.wav.my"
        rlAssertNotDiffer "reference/wav/send.wav.ref" "tmp/wav/send.wav.my"
    rlPhaseEnd

    rlPhaseStartTest "webm"
    rlPhaseEnd

    rlPhaseStartTest "wmv"
        rlAssertNotDiffer "reference/wmv/presentation.wmv.ref" "tmp/wmv/presentation.wmv.my"
    rlPhaseEnd

    rlPhaseStartTest "wps"
        rlAssertNotDiffer "reference/wps/word_document.wps.ref" "tmp/wps/word_document.wps.my"
    rlPhaseEnd

    rlPhaseStartTest "wsc"
        rlAssertNotDiffer "reference/wsc/HelloWorld.wsc.ref" "tmp/wsc/HelloWorld.wsc.my"
    rlPhaseEnd

    rlPhaseStartTest "wsf"
        rlAssertNotDiffer "reference/wsf/HelloWorld.wsf.ref" "tmp/wsf/HelloWorld.wsf.my"
    rlPhaseEnd

    rlPhaseStartTest "wsh"
        rlAssertNotDiffer "reference/wsh/HelloWorld.wsh.ref" "tmp/wsh/HelloWorld.wsh.my"
    rlPhaseEnd

    rlPhaseStartTest "xlam"
        rlAssertNotDiffer "reference/xlam/calculation.xlam.ref" "tmp/xlam/calculation.xlam.my"
    rlPhaseEnd

    rlPhaseStartTest "xls"
        rlAssertNotDiffer "reference/xls/calculation-new-format.xls.ref" "tmp/xls/calculation-new-format.xls.my"
        rlAssertNotDiffer "reference/xls/calculation-old-format.xls.ref" "tmp/xls/calculation-old-format.xls.my"
        rlAssertNotDiffer "reference/xls/calculation_with_autostart_macro.xls.ref" "tmp/xls/calculation_with_autostart_macro.xls.my"
    rlPhaseEnd

    rlPhaseStartTest "xlsb"
        rlAssertNotDiffer "reference/xlsb/calculation_with_autostart_macro.xlsb.ref" "tmp/xlsb/calculation_with_autostart_macro.xlsb.my"
        rlAssertNotDiffer "reference/xlsb/calculation.xlsb.ref" "tmp/xlsb/calculation.xlsb.my"
        rlAssertNotDiffer "reference/xlsb/encrypted.xlsb.ref" "tmp/xlsb/encrypted.xlsb.my"
    rlPhaseEnd

    rlPhaseStartTest "xlsm"
        rlAssertNotDiffer "reference/xlsm/calculation_with_autostart_macro.xlsm.ref" "tmp/xlsm/calculation_with_autostart_macro.xlsm.my"
        rlAssertNotDiffer "reference/xlsm/calculation.xlsm.ref" "tmp/xlsm/calculation.xlsm.my"
        rlAssertNotDiffer "reference/xlsm/encrypted.xlsm.ref" "tmp/xlsm/encrypted.xlsm.my"
    rlPhaseEnd

    rlPhaseStartTest "xlsx"
        rlAssertNotDiffer "reference/xlsx/calculation.xlsx.ref" "tmp/xlsx/calculation.xlsx.my"
        rlAssertNotDiffer "reference/xlsx/encrypted.xlsx.ref" "tmp/xlsx/encrypted.xlsx.my"
    rlPhaseEnd

    rlPhaseStartTest "xlt"
        rlAssertNotDiffer "reference/xlt/calculation.xlt.ref" "tmp/xlt/calculation.xlt.my"
    rlPhaseEnd

    rlPhaseStartTest "xltm"
        rlAssertNotDiffer "reference/xltm/calculation.xltm.ref" "tmp/xltm/calculation.xltm.my"
    rlPhaseEnd

    rlPhaseStartTest "xltx"
        rlAssertNotDiffer "reference/xltx/calculation.xltx.ref" "tmp/xltx/calculation.xltx.my"
    rlPhaseEnd

    rlPhaseStartTest "xml"
        rlAssertNotDiffer "reference/xml/calculation.xml.ref" "tmp/xml/calculation.xml.my"
        rlAssertNotDiffer "reference/xml/output.xml.ref" "tmp/xml/output.xml.my"
        rlAssertNotDiffer "reference/xml/result.xml.ref" "tmp/xml/result.xml.my"
        rlAssertNotDiffer "reference/xml/xmlutf16.xml.ref" "tmp/xml/xmlutf16.xml.my"
    rlPhaseEnd

    rlPhaseStartTest "xps"
    rlPhaseEnd

    rlPhaseStartTest "xpt"
        rlAssertNotDiffer "reference/xpt/calbase.xpt.ref" "tmp/xpt/calbase.xpt.my"
    rlPhaseEnd

    rlPhaseStartTest "xsl"
        rlAssertNotDiffer "reference/xsl/table.xsl.ref" "tmp/xsl/table.xsl.my"
    rlPhaseEnd

    rlPhaseStartTest "zip"
        rlAssertNotDiffer "reference/zip/empty.zip.ref" "tmp/zip/empty.zip.my"
        rlAssertNotDiffer "reference/zip/stde.zip.ref" "tmp/zip/stde.zip.my"
        rlAssertNotDiffer "reference/zip/VisualC.zip.ref" "tmp/zip/VisualC.zip.my"
    rlPhaseEnd

    rlPhaseStartTest "z5"
        rlAssertNotDiffer "reference/z5/Aisle.z5.ref" "tmp/z5/Aisle.z5.my"
        rlAssertNotDiffer "reference/z5/guess.z5.ref" "tmp/z5/guess.z5.my"
        rlAssertNotDiffer "reference/z5/stiffmst.z5.ref" "tmp/z5/stiffmst.z5.my"
    rlPhaseEnd

    rlPhaseStartTest "z7"
        rlAssertNotDiffer "reference/z7/custard.z7.ref" "tmp/z7/custard.z7.my"
    rlPhaseEnd

    rlPhaseStartTest "z8"
        rlAssertNotDiffer "reference/z8/ats.z8.ref" "tmp/z8/ats.z8.my"
    rlPhaseEnd

    rlPhaseStartTest "3ds"
        rlAssertNotDiffer "reference/3ds/key.3DS.ref" "tmp/3ds/key.3DS.my"
    rlPhaseEnd

    rlPhaseStartTest "7z"
        rlAssertNotDiffer "reference/7z/spectrum.7z.ref" "tmp/7z/spectrum.7z.my"
    rlPhaseEnd

    rlJournalPrintText
rlJournalEnd
rm -rf tmp