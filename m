Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7D6CF30BD
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2019 15:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbfKGOAj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Nov 2019 09:00:39 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:59672 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726754AbfKGOAj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Nov 2019 09:00:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573135237;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=KyRLq4Ve3M2A1oneenpTnlCLHTlXWb5NRh38aJI9yyA=;
        b=CzBjGZSp7OyTa2tiLYIkmscSR+zllHoZF0IofPNpz+v6lHApgxtEknPamaqUYdCEYomE3R
        GJW0PLTGLmnKesdZoiMY09NZxboYfwRutrqK/dMZ1mf9IMHaQg83037l2V7wZL9HPjrL1L
        nStNVzNeGvOBF86qIGuRxygkegtSMBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-w1ZOD-4mP8i3wL4BJnzipg-1; Thu, 07 Nov 2019 09:00:35 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8ABCC107ACC4;
        Thu,  7 Nov 2019 14:00:34 +0000 (UTC)
Received: from olysonek-rh.redhat.com (unknown [10.40.205.146])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E217F600F8;
        Thu,  7 Nov 2019 14:00:31 +0000 (UTC)
From:   =?UTF-8?q?Ond=C5=99ej=20Lyson=C4=9Bk?= <olysonek@redhat.com>
To:     linux-i2c@vger.kernel.org
Cc:     jdelvare@suse.de,
        =?UTF-8?q?Ond=C5=99ej=20Lyson=C4=9Bk?= <olysonek@redhat.com>
Subject: [PATCH i2c-tools] tools: Load the i2c-dev kernel module when needed
Date:   Thu,  7 Nov 2019 15:00:06 +0100
Message-Id: <20191107140006.14413-1-olysonek@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: w1ZOD-4mP8i3wL4BJnzipg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i2c-dev kernel module is necessary to access I2C adapters from
userspace, so it's needed by all the I2C tools. The module is not
loaded automatically, so when e.g. i2cdetect is run without i2c-dev
loaded, it gives a false impression that no I2C adapters exist, which
is not very user-friendly:

 # i2cdetect -l
 # modprobe i2c-dev
 # i2cdetect -l
i2c-0=09i2c       =09i915 gmbus ssc                  =09I2C adapter
i2c-1=09i2c       =09i915 gmbus vga                  =09I2C adapter
i2c-2=09i2c       =09i915 gmbus panel                =09I2C adapter
i2c-3=09i2c       =09i915 gmbus dpc                  =09I2C adapter
i2c-4=09i2c       =09i915 gmbus dpb                  =09I2C adapter
i2c-5=09i2c       =09i915 gmbus dpd                  =09I2C adapter
i2c-6=09i2c       =09DPDDC-C                         =09I2C adapter
i2c-7=09i2c       =09DPDDC-D                         =09I2C adapter

This patch makes all the tools autoload i2c-dev when needed. The code
to load the module is compiled in only if libkmod is present on the
system.

This resolves the following Fedora bug:
https://bugzilla.redhat.com/show_bug.cgi?id=3D913203

The patch is based on a previous version of the patch by Michal Minar,
posted on linux-i2c some time ago:
https://marc.info/?l=3Dlinux-i2c&m=3D140195625915505&w=3D2

The patch is also inspired by the GPLv2+ modprobe from kmod.

Signed-off-by: Ond=C5=99ej Lyson=C4=9Bk <olysonek@redhat.com>
---
 tools/Module.mk   | 11 +++++-
 tools/i2cbusses.c | 97 +++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 95 insertions(+), 13 deletions(-)

diff --git a/tools/Module.mk b/tools/Module.mk
index 693102f..17ef8d4 100644
--- a/tools/Module.mk
+++ b/tools/Module.mk
@@ -12,10 +12,17 @@ TOOLS_DIR=09:=3D tools
 TOOLS_CFLAGS=09:=3D -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qu=
al \
 =09=09   -Wcast-align -Wwrite-strings -Wnested-externs -Winline \
 =09=09   -W -Wundef -Wmissing-prototypes -Iinclude
+TOOLS_LDFLAGS=09:=3D
+
+ifeq ($(shell pkg-config --exists libkmod && echo 1), 1)
+TOOLS_CFLAGS=09+=3D $(shell pkg-config --cflags libkmod) -DUSE_LIBKMOD
+TOOLS_LDFLAGS=09+=3D $(shell pkg-config --libs libkmod)
+endif
+
 ifeq ($(USE_STATIC_LIB),1)
-TOOLS_LDFLAGS=09:=3D $(LIB_DIR)/$(LIB_STLIBNAME)
+TOOLS_LDFLAGS=09+=3D $(LIB_DIR)/$(LIB_STLIBNAME)
 else
-TOOLS_LDFLAGS=09:=3D -L$(LIB_DIR) -li2c
+TOOLS_LDFLAGS=09+=3D -L$(LIB_DIR) -li2c
 endif
=20
 TOOLS_TARGETS=09:=3D i2cdetect i2cdump i2cset i2cget i2ctransfer
diff --git a/tools/i2cbusses.c b/tools/i2cbusses.c
index b4f00ae..5f3ad42 100644
--- a/tools/i2cbusses.c
+++ b/tools/i2cbusses.c
@@ -43,6 +43,14 @@
 #include <linux/i2c.h>
 #include <linux/i2c-dev.h>
=20
+#ifdef USE_LIBKMOD
+#include <libkmod.h>
+
+#define I2C_DEV_MOD_NAME "i2c_dev"
+#define MODULE_LOAD_ERR_MSG "Error: Failed to load required " \
+                             I2C_DEV_MOD_NAME " kernel module: "
+#endif
+
 enum adt { adt_dummy, adt_isa, adt_i2c, adt_smbus, adt_unknown };
