Return-Path: <linux-i2c+bounces-8825-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 553B59FE61E
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 13:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 130D31881780
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 12:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2D71A7264;
	Mon, 30 Dec 2024 12:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="H4Bwrjhe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5671547F0
	for <linux-i2c@vger.kernel.org>; Mon, 30 Dec 2024 12:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735563294; cv=none; b=ZHmofDgsElB2iBlIXv5pmZCA7qpAyzzhPMSCCzAF/YlP8fStuBMVGmPUrQLjT2JeXJzfxFiZ7rR1gieKvDP1DGI9JJlCweYlkQ52NygTQvUxGL7zJN6WhVniI/6DhN+p+wXedftXmp2q9P1oCmoc0Gbnu5uSwi4buVe8W8aqfCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735563294; c=relaxed/simple;
	bh=LAzzG/KGUF22rwooiim/15WyGSz5Ax+cp4ybo5UHS/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvTZuTiQU5hPisqWiCen0w2QyXctrazKprCLsTKdUk8j0FFYxmIKiIUlEJKZXJFw6zog1XQhwPRSyNDBhu79EF3RMj4ko+tj1ciFm2SglxXUIW+tEPEJp8ajKFzh738XotIcba/bLh4TBYsc+Ee9q7YoDXbZ/vvFZvCWhcdUdds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=H4Bwrjhe; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa679ad4265so1838207666b.0
        for <linux-i2c@vger.kernel.org>; Mon, 30 Dec 2024 04:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735563290; x=1736168090; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L6yiVG2rvJcUZHF0ruSJLoM+2O4YApJgi/SKw2nu9zY=;
        b=H4BwrjheRn7r4VoAuHY6Bv1ICVnuKcuznmK8LiD1Tyge8SRNL0N9zRAW3MH4++jiQk
         t0APnNfpcewezBc15I/g9rkSYM9FOjKr0Qi1ZNlZUc3wVTs8wtpYTSkstZllyn7jqvYN
         rRxrvb/b5Pbbm7sXGXtrLERYhcwyb7iPzsnoRPo4LhR04wDBF5IIG/36A7TTvg66tl1t
         ZTVcpcX6Muw6Zp7krUnAXH8/jV2Rkr0lEVnSzZbFxcXwI7R7tmbxkVBIQavkIfoveTUO
         BVRb69Tt1ChdfhWhntFNMR04GJnqAXgEy6HdntyIempfSrUKgK9VdZ6/38v+D086xx3c
         nZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735563290; x=1736168090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6yiVG2rvJcUZHF0ruSJLoM+2O4YApJgi/SKw2nu9zY=;
        b=XYhi/vROeqysK7Ekbqw0HYrQiW/Lc2kmclKwqy2R/t0Cf7SsLoTBMSjtZxLMlnKckw
         jtHEg3dU4RDLO5NuddrApzvUdg6gIYi9aUZfXGyxhNZS6D0Dj5g2ERwRsjQu8X7y2qOq
         YDzgeVhN+Q7mZbSFDP8G2h6v+IM5Hcx4ADqXrWzY6AkfUvPhgOicGLa71Ba2eI/T/pm7
         dx7I5at/zUYCBiDJz0TgPSMLn4OeCTOWpCZnmz8HSTcHBaZtznPykx6RgmjRZk+fXVhc
         rPZSl1Z7ASwKrII9AxcXUw5LL0ZIf+mEYb4XYBYvnUukbpE2wqGw9cThHYAoTpmW+2B7
         F0qA==
X-Forwarded-Encrypted: i=1; AJvYcCXwsAYdHDudtvCR3Ph60eNOSMELhwCqRIYStkAJBvuEym/VF/F+FA+YqpUFfYkWwtA5vWDGmF1PKzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXqHLQIasMpJj5NRqosNXeVtmqKMVl/ckSgS8AOJ3u+/09LJof
	azHt+fKkyDKKoJeY3t0TaJxLPTqtz4iaXAPsIF9RWLvvZ1I1+y3YN39PDKfgGed/rvfEeO64fvJ
	e
