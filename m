Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8592EF9424
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2019 16:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfKLP03 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Nov 2019 10:26:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28450 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725954AbfKLP02 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Nov 2019 10:26:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573572386;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E5iIwYu95q4CgjIOkOkB9fCweRXuBHi08YY9VXpwFb8=;
        b=eDLiefSep+y6n8ExjNy4zVikd5ZZg/Xx2BtmjLXqW4QVaW2zm5RQz9WM8iilQtnH35rx9U
        oQ/xAdo90aClbfAlko6ITJUe7sFpZM/6kbtkT8oo3YwJ+KaYUBAa6VGkVcZADdCtlv24Yn
        J1M0yAYzX4HX049tbIq/HtBkqwSHDU8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-Z_wCSJOiN6KOMaoDemCFHQ-1; Tue, 12 Nov 2019 10:26:24 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EE7BDB30;
        Tue, 12 Nov 2019 15:26:24 +0000 (UTC)
Received: from olysonek-rh (unknown [10.43.2.91])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 3718263641;
        Tue, 12 Nov 2019 15:26:23 +0000 (UTC)
From:   =?utf-8?Q?Ond=C5=99ej_Lyson=C4=9Bk?= <olysonek@redhat.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools] tools: Load the i2c-dev kernel module when needed
In-Reply-To: <1573555682.5312.3.camel@suse.de>
References: <20191107140006.14413-1-olysonek@redhat.com> <20191111200308.256bb9db@endymion> <fls4kz9xy4q.fsf@redhat.com> <1573555682.5312.3.camel@suse.de>
Date:   Tue, 12 Nov 2019 16:26:21 +0100
Message-ID: <flso8xhxgiq.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: Z_wCSJOiN6KOMaoDemCFHQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Jean Delvare <jdelvare@suse.de> writes:

> On Tue, 2019-11-12 at 10:05 +0100, Ond=C5=99ej Lyson=C4=9Bk wrote:
>> Jean Delvare <jdelvare@suse.de> writes:
>> > On Thu,  7 Nov 2019 15:00:06 +0100, Ond=C5=99ej Lyson=C4=9Bk wrote:
>> > > This patch makes all the tools autoload i2c-dev when needed. The cod=
e
>> > > to load the module is compiled in only if libkmod is present on the
>> > > system.
>> >=20
>> > What is the added value of libkmod here? I mean, how is this any bette=
r
>> > than:
>> >=20
>> > =09system("modprobe i2c-dev");
>> >=20
>> > which is what my patch was doing?
>>=20
>> Using libkmod should be faster as it avoids executing the shell and then
>> modprobe. I could use system("modprobe i2c-dev") in the #else branch
>> when libkmod is not available, though.
>
> Michal's patch was doing that, and I think it makes sense, as I'd
> rather not depend on the presence of libkmod for the feature itself. I
> would like to be able to document "the i2c-dev module will be loaded as
> needed" without having to explain in which case this will actually work
> and in which case it won't. Doesn't matter if it's slower without
> libkmod - that does not need to be documented.

Sure. I thought there was a reason not to use system() so I removed it,
but I was wrong. I'll re-add it on the #else branch.

>> > > This resolves the following Fedora bug:
>> > > https://bugzilla.redhat.com/show_bug.cgi?id=3D913203
>> > >=20
>> > > The patch is based on a previous version of the patch by Michal Mina=
r,
>> > > posted on linux-i2c some time ago:
>> > > https://marc.info/?l=3Dlinux-i2c&m=3D140195625915505&w=3D2
>> > >=20
>> > > The patch is also inspired by the GPLv2+ modprobe from kmod.
>> > >=20
>> > > Signed-off-by: Ond=C5=99ej Lyson=C4=9Bk <olysonek@redhat.com>
>> > > ---
>> > >  tools/Module.mk   | 11 +++++-
>> > >  tools/i2cbusses.c | 97 +++++++++++++++++++++++++++++++++++++++++---=
---
>> > >  2 files changed, 95 insertions(+), 13 deletions(-)
>> > >  (...)
>> > > +/**
>> > > + * Try to load the i2c_dev kernel module.
>> > > + * Returns 1 on success, 0 otherwise.
>> > > + */
>
> A rather unusual convention. Any reason why you opted for that rather
> that the usual 0 on success / -errno on error?

No reason; this was taken from Michal's patch. I'll change it in v2.

