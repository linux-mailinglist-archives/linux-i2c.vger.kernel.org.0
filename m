Return-Path: <linux-i2c+bounces-11247-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 795F3ACD9C2
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 10:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEC7F172CCC
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 08:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD63214F9D6;
	Wed,  4 Jun 2025 08:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OGYGblhn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52D714B96E
	for <linux-i2c@vger.kernel.org>; Wed,  4 Jun 2025 08:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749025826; cv=none; b=fbI+eZN4WR7G7Wb269elF4IXzuBjIOkV/uu9n6YkEml/ECUVtm6OracYyLepgD3Bi/EOTfKSyxAoyjK2CCY3jmUWeS2tOSryVriGfqym7Veqb49bt5MrX6KfmnaV8Ij6DXGiTGrxNYjGRVtT1JMgJxMaxVSUdVOyQU7/ZMou30o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749025826; c=relaxed/simple;
	bh=t9lyLP6HQdSdpImuHZHSYDwdUMS6Hh6gWSWkNETJqLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Je0qRQN1yDzErQKXgRDII/+a063OxrxPLAIWuLxzH+lzWfsLxuijGb1I8uN6KigrQSjPYFH9RBpmDsvFwnI5hkc0ymSD/EOm48MO5+mA3uhbrTxms74AKF4gn5GES14nP4j0rRVFxpXGEP5dTzlDoi/NoVqSLFi6m4LBlincHDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OGYGblhn; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so436802a12.3
        for <linux-i2c@vger.kernel.org>; Wed, 04 Jun 2025 01:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749025820; x=1749630620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t9lyLP6HQdSdpImuHZHSYDwdUMS6Hh6gWSWkNETJqLk=;
        b=OGYGblhnoyrimAfnwOBx+3g+nvWWJvP/IrVab8gYy4E+3+JyQn0FDjBf0ss3T7OZjA
         HdtU7/Vm4d5TGodfuFH/c6iatsyFUzIZYitABYw/ausgpMHQQBdz/wYoGPfllAyDWi1g
         5jkXdfKCC+wb+uSvMl6BrNwnn69SbmdqujhiTIlV1jZfPUTWTcgVhuH0qO3ruAMmwkJm
         X6pLTorGrhxyH49jblAsAFe344pXcNETCAUn9bFWo5RAkXbhT3umYe0OBJIkLXqbN6rH
         nct8nRlZVVZZvUBZaIbm0OQkVSrfxpeR7e+kxAEqEYeitwGCviD/zYbBgOqWJTZ9ks0E
         2uig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749025820; x=1749630620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9lyLP6HQdSdpImuHZHSYDwdUMS6Hh6gWSWkNETJqLk=;
        b=q9Ym7DtTYmOUuZfR0om2Ph1h1ZnYV9hGfzWEvVG1ayKbBzWEuRMCbQb4xU11AzsSKK
         3+oZVYmn6nDYzFII/gKP/M2oRta1bT7i+eK2u6682aSbeADlhQZt0I+ahcbOBGWIBVHT
         3Zlm67rrC+EF6rHXAaSM0xIfGg7iYAnR53L2gDOvD0+sJ2k1vNsFpiJJATTAYrpcT6Mf
         2iCNneXWEqoriJnNBbC4uZ7zVa3amnUUiqNRV06oj0+UvGbS9O07+QzQkk4QF8Aexitp
         JsjsEXCy6mx7JyIbTW6yNKt3nRz6gRjn2noPckVIg3l+z0wmIJyLm60Y3wOTAj0qnDxH
         aNhA==
X-Forwarded-Encrypted: i=1; AJvYcCWIcho8mLd8BxxzyLm4mRguEb3EQIdji52hjX3Wl9tLJOZUvB4atdwSObsQAxt7BGE3zls3+CugJHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjxIufpzehtEDs73ekyKinJGkYpaIIYz8+7vdkzLdmh5Wz+4V9
	fnNPBmeZ6hYCx4hlOlTbKziJ+6P30+my+Ierc2woKml+ToymNQqt2xIrIiyecEuryvjOqPSf1dn
	2GMcJ
X-Gm-Gg: ASbGncuWws4IHzsXG3eKNis4Evg92YJ05+8/SS5xbGllF6CtAv0bsg2FJ8DOyxCu32c
	NkyLP9ESa+7404+xAVk60GtEs0H+nWdQGe4qVIwaavOVKB1X45SfnGpaSSimdpjht0GifOprhjZ
	o/tcBg6viyOh5jtPgCgbMZTJWpLbd/fqhQijP30a1HDMs68gi1tsz90oHAwfOLNOYw0U5P/TOu2
	Y0PeMGpH6jHfzdDNU/OMAQHYCHovybBK2c60W/fqeH/IS0ygAiG113alU9ceb2bwtf+VITeBJrB
	pF9XnDffEwKZpEP3AIrFSPCH98f6+ipyyUlnobupTZK5eKDl5OKlVMADBC3u8drqGVS+wmWaH67
	IhVTuCXL49XfN6KGtIw==
