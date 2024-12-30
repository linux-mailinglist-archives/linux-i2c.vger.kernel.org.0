Return-Path: <linux-i2c+bounces-8821-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C695D9FE4FB
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 10:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9ED818829D5
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 09:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2611A2545;
	Mon, 30 Dec 2024 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nnQ0ouMh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31AA1A08A8
	for <linux-i2c@vger.kernel.org>; Mon, 30 Dec 2024 09:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735551782; cv=none; b=gVVC1MSHY0XRAAyxsPNxEwa/uIZVPxK8oLd0UtY11QnTq22kYY+aKODV6m9PyXMq7OKQ8EY8Uk9Mec6AvD1gHbfnWgLklKksAMiagZpmPE1q8RB5Qd9PU8Ah9ziV6WUKt9nk0/T78LOK+0MHQ3UzcphxxHPAI3F/hrexFNhlHHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735551782; c=relaxed/simple;
	bh=FjXlYxjX1sgy+GA/1EFVfivCpbDxsjR40JN4RqEhUwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7a/TyXQ1EpaiMrqhxbxrfeXVx0ZgWJRxlRENNktqvsgWB2nBcr/2V3T0NpTeO1W19EXA57Pl3AJqcutpF0DJjltMZX2K4qhq/uWvWIzjoIBk+3/os1s6Ah6sRUUBGYPnSE9LDYthLsUz1lcNzJQLx+WZREDZEC2mijDV9qN5hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nnQ0ouMh; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso14557666a12.0
        for <linux-i2c@vger.kernel.org>; Mon, 30 Dec 2024 01:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735551777; x=1736156577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FjXlYxjX1sgy+GA/1EFVfivCpbDxsjR40JN4RqEhUwY=;
        b=nnQ0ouMhTbGnMidTEQszqMyfM3uoOXm1Ut7tc7HDTqHCLcr9saNsvQtNvr9ZAUQyON
         5ff6AUOHm8LtmgWdyX2xRQmkODrXNh+0VsgYtgh0KRvtGM0ugR9dY6+ndxe/T6yoQpOT
         pV1IGfwOnXg0HchncM9xrT3aVMuVmeDGp1FfKZO7zzxG8eESqNR8sOxpmpRIrRv1uZCv
         cV4QcjykwZ8wvmGfslAqwHfYpBpYc9oi6o11sY4xZ1im5z+PbWYyfLSTvsQH+rIxZ1y9
         uESzu0uo/8td2cmPfGjBlIZv2fZeeVHw/adloksQTuosgFXRhjphm2e7WbtJ12B8mrNz
         RKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735551777; x=1736156577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjXlYxjX1sgy+GA/1EFVfivCpbDxsjR40JN4RqEhUwY=;
        b=st+OU/ymfTeXA1j/GCUWgIVjKA25TSD4GO7I/jp2sx3K67jaunSQNw3rGXbKecysnW
         4RjBu+1TCZtlK8RhAZjrBYGbrtjg+bvwBCGVOjtW1xTAKhOu1SmZbQXGVvCUp54V0iaZ
         0eXGvqQh7XtiOJ+v59pxKV1OkaIF+IkwBO5F8aur/iUtkZSYNyhuBTIi9G3sNqZYuich
         Y1Wqnb3uK+JsuxzUA+dPlnZVOwZiSoY7He0CoFqLgIjBboq7FhEym0bYOmkWZ254kl9o
         pO3F/ZrLFryCU4SkRGpcGALEyE5AVEd71fs3VgkkDtQ1im7Q379YlweVTGVp418N6Y/H
         /+CA==
X-Forwarded-Encrypted: i=1; AJvYcCUHk4CTMmePFiq34aI/osWXbJ4Syk5pLAqFsbRsDzsFjqe8B1n61zS6HsyL+G0yhfQjlyGOIm3savo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQDLs8efP6iSYlxq+Vz7dqvX4UEeLdTTtLXjEFLPMsW4xLiPDU
	HhjSZqOxpuTs78xFF/90dFHrpwtsQZcoDpxDWgMt+8w9Ne572kgIePAKoHq5+Sw=
X-Gm-Gg: ASbGncsJCiDC0UAS+4LOvdwLaFXZ1eFn2AQgbOMtjdayoD0OTuhuHh7kj6WZG2NuCgQ
	JBerrzsgq+1osiGSxvVm8R495QXyy4lrrl1IG0GJrdUgrCxBu7angQFgJu/jueMae5IyfbB/gem
	1+QVFbv3p0IATeaSCXGl8bSam4wsHl6LgfyMXa1sEMbQkjIhFI6lGKsJiEysZ8OUixZA3JQyH8v
	lJj6jQGQYotBJ/I27blipGqso/ld7mmmxo/ng8c7170Hi7rCgGKm37iFac45igzyEj3WiAzD9dn
	ZgGwsPSAWA==
