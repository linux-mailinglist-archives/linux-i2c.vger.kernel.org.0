Return-Path: <linux-i2c+bounces-7095-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B414C98A004
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 12:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63EDF1F2104F
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 10:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4725C18D622;
	Mon, 30 Sep 2024 10:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ey4sQ9LH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BF718CBF7
	for <linux-i2c@vger.kernel.org>; Mon, 30 Sep 2024 10:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727693945; cv=none; b=owpf2OjQBTPDM0Kg/HgsdG1NXUUCgwCyVHYzLfDnR4TAbU7k5uEB1eu4Kr+hgy329/0jbRX5XX5+w5W8fJC/wFuSDS8O5Pis0CMyPJLg5kT2pkZREhvS9hzULxRSStImg3J1KOsQlxhOut3r53MdmKIByFO63rsbTtgjHBwuYjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727693945; c=relaxed/simple;
	bh=tGsE4gnAGI94Dilik0vAC2fgamlajnKDHGmeN4h79NI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KK3LtCTJL8pXeAFjBe0ktAF+tspDHHYUKcEwAYdxiUd1yqoZPupTfAdUwJ+KobCVeQP4A0oe1r2L62HjpQZPztfaG2MtDne1AOkS//ghNhsPn5URifdFzyTqN7s6zmXk7LLf3/tif27/LrQh2vRySrJcFw2N9RT4ORBmb3FCgHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ey4sQ9LH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/MdT
	qoOYofI5jKHRdvBt8ZzGblilbR+9UBQxu10obeY=; b=ey4sQ9LHWRI9n9PgfaON
	5xuA1hwPE87dofg/y7cdTGPYbtCVj25LMdmVXaxU+660DuWpNS+pwmW7tTnem1SI
	/RGrFh1BsB5NJnAdK1ZYhLhDmo+h6IOv7hc4N4CXvr8TrCc3DUH0u54jS8DEl2+j
	tqM+0PGRvP9/FtptSxKj9K+8zPO1zTLtHNVR+/BCreH787IpBnzycn3K2889yaEr
	gsT8rRnSyqSou6Jd6+mqoVQr7QN2OpT1uCk46ItSz52epM7jmcMg7cP/16kBLteo
	+yPQH+FZtNCpBHKQOEqTT81OB65/CR5MpjlfhqTIeMItV+db3+bWmeirQkrhbcXV
	fA==
Received: (qmail 2157287 invoked from network); 30 Sep 2024 12:58:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Sep 2024 12:58:53 +0200
X-UD-Smtp-Session: l3s3148p1@IMIjF1Qj8J8gAQnoAH/eAHsKVyf407fR
Date: Mon, 30 Sep 2024 12:58:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org
Subject: Re: [PATCH dt-schema] schemas: i2c: add optional GPIO binding for
 SMBALERT# line
Message-ID: <ZvqEbMHgbNymNUYJ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org
References: <20240909105835.28531-1-wsa+renesas@sang-engineering.com>
 <CAL_JsqLui9=K_LdAoEAibxRo30_2ahdGXhCW50ow8rcqCp6jZA@mail.gmail.com>
 <CAMuHMdWGtuAuQ3M3HonY8zfODTTz_izV6g9555iwuPLSY+P9_g@mail.gmail.com>
 <CAL_Jsq+cFb56e5WvipL1nR-0TDz+v6vnFDvz9F9JbXinxkEt1Q@mail.gmail.com>
 <Zt_3WtlRP_5wt4PN@shikoro>
 <ZuKLpilWKCS5k7Kx@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ViQf10GYLX3Nuesl"
Content-Disposition: inline
In-Reply-To: <ZuKLpilWKCS5k7Kx@shikoro>


--ViQf10GYLX3Nuesl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I had this originally in my RFC[1]. I got convinced by Geert's arguments
> > because the DT snippet in the board DTS looked kinda ugly. The board
> > needs to override the DTSI of the SoC to replace "interrupts" with
> > "interrupts-extended":
> >=20
> > =3D=3D=3D
> >=20
> >  &i2c3	{
> >  	pinctrl-0 =3D <&i2c3_pins>;
> >  	pinctrl-names =3D "i2c-pwr";
> > +
> > +	/delete-property/ interrupts;
> > +	interrupts-extended =3D <&gic GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>, <&gpi=
o1 26 IRQ_TYPE_EDGE_FALLING>;
> > +	interrupt-names =3D "main", "smbus_alert";
> > +
> > +	smbus;
> >  };
> >=20
> > =3D=3D=3D
>=20
> I guess my questions here are: is this proper? Is there a better way to
> describe it? Is using interrupts still the way to go?

Hi Rob,

do you still prefer "interrupts" over "smbalert-gpios" given the above
snippet?

Thanks,

   Wolfram


--ViQf10GYLX3Nuesl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmb6hGgACgkQFA3kzBSg
KbZQRxAAisaHk/3B+ojhVo3LMlr6I4s7403zjpBZFdZxs8v5qX4Z0oR0aoyKRlfo
A6Nmv0jfGk2vgSJQdmcT/hatWYvFKofHT9JKWREIPIIwW60l1m1osnxPHC9WGOnT
6peA7Ktvmw7JYmkOoxB4rhaGXvFxj3HIbD+bKi+gRrGROdHlx0otxfISZfhArbUW
4TaWwWqWbFFq53Q9aLHjoaHgMqkSWddjotD43DcGBwlmXy2l1M+hUr3L2GcHcLFZ
DxXjpG15pkQSWZ4XGLTbVsXEquSOf6bkIEyUmzSFHJG4pPgYyLiKf65fXtMJOJ2B
+xy0VQmlJ49ajxxdidflCFZI1GqJAnqzS/IzthSCO+v1/F/A54QdntM8zJIn3V1C
eUkcqBdLAdm213WnR5pYdrUj1TiuPXShHPLKWZsdIGcgH0600yMTJjb/4yGJYsAM
Fy7WmENQy9L/TobeBT9E+0pU391ro3Mhl+Am2hRWUvK40ryQc1AKfpVHs0m6UMoW
uZzZpp8OBlcCAfbXfMBtXB3WbM6tCwHwlmJ1ez1iFDRDGkV2vWw7nPkyIdc8wfy3
MIvxiqu4CAYz4NNUrsK3dXPQKjGnmtJND7evNDCIh8iSFLiYzggUpTGwkO6kiICf
rLcUUUV7dxZKMahqzLtVmn7BgWosHPmyIqWMhJwtC9leG2FYN2w=
=l1v0
-----END PGP SIGNATURE-----

--ViQf10GYLX3Nuesl--