X-Gm-Gg: ASbGncseUhQ8J4wV3E88A7jvNbjxrpt6/Yvbc/hrDKQ0KKnpK6iFsHonDjzBlVZ5rBd
	GGR6al6i2B2qnSpbDsqG3uT02ymj6CGspcATTFfFqijk/BEbBmCzU7a/zny5NuP+eCpZuYkjafF
	XknO02m+gz8UxPaKlI/VMedgvzPx3VJYJA1mGarXsXuDVfWjHUxm4RNruXOlnJacXbtO7TDDkic
	lk1OE2TkmLHaG37Ximj2zUe4H4FS65Bjc3Wvcc2Xe+5ujkZkQetyvqY+MHGgOGB2WuP28hQsdCp
	k4mdF/6mQQ==
X-Google-Smtp-Source: AGHT+IEguoQDHKqF2MqwSsZzJ2u420uxn0RCk2uzvFpxn5RzDEa87mmLVOJVrIMFViZ7aWTTyuWmzA==
X-Received: by 2002:a17:906:528c:b0:aae:83c7:6ce7 with SMTP id a640c23a62f3a-aae83c76e6fmr2812489566b.0.1735563290399;
        Mon, 30 Dec 2024 04:54:50 -0800 (PST)
Received: from localhost (p50915bc6.dip0.t-ipconnect.de. [80.145.91.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80678c8dbsm14645922a12.40.2024.12.30.04.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 04:54:49 -0800 (PST)
Date: Mon, 30 Dec 2024 13:54:45 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, andi.shyti@kernel.org, 
	andriy.shevchenko@linux.intel.com, masahiroy@kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH] module: Allow DEFAULT_SYMBOL_NAMESPACE be set after
 export.h included
Message-ID: <k3zeri45onxbumirsdq3egiy6hdp4x4wcuqj3phv6uddjmmyrd@yr6v4lqxadxu>
References: <20241228184328.5ced280b@dsl-u17-10>
 <CAHk-=wi=7gHNhr0tOKQzSAhzR1TeAGQHYgh5+F1thaQkOZ094g@mail.gmail.com>
 <20241229005936.4d54f2a6@dsl-u17-10>
 <ytxbpm4zmausomklykqeqaw3nnkaurqwsi76uejgq655ylmxyd@ubbetotmrqo3>
 <20241230120303.691e7a5c@dsl-u17-10>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3t45r7vjwkltydhy"
Content-Disposition: inline
In-Reply-To: <20241230120303.691e7a5c@dsl-u17-10>


--3t45r7vjwkltydhy
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] module: Allow DEFAULT_SYMBOL_NAMESPACE be set after
 export.h included
MIME-Version: 1.0

Hello David,

On Mon, Dec 30, 2024 at 12:03:03PM +0000, David Laight wrote:
> On Mon, 30 Dec 2024 10:42:55 +0100
> Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com> wrote:
>=20
> > On Sun, Dec 29, 2024 at 12:59:36AM +0000, David Laight wrote:
> > > On Sat, 28 Dec 2024 15:29:24 -0800
> > > Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > >  =20
> > > > On Sat, 28 Dec 2024 at 10:43, David Laight <david.laight.linux@gmai=
l.com> wrote: =20
> > > > >
> > > > > Instead just default DEFAULT_SYMBOL_NAMESPACE to "" and remove the
> > > > > extra _EXPORT_SYMBOL() wrapper.
> > > > >
> > > > > This lets DEFAULT_SYMBOL_NAMESPACE be defined after export.h is i=
ncluded.   =20
> > > >=20
> > > > Grr. This is horribly ugly. =20
> > >=20
> > > I thought it was a neater 'ugly' than the current definitions in expo=
rt.h
> > >  =20
> > > > I think the i2c code should just be fixed to use the proper "define
> > > > namespace early". =20
> > >=20
> > > The i2c changes were needed because I found the code wouldn't compile.
> > > It is pretty easy mistake to make and will happen again. =20
> >=20
> > There is
> > https://lore.kernel.org/linux-i2c/20241203173640.1648939-2-u.kleine-koe=
nig@baylibre.com
> > that moves the DEFAULT_SYMBOL_NAMESPACE above the #include block for the
> > i2c driver. Though it seems I missed ...master.c. (I'll address that.)
> >=20
> > > and does - I missed drivers/pwm/pwm-lpss.c drivers/hwmon/nct6775-core=
=2Ec
> > > and drivers/pwm/pwm-lpss.c =20
> >=20
> > drivers/pwm/pwm-lpss.c is addressed by
> > https://lore.kernel.org/linux-pwm/cover.1733245406.git.ukleinek@kernel.=
org
> >=20
> > the hwmon driver is addressed by
> > https://lore.kernel.org/linux-hwmon/20241203173149.1648456-2-u.kleine-k=
oenig@baylibre.com
> > (and applied in next)
> >=20
> > There is also drivers/gpio/gpio-idio-16.c (which I guess you intended to
> > list instead of the pwm driver twice), which I sent a patch for at
> > https://lore.kernel.org/linux-gpio/20241203172631.1647792-2-u.kleine-ko=
enig@baylibre.com
> > (also already applied in next).
>=20
>=20
> With all those applied it is probably worth applying my change to export.h
> (which is all I really wanted to do - until the build failures.)
>=20
> diff --git a/include/linux/export.h b/include/linux/export.h
> index 2633df4d31e6..6cea1c3982cd 100644
> --- a/include/linux/export.h
> +++ b/include/linux/export.h
> @@ -59,14 +59,12 @@
>=20
>  #endif
>=20
> -#ifdef DEFAULT_SYMBOL_NAMESPACE
> -#define _EXPORT_SYMBOL(sym, license)   __EXPORT_SYMBOL(sym, license, DEF=
AULT_SYMBOL_NAMESPACE)