X-Google-Smtp-Source: AGHT+IHVFYO8vdjLd+TmqH2YoHxXNVp5TJeYo6ulb/LEKYr3e0TXVsCjqKIwA/xzTaGp2dsn2f5EEw==
X-Received: by 2002:a17:907:3d9f:b0:aa6:7df0:b179 with SMTP id a640c23a62f3a-aac334422cfmr2701611866b.22.1735551776930;
        Mon, 30 Dec 2024 01:42:56 -0800 (PST)
Received: from localhost (p50915bc6.dip0.t-ipconnect.de. [80.145.91.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8953b6sm1465242766b.65.2024.12.30.01.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:42:56 -0800 (PST)
Date: Mon, 30 Dec 2024 10:42:55 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, andi.shyti@kernel.org, 
	andriy.shevchenko@linux.intel.com, masahiroy@kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH] module: Allow DEFAULT_SYMBOL_NAMESPACE be set after
 export.h included
Message-ID: <ytxbpm4zmausomklykqeqaw3nnkaurqwsi76uejgq655ylmxyd@ubbetotmrqo3>
References: <20241228184328.5ced280b@dsl-u17-10>
 <CAHk-=wi=7gHNhr0tOKQzSAhzR1TeAGQHYgh5+F1thaQkOZ094g@mail.gmail.com>
 <20241229005936.4d54f2a6@dsl-u17-10>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m2k2bsmfdvedwxi7"
Content-Disposition: inline
In-Reply-To: <20241229005936.4d54f2a6@dsl-u17-10>


--m2k2bsmfdvedwxi7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] module: Allow DEFAULT_SYMBOL_NAMESPACE be set after
 export.h included
MIME-Version: 1.0

On Sun, Dec 29, 2024 at 12:59:36AM +0000, David Laight wrote:
> On Sat, 28 Dec 2024 15:29:24 -0800
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
>=20
> > On Sat, 28 Dec 2024 at 10:43, David Laight <david.laight.linux@gmail.co=
m> wrote:
> > >
> > > Instead just default DEFAULT_SYMBOL_NAMESPACE to "" and remove the
> > > extra _EXPORT_SYMBOL() wrapper.
> > >
> > > This lets DEFAULT_SYMBOL_NAMESPACE be defined after export.h is inclu=
ded. =20
> >=20
> > Grr. This is horribly ugly.
>=20
> I thought it was a neater 'ugly' than the current definitions in export.h
>=20
> > I think the i2c code should just be fixed to use the proper "define
> > namespace early".
>=20
> The i2c changes were needed because I found the code wouldn't compile.
> It is pretty easy mistake to make and will happen again.

There is
https://lore.kernel.org/linux-i2c/20241203173640.1648939-2-u.kleine-koenig@=
baylibre.com
that moves the DEFAULT_SYMBOL_NAMESPACE above the #include block for the
i2c driver. Though it seems I missed ...master.c. (I'll address that.)

> and does - I missed drivers/pwm/pwm-lpss.c drivers/hwmon/nct6775-core.c
> and drivers/pwm/pwm-lpss.c

drivers/pwm/pwm-lpss.c is addressed by
https://lore.kernel.org/linux-pwm/cover.1733245406.git.ukleinek@kernel.org

the hwmon driver is addressed by
https://lore.kernel.org/linux-hwmon/20241203173149.1648456-2-u.kleine-koeni=
g@baylibre.com
(and applied in next)

There is also drivers/gpio/gpio-idio-16.c (which I guess you intended to
list instead of the pwm driver twice), which I sent a patch for at
https://lore.kernel.org/linux-gpio/20241203172631.1647792-2-u.kleine-koenig=
@baylibre.com
(also already applied in next).

Best regards
Uwe

--m2k2bsmfdvedwxi7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdyaxwACgkQj4D7WH0S
/k7+ZwgAg7JwYV+EHkpc+lAFqEZ4tuuyNasep6lbyZEZPnusB3pkyGAJz+I9vyBu
cXbbRFMhhzl7N7de+SDDd+j9OsNwnHMBENyGgx0W+VTjfALNh/3E+KzQ1/3+hTyB
L1rwI2sGk/4nmsJnfJfASWQFkx2zc2fj2s5o/pKDu15aeM6TCA2rLuipTJZbtrFp
OqbqbAyP78FNx4S5v3pYakV+qWZjK/Q/svmhpMK/8aBrS3753Dbl894hvlMglpuW
CSdoGHsTnIbl8iVfKx9JGZK9ccjvZm5HDB0o/gFPtp6g7cwHluQYRDLZpqVp1i3O
MUHAq3kPcKp86f+tW7zhHbG7iMIzOg==
=X57o
-----END PGP SIGNATURE-----

--m2k2bsmfdvedwxi7--

