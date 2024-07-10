Return-Path: <linux-i2c+bounces-4844-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A9592D54C
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 17:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24F811C2112B
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 15:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C33E19307A;
	Wed, 10 Jul 2024 15:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IcUTbVpJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91BE18FDA6
	for <linux-i2c@vger.kernel.org>; Wed, 10 Jul 2024 15:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720626487; cv=none; b=WDU61ZTrAlf3VPvLs2xWPkHzTOseTEbqQ/OhJGaQOwBkQUlmqLaCsyQ9/iaWbIju58rc4yeRFb0vZnXKJWtq+csYFRWLp6QivAoPNBeOd6nGakl1/6OxUqcH0sPbI4yi/y0LRaiIXvtrfyqJq8FPJrwWRAOtKgOqjpVGTZUODc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720626487; c=relaxed/simple;
	bh=oddPedEKNj4pX9N5DaWLvxgf+eAXu+l+uVZNuKGDdbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOTr7sgc2fHAYj6GGios4lhpYwCj9rVwpWUiIFvv5LLyu8GIINc6wzxliCJ19rEH5Q/Xo5NvImSF66Nba0RaU4L/5EnyBSfpoGuWEXU6tAw1Vby4d8psDuDSP3LriNyV1uZEYg5t3AsQa2eaj5gIPIaK1gOF4MPzjq5RO7FtNPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IcUTbVpJ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a77e85cb9b4so476223766b.0
        for <linux-i2c@vger.kernel.org>; Wed, 10 Jul 2024 08:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720626482; x=1721231282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aYXgwerogTY3PVzoTi9tjQJFg2ROky46/04E2k/MNhA=;
        b=IcUTbVpJJ4tRwq3FZM4YQkOju+n/XimFm8RRBnTzlsrwPqPrmeYRknE4iko08gEDx0
         tT8xWGJ5H4TE19AEqESzfwzER0ik49y5HisPPkN8GRV5rv/jBrc0HJCVpbwyoar0VNd0
         js/DMJfMIvaATLw28iBD4N67M3clUWNWcYIyj5jdUyTnWGLBFFe7u+FqNukuN+VshPhX
         5UQaDRiR4UAXBVAvtRdIh3CtGAPj5RydurlyrjUcNeU1gEDJA5pbVVKKYccLoJiyMhYA
         60pHV6wMkur/oE79v62cSseBztB9aq+me9VVeAo58i4NQLO1CHGgz9gew4tqGcw92UpG
         AHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720626482; x=1721231282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYXgwerogTY3PVzoTi9tjQJFg2ROky46/04E2k/MNhA=;
        b=UvfsIF8ldsoHKzl9KrXwB1Tdf7cxA/FDw3DYD6a8AA759ralF/Y65OpYsOv6ksj94e
         MxBk4cI9zW+gOAWRcvqGwArWzoD1WxTEcU8hZIUWuGDWUx1hBOTTg4YvO2A24ErFmVh7
         yp0eo8S/yqUNkcFTK/Pni/Bl2yGodk9f/i9NaK6hcv3vh3M/KAA+YODF8x6n8IGo70yN
         IigGNdVmvFZyXkvHPQzXlWKXHfKgKdKXvCa/7ip0YhPOhuJkcfiBh7LqmvXtbR1sNHm0
         szuYQ8ksjvaFeO1aJ7NUxxhYcOxFr4Xu+mDGU+KHswrfa6tIkFjHxqGV0iYmdvs+WLeo
         fcTA==
X-Forwarded-Encrypted: i=1; AJvYcCUiQ2HtcWbjMhCO9YGYYnlR6D871VL+PBY6yPJaT5J4tsi2ItAPP3KiXPhHmxtNgy1Myer8oo63gifW+sb30se1bodzC/eq5IMD
X-Gm-Message-State: AOJu0YyOw9h5B9wDMGpCTf+oC6wzj1fDrZ3jFC7+QrL04OI1xjDCV3Bm
	O8+DzdgRNS/227uGAj3NTGpMgLDSCPJstJaO4VXJef9RLkvF0agYokpcnyRxIb4=
X-Google-Smtp-Source: AGHT+IH0miVgNqWhwNDvxtRxk3pod9GFPWWTeJEOZ+2qxiuxn8cJ8oM+ksQfycsTgSvt3ouV27uvdQ==
X-Received: by 2002:a17:906:4ed7:b0:a6f:6126:18aa with SMTP id a640c23a62f3a-a780b89f569mr334580966b.67.1720626482110;
        Wed, 10 Jul 2024 08:48:02 -0700 (PDT)
