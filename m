Return-Path: <linux-i2c+bounces-4879-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B112B92E07D
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 09:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E40E2814D7
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 07:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A86D12EBE3;
	Thu, 11 Jul 2024 06:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="k1JHq7ZD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2116F13F439
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 06:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720681147; cv=none; b=eoi7mPFM3o+GhFC/MoMQmGWHvU5ePegnjn+5tdBLYlqy4iFJbLSMjeg6zuxbpq+n9WWtGSv8vPK4JbMts5jR9z6ciYP/ya964Nyi2qO/D6TayBiOoXTHrtp+qdlLSlqvbdGQvPSWUhqDxsKHFkev5ww1gCoQLtCkDIt+VYgLzuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720681147; c=relaxed/simple;
	bh=ayPhVWTIPiDhF97kyHEdjOYPLw/ai95TF//OzPT0Blw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myyWxxLf+1uQHAgchLoK46Ku8muvyTnGKsBw2Gk8pawNzatK0XJlI6RfVRyepee87U7vYbg0rc25/KUiff19sJoIcCDDdU2mx59a14o+vEgTzgW9kAvZI2d7C4W4EXfq0dLdtGTVw9z+gW7W2YsiQdGvycXujRTbetHmWX8WREI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=k1JHq7ZD; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a728f74c23dso74633366b.1
        for <linux-i2c@vger.kernel.org>; Wed, 10 Jul 2024 23:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720681141; x=1721285941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CfCMvyhJlqsnh0V3XOFgutmpHNzCcaUC0rLZiDNZUPA=;
        b=k1JHq7ZDDMWjdJlbMTc8JvZN7xdR9TqmV2iie43iXXBv0Mz77erAummOdn7O7DEDl1
         ldIh2/CBjPz9uhJizX/KUFXRV40WkcY7NZgJMEvFZXUEe0viAq4jRKk29y2dqGXFzLdz
         C+hJb02OQk7QZdbUzbcwYqWkX/LB+3UtqXWm0i2CZ8K4Fdcr20wW1A47b5oef6cD6ycI
         l/Ab03H8kdh3FSKCHQF7qUVFo3U3aIotebQ4MCDiirdFGWfsJiJ2L/nUv53YHHE9V/bl
         omYeBLCQTKCrf5BivxXXv14YvetWq2ZcJumVCvSRkLUyGRiFlsU6MtXapiRTV/Bm34yj
         30JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720681141; x=1721285941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CfCMvyhJlqsnh0V3XOFgutmpHNzCcaUC0rLZiDNZUPA=;
        b=Jp37L74QzCg+ijVH0NcHXOWfW2o+BjXC+8XjO6U1nbyCXyMsu9gPG+Ugz1q4Xdihb/
         SZiXstUJ5w2uKZz6B39HAJBgORRMANsMzy2m3i/eAJXN/2p2EXBKyvQDu0e9pcx/RTXM
         LLgH4gYaHgsz4Bb1E0DsfPvsv5gPqYfHSybQ3S9/slODp8iDq8QWispeX0haMqflKiGt
         rGB+peLVYC5ApAw3hIJNZrhBthO0EdZpw8irMzooyAVxOIVGZUFQAhtk3GifJ9SqAG8M
         oobUk2E4qo34DA1ZE/vH1ccoU7gg+wY/7oU8NxAeE6d/8MwCbD5A4hAtIqRHSK/OfK6C
         rLnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMvMwcehfEltqpjtFwozO7ekz6991Fk9d3RxsB4Ng4Vq/SOxfmseoXf2C+uCv/2RElb32r0DZC2+RlkgjDYCw23Mqr/U+FWbD4
X-Gm-Message-State: AOJu0YxRUSYJNVFstH8sRNaE/WnixVHX2lQ5Lfqs52FsfqPaobczn6/8
	h9GUH+xcO9AbkSXmV8jnGBxmMF6ZYV62rdbHMZgTcrXXW+w2h5Ru9Fwp7V/tyVk741P37cNWycE
	2
X-Google-Smtp-Source: AGHT+IGzqByQaDlulzpECh7q9m9Kw4fpn/DdAeoGXYmEflArVdRKf6tmLX3JndJDAhVQvnhT+OVkOw==
X-Received: by 2002:a17:906:b2d7:b0:a77:c3b5:9e5d with SMTP id a640c23a62f3a-a780b8802cfmr495314766b.47.1720681140837;
        Wed, 10 Jul 2024 23:59:00 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bcccasm231682666b.12.2024.07.10.23.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 23:59:00 -0700 (PDT)
Date: Thu, 11 Jul 2024 08:58:58 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, 
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (pmbus/ltc4286) Improve device matching
Message-ID: <ezfkst4py7dnbktudhh4aqucdfbhfp3yacqh3rp6uae6zma22s@btpajdbboz3o>
References: <cover.1720600141.git.u.kleine-koenig@baylibre.com>
 <cf49bf8b0ba4e50e71e0b31471748b50d7b1a055.1720600141.git.u.kleine-koenig@baylibre.com>
 <c98be2fa-bc08-45cb-bed6-3efeeefa8754@roeck-us.net>
 <3jyzvldeh32cwjmvcuhazmz2jzuqjcbnza4yajnn2ky7mcby37@aswnxwoe6whu>
 <201dec9d-bba0-477b-bbb2-c17aa37b944a@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2ihnrbwkbycz3him"
