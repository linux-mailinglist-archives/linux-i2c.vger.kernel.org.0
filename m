Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8C303E27E0
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Aug 2021 11:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244689AbhHFJzi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Aug 2021 05:55:38 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:33522 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244496AbhHFJzi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Aug 2021 05:55:38 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 10D4C1FE4C;
        Fri,  6 Aug 2021 09:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1628243722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sEGpT0au7mcgbNliWwH/ja8m3G1CZdRYeq9tRtS7RiI=;
        b=ttYwmp1mKKnhRLGXWT8zmLxKkIYVO5zfsWZE3zYquqnBy0F0f65qa7GdkT3PhYpuj4VzJX
        HIzrRE/hQHqvsqkgKtAhRn/q8NBLbhtogColwqeA9dRi8OlpclTAnE6GS0KnEfOqJMrZTb
        Sd+lm3vD+IAixeCFBH/HJnXZJb3/WUs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1628243722;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sEGpT0au7mcgbNliWwH/ja8m3G1CZdRYeq9tRtS7RiI=;
        b=RKJu9Rmm+pNBXoZZ5qQbtRHX16QArfvvQUYcIFJfVYK/Q+juLvMMB3QWHJOfUhJQ9rXRB9
        C9ozsAP+tcpB2eCA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id C78541399D;
        Fri,  6 Aug 2021 09:55:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id GIq8LQkHDWENQwAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Fri, 06 Aug 2021 09:55:21 +0000
Date:   Fri, 6 Aug 2021 11:55:19 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 05/10] i2c: i801: Improve is_dell_system_with_lis3lv02d
Message-ID: <20210806115519.3d9c58cf@endymion>
In-Reply-To: <20210805230818.mmgybd4ybr2savyk@pali>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
        <f2477399-62df-0036-7d35-4e8634afad9c@gmail.com>
        <20210805115156.70e364be@endymion>
        <20210805191144.qq37e73p5zqomkem@pali>
        <14a49ba2-f6a6-3ccc-6a65-70a72bb3fe51@gmail.com>
        <20210805230818.mmgybd4ybr2savyk@pali>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Pali, Heiner,

On Fri, 6 Aug 2021 01:08:18 +0200, Pali Roh=C3=A1r wrote:
> On Thursday 05 August 2021 21:42:23 Heiner Kallweit wrote:
> > On 05.08.2021 21:11, Pali Roh=C3=A1r wrote: =20
> > > On Thursday 05 August 2021 11:51:56 Jean Delvare wrote: =20
> > >> On Sun, 01 Aug 2021 16:20:19 +0200, Heiner Kallweit wrote: =20
> > >>> Replace the ugly cast of the return_value pointer with proper usage.
> > >>> In addition use dmi_match() instead of open-coding it. =20
> > >>
> > >> Pali, would you be able to test this patch? =20
> > >=20
> > > Tested now on Latitude E6440 and patch is working fine (no difference=
).

Thank you for joining the discussion and testing.

