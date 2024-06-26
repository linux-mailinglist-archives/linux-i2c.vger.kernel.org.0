Return-Path: <linux-i2c+bounces-4384-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F4D919892
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 21:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C17171C21C97
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 19:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42BD19149E;
	Wed, 26 Jun 2024 19:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="k1AU9bl6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B901922DF
	for <linux-i2c@vger.kernel.org>; Wed, 26 Jun 2024 19:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719431610; cv=none; b=qZx9xkQA5nd4IRQ9QxBaDFfGglllWfqKe6VOQPs6hHL1lyHGxwZyLqijMNxAyGN1VPoVxUcBhX3EmKMmSiY3p1f5z80zaPIg6cER8N96trzyuV/NcMXMkgzjB2loqZQjo99MofV7ZSLzsvGVS0Z6wRGach8cuZiS5/pmpp6gf8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719431610; c=relaxed/simple;
	bh=0Ybj4wtW95M6drlyUm9WmidvdRg5rnZr11IpSHb4Sd0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RfyzHtvSX89uzQFvBuWWBjAYcO2rahWrbiWz/cFamNN2HjqhFj6fyzHNkzVLoDqXKMoJlST3gxVaKCafsDDBSIJwJSGkd9Xp2pI5LckElCSFSHqdmDK15JpRpG6GJHSn1ZXwC4Ydmmb6LNSf2Fj0PhgBlcxM0HW5aSloLiEsEHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=k1AU9bl6; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ec595d0acbso51717691fa.1
        for <linux-i2c@vger.kernel.org>; Wed, 26 Jun 2024 12:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719431607; x=1720036407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lRCmQ69BSqOdDqCtC+2XA7M6nsGtIS36NlCZuj8Lhm4=;
        b=k1AU9bl6FwkfB9HbPryO1lwuo77m1RKbygNU8JUlDsJZZsKRXwU5hlF/W6q6SsLF3w
         UiRr3EHtiYnte9aBdIx4kuZTVTPCiM8LPkj9jVq1hFcJIVhdZE/h7+uPSRuKopHd7X0x
         OfgzhvEFSYtri1DLVFZGIgLvtSwhVg4M8pGdvIbWnT7e4qi8Xq/V4KHe78vrDgCmzcul
         eh6HDW2v8IS2m1LEOek0xxQeJfhEERWwtdzr6cCamIs3Vuo7ZJ82ZFD/wsJ+GP+Fu44C
         KgsmXRwers7roNSU1lHq5pg+1jRs4WRv7LiBAo2+q8RnQcM3Q+6owxCjWt4HtdohmcTf
         9+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719431607; x=1720036407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRCmQ69BSqOdDqCtC+2XA7M6nsGtIS36NlCZuj8Lhm4=;
        b=hvwbCKOGX6zTY2jCqv4txU3gAgjfkKxgRVTiMAV8At7fqc06UyWrauLUxXDD4wg5qI
         xgqFhgP3ETN3FIpe+ypzOs7ZUGRqIbDQWa3Vs0esfiZ4fb3r3KfQey4003L3yRDtaEN6
         U+K21ksnn40sIgPFLSC6luI/e10ATUdKNAHGcpfU6NMKdeuQ3dYB5Zy8hjL1z4kW1NfA
         XcADYMOu7wu8wisJv1Q/Hb59+lTeHQ/62Od4768ElpQIlzG1pLWL7jRUpQaJar+d93pl
         nnsg9y3iRzagfS3xt+/oXx17LZG1zQgREW5QT1OUbZ4wrDEmn2HFHNKEDKXk4TdzQLmy
         KCiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7iqaKiXDmaFlsHg8qRNubD1xygiuuJtN8yCwHu7YAxhApi9QPftLzmubBKsykMqtBuFC213BLR9XfqQQcCnT/cWYL3WFkZ5w6
X-Gm-Message-State: AOJu0Yw4zfzUvVlYAr8KaStLA6ekpUR/SxX3PsSGH31G+gEwhCto4nxv
	MAtdLsFbLT6WRFZHIAHJRLGrti5VxYzC+KsnGpk/M9xUGD6u5kfgSdex11doDEA=
