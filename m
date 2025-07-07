Return-Path: <linux-i2c+bounces-11866-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8A4AFB730
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 17:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6AA116BAC8
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 15:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778072E266E;
	Mon,  7 Jul 2025 15:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OikzEQGl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE3218D65C;
	Mon,  7 Jul 2025 15:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751901854; cv=none; b=PwUF1/SigAxgTP5Z6h5mi4RHcBGbmqxeDK6+evL0lBRHc12QfTYdTlkiOWKslE05fOae7MKlylfNNrTDmNd8ICu7VYR2fB+jID3uQdyJCvOzdM4fZyb6kq+/cnckB2IBhqfo/0YNZxiXuCTWzWtkTbCL+Ngy8+RFewd//bCGZpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751901854; c=relaxed/simple;
	bh=fDhz2osI4p8WqN2IabKaQrF83SU0gsKwpONhRUmNojE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTqCMVJ734SwvxAc51qZe/JHmJ4VaotTokxyuhQ03H4TU4jthZIoupr5JEQwyI6QOILX0ZwQP6wm/KoRyuuXcwMwJ8RCOSty7rfLTARG9D+t9hkvu8l6GEMbA97S841QEKYiEiEXBK0Rb2bJ/M/tbtLHKXdXb0qxOoZkSOMq7uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OikzEQGl; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4537fdec33bso20345835e9.1;
        Mon, 07 Jul 2025 08:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751901851; x=1752506651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T53LAA9y6FGyFGwKAbSwB6CU5K8ZNhe95J1OUbEWYbA=;
        b=OikzEQGlhmIv0OW520wt0APCcCS9RBXqGViSl0fghdJOYE92BHga5IEmgVoTNg0H2w
         o9uah/BlOQZbgCZzm6I1ihayJoZPw3tbDKctBDgqYJ4iU5JACCF5IxMU4A70HzOxtvfo
         d2Mo+f4Wp2kEPwmJdNeKvs3BrMWdYTBTJgQ+Im65nDhcawbialR2KOPMe5SuScKScJO+
         9rdgY0gCSEpJlapVUKztI3/m7QirhOLfaweeOQo5esNi6ztLOBDaDLr4D5oGTBoWuJ4t
         ZwdqHWTZSpPGJbQYZtaVfxEn2TVOXp6Ucx0p7VeNQgN+5Hj21t8qakmQIIKyzrAhDKN5
         brrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751901851; x=1752506651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T53LAA9y6FGyFGwKAbSwB6CU5K8ZNhe95J1OUbEWYbA=;
        b=hRt8b/nleIKgHTAHv8AGQH/hKv6lcKdbx4O1siZOZgJjztoPo4JBeZd6EqRiLuNcxV
         FjnBvvlxhuVLki5U56IBDppgFly6X9CCjXDPxLTY7PpTeuqjY+SxFf83Pdrx7Dn7v3E7
         iSYo8iFuAEPv30mR5VA92D30ATb5uDoFwkbE6o4fpTb5IKSL1ITdqySJvsKHsAU7qp3q
         E+NrWbb4ZcmGZeR9J8OLbvOFLZdV/x5lf4WeYETVdTimLi8RqVTX9bXZPDeAmwpAcQQr
         XrSYz1u63UTjShprD7Ijpf1q3Gspo5lBXyoRm1TA0xYpo4aE+d9JzAJdMM20hOv1roIS
         QVJA==
X-Forwarded-Encrypted: i=1; AJvYcCVU1CV2QicdfPizvyCcsWfpva8FfP/RVtpq10QmsZk2mYC8grAIc5jHekY9/GwYRMq8Rp+RiOVZe0ZyFqiH@vger.kernel.org, AJvYcCWNtvai9qSM7ivbZL+c/A1IPQaYmeXsF6TiUi6+bkJKFojC5PN2YOt83cnBdsiARfIFPFpaXd49r3nEpcI=@vger.kernel.org, AJvYcCWOwEtsG1Fk6thE3QoyOMs+ojQE4hLP6NsOB4M+yYglD4nlaExoXqCq9X+62zrkbhSrUGrP1jlwKUe6@vger.kernel.org, AJvYcCXTlK2j2XhrX4KjoEc3012B8r/SGZu+8AlzNJkkS13mgkbRn3Fc8VrcVeNFx7stmL99af5lkBSx59k0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqzn2r/2xRgyB5WOunZIIUY4wIkkAxuLMVghWaPmva9BwaF+A9
	3/ByGn79VMzSs3PU69SQ9guXjDl+03Z7rz7G8qD/u+oX+qDx7ITzd+ru