Received: from localhost (p200300f65f164800ca5d02fee8f4878b.dip0.t-ipconnect.de. [2003:f6:5f16:4800:ca5d:2fe:e8f4:878b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bc57csm168684766b.1.2024.07.10.08.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 08:48:01 -0700 (PDT)
Date: Wed, 10 Jul 2024 17:48:00 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, 
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (pmbus/ltc4286) Improve device matching
Message-ID: <3jyzvldeh32cwjmvcuhazmz2jzuqjcbnza4yajnn2ky7mcby37@aswnxwoe6whu>
References: <cover.1720600141.git.u.kleine-koenig@baylibre.com>
 <cf49bf8b0ba4e50e71e0b31471748b50d7b1a055.1720600141.git.u.kleine-koenig@baylibre.com>
 <c98be2fa-bc08-45cb-bed6-3efeeefa8754@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nn446x7ofyzjfvr5"
Content-Disposition: inline
In-Reply-To: <c98be2fa-bc08-45cb-bed6-3efeeefa8754@roeck-us.net>


--nn446x7ofyzjfvr5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Guenter,

On Wed, Jul 10, 2024 at 07:09:28AM -0700, Guenter Roeck wrote:
> On 7/10/24 01:35, Uwe Kleine-K=F6nig wrote:
> > The devices supported by this driver report the model name in their
> > register space. The way this is evaluated allows longer strings than the
> > driver's model list. Document this behaviour in a code comment to lessen
> > the surprise for the next reader.
> >=20
> > Additionally emit the reported model name in case of a mismatch.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > ---
> >   drivers/hwmon/pmbus/ltc4286.c | 12 +++++++++---
> >   1 file changed, 9 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/hwmon/pmbus/ltc4286.c b/drivers/hwmon/pmbus/ltc428=
6.c
> > index 9e7ceeb7e789..2e5532300eff 100644
> > --- a/drivers/hwmon/pmbus/ltc4286.c
> > +++ b/drivers/hwmon/pmbus/ltc4286.c
> > @@ -95,13 +95,19 @@ static int ltc4286_probe(struct i2c_client *client)
> >   				     "Failed to read manufacturer model\n");
> >   	}
> > -	for (mid =3D ltc4286_id; mid->name[0]; mid++) {
> > +	for (mid =3D ltc4286_id; mid->name[0]; mid++)
> > +		/*
> > +		 * Note that by limiting the comparison to strlen(mid->name)
> > +		 * chars, the device reporting "lTc4286chocolade" is accepted,
> > +		 * too.
> > +		 */
>=20
> This is misleading; the desired match is LTC4286 and all its variants (LT=
C4286[A-Z] and
> whatever else the vendor can come up with), i.e., it is supposed to inclu=
de all device
> variants, and ignoring case since it is irrelevant. Referring to the odd =
string just
> makes that look unnecessarily bad. I am not going to apply this patch, so=
rry.

You're quite an optimist, expecting "whatever the vendor can come up
with" but nothing bad :-)

Anyhow, what about updating the comment to read:

	Note that by limiting the comparison to strlen(mid->name) chars,
	matching for devices that report their model with a variant
	suffix is supported.

While looking at the code again, I spotted a (theoretic) bug: Given that
block_buffer isn't initialized at function entry, it might well contain
"LTC4286something" (which might even be realistic if the driver just
probed on a different bus?). Now if i2c_smbus_read_block_data(...
PMBUS_MFR_MODEL, ...) returned something between 0 and 6, we're looking
at bytes that didn't come from the block read.

Best regards
Uwe

--nn446x7ofyzjfvr5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaOrS0ACgkQj4D7WH0S
/k59gAf+P4eqTTePnJrTYvddwqBkdvM63uO/PGf3HFtHKPjmjGxbBaVeTgItGAO1
T/gb7keaaYQOfVk9RTDFpZMmOC2IaI+yJ3AUC0m7F+ICWKRFU+MqBgoRviZPm/9R
oaCJFUIUb0TS9PFfBEUYh58KuZSqvufYiJEx09QIhNSawZvFhVeFxlfJ07mPqnRr
hLFUkdXIaNITWfc09qJYpWJg5OU8I0DD4bnj/8FNfKqX8V4M15BPRx2dGk6KR9y6
3lwTlS9fx5YxVqD1BLwiqR4yJuWsxRFKIZRZ0MCe5g/a//Jnt6+ezU7gYHCeF7pd
2Yavwu8UnpAPN3Cqj45vocH5IIzC5A==
=VCEa
-----END PGP SIGNATURE-----

--nn446x7ofyzjfvr5--