> > >>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> > >>> ---
> > >>>  drivers/i2c/busses/i2c-i801.c | 13 ++++---------
> > >>>  1 file changed, 4 insertions(+), 9 deletions(-)
> > >>>
> > >>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c=
-i801.c
> > >>> index d971ee20c..a6287c520 100644
> > >>> --- a/drivers/i2c/busses/i2c-i801.c
> > >>> +++ b/drivers/i2c/busses/i2c-i801.c
> > >>> @@ -1191,7 +1191,7 @@ static acpi_status check_acpi_smo88xx_device(=
acpi_handle obj_handle,
> > >>> =20
> > >>>  	kfree(info);
> > >>> =20
> > >>> -	*((bool *)return_value) =3D true;
> > >>> +	*return_value =3D obj_handle; =20
> > >=20
> > > You are missing a cast here. "obj_handle" is of unknown typedef type
> > > acpi_handle and *return_value is of type void*. So this can generate a
> > > compile warning (either now or in future).
> >=20
> > acpi_handle is defined as:  typedef void *acpi_handle;
> > Therefore compiler is happy (as long as acpi_handle is any pointer type=
). =20
>=20
> But point of this typedefing is to hide real type and let user to use
> this "unknown" type without excepting any specific type.
>=20
> "Therefore compiler is happy" here is there just a "hack" which
> currently mute casting warning. But I think it is not something which
> should be used as it is against how API / code of specific function was
> designed.

But you can't respect that "unknown type" and still code cleanly. The
definition of acpi_handle hides the fact that this is a pointer type.
And you can't code cleanly if you need to manipulate an "object" but
have no idea whether it's a pointer, a scalar value or a structure.

(Well, you *could* with an API which does all the manipulation for you.
But that's not what we have here.)

In my opinion, the only value of "acpi_handle" as it is currently
defined is to let people know what type of data is found behind that
pointer. But I would much prefer real structure and an explicit pointer
to it.

> For me this situation looks like: Somebody created API and specified how
> to use it. It was realized that specified usage is not ideal for some
> operations. And then people started "hacking" this API to look better
> in these special cases.
>=20
> But solution for this issue is to fix API (or create a new API which
> better for this purpose), not hacking or workarounding it to looks
> better by hiding / workarounding other important details.

The practical issue here is that we are talking about ACPICA, which is
partly developed outside / independently of the rest of the kernel. If
you can convince the ACPICA developers to implement a better
alternative to acpi_get_devices(), and/or make acpi_handle a better
type, I'll be more than happy to use that in the i2c-i801 driver. But I
don't see that happening any time soon, if ever, and for the time
being, we have to live with the poor API we are given.

> > > So you need to write it something like this:
> > >=20
> > >   *((acpi_handle *)return_value) =3D obj_handle;
> > >=20
> > > But what is benefit of this change? Is not usage of explicit true and
> > > false values better than some acpi_handle type of undefined value sto=
red
> > > in obj_handle?
> >
> > From a logical perspective I agree. My motivation is that I see explicit
> > casts as a last resort and try to avoid them as far as possible. =20

I tend to agree with that, FWIW.

> But in this case you really should not avoid casting. It is different
> pointer type of unknown (or rather hidden) type. Currently it does not
> throw warning (maybe because compiler is not smart enough). But it does
> not mean that code is really semantically correct or that in future
> compiler (or its new version) does not throw warning.

It's not about the smartness of the compiler. acpi_handle is equal to
void *, and Heiner's code is perfectly valid for a void *. No cast
needed with any compiler or on any platform.

Of course, things would break if the definition of acpi_handle ever
changes. Which would be great new actually, as I wrote above. And we
can revisit the code then.

> Syntactically code looks better, but only until reader start studding
> what code is really doing.

I have to admit I got pretty confused when reading it at first. On the
other hand, I was equally confused by the code that it attempts to
replace ^^

> > The current code abuses a void* variable to store a bool. This makes the
> > implicit assumption that a pointer variable is always big enough to
> > store a bool. =20
>=20
> I understand your concerns and also your motivation. API is not ideal
> for usage. But both current and your proposed solution is just a hack to
> workaround this API usage.
>=20
> I think that according to C standard it is possible to cast between
> pointer and non-pointer (integer-like) types only via uintptr_t (or
> intptr_t) type...
>=20
> So compliant C code could look like this?
>=20
>     void func(void **ret) {
>         *ret =3D (void *)(uintptr_t)1;
>     }
>=20
>     bool test(void) {
>         void *found =3D (uintptr_t)0;
>         func(&found);
>         return (uintptr_t)found;
>     }
>=20
> or test() function may be simplified:
>=20
>     bool test(void) {
>         void *found =3D NULL;
>         func(&found);
>         return found;
>     }
>=20
> (but for me it looks strange if I'm reading _word_ NULL when used as a
> false value in 2-state logic variable)

I don't like this and I'm not even sure if that is allowed in the kernel.

> > With regard to "acpi_handle of undefined value": I'm just interested
> > in the information whether handle is NULL or not. That's the normal
> > implicit cast to bool like in every if(pointer) clause.  =20
>=20
> Yes, of course, this is fully valid.
> (...)
> > > Anyway, it looks strange to use name "found" for object handle
> > > variable. I would expect that something named "found" is storing
> > > something which refers to 2-state logic and not some handle value.

It's actually a rather common pattern for lookup functions, returning
NULL when the expected item wasn't found, or a pointer to the item if
found. What makes things a bit weird here is that we don't actually
care about acpi_handle. All we need is a pointer to pretty much
anything, to differentiate between the found and not found cases.

Therefore I would propose the following alternative:

--- linux-5.13.orig/drivers/i2c/busses/i2c-i801.c	2021-08-06 11:11:44.27520=
0299 +0200
+++ linux-5.13/drivers/i2c/busses/i2c-i801.c	2021-08-06 11:18:19.847469822 =
+0200
@@ -1194,7 +1194,7 @@ static acpi_status check_acpi_smo88xx_de
=20
 	kfree(info);
=20
-	*((bool *)return_value) =3D true;
+	*return_value =3D hid;	/* Could be any address, used as true value */
 	return AE_CTRL_TERMINATE;
=20
 smo88xx_not_found:
@@ -1204,13 +1204,10 @@ static acpi_status check_acpi_smo88xx_de
=20
 static bool is_dell_system_with_lis3lv02d(void)
 {
-	bool found;
-	const char *vendor;
+	acpi_handle found =3D NULL;
=20
-	vendor =3D dmi_get_system_info(DMI_SYS_VENDOR);
-	if (!vendor || strcmp(vendor, "Dell Inc."))
+	if (!dmi_match(DMI_SYS_VENDOR, "Dell Inc."))
 		return false;
-
 	/*
 	 * Check that ACPI device SMO88xx is present and is functioning.
 	 * Function acpi_get_devices() already filters all ACPI devices
@@ -1219,9 +1216,7 @@ static bool is_dell_system_with_lis3lv02
 	 * accelerometer but unfortunately ACPI does not provide any other
 	 * information (like I2C address).
 	 */
-	found =3D false;
-	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL,
-			 (void **)&found);
+	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL, &found);
=20
 	return found;
 }

Basically, it's Heiner's patch except for one line, the idea is to
return the HID string pointer (which has type char *) instead of the
acpi_handle. That way we don't depend on an opaque ACPI type. (I first
tried with the matching acpi_smo8800_ids entry but compiler complained
about incompatible pointer types due to the const).

Actually, I think we could use pretty much ANY pointer. Heck, that
would work too:

	*return_value =3D &disable_features;	/* Could be any address, used as true=
 value */

Would be kinda confusing, but the comment is supposed to address that.
In fact we could even do:

	*return_value =3D &i;	/* Could be any address, used as true value */

That's the address of a local variable on the stack, which will no
longer exist by the time we check it, but that's still a non-NULL
pointer so it would work :-D Seriously, let's not do that, simply
because static code analyzers would possibly complain.

--=20
Jean Delvare
SUSE L3 Support