If you keep the above definition (without the #ifdef), you don't need to
touch the definitions of EXPORT_SYMBOL and EXPORT_SYMBOL_GPL below.
Probably a matter of taste.

> -#else
> -#define _EXPORT_SYMBOL(sym, license)   __EXPORT_SYMBOL(sym, license, "")
> +#ifndef DEFAULT_SYMBOL_NAMESPACE
> +#define DEFAULT_SYMBOL_NAMESPACE ""
>  #endif
>=20
> -#define EXPORT_SYMBOL(sym)             _EXPORT_SYMBOL(sym, "")
> -#define EXPORT_SYMBOL_GPL(sym)         _EXPORT_SYMBOL(sym, "GPL")
> +#define EXPORT_SYMBOL(sym)             __EXPORT_SYMBOL(sym, "", DEFAULT_=
SYMBOL_NAMESPACE)
> +#define EXPORT_SYMBOL_GPL(sym)         __EXPORT_SYMBOL(sym, "GPL", DEFAU=
LT_SYMBOL_NAMESPACE)
>  #define EXPORT_SYMBOL_NS(sym, ns)      __EXPORT_SYMBOL(sym, "", ns)
>  #define EXPORT_SYMBOL_NS_GPL(sym, ns)  __EXPORT_SYMBOL(sym, "GPL", ns)
>=20
> It would be 'nice' to get that into 6.13 (along with the other changes th=
at
> remove __stringify()) - but it is getting late in the rc cycle now.

I'm pretty sure we won't get all my changes into v6.13.

Best regards
Uwe

--3t45r7vjwkltydhy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdymBMACgkQj4D7WH0S
/k455gf/f73bdsv52miqC5C2FcwH9xFjtKZL28cKNq2cJ0AEUVRUQ8tpc5qILX17
ggAplvWJ78J6+hY0NB7iQFBoWVcU7Q6rZoJlVlesXjrluySTHVdjGgnWVmj0L8Ue
1JI1jh5X9jxBa1uVI12fj5fm6EMCHQWEnOmTJVzzlH9Vur4PwUgfz03s73wJz5mi
5j8Zsdxa6aHMsUAwAjoSPeBwrm0FfXES/VDEO0EsZVBTUlTWogOX0/X4+piFGOaj
DjVB5v7szJGbKVNPs/tqjknKjTmbdGyB3Gy0Ho5hAkQzDwzyW0Bjmo1MW3+f+97Q
7XRZi3HA3AX3Yc7oxYgUrQa1vqSavw==
=JJSC
-----END PGP SIGNATURE-----

--3t45r7vjwkltydhy--