X-Google-Smtp-Source: AGHT+IFdmbxXiV37RcC2FIVseGLV7Xoe29GB0LBjDtgtJzPY16pt+6fWNxJtmJqdbRujSwfOb+Fihw==
X-Received: by 2002:a2e:9213:0:b0:2ec:4de9:7334 with SMTP id 38308e7fff4ca-2ec5b2fd2bdmr84530621fa.11.1719431606495;
        Wed, 26 Jun 2024 12:53:26 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d305616dfsm7607391a12.79.2024.06.26.12.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 12:53:26 -0700 (PDT)
Date: Wed, 26 Jun 2024 21:53:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <i25xsy5nnefy2gkk4htkhcxd2ifgpn5ljhps4kd7ixn3tcy5to@gd7vrvgjvbj4>
References: <20240625083131.2205302-2-u.kleine-koenig@baylibre.com>
 <rb2fmtnhaqicg2behqfijfypfsvkqatud4h6klal77u6scw2gp@cznyn5vof4x4>
 <pja67neo74zw6rqpv5n7ekivlhejbmpuge6umtuatwhgjbmcwr@7u7f7vhpnwtt>
 <siwnljn7t22tsqybv6w3dndhuiynhvudtshkmyh67q6kyxjl6j@wuisjuqlovyg>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rfuvtzq3as2b5mp6"
Content-Disposition: inline
In-Reply-To: <siwnljn7t22tsqybv6w3dndhuiynhvudtshkmyh67q6kyxjl6j@wuisjuqlovyg>


--rfuvtzq3as2b5mp6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 12:34:05PM +0200, Wolfram Sang wrote:
> Hi Uwe,
>=20
> > There is an inconsistency in the different *_device_id structures. Some
> > have a kernel_ulong_t for driver private data, others have a void*.
> > Depending on how it's used in the drivers, one or the other is better.
> > To get the best from both the idea is to do
> >=20
> > diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_device=
table.h
> > index 4338b1b4ac44..594c5ace303a 100644
> > --- a/include/linux/mod_devicetable.h
> > +++ b/include/linux/mod_devicetable.h
> > @@ -477,7 +477,10 @@ struct rpmsg_device_id {
> > =20
> >  struct i2c_device_id {
> >  	char name[I2C_NAME_SIZE];
> > -	kernel_ulong_t driver_data;	/* Data private to the driver */
> > +	union {
> > +		kernel_ulong_t driver_data;	/* Data private to the driver */
> > +		const void *data;
> > +	};
> >  };
> > =20
> >  /* pci_epf */
> >=20
> > which then allows to drop quite a few casts, e.g.
>=20
> I personally could live with the casts, even though the above looks
> clearer, of course. On suggestion, though, can we please have:
>=20
>  +		const void *data_ptr;
>=20
> There is no obvious difference between 'driver_data' and 'data' to
> determine what is the ulong type and what is void*. 'data_ptr' makes
> this instantly recognizable IMO.

I share that concern, the reason for considering "data" is the output of

	git grep 'const void *' include/linux/mod_devicetable.h

Getting these all into alignment, maybe even picking a better name than
"driver_data", would be the eventual goal. IMHO "driver_data" vs
"data_ptr" looks strange, maybe I'd prefer "driver_ptr" over
"data" and "data_ptr"?!

Best regards and thanks for your feedback,
Uwe

--rfuvtzq3as2b5mp6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZ8cbEACgkQj4D7WH0S
/k53Cwf/VQIL34v5uMvrgjL1YTmr1pJOhbrfHIEuvYrNnvEK/AdlcME4v/v85UBu
MWdlzgTqMefvfAWLgo6WSlDEFUHMGtaAhmpNY+GLgq0NqX50zyH++7bkvP3fPR7G
1OMnWMLQVHDnryJ7rkS1ovcm+NEI2iPRhNrHCQLCpYtDQUcG7Anu0OZs8NnemynS
vv4FfnoeWLwcs5rbYAQHK3FMMcfiUFQwoE98BazecnjEdR5rh5Pn86CfqOxqbHvR
3rL+5/7brVDtejEdHPKhBnQRpbI0baMFRRqnrH8/yIFB0PaRtmB8ealXRz/1ohP0
wYxTe0t1EUT+pPtaGWVJHG8S6KOGyQ==
=8/Co
-----END PGP SIGNATURE-----

--rfuvtzq3as2b5mp6--

