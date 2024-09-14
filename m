Return-Path: <linux-i2c+bounces-6750-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 427BD979357
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2024 22:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBD391F2237A
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2024 20:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432E113211C;
	Sat, 14 Sep 2024 20:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fMwRAiAG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB8D82877
	for <linux-i2c@vger.kernel.org>; Sat, 14 Sep 2024 20:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726346742; cv=none; b=mFp5Zk46n8ylVXvLoUHXSoOVYl4qflOjst+2OsKu9cJQmnjt6RfrAW9CnBuipnjIXi/3xYKiMXngHa4p7h6pfcnzyyJ3AqTEgXFzjcej28DALCa70S0bzFpOrMfPqsWlnIsWon/0osOm1kuYpN+Dnhykyl26nhIYelFHI2uUImY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726346742; c=relaxed/simple;
	bh=YZ5SuZfV42affykQM6C2ivTr0iGXmgCbtCc16bO/iNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BufqrimIWOiXrsss6R2xH7xwTgk+PFZIQ41pKhugGGoqDEFuqKjEQHIvg5g0GBnqvq5lboDmv4TfvrC35OHEQSBU3cGmBJLmZgX0079ef2AsvIcbN5sXUKY1e0dIyl/iElMKaEVpwpOsYfYnN45gauqF+jtl3cnz+dv/PgWnzB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fMwRAiAG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=OPMY
	z59S5g/FP6m/X5sGQO+neZNnTnBivlMt+S4rvMw=; b=fMwRAiAG9glWINlngtk+
	1meCSkydzQsW1jznlQh7XZ6grS9pQ+A9OZuOvFYXCesUg8eYMnd6lJL9jqSjTr1C
	UuR4ksjV+awnXcmOVN1HF4fOdWgZ/DSXZrY658NjOMRniP2I9Zv3MJhOUVOJmB5y
	drEmdTnkwONS78au8xHVOTX8q2UNmBYspU5oxZdF0irBY3eZAbFPIHhP9kyvappF
	IpA/WCmf1tQzks/gZiL5HxFbrcey4xdHcuGVYytWqY5m7gwp7YOdpOB8rhqfCvZQ
	herMEUeWiip4TqCbwQBaumBq0OWYqonl/2uvdtF8M6ss23+WL6jmF5AdkipMx5mi
	yw==
Received: (qmail 1555125 invoked from network); 14 Sep 2024 22:45:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Sep 2024 22:45:35 +0200
X-UD-Smtp-Session: l3s3148p1@3yHraxoiOLdQT+F6
Date: Sat, 14 Sep 2024 22:45:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, chris.brandt@renesas.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 00/11] i2c: riic: Add support for Renesas RZ/G3S
Message-ID: <ZuX176V2OhI4ticP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Claudiu <claudiu.beznea@tuxon.dev>, chris.brandt@renesas.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240820101918.2384635-1-claudiu.beznea.uj@bp.renesas.com>
 <pwgwgzrjx56ftxazloljkhmnptqkzzzvs2tfq2tnrz7y3mfmma@ru7mawibsipc>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ugIP7Ik1/cAGUKwF"
Content-Disposition: inline
In-Reply-To: <pwgwgzrjx56ftxazloljkhmnptqkzzzvs2tfq2tnrz7y3mfmma@ru7mawibsipc>


--ugIP7Ik1/cAGUKwF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 04:12:27PM +0200, Andi Shyti wrote:
> Hi Claudiu,
>=20
> > Claudiu Beznea (11):
> >   i2c: riic: Use temporary variable for struct device
> >   i2c: riic: Call pm_runtime_get_sync() when need to access registers
> >   i2c: riic: Use pm_runtime_resume_and_get()
> >   i2c: riic: Enable runtime PM autosuspend support
> >   i2c: riic: Add suspend/resume support
> >   i2c: riic: Define individual arrays to describe the register offsets
> >   dt-bindings: i2c: renesas,riic: Document the R9A08G045 support
> >   i2c: riic: Add support for fast mode plus
>=20
> Up to here, first 8 patches, merged to i2c/i2c-host.

It took a while but I needed to get my Genmai-board booting again. It
does now and I could test these changes on r7s72100 (RZA1H). Reading,
writing, suspend/resume, works like expected. No regressions
experienced. So, for the record.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ugIP7Ik1/cAGUKwF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbl9esACgkQFA3kzBSg
KbaRqQ//QWFIvXRdxDWQ8HjC1iJcRpW2JCMMCfSuZx4cT38fZBOcK5xl+9zq+ctH
zUXjYZA1NA82LDXv855Z/iYt73y18cULFqYkaGzhpDxj2a7x4zHv0e9R4eof0dXE
mpuiON1icbNBQ083P14hmMeF6l32tpZAfNo1wI97PpIOYpMqEBcCn6z2moWbWb+q
daFgjDA0NONROxcSn07ZffUuOBqVT/bgtIHmWbxHTekM9fB0jjv78ZH9bg6Dt7Hy
4T3+JH8tew8Cq4MteoC0y3NA+g0S9zStUx7LctsQfFBVgQ0wcCfhrOyphrCqPnMo
P632COoRSHwu2YB7pN0aT/UxD/L3TULnt5sy6tTJCKt0GVwOPcgze0BN3FAz4/b5
7OGYf+NZbKhNXeguE8IsmtdouxGq7cBQJSmS+M1VM3QJGBORpOnpeRvm5AYuVqnk
5jt8B5j4UfOblozMHpyjxnMFtlbydrBhomqRwBqhd89doyBb3WhrISeJFdhlwbJR
S6PeIDy/T+fb+tHax9lx5wHQAjkjOIYyDWxOGnJWgIrKLr0rPD+jjP3AmwO5Elxe
QNQFUgwtzKMXxAF7kyuavv6C3xdMJmwZqvWh5XV9oVQJvND+pSF+Myf+gG1sFlSB
EokMuKiJCecj9z0+/7TOEqaaVHazjqNf7REty0ejsWrHD4yqVF0=
=Xipk
-----END PGP SIGNATURE-----

--ugIP7Ik1/cAGUKwF--

