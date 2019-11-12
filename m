Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEB3BF8B56
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2019 10:06:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfKLJGO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Nov 2019 04:06:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32306 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725853AbfKLJGO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Nov 2019 04:06:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573549571;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=skbxpMCD7TgNgpbGtigr5Nt2PbvxPmgy7cR2KL0Jyuc=;
        b=jOm258KQDoMTBTIwJ2hcCTQUHJ5ku/XwMfrTMoomfcCr0fowmvTybfE2SJ/bXmg8wWzJhP
        K48lApp2kFcvMLXubNMGJ1naB8OSXpW8sY/s7pKPnNasMMnqauOs3iSPB2ZNKdsMa0Ft4b
        KSCrQsvzVHy66vcNhgSXUF7xJ8GS570=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-H3UOT_tcMuGo9Nop0JJkBA-1; Tue, 12 Nov 2019 04:06:01 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 323AD8EFCAE;
        Tue, 12 Nov 2019 09:06:00 +0000 (UTC)
Received: from olysonek-rh (unknown [10.43.2.91])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 61A9D1B41E;
        Tue, 12 Nov 2019 09:05:59 +0000 (UTC)
From:   =?utf-8?Q?Ond=C5=99ej_Lyson=C4=9Bk?= <olysonek@redhat.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools] tools: Load the i2c-dev kernel module when needed
In-Reply-To: <20191111200308.256bb9db@endymion>
References: <20191107140006.14413-1-olysonek@redhat.com> <20191111200308.256bb9db@endymion>
Date:   Tue, 12 Nov 2019 10:05:57 +0100
Message-ID: <fls4kz9xy4q.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: H3UOT_tcMuGo9Nop0JJkBA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean,

Jean Delvare <jdelvare@suse.de> writes:

> Hi Ond=C5=99ej,
>
> On Thu,  7 Nov 2019 15:00:06 +0100, Ond=C5=99ej Lyson=C4=9Bk wrote:
>> The i2c-dev kernel module is necessary to access I2C adapters from
>> userspace, so it's needed by all the I2C tools. The module is not
>> loaded automatically, so when e.g. i2cdetect is run without i2c-dev
>> loaded, it gives a false impression that no I2C adapters exist, which
>> is not very user-friendly:
>>=20
>>  # i2cdetect -l
>>  # modprobe i2c-dev
>>  # i2cdetect -l
>> i2c-0=09i2c       =09i915 gmbus ssc                  =09I2C adapter
>> i2c-1=09i2c       =09i915 gmbus vga                  =09I2C adapter
>> i2c-2=09i2c       =09i915 gmbus panel                =09I2C adapter
>> i2c-3=09i2c       =09i915 gmbus dpc                  =09I2C adapter
>> i2c-4=09i2c       =09i915 gmbus dpb                  =09I2C adapter
>> i2c-5=09i2c       =09i915 gmbus dpd                  =09I2C adapter
>> i2c-6=09i2c       =09DPDDC-C                         =09I2C adapter
>> i2c-7=09i2c       =09DPDDC-D                         =09I2C adapter
>
> Yeah, I agree, I meant to do this for a long time, actually I have a
> proof-of-concept patch for this on my disk from 2006 :-(
>
>> This patch makes all the tools autoload i2c-dev when needed. The code
>> to load the module is compiled in only if libkmod is present on the
>> system.
>
> What is the added value of libkmod here? I mean, how is this any better
> than:
>
> =09system("modprobe i2c-dev");
>
> which is what my patch was doing?

Using libkmod should be faster as it avoids executing the shell and then
modprobe. I could use system("modprobe i2c-dev") in the #else branch
when libkmod is not available, though.

>
>> This resolves the following Fedora bug:
>> https://bugzilla.redhat.com/show_bug.cgi?id=3D913203
>>=20
>> The patch is based on a previous version of the patch by Michal Minar,
>> posted on linux-i2c some time ago:
>> https://marc.info/?l=3Dlinux-i2c&m=3D140195625915505&w=3D2
>>=20
>> The patch is also inspired by the GPLv2+ modprobe from kmod.
>>=20
>> Signed-off-by: Ond=C5=99ej Lyson=C4=9Bk <olysonek@redhat.com>
>> ---
>>  tools/Module.mk   | 11 +++++-
>>  tools/i2cbusses.c | 97 +++++++++++++++++++++++++++++++++++++++++------
>>  2 files changed, 95 insertions(+), 13 deletions(-)
>>=20
>> diff --git a/tools/Module.mk b/tools/Module.mk
>> index 693102f..17ef8d4 100644
>> --- a/tools/Module.mkles joues
>> +++ b/tools/Module.mk
>> @@ -12,10 +12,17 @@ TOOLS_DIR=09:=3D tools
>>  TOOLS_CFLAGS=09:=3D -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast=
-qual \
>>  =09=09   -Wcast-align -Wwrite-strings -Wnested-externs -Winline \
>>  =09=09   -W -Wundef -Wmissing-prototypes -Iinclude
>> +TOOLS_LDFLAGS=09:=3D
>> +
>> +ifeq ($(shell pkg-config --exists libkmod && echo 1), 1)
>> +TOOLS_CFLAGS=09+=3D $(shell pkg-config --cflags libkmod) -DUSE_LIBKMOD
>> +TOOLS_LDFLAGS=09+=3D $(shell pkg-config --libs libkmod)
>> +endif
>> +
>>  ifeq ($(USE_STATIC_LIB),1)
>> -TOOLS_LDFLAGS=09:=3D $(LIB_DIR)/$(LIB_STLIBNAME)
>> +TOOLS_LDFLAGS=09+=3D $(LIB_DIR)/$(LIB_STLIBNAME)
>>  else
>> -TOOLS_LDFLAGS=09:=3D -L$(LIB_DIR) -li2c
>> +TOOLS_LDFLAGS=09+=3D -L$(LIB_DIR) -li2c
>>  endif
>> =20
>>  TOOLS_TARGETS=09:=3D i2cdetect i2cdump i2cset i2cget i2ctransfer
>> diff --git a/tools/i2cbusses.c b/tools/i2cbusses.c
>> index b4f00ae..5f3ad42 100644
>> --- a/tools/i2cbusses.c
>> +++ b/tools/i2cbusses.c
>> @@ -43,6 +43,14 @@
>>  #include <linux/i2c.h>
>>  #include <linux/i2c-dev.h>
>> =20
>> +#ifdef USE_LIBKMOD
>> +#include <libkmod.h>
>> +
>> +#define I2C_DEV_MOD_NAME "i2c_dev"
>> +#define MODULE_LOAD_ERR_MSG "Error: Failed to load required " \
>> +                             I2C_DEV_MOD_NAME " kernel module: "
>> +#endif
>> +
>>  enum adt { adt_dummy, adt_isa, adt_i2c, adt_smbus, adt_unknown };
>> =20
>>  struct adap_type {
>> @@ -63,6 +71,61 @@ static struct adap_type adap_types[5] =3D {
>>  =09  .algo=09=09=3D "N/A", },
>>  };
>> =20
>> +
>> +/**
>> + * Try to load the i2c_dev kernel module.
>> + * Returns 1 on success, 0 otherwise.
>> + */
>> +static int load_i2c_dev_module(int quiet) {
>> +=09int ret =3D 0;
>> +#ifdef USE_LIBKMOD
>> +=09int flags =3D 0;
>> +=09struct kmod_ctx *ctx;
>> +=09struct kmod_list *l, *list =3D NULL;
>> +
>> +=09ctx =3D kmod_new(NULL, NULL);
>> +=09if (!ctx) {
>> +=09=09if (!quiet)
>> +=09=09=09fprintf(stderr,
>> +=09=09=09=09MODULE_LOAD_ERR_MSG "kmod_new() failed\n");
>> +=09=09goto out;
>> +=09}
>> +=09if (kmod_module_new_from_lookup(ctx, I2C_DEV_MOD_NAME, &list) < 0
>> +=09    || list =3D=3D NULL) {
>> +=09=09if (!quiet)
>> +=09=09=09fprintf(stderr, MODULE_LOAD_ERR_MSG
>> +=09=09=09=09I2C_DEV_MOD_NAME " module lookup failed\n");
>> +=09=09goto ctx_unref;
>> +=09}
>> +
>> +=09flags |=3D KMOD_PROBE_APPLY_BLACKLIST_ALIAS_ONLY;
>> +=09kmod_list_foreach(l, list) {
>> +=09=09struct kmod_module *mod =3D kmod_module_get_module(l);
>> +=09=09int res;
>> +=09=09res =3D kmod_module_probe_insert_module(mod, flags, NULL, NULL,
>> +=09=09                                      NULL, NULL);
>> +=09=09ret =3D (res >=3D 0);
>> +=09=09if (res =3D=3D -ENOENT && !quiet) {
>> +=09=09=09fprintf(stderr, MODULE_LOAD_ERR_MSG
>> +=09=09=09        "unknown symbol in module \"%s\", or unknown parameter=
 (see dmesg)\n",
>> +=09=09=09        kmod_module_get_name(mod));
>> +=09=09} else if (res < 0 && !quiet) {
>> +=09=09=09fprintf(stderr, MODULE_LOAD_ERR_MSG "(module %s): %s\n",
>> +=09=09=09        kmod_module_get_name(mod), strerror(-res));
>> +=09=09}
>> +=09=09kmod_module_unref(mod);
>> +=09}
>> +
>> +=09kmod_module_unref_list(list);
>> +ctx_unref:
>> +=09kmod_unref(ctx);
>> +out:
>> +#else
>> +=09(void) quiet;
>> +#endif
>> +=09return ret;
>> +}
>> +
>>  static enum adt i2c_get_funcs(int i2cbus)
>>  {
>>  =09unsigned long funcs;
>> @@ -209,8 +272,12 @@ struct i2c_adap *gather_i2c_busses(void)
>>  =09   i2c-dev and what we really care about are the i2c-dev numbers.
>>  =09   Unfortunately the names are harder to get in i2c-dev */
>>  =09strcat(sysfs, "/class/i2c-dev");
>> -=09if(!(dir =3D opendir(sysfs)))
>> -=09=09goto done;
>> +=09if(!(dir =3D opendir(sysfs))) {
>> +=09=09if (!load_i2c_dev_module(0))
>> +=09=09=09goto done;
>> +=09=09if ((!(dir =3D opendir(sysfs))))
>> +=09=09=09goto done;
>> +=09}
>>  =09/* go through the busses */
>>  =09while ((de =3D readdir(dir)) !=3D NULL) {
>>  =09=09if (!strcmp(de->d_name, "."))
>> @@ -407,21 +474,29 @@ int parse_i2c_address(const char *address_arg, int=
 all_addrs)
>>  int open_i2c_dev(int i2cbus, char *filename, size_t size, int quiet)
>>  {
>>  =09int file, len;
>> +=09int i;
>> =20
>> -=09len =3D snprintf(filename, size, "/dev/i2c/%d", i2cbus);
>> -=09if (len >=3D (int)size) {
>> -=09=09fprintf(stderr, "%s: path truncated\n", filename);
>> -=09=09return -EOVERFLOW;
>> -=09}
>> -=09file =3D open(filename, O_RDWR);
>> -
>> -=09if (file < 0 && (errno =3D=3D ENOENT || errno =3D=3D ENOTDIR)) {
>> -=09=09len =3D snprintf(filename, size, "/dev/i2c-%d", i2cbus);
>> +=09for (i =3D 0; i < 2; ++i) {
>
> Sorry, what are you doing here?

I'm attempting to load /dev/i2c/%d or /dev/i2c-%d. If none of them
exist, I load the i2c-dev module and try again. Perhaps it would be
clearer if I used goto instead of the for loop. Or move opening the
files to a separate function.

>
>> +=09=09len =3D snprintf(filename, size, "/dev/i2c/%d", i2cbus);
>>  =09=09if (len >=3D (int)size) {
>>  =09=09=09fprintf(stderr, "%s: path truncated\n", filename);
>>  =09=09=09return -EOVERFLOW;
>>  =09=09}
>>  =09=09file =3D open(filename, O_RDWR);
>> +
>> +=09=09if (file < 0 && (errno =3D=3D ENOENT || errno =3D=3D ENOTDIR)) {
>> +=09=09=09len =3D snprintf(filename, size, "/dev/i2c-%d", i2cbus);
>> +=09=09=09if (len >=3D (int)size) {
>> +=09=09=09=09fprintf(stderr, "%s: path truncated\n", filename);
>> +=09=09=09=09return -EOVERFLOW;
>> +=09=09=09}
>> +=09=09=09file =3D open(filename, O_RDWR);
>> +=09=09}
>> +
>> +=09=09if (file >=3D 0 || (errno !=3D ENOENT && errno !=3D ENOTDIR))
>> +=09=09=09break;
>> +=09=09if (i > 0 || !load_i2c_dev_module(quiet))
>> +=09=09=09break;
>>  =09}
>> =20
>>  =09if (file < 0 && !quiet) {
>
>
> --=20
> Jean Delvare
> SUSE L3 Support

Thanks,
Ondra

