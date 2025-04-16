Return-Path: <linux-i2c+bounces-10398-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8B3A8B27B
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 09:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F36263A5812
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 07:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C6D22D4EF;
	Wed, 16 Apr 2025 07:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TUakBY6z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9C61A8F9E
	for <linux-i2c@vger.kernel.org>; Wed, 16 Apr 2025 07:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789388; cv=none; b=noOYWcdZQK81g0rfEbfsi7DVzghDv4V8v+o5HmreuvJeJqX81HOCvfn6wfr06wsiz3TRuyIywItvGrCRjKiP7DWRFYCwKFlREaz5tSbUK2c4NT4VL6jdaEpfUkhnUn+iYluTJnNVGu1F/I0wvf0GOweAMxtqlI6c3I3rGhHUt9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789388; c=relaxed/simple;
	bh=W7RjF650Hww4phW6Jao4G0MIVaVTwIdOqM03zj51tfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWYyUtzrnDTmVf0O55N02gsDUEqfDTHl23wywRuZqBPTPGkHvHLa9HRCro9hwMmys986iAsxCJZDHfuKv0wWZYbaGiAGRmfUk9xQMlD0CR3zuNXXumUG3hcsZW53WQskOhkNBI4V5CpaY/3/WvtlWlWJr2uAE/wIvXVTXxQtme8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TUakBY6z; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+IW6
	5bGR736uruXZFGxU8tn6ykQrJqn+sd1HNhK4aE4=; b=TUakBY6zfxRPRE0UctHq
	dqNUm33Zz5F8alNlgnW6R/gdOKeKeT7E0/k4nja8GMOzkzwXgjxvveV5H4pmFGOX
	0xJ3ZF/2D8mpynDRs1abnL1GMk5ahylvhnYyxA4vfVOWPHx5GL7iVTVUuhg9Ycc2
	VYGfkF5eL65HRjcTJunKDxd55XLUui45KIysH+d4vO6/anzgJZ+fZXxHWADZVES+
	IZLDpjRfb3SZobdWrmz1jM3XfXB3LUUYT33+7XcoZquZDskZYFagrXPG++RnskHJ
	lUsYf4kXTQrZUD4hOFHXOR0iZO94p4hJ1wsyuMvps1d7nWLrWlBkYhoxRmNvQUbM
	2Q==
Received: (qmail 619537 invoked from network); 16 Apr 2025 09:43:04 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Apr 2025 09:43:04 +0200
X-UD-Smtp-Session: l3s3148p1@usVtb+AyBO0ujnsq
Date: Wed, 16 Apr 2025 09:43:03 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 9/9] i2c: riic: Implement bus recovery
Message-ID: <Z_9fh2nfwAaUnhVV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218001618.488946-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z2XewglpALJFE1Ay@ninjato>
 <CA+V-a8vB1c8Zp+zzoHp0zFpW8fjw-xq2=KPr=dyBUUZbOhBxJQ@mail.gmail.com>
 <Z2gJtlb5Sc9esEba@ninjato>
 <CA+V-a8s4-g9vxyfYMgnKMK=Oej9kDBwWsWehWLYTkxw-06w-2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K5vpMRnXuq3n+WSd"
Content-Disposition: inline
In-Reply-To: <CA+V-a8s4-g9vxyfYMgnKMK=Oej9kDBwWsWehWLYTkxw-06w-2g@mail.gmail.com>


--K5vpMRnXuq3n+WSd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Prabhakar,

finally some time for this!

> Based on the feedback from the HW engineer the restriction is valid
> see attached image (i2c-pullup.png). The SCL and SDA are Schmitt
> input/open-drain output pins for both master and slave operations.
> Because the output is open drain, an external pull-up resistor is
> required.

That confirms what I was saying. It is required. There is no difference
between setting the bit manually and the IP core doing it internally.

> Assuming there is an external pull-up resistor for all the platforms I
> implemented the I2C bus recovery using the generic recovery algorithm
> and I'm seeing issues, as the required number of clock pulses are not
> being triggered (Note, the i2c clock frequency is 400000Hz where the
> below tests are run).

So, my take is to check further why this is the case. The code looks
mostly good, except for bus_free:

> +static int riic_get_bus_free(struct i2c_adapter *adap)
> +{
> +       struct riic_dev *riic = i2c_get_adapdata(adap);
> +
> +       udelay(5);

I wonder about the udelay here. Both, why this is necessary and where
the value comes from.

> +
> +       /* Check if the bus is busy or SDA is not high */
> +       if ((riic_readb(riic, RIIC_ICCR2) & ICCR2_BBSY) ||
> +           !(riic_readb(riic, RIIC_ICCR1) & ICCR1_SDAI))

And maybe if we can't skip reading SDAI here?

> +               return -EBUSY;
> +
> +       return 1;
> +}

Have you already played with these options? If you didn't and don't have
time to do so, I can also check it. I luckily got a G3S meanwhile.

Happy hacking,

   Wolfram


--K5vpMRnXuq3n+WSd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf/X4MACgkQFA3kzBSg
KbYQog/+MzMB5MNGTKUZRZK6nzVl3KnzBf5pjrz68biiT5lJOt/0OqsQeIWgDo5/
2GwZ7HCXaisDGd/l6Tw/7uDHsl0MFwU/4xWwEdVsdyn25jwKHibYyCC8495q5N2n
W4aIYU7DPkDlWZ8txSpefu8W3IKdezFh6Sx331zGnEmILPwIhd4qE1wChe+dK0xe
A97Jpg3eKZqozLNocoD849LtRcufeRYGT1IioypleoTJpGpep1/eZwkdyKYd3JNb
3BBAMlkFDbRrEfCeOwqc3Aun6JWelft5/tklQjXFj2ib1n+vgP2ZcIItyTB2jyWE
Z5aDeDcXN8SBZ6uRloTSHj+OyKI9mcqg0/SqFRnndV9nlEeKcM5lM7oH4AOIsb96
65oQZL8opbCpyRnzhQANf94I/bZlpjZPfpdo27jItidVJ5LRoCV6dbbBhqPpc+Fd
BcY7ERnXTiQ6tB9EmE8kVh05twfqvDvjuvxvBda9qBaSVnvWcNpDlp1c5c8ef6/7
Yms+SYx3ysSVijFZAyFdmyBMEB6WLvdoKw6c5nNW9LamWbLRC/4hZGKZeCxIE0oW
/h7gRGyW9+GRZPkmrnXSAWgN4qIOlZIxaHIPDoC3xmLE2lc4eF0klARyJ2s4sdHg
24aXzuHiALoRjyN4fKo7hNzfAOcHhsHiPQDMi8YM43AjMyuPjY4=
=aviI
-----END PGP SIGNATURE-----

--K5vpMRnXuq3n+WSd--

