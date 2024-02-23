Return-Path: <linux-i2c+bounces-1952-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A9C861FDC
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 23:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D70831C23C81
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 22:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736FF143C63;
	Fri, 23 Feb 2024 22:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WNubgYoW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7471803E
	for <linux-i2c@vger.kernel.org>; Fri, 23 Feb 2024 22:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708727672; cv=none; b=DL2tw6ouplwNusZNmkRV5cHDhc3vZm9sSLL9T2y/Tt6CVlpzl/ksHoeqlHJ+JScKtyiRJWOR5Q9lxq00ZgTMelky0utg1SjSuwsgc45guHOn8PNOC7NuV22+CmzAKGBmNF2qdOO1TgAZ6sgTvNUBiC1cl10p9AfdiB5UqKG46ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708727672; c=relaxed/simple;
	bh=OjImI9nqJ8TO8TDyZt96kFcK0C88oOP70tesV0S+yBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6/7yBvM9Y5hS/vUO6OH5pg7MlmTkoWl4k0ML46YR8z9zzMb3KzdaxfZGAw65U61EFq4XqjqUHMHoSPXDN+IVVNgoKOq+9EqLOL3DZ2CesLzV8+yuauysbSrjFrJV4CnrrxO58q8gVBR3DUm5i5ON9xknfcgqSzgrh/RunjEVCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WNubgYoW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2Wfh
	FQ80HGIyU4EysZndPKnOpYN/Nd/vyMAbdv2H1oE=; b=WNubgYoWQFi11xP0oDRe
	z/4cvJH7rLAtEdS7XwEDVqmGY3B/gf0rxuPUCi8SUmKE5NbqOBWwE3iLQxBm9z/Y
	GEhlSWf36eGtjPd7KjFexqs64aymQbsRPCwOZcBC/7+QRUd4K/1mIjQ6nEUMx9JP
	AeZM/fNoXKdT96q0u3GhKaPjI1i7SzrnuBKBsjMY7PuqTkzMIFucYW2sTxJNgjBh
	kSBN6dzu658AL9eQEIOvM/8tXMt79XIyRdZtZrZXHw1xf+F5Z9tYhCEkfE1IKoFx
	RAyhlfXSm1iJv2YG1wkKEE87gA9pf/lj9V9PaSZ4GoezXe+222K7unYyAizoWy0i
	lg==
Received: (qmail 380856 invoked from network); 23 Feb 2024 23:34:20 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Feb 2024 23:34:20 +0100
X-UD-Smtp-Session: l3s3148p1@CUgsKRQS0JEujnsZ
Date: Fri, 23 Feb 2024 23:34:19 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: Remove obsolete i2c.txt
Message-ID: <Zdkda5jf072mENvK@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-sound@vger.kernel.org
References: <20240222174343.3482354-2-robh@kernel.org>
 <ZdemsdGQE0RtilCd@shikoro>
 <CAL_JsqKpn6jqktRLQUx7HMrJG0PZeiOZ=hQnHpZK6AHcM22CLQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fF2R2D/X283ptnYJ"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKpn6jqktRLQUx7HMrJG0PZeiOZ=hQnHpZK6AHcM22CLQ@mail.gmail.com>


--fF2R2D/X283ptnYJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

> > * In the schema, "clock-frequency" has a minimum of 1kHz and a maximum
> >   of 3MHz. Why? The specs do not say anything about a minimum freq and
> >   fastest speed mentioned in the docs is 5Mhz (Ultra fast mode).
>=20
> IIRC, the high speed mode originally topped out at 3MHz. I guess
> that's been revised.

Hs-mode has a max of 3.4MHz...

>=20
> We can drop the minimum.

=2E.. but I see you changed min/max now to 1/5000000. That's what I would
have suggested as well.


> > * new binding "i2c-scl-clk-low-timeout-us" has a description which I do
> >   not understand. What is a waiting state?
>=20
> Shrug. May have to look at the MPC h/w that uses the property.

I will also have another look. My gut feeling is that the binding is
okay, only the description might need an update.

> >
> > * new binding "no-detect" is broken. At the least, it should be named
> >   something like "bus-fully-described" and then the OS can decide to
> >   leave out auto-detection mechanisms. If you are interested in the
> >   latter, you can simply disable class based instantiation on the host
> >   controller. No need to describe this in DT.
>=20
> I've reverted the property now.

Cool, thanks!

Kind regards,

   Wolfram


--fF2R2D/X283ptnYJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXZHWcACgkQFA3kzBSg
KbYzig//S6LN1IJcbov4tQYqc0ld204PZ2cFEc0wE9p1z2ACiq71IoYiaESHLfjF
8BndHnuZnCc4LsHNTnDVquUsM54mxypBiXdnBvmmKCrJUlnpDrwlVmRi1yQ0VuFP
V2/zW4mOesb56puXSfua8Hsyp9M2qEGyjwJSdMMEozyQcBkLausobHQKbphvFhc6
OAjp1HJvGb9kjrYRGpH6dbDPrk6efXcwKy3n63//ILBcmSloVfFbWgn8n3j7nk1I
0EDdgRx4MDdz0leMRTlROjl7VtF+EdWeZ0OqIuZPGNxTuk5xXa3XII0bT9+tOBCA
/c4eLMLua8keQnLJanHxIpcVYv982KNjJMfOaIOI6u0F7UsV6ZRLEQbmzuYE9QpG
2mK37DgB4b8V85n6HwpXzZaiqOnzEFIJ70ZEDPkVhtEfcNjz5etDvwWomgiotfKO
QajwbDm9F3R4FcO3EA8WgDR/dDv8cqCXjOfgFyUV9jjbbeDO5rVUMBGLoLSlv1+D
ysOnVR1JSK6d4wtN6gbCMnzK6aAQPmgdZWq09P5sarNEfGJ3tv6ztUdcfDkoKsiJ
xfRUrch+VMkrIMbshoICqlRyjtOPMSNpme1eClzMQgd6CDi0mBXJC6fWPmLYV6kS
Spc1IA87hY7oYQH5LXdd0PwZs/2ulfzTdJ/m90bdPzfIifiVxn4=
=ITPf
-----END PGP SIGNATURE-----

--fF2R2D/X283ptnYJ--

