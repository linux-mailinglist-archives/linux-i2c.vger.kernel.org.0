Return-Path: <linux-i2c+bounces-10717-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D0EAA5BC0
	for <lists+linux-i2c@lfdr.de>; Thu,  1 May 2025 09:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DF154C420D
	for <lists+linux-i2c@lfdr.de>; Thu,  1 May 2025 07:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27036276036;
	Thu,  1 May 2025 07:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Fsn+8PTh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F41A270EA2
	for <linux-i2c@vger.kernel.org>; Thu,  1 May 2025 07:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746086288; cv=none; b=J/cyM6Fm5yKgvWXJJxKmrILCYcmOIlgECAzbCOO/4NCeD1amC3QxnAUQaQ93uU2G+2OaE8pp9ywQPLm35ElxnP0LCH1kS5zGK19qNgoCRfDAks6d3+n3LC3rfSgjgUTF4PYGnbZiQGA0Uk7LHwjCR6JpfmnmhDhoIJqLsxzugK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746086288; c=relaxed/simple;
	bh=AMet2O0U655+gsWsG5t7/qer8SmvqpDgG/WhSKtrgOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fX4YHe262BFM3vdSN/HN2+4X6fgiP2nveoB8KAwzm/M0SgA4GQjqOgNB5/MLznCLrmH8jsY9zQvaz5agyNllAHPqJ0xG7XSn9oDakbA9ya/EuVaFaDcWkfXa6qD9j4l6+MCI5rszq5vaku+UgZICu4tV3ffxHeE9tikf52SafaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Fsn+8PTh; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=AMet
	2O0U655+gsWsG5t7/qer8SmvqpDgG/WhSKtrgOE=; b=Fsn+8PThY/f44GssvN/h
	HPEihDGbELHJVdk2DYOzo19/yCeN/9f7GAXiu4DzslQh/AryLc1tFsn3iG1+XtKS
	i637GpBWs8/DieBSydpXYrJYzdhJ4elwjVlNEnR/Y6xJ4y8XTlN/+siGVbfktZ2K
	6CpbgPYjoLMuXXGY9AZiUVrw8+In62mfUwy1VtnUD7fi9NIwXNXc/KktVJXThvqk
	an6249XyZvqB7TgoxLsDfQhZFemeWMiaBlVKLQRSw346EYKps9AnRJt0hq5nTucJ
	FVwkdYJevoO1OQ4BrtbGbPbNXLprEuE6R9vIWaVWOoF8z5gKr3goisFm0QVDdnmT
	Ag==
Received: (qmail 980056 invoked from network); 1 May 2025 09:58:04 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 May 2025 09:58:04 +0200
X-UD-Smtp-Session: l3s3148p1@uRO6ZA40Do4gAwDPXxyAAIlRla1HkD11
Date: Thu, 1 May 2025 09:58:04 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v9 2/2] i2c: riic: Recover from arbitration loss
Message-ID: <aBMpjKtQYYB-teNt@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250430194647.332553-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430194647.332553-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aBKFWxIRaa4W7TDf@shikoro>
 <CA+V-a8v5qFC+uxzC8Qw4F3M1XSFnVq90MWxbvmiRks=ZbkzZjw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZZ0WXadQ9QuHKhxu"
Content-Disposition: inline
In-Reply-To: <CA+V-a8v5qFC+uxzC8Qw4F3M1XSFnVq90MWxbvmiRks=ZbkzZjw@mail.gmail.com>


--ZZ0WXadQ9QuHKhxu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Do you mean that upon detecting an arbitration loss, we simply clear
> the arbitration bit and retry?

Yes, after the bus is considered free again.

> However, when observing the SDA line after recovery, it goes LOW again
> during the transfer. I've attached a screenshot of this case: we
> recovered from a bus hang, the I2C recovery algorithm brought the bus
> to a STOP state, and then a START condition was issued. But after
> initiating the transfer, we can see the SDA line being held LOW again.

That looks weird. Why are there two SDA transitions around 30us? Why is
SDA changed while SCL is high around 45us? Then, this small SCL spike
around 55us... What device is this?


--ZZ0WXadQ9QuHKhxu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgTKYwACgkQFA3kzBSg
KbbgGxAAsyDod1kFRTgEnVnVsgQDpUm2RCc5O2emluHW6Hctlims9JwkDkV0S5Da
9Y2X8cXbMZzMdCGUNRBIJ/Mpz1FyOng34HqgKMjG7ZPY6gr69SnjJqjZodDyjoGt
CJ0Ss1ST9vd/MmtUWoz/ha54+/v8M6J1poRRpcpgK/lORZBeYFZ38cb0Gco21tDj
dMIDGGRBH228U2Dgds9KOB7uCnC1j0mdoDY4MRYrqQnCetfTuE7sieU5J1UB73Im
MUAd7YBFvbCBX7J5ZrrNHYaBFQJLgyqJtSeuDdJ7RWgcyHZarQH8I8NwNe/aa/Y7
7WZo/Hshl+cRQCmFhIdq5W0DLEFCtx/fgaQelKzYdWn0D4roibg3rAsj5PmFIfgp
1DYKnLbigRA59vfSZfwO8N6Pgq8wLHH1HF6KZB0Ti8hVJkri/YH3RZ8QUTudLg7e
ZncRQhf40MS/qa1qVkLtoPAoxOkamAiTF6sZwaLWFpzZQ3QjzZgOvUDQ4PlBS/yM
nr3cK9dGGguDHAkmo6C3HhkiM75hI/8gIZ6EXFx80gQRpEhv7aihZ9CQR8jU11K1
CZhbOhR9BU9Volk1QKH69fyxjgfMIlkr9IswTG6NxgOrA2orGnXfPSpiihvqoG/i
m4x2kSUQ2wKFS47UYq5uilCLWZH/hPgSuYDbmAh/R27NJH7Ht4k=
=Dq1O
-----END PGP SIGNATURE-----

--ZZ0WXadQ9QuHKhxu--