Content-Disposition: inline
In-Reply-To: <201dec9d-bba0-477b-bbb2-c17aa37b944a@roeck-us.net>


--2ihnrbwkbycz3him
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Guenter,

On Wed, Jul 10, 2024 at 12:16:55PM -0700, Guenter Roeck wrote:
> On 7/10/24 08:48, Uwe Kleine-K=F6nig wrote:
> > On Wed, Jul 10, 2024 at 07:09:28AM -0700, Guenter Roeck wrote:
> > > On 7/10/24 01:35, Uwe Kleine-K=F6nig wrote:
> > > > The devices supported by this driver report the model name in their
> > > > register space. The way this is evaluated allows longer strings tha=
n the
> > > > driver's model list. Document this behaviour in a code comment to l=
essen
> > > > the surprise for the next reader.
> > > >=20
> > > > Additionally emit the reported model name in case of a mismatch.
> > > >=20
> > > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > > > ---
> > > >    drivers/hwmon/pmbus/ltc4286.c | 12 +++++++++---
> > > >    1 file changed, 9 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/drivers/hwmon/pmbus/ltc4286.c b/drivers/hwmon/pmbus/lt=
c4286.c
> > > > index 9e7ceeb7e789..2e5532300eff 100644
> > > > --- a/drivers/hwmon/pmbus/ltc4286.c
> > > > +++ b/drivers/hwmon/pmbus/ltc4286.c
> > > > @@ -95,13 +95,19 @@ static int ltc4286_probe(struct i2c_client *cli=
ent)
> > > >    				     "Failed to read manufacturer model\n");
> > > >    	}
> > > > -	for (mid =3D ltc4286_id; mid->name[0]; mid++) {
> > > > +	for (mid =3D ltc4286_id; mid->name[0]; mid++)
> > > > +		/*
> > > > +		 * Note that by limiting the comparison to strlen(mid->name)
> > > > +		 * chars, the device reporting "lTc4286chocolade" is accepted,
> > > > +		 * too.
> > > > +		 */
> > >=20
> > > This is misleading; the desired match is LTC4286 and all its variants=
 (LTC4286[A-Z] and
> > > whatever else the vendor can come up with), i.e., it is supposed to i=
nclude all device
> > > variants, and ignoring case since it is irrelevant. Referring to the =
odd string just
> > > makes that look unnecessarily bad. I am not going to apply this patch=
, sorry.
> >=20
> > You're quite an optimist, expecting "whatever the vendor can come up
> > with" but nothing bad :-)
> >=20
>=20
> "optimist" is relative. A perfectly valid alternative would be to _not_ d=
o any
> testing at all. After all, this is not a detect function, this is the pro=
be
> function, which should only be called _after_ the chip has been identifie=
d.
>=20
> Since the model number is not used for anything but extra validation, one=
 might
> as well argue that the validation is unnecessary and can or should be dro=
pped
> to reduce boot time. Of course, given the vagueness of the PMBus specific=
ation,
> that might result in fatal consequences if the wrong chip is instantiated,
> so I think that validation does make sense, and I suggest to add it for a=
ll
> PMBus drivers. However, one can overdo it (and not all drivers do it).

+1 for a generic check in generic code.

One could also argue that it's an error if the device was declared to be
a ltc4286 but reports LTC4287A in its PMBUS_MFR_MODEL register.
So something like:

	mid =3D i2c_client_get_device_id(client);

would make sense, too. (There is a corner case that the driver is not
bound via the entries in the driver's .id_table, not sure how relevant
this is.)

> > Anyhow, what about updating the comment to read:
> >=20
> > 	Note that by limiting the comparison to strlen(mid->name) chars,
> > 	matching for devices that report their model with a variant
> > 	suffix is supported.
> >=20
> > While looking at the code again, I spotted a (theoretic) bug: Given that
> > block_buffer isn't initialized at function entry, it might well contain
> > "LTC4286something" (which might even be realistic if the driver just
> > probed on a different bus?). Now if i2c_smbus_read_block_data(...
> > PMBUS_MFR_MODEL, ...) returned something between 0 and 6, we're looking
> > at bytes that didn't come from the block read.
> >=20
>=20
> Yes, I would agree that a check ensuring that ret >=3D 7 would make sense.

alternatively do

	block_buffer[ret] =3D '\0';

before the comparison.

To be honest, patch #2 was my focus and I don't have a pmbus device. So
I'll drop this topic and let you (or someone else) handle the action
items arising from this discussion.

Best regards
Uwe

--2ihnrbwkbycz3him
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaPgrAACgkQj4D7WH0S
/k7D5wf/Q6NOrIVqUQiKPOHrXzI1l00dGbDie3jDZ9MNAODpGph0Fh34eTTuQ8dV
CRD//aKzvjzTaYk1bXC1ITIKgP548AicSoQM7VZhkxL/1j7GpVNJj6bwqZIlNAZ+
sMN6CmyAR87lRenSFf6Eq9BlbQndoFWF1IZZEroiEONVlJkFCPcQnNuvq07O0XSs
qF+nXPeKJhm1BeCD/dSgJPIFEWjp3JTBGzqLCxCvnWV8fC7iv8MwVXV1Kt+y9yDb
jef4JF5hkSB1lXkabPBRPVwyb48lL7prIHZVRGlSb12KgjDLC92+F8PQ2BriPc4u
njYtIwJSUerWnv44zc6Wv0Syf/x/WA==
=nYen
-----END PGP SIGNATURE-----

--2ihnrbwkbycz3him--