=20
 struct adap_type {
@@ -63,6 +71,61 @@ static struct adap_type adap_types[5] =3D {
 =09  .algo=09=09=3D "N/A", },
 };
=20
+
+/**
+ * Try to load the i2c_dev kernel module.
+ * Returns 1 on success, 0 otherwise.
+ */
+static int load_i2c_dev_module(int quiet) {
+=09int ret =3D 0;
+#ifdef USE_LIBKMOD
+=09int flags =3D 0;
+=09struct kmod_ctx *ctx;
+=09struct kmod_list *l, *list =3D NULL;
+
+=09ctx =3D kmod_new(NULL, NULL);
+=09if (!ctx) {
+=09=09if (!quiet)
+=09=09=09fprintf(stderr,
+=09=09=09=09MODULE_LOAD_ERR_MSG "kmod_new() failed\n");
+=09=09goto out;
+=09}
+=09if (kmod_module_new_from_lookup(ctx, I2C_DEV_MOD_NAME, &list) < 0
+=09    || list =3D=3D NULL) {
+=09=09if (!quiet)
+=09=09=09fprintf(stderr, MODULE_LOAD_ERR_MSG
+=09=09=09=09I2C_DEV_MOD_NAME " module lookup failed\n");
+=09=09goto ctx_unref;
+=09}
+
+=09flags |=3D KMOD_PROBE_APPLY_BLACKLIST_ALIAS_ONLY;
+=09kmod_list_foreach(l, list) {
+=09=09struct kmod_module *mod =3D kmod_module_get_module(l);
+=09=09int res;
+=09=09res =3D kmod_module_probe_insert_module(mod, flags, NULL, NULL,
+=09=09                                      NULL, NULL);
+=09=09ret =3D (res >=3D 0);
+=09=09if (res =3D=3D -ENOENT && !quiet) {
+=09=09=09fprintf(stderr, MODULE_LOAD_ERR_MSG
+=09=09=09        "unknown symbol in module \"%s\", or unknown parameter (s=
ee dmesg)\n",
+=09=09=09        kmod_module_get_name(mod));
+=09=09} else if (res < 0 && !quiet) {
+=09=09=09fprintf(stderr, MODULE_LOAD_ERR_MSG "(module %s): %s\n",
+=09=09=09        kmod_module_get_name(mod), strerror(-res));
+=09=09}
+=09=09kmod_module_unref(mod);
+=09}
+
+=09kmod_module_unref_list(list);
+ctx_unref:
+=09kmod_unref(ctx);
+out:
+#else
+=09(void) quiet;
+#endif
+=09return ret;
+}
+
 static enum adt i2c_get_funcs(int i2cbus)
 {
 =09unsigned long funcs;
@@ -209,8 +272,12 @@ struct i2c_adap *gather_i2c_busses(void)
 =09   i2c-dev and what we really care about are the i2c-dev numbers.
 =09   Unfortunately the names are harder to get in i2c-dev */
 =09strcat(sysfs, "/class/i2c-dev");
-=09if(!(dir =3D opendir(sysfs)))
-=09=09goto done;
+=09if(!(dir =3D opendir(sysfs))) {
+=09=09if (!load_i2c_dev_module(0))
+=09=09=09goto done;
+=09=09if ((!(dir =3D opendir(sysfs))))
+=09=09=09goto done;
+=09}
 =09/* go through the busses */
 =09while ((de =3D readdir(dir)) !=3D NULL) {
 =09=09if (!strcmp(de->d_name, "."))
@@ -407,21 +474,29 @@ int parse_i2c_address(const char *address_arg, int al=
l_addrs)
 int open_i2c_dev(int i2cbus, char *filename, size_t size, int quiet)
 {
 =09int file, len;
+=09int i;
=20
-=09len =3D snprintf(filename, size, "/dev/i2c/%d", i2cbus);
-=09if (len >=3D (int)size) {
-=09=09fprintf(stderr, "%s: path truncated\n", filename);
-=09=09return -EOVERFLOW;
-=09}
-=09file =3D open(filename, O_RDWR);
-
-=09if (file < 0 && (errno =3D=3D ENOENT || errno =3D=3D ENOTDIR)) {
-=09=09len =3D snprintf(filename, size, "/dev/i2c-%d", i2cbus);
+=09for (i =3D 0; i < 2; ++i) {
+=09=09len =3D snprintf(filename, size, "/dev/i2c/%d", i2cbus);
 =09=09if (len >=3D (int)size) {
 =09=09=09fprintf(stderr, "%s: path truncated\n", filename);
 =09=09=09return -EOVERFLOW;
 =09=09}
 =09=09file =3D open(filename, O_RDWR);
+
+=09=09if (file < 0 && (errno =3D=3D ENOENT || errno =3D=3D ENOTDIR)) {
+=09=09=09len =3D snprintf(filename, size, "/dev/i2c-%d", i2cbus);
+=09=09=09if (len >=3D (int)size) {
+=09=09=09=09fprintf(stderr, "%s: path truncated\n", filename);
+=09=09=09=09return -EOVERFLOW;
+=09=09=09}
+=09=09=09file =3D open(filename, O_RDWR);
+=09=09}
+
+=09=09if (file >=3D 0 || (errno !=3D ENOENT && errno !=3D ENOTDIR))
+=09=09=09break;
+=09=09if (i > 0 || !load_i2c_dev_module(quiet))
+=09=09=09break;
 =09}
=20
 =09if (file < 0 && !quiet) {
--=20
2.20.1