X-Gm-Gg: ASbGncslQLI7t4MM4wtXS4IDhMp3Bcp3g6KikgYGGYWetY/pWmUpzgVS+L93qtzqowV
	SYhFWBx957WMWV4/h5S77/8OpjINj9JgO2nOB4NuQbjC4CvI4elo9jUvm/hOsVjDLs9cVICno7Z
	9vVKoRKVTEwxgrQXQgQSma5biJQ/5g9Ea6B/hBHWKmjsPZdToJONXePW0xFzUqLj1FOoGPHSmB6
	xlOmVgTO3aVXEv5YeZO8qQz56sXnE55tZNUdcKHqE6p7k74UE+eT13JNNFY8fVIHDcUDIaDUN0S
	ChfRGhPfSa8BQvLz7Fzw4Q9nSgvFb2brcUXC8zVcT1VjieYovprghofcxzLqYpSIv14c98DggJN
	GoNuRIxCdYu2lp9Y6h7k09onk9YMKW+a3mruBsmKB4iH9ixvD
X-Google-Smtp-Source: AGHT+IG1w2T54Fkthr8wObL5maCg4ABYwcBuKKdJP4/t8bwdv58d2ysx+Bvgf7hosy/C1Q9tw0A6gw==
X-Received: by 2002:a05:600c:1907:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-454b4e76790mr110016745e9.8.1751901850422;
        Mon, 07 Jul 2025 08:24:10 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454adc71a96sm134872025e9.24.2025.07.07.08.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 08:24:09 -0700 (PDT)
Date: Mon, 7 Jul 2025 17:24:06 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, 
	Jon Hunter <jonathanh@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "digetx@gmail.com" <digetx@gmail.com>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v3 2/5] i2c: tegra: Do not configure DMA if not supported
Message-ID: <xbmn6f3uisuqbihxe3orlahlgopuy6sg6j5nujrvjikor3g3tt@b2mb7w45rgc6>
References: <20250609093420.3050641-1-kkartik@nvidia.com>
 <20250609093420.3050641-3-kkartik@nvidia.com>
 <z3evk6j53hbgf426kc4ltdv4dbisoqnwkfwhapyenpadhey6v7@zvbljg5svppi>
 <990e01e1864180247212775c2e27955a73bfea56.camel@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dx5hyoc36a3o5wkr"
Content-Disposition: inline
In-Reply-To: <990e01e1864180247212775c2e27955a73bfea56.camel@nvidia.com>


--dx5hyoc36a3o5wkr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/5] i2c: tegra: Do not configure DMA if not supported
MIME-Version: 1.0

On Mon, Jun 16, 2025 at 10:01:39AM +0000, Kartik Rajput wrote:
> Thanks for reviewing the patch Thierry!
>=20
> On Tue, 2025-06-10 at 10:28 +0200, Thierry Reding wrote:
> > On Mon, Jun 09, 2025 at 03:04:17PM +0530, Kartik Rajput wrote:
> > > On Tegra264, not all I2C controllers have the necessary interface
> > > to
> > > GPC DMA, this causes failures when function tegra_i2c_init_dma()
> > > is called.
> > >=20
> > > Ensure that "dmas" device-tree property is present before
> > > initializing
> > > DMA in function tegra_i2c_init_dma().
> > >=20
> > > Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> > > ---
> > > v1 -> v2:
> > > 	* Update commit message to clarify that some I2C
> > > controllers may
> > > 	=C2=A0 not have the necessary interface to GPC DMA.
> > > ---
> > > =C2=A0drivers/i2c/busses/i2c-tegra.c | 3 +++
> > > =C2=A01 file changed, 3 insertions(+)
> > >=20
> > > diff --git a/drivers/i2c/busses/i2c-tegra.c
> > > b/drivers/i2c/busses/i2c-tegra.c
> > > index ebd51165c46b..c7237d26b813 100644
> > > --- a/drivers/i2c/busses/i2c-tegra.c
> > > +++ b/drivers/i2c/busses/i2c-tegra.c
> > > @@ -448,6 +448,9 @@ static int tegra_i2c_init_dma(struct
> > > tegra_i2c_dev *i2c_dev)
> > > =C2=A0	if (IS_VI(i2c_dev))
> > > =C2=A0		return 0;
> > > =C2=A0
> > > +	if (!device_property_present(i2c_dev->dev, "dmas"))
> > > +		return 0;
> >=20
> > I know that you use the OF-independent variant here, but has this
> > been
> > tested on ACPI?
>=20
> No, Tegra I2C driver does not support DMA with ACPI boot.