>> > > +static int load_i2c_dev_module(int quiet) {
>> > > +=09int ret =3D 0;
>> > > +#ifdef USE_LIBKMOD
>> > > +=09int flags =3D 0;
>> > > +=09struct kmod_ctx *ctx;
>> > > +=09struct kmod_list *l, *list =3D NULL;
>> > > +
>> > > +=09ctx =3D kmod_new(NULL, NULL);
>> > > +=09if (!ctx) {
>> > > +=09=09if (!quiet)
>> > > +=09=09=09fprintf(stderr,
>> > > +=09=09=09=09MODULE_LOAD_ERR_MSG "kmod_new() failed\n");
>> > > +=09=09goto out;
>> > > +=09}
>> > > +=09if (kmod_module_new_from_lookup(ctx, I2C_DEV_MOD_NAME, &list) < =
0
>> > > +=09    || list =3D=3D NULL) {
>> > > +=09=09if (!quiet)
>> > > +=09=09=09fprintf(stderr, MODULE_LOAD_ERR_MSG
>> > > +=09=09=09=09I2C_DEV_MOD_NAME " module lookup failed\n");
>> > > +=09=09goto ctx_unref;
>> > > +=09}
>> > > +
>> > > +=09flags |=3D KMOD_PROBE_APPLY_BLACKLIST_ALIAS_ONLY;
>> > > +=09kmod_list_foreach(l, list) {
>
> I must say I'm surprised this is a list, I thought module names had to
> be unique?

I was surprised as well. My understanding is that you pass an alias to
kmod_module_new_from_lookup() rather than a module name. And there could
be aliases called e.g. 'i2c-dev' that point to some other modules. The
kmod_module_new_from_lookup() function resolves the aliases and puts all
the target modules to the list. So module names are probably unique, but
aliases need not be. I think.

modprobe uses the same approach.

>> > > +=09=09struct kmod_module *mod =3D kmod_module_get_module(l);
>> > > +=09=09int res;
>> > > +=09=09res =3D kmod_module_probe_insert_module(mod, flags, NULL, NUL=
L,
>> > > +=09=09                                      NULL, NULL);
>> > > +=09=09ret =3D (res >=3D 0);
>
> Mixing "ret" and "res" in the same function is asking for trouble. Do
> you really need two variables?

Good point. I'll resolve it somehow in v2.

>> > > +=09=09if (res =3D=3D -ENOENT && !quiet) {
>> > > +=09=09=09fprintf(stderr, MODULE_LOAD_ERR_MSG
>> > > +=09=09=09        "unknown symbol in module \"%s\", or unknown param=
eter (see dmesg)\n",
>> > > +=09=09=09        kmod_module_get_name(mod));
>> > > +=09=09} else if (res < 0 && !quiet) {
>> > > +=09=09=09fprintf(stderr, MODULE_LOAD_ERR_MSG "(module %s): %s\n",
>> > > +=09=09=09        kmod_module_get_name(mod), strerror(-res));
>> > > +=09=09}
>> > > +=09=09kmod_module_unref(mod);
>
> Are we guaranteed that the driver probing has completed at this point?
> I mean, the kernel sends events for udev to process and the actual /dev
> nodes are created by udev asynchronously as I understand it. Don't we
> need an equivalent of "udevadm settle" here?

To be honest, I'm not sure. I'll look into it.

>> > > +=09}
>> > > +
>> > > +=09kmod_module_unref_list(list);
>> > > +ctx_unref:
>> > > +=09kmod_unref(ctx);
>> > > +out:
>> > > +#else
>> > > +=09(void) quiet;
>> > > +#endif
>> > > +=09return ret;
>> > > +}
>> > > +
>> > >  static enum adt i2c_get_funcs(int i2cbus)
>> > >  {
>> > >  =09unsigned long funcs;
>> > > @@ -209,8 +272,12 @@ struct i2c_adap *gather_i2c_busses(void)
>> > >  =09   i2c-dev and what we really care about are the i2c-dev numbers=
.
>> > >  =09   Unfortunately the names are harder to get in i2c-dev */
>> > >  =09strcat(sysfs, "/class/i2c-dev");
>> > > -=09if(!(dir =3D opendir(sysfs)))
>> > > -=09=09goto done;
>> > > +=09if(!(dir =3D opendir(sysfs))) {
>> > > +=09=09if (!load_i2c_dev_module(0))
>> > > +=09=09=09goto done;
>> > > +=09=09if ((!(dir =3D opendir(sysfs))))
>> > > +=09=09=09goto done;
>> > > +=09}
>> > >  =09/* go through the busses */
>> > >  =09while ((de =3D readdir(dir)) !=3D NULL) {
>> > >  =09=09if (!strcmp(de->d_name, "."))
>> > > @@ -407,21 +474,29 @@ int parse_i2c_address(const char *address_arg,=
 int all_addrs)
>> > >  int open_i2c_dev(int i2cbus, char *filename, size_t size, int quiet=
)
>> > >  {
>> > >  =09int file, len;
>> > > +=09int i;
>> > > =20
>> > > -=09len =3D snprintf(filename, size, "/dev/i2c/%d", i2cbus);
>> > > -=09if (len >=3D (int)size) {
>> > > -=09=09fprintf(stderr, "%s: path truncated\n", filename);
>> > > -=09=09return -EOVERFLOW;
>> > > -=09}
>> > > -=09file =3D open(filename, O_RDWR);
>> > > -
>> > > -=09if (file < 0 && (errno =3D=3D ENOENT || errno =3D=3D ENOTDIR)) {
>> > > -=09=09len =3D snprintf(filename, size, "/dev/i2c-%d", i2cbus);
>> > > +=09for (i =3D 0; i < 2; ++i) {
>> >=20
>> > Sorry, what are you doing here?
>>=20
>> I'm attempting to load /dev/i2c/%d or /dev/i2c-%d. If none of them
>> exist, I load the i2c-dev module and try again. Perhaps it would be
>> clearer if I used goto instead of the for loop. Or move opening the
>> files to a separate function.
>
> I think I would rename open_i2c_dev to static __open_i2c_dev or
> similar, and then add (untested):
>
> int open_i2c_dev(int i2cbus, char *filename, size_t size, int quiet)
> {
> =09int file;
>
> =09file =3D __open_i2c_dev(i2cbus, filename, size, quiet);
> =09if (file < 0 &&=C2=A0load_i2c_dev_module(quiet))
> =09=09file =3D __open_i2c_dev(i2cbus, filename, size, quiet);
>
> =09return file;
> }
>
> This avoids the extra indentation or the goto, and seems neater
> overall. I don't think we care about the slight performance penalty.
> What do you think?

Yes, I think that's the best solution. Will do.

> Thanks,
> --=20
> Jean Delvare
> SUSE L3 Support

Thanks for the review!

Ondra