X-Google-Smtp-Source: AGHT+IFkZmJNjjLaQkUceqjjQ98oRfGhjpe98OT9AroVYr3fXdFalWm0wj5BIKZ7ZwJrkNnk4D69oA==
X-Received: by 2002:a17:907:6ea6:b0:ad8:adea:4b15 with SMTP id a640c23a62f3a-addf8f99268mr173964266b.48.1749025820502;
        Wed, 04 Jun 2025 01:30:20 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ada6ad3949bsm1065183966b.129.2025.06.04.01.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 01:30:19 -0700 (PDT)
Date: Wed, 4 Jun 2025 10:30:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: 1106498@bugs.debian.org
Cc: sergio <sazamoracl@gmail.com>, Jean Delvare <jdelvare@suse.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: Bug#1106498: Acknowledgement (linux-image-6.1.0-37-amd64: Ouput
 sound disappeared after last update on Lenovo Yoga Laptop)
Message-ID: <2ctrnceanjbxe65k4e6hcljyqfq7esotiinabwd3rb4dqsfcrs@pyo4wulkjgy7>
References: <174814452778.7037.3139530479075309721.reportbug@debian>
 <handler.1106498.B.1748144532663278.ack@bugs.debian.org>
 <174814452778.7037.3139530479075309721.reportbug@debian>
 <QVAUWS.D0WMICKBJT0C2@gmail.com>
 <174814452778.7037.3139530479075309721.reportbug@debian>
 <d7e5wempkmwckq3xegeucuj7ckfqino647no6czey4n4s7efig@5um3az3z3ysu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="umtkdrrhwhz4bg2x"
Content-Disposition: inline
In-Reply-To: <d7e5wempkmwckq3xegeucuj7ckfqino647no6czey4n4s7efig@5um3az3z3ysu>


--umtkdrrhwhz4bg2x
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Bug#1106498: Acknowledgement (linux-image-6.1.0-37-amd64: Ouput
 sound disappeared after last update on Lenovo Yoga Laptop)
MIME-Version: 1.0

Control: retitle -1 linux-image-6.1.0-37-amd64: sound device occasionally d=
oesn't appear after last microcode/kernel update on Lenovo Yoga Laptop

Hello,

On Thu, May 29, 2025 at 06:10:44PM +0200, Uwe Kleine-K=F6nig wrote:
> I added the i2c upstream maintainers for the i801 driver to Cc, maybe
> they have a good idea. To get an idea, find more context at
> https://bugs.debian.org/1106498.
>=20
> On Sun, May 25, 2025 at 07:07:02PM -0400, sergio wrote:
> > $ dmesg -T
> > [dom may 25 18:35:13 2025] i801_smbus 0000:00:1f.4: Transaction timeout
> > [dom may 25 18:35:13 2025] i801_smbus 0000:00:1f.4: Failed terminating =
the
> > transaction
> > [dom may 25 18:35:13 2025] i801_smbus 0000:00:1f.4: SMBus is busy, can'=
t use
> > it!
>=20
> That sounds as if there was a problem with the smbus driver or one of
> its devices. Maybe bus recovery would help, but the driver doesn't
> support that. I don't know if that is implementable?
>=20
> What devices do you have on the bus? (You can find that out in a first
> approximation using `ls -l /sys/bus/i2c/devices/*`.)
>=20
> Maybe this is a firmware issue. Are you running the newest BIOS on that
> machine?

Another thing I wonder is: In the initial report you said this happens
since the last kernel and microcode update. Can you please check if
reverting to the old kernel and microcode reliably fixes the problem and
then try to update only one of the packages and retest. Ideally update
in small steps using packages from snapshot.debian.org to find out which
package and version actually broke your sound output.
=20
Best regards
Uwe

--umtkdrrhwhz4bg2x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhABBYACgkQj4D7WH0S
/k4HHwf9FiFVGFLdDYbgxc6c8YEnxIvi8R3Wsrz8R/q6PiN7icrim8F3LFURqKZv
fd6BD9hd2OD9F+nA1a9V2r1ThwK8jMY/v7DfyZEEoqb3ySxb0GtlwW/bNPdHRlfx
DqiA+LkJ8pU1wqEAXwj3RiaOGWkbA9DJPTVerCi4NM9E2rJdGfiatIwCcdRvEO6M
kjP2KNI4vMkhhJ+gZUJ4wtGBt/UXyhvvZjCDtD7M7EoSCOafEvy53YjZ/HUK8kVw
MZ1O+Lx76eXtbhYofALNZJbIX0W/hA0ShVTG+3mV97eC2hIzLThcOo4pz1DqxnMN
SU0F0jO4HXp9P0ZA+I6MBe0mBY6dhw==
=De5m
-----END PGP SIGNATURE-----

--umtkdrrhwhz4bg2x--