Maybe in that case we should just use the of_property_present() here?
It's not a big deal, but it could help point out that this is only meant
to work with DT.

> > Originally the intention behind this code was to get some sort of
> > validation of the DT (i.e. dmas property is desired, so we want to
> > flag
> > if it isn't provided) with the fallback existing mostly just so
> > things
> > can operate in the absence (or if APB/GPC DMA isn't available for
> > some
> > reason).
> >=20
> > If we now solely make this depend on the availability of the DT (or
> > ACPI) property, then we loose all of that validation. I suppose we
> > have
> > DT schema to check for these kinds of things now, but since we're not
> > marking these properties as required, there's really no validation at
> > all anymore.
> >=20
> > My concern is that if somebody's left out the dmas/dma-names
> > properties
> > by accident, they may not get what they were asking for and we have
> > no
> > hints to provide whatsoever. Maybe that's okay if we provide the base
> > DT, which has been unmodified for a while.
>=20
> Should I add an info print here, to indicate that we are missing the
> "dmas" property?

That's not ideal either, because it would cause a print about missing
DMA for ACPI where DMA is expected not to work. And it will cause the
messages to be printed for I2C controllers that don't have the GPC DMA
interface.

Properly dealing with this would mean annotating each instance so we
know when this should be an error/warning. I don't think it's worth it
at this point. People will probably rely on the upstream DTSI file for
their needs anyway and we've got the dmas properties there. I think it
can be left as-is.

Or maybe we can add a dev_dbg() message to point this out, that's better
than nothing at all and shouldn't confuse people unnecessarily.

Thierry

--dx5hyoc36a3o5wkr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhr5pMACgkQ3SOs138+
s6HWzxAAgwP/j15NDbXBWCGv6G4TZX93zxaFdtDfKfsX59Drc8dXCkCCWUp5vAH8
oweIs9FVNd2IaDurJFxSY5LBWlJpaRA0y0RLO380N5Zaom+0QhGake3+1vOXoUcx
HekcjyZhQ3jMO87bEniWVGXOTTPhizuTo2YuUwU0KbrkjH1PfIL5bbkoLtGA+zvK
FGxlGo9uS9CCGNwJ2BaJWKWrmLV8y2ty8ZDec8Eso+fq3Z/CmiqIRPn7NY8RT7kf
J0icG95oIJRUjtsrJZ/Ud1XkAHy02MhuS7iTl7j/GIr37AsHc5UzMIvoTPwHe7Dq
MbPmzAdqZNJCTsj+YqgpQrgeF/TORJIWi6nWpSCTu0HnT+9HwEqO1BCWdYbDfKP2
ojh2oKqfpDaQHTaVvkoJ64ii70D1YlazKClzbH402eUAJcJbM4z02l0CdwtL1CZt
EQUrTvj+KM1+vC3pDiBhbtx8WbIo95GehtZgHnjtTBeS0U0sV8p+7VGVV1/OyKJQ
wyoZqDIUP2wH3g1GkFzR9zZjDsc6gwJevf+OkMMNvS0cWuX8SdQkQmoIQtknrbAl
QvZtoydCsVmkY5YOmYdDDmCW2IMZxwwndw9D59TZ2i6xlPxoy37GFtBGMigV0H5M
CupPkq72vJI6Ciphh+KqouAAmjTqdlTNS/dPQlqXiIlW12BnvIM=
=UbNH
-----END PGP SIGNATURE-----

--dx5hyoc36a3o5wkr--

