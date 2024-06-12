Return-Path: <linux-i2c+bounces-3994-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 462CB90589B
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 18:22:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE78A281AD5
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 16:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1366181B82;
	Wed, 12 Jun 2024 16:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kymwpd+v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960D718133A
	for <linux-i2c@vger.kernel.org>; Wed, 12 Jun 2024 16:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718209186; cv=none; b=srQZrkRb1GUc+m+PzzAydmUZSMPtb5riED5TSBL+fLAYcykpkThXvjb5rBTte0aW6E4fDiGYjjXad/D4guTH/4za9kdyQbPUnjlDSiQlSh9yWfDE855Wz3MamUKSfSoUVK6DdxHxm+69VotJFieWKQVt/olItspBXvqY+7z2lnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718209186; c=relaxed/simple;
	bh=M+2vZUT5HcUdHG3ExX7quMT7IPpWdDiK4UGZjycX4Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joPY72TvHrK8ml6ycAXnplhFoviT3LWaCRO7yQ+QjZQQmRSa1foxLi3A0FpTMSL3p1DtggNSQIP7zpOkG80spbJXKV1aD8G8U8/GbNFayiLc9zHHlbLIAo/r/N/5xLj11CluyMS2joo+/T8L62rvfhpnwUXiVAcPFtI0sTaRIqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kymwpd+v; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=i0SZ
	O5+K4tPB3cxo/0gwk2raZmazNK3CHxiwPLuw1qs=; b=kymwpd+vF3DiXNHscBb5
	mxCTXOnHjjf5IqDv2W7HJJN3q6okTmsTrPG91WbEi5wRPih4Bn/1S752nyH5vrrS
	J69IpY8ljzfYG1Cs+d2bAPRiWWtNbp8VLXklh3fpKu7AUVsD22SlxXnwjxgVESy6
	Ux92A3NMZHN4i7pBk1NckI2qS9h0cfQQM5bEUHx29zC2XM2JIdjxkws2D+cc12d4
	XmNDMvw5gNS2gBjtoua0dT4QgPgo4Os+q8n/wDO8qzNrX2Z8G53jeSeOyyU+ZBIN
	Wkv04V6+PDa3YsJObiomMXXrcUEkv46SyTPAW4L3m/4v2c0D+S79eAUF4UOZIYjC
	TQ==
Received: (qmail 868741 invoked from network); 12 Jun 2024 18:19:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jun 2024 18:19:42 +0200
X-UD-Smtp-Session: l3s3148p1@iYfyv7Man3dtKPIY
Date: Wed, 12 Jun 2024 18:19:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>, 
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>, linux-hwmon@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?utf-8?B?UmVuw6k=?= Rebe <rene@exactcode.de>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Stephen Horvath <s.horvath@outlook.com.au>
Subject: Re: [PATCH v4 5/6] i2c: smbus: Support DDR5 SPD EEPROMs
Message-ID: <veggn7y6qeeqx2dsmjykktudpwifnt5xzxcx5ulfglkgtq574p@f5dzhj4otjgl>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Guenter Roeck <linux@roeck-us.net>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Armin Wolf <W_Armin@gmx.de>, linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?utf-8?B?UmVuw6k=?= Rebe <rene@exactcode.de>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-6-linux@roeck-us.net>
 <c939b0c7-2c8c-4cf1-8d5c-9309ce0b371a@gmx.de>
 <txliuvufu6muqucno2uex2q6xvnveozpjzahx7zryqlvvvzrs7@flv2zztine6r>
 <a7e38754-ff1a-4e15-99b2-4785827efc83@roeck-us.net>
 <ib6p4ivqdn56l3jzzarsoeijjhwak33bmqvj2qiddbhxdqzchk@txl4gdslx4gq>
 <79f406ae-cfc9-48bb-9c80-20f998c40b69@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fsi4s3rbbehergvr"
Content-Disposition: inline
In-Reply-To: <79f406ae-cfc9-48bb-9c80-20f998c40b69@roeck-us.net>


--fsi4s3rbbehergvr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


CCing Heiner...

> > > > Yes, maybe this could be simplified to "(LP)DDR memory types"
> > > >=20
> > >=20
> > > I rephrased it to "Only works for (LP)DDR memory types up to DDR5".
> >=20
> > Thanks!
> >=20
> > > How about "Only works on systems with 1 to 8 memory slots" ?
> >=20
> > This is a question for Heiner. I'd think it is is still correct, but I
> > don't know exactly.
> >=20
>=20
> My interpretation was that it should work if the DIMMs are connected to
> multiplexed I2C busses, but probably not if they are connected to
> different adapters. The error message in that case is a bit misleading,
> though, because it claims that "More than 8 memory slots on a single bus",
> which isn't necessarily the case. For example, it should be perfectly val=
id
> to have up to 24 DIMMs in this system.
>=20
> i2c-0/name:SMBus PIIX4 adapter port 0 at 0b00
> i2c-1/name:SMBus PIIX4 adapter port 2 at 0b00
> i2c-2/name:SMBus PIIX4 adapter port 1 at 0b20
>=20
> ... but I guess that is a question for someone with such a system to answ=
er.
>=20
> Ultimately the handling of systems with more than 8 memory slots will need
> to be updated at some point. On my systems, with 'i2c: piix4: Register SP=
Ds'
> applied, I see
>=20
> i2c i2c-0: 4/4 memory slots populated (from DMI)
>     [my system is running 6.6.y which still generates that message]
> i2c i2c-0: Successfully instantiated SPD at 0x50
> i2c i2c-0: Successfully instantiated SPD at 0x51
> i2c i2c-0: Successfully instantiated SPD at 0x52
> i2c i2c-0: Successfully instantiated SPD at 0x53
> i2c i2c-1: 4/4 memory slots populated (from DMI)
> i2c i2c-2: 4/4 memory slots populated (from DMI)
>=20
> meaning the function is called for each adapter (which makes sense).
> However, the code counting the DIMMs doesn't really take the adapter
> into account, meaning adapters 1 and 2 are still probed even though
> all DIMMs were already instantiated from adapter 0.
>=20
> On a system with more than 8 DIMMs connected to different piix4 adapters
> (without mux) we'd probably see something like
>=20
> i2c i2c-0: More than 8 memory slots on a single bus, contact i801 maintai=
ner ...
> i2c i2c-1: More than 8 memory slots on a single bus, contact i801 maintai=
ner ...
> i2c i2c-2: More than 8 memory slots on a single bus, contact i801 maintai=
ner ...
>=20
> which wouldn't be very helpful. I think the main problem may be that
> the i801 driver implements sub-adapters as muxes, but the piix4 driver
> doesn't do (or need) that. The message is also i801 centric which doesn't
> apply anymore after 'i2c: piix4: Register SPDs' is applied.
>=20
> However, I would not want to even try changing that code without access
> to a system using piix4 and supporting more than 8 memory slots.
>=20
> Thanks,
> Guenter
>=20
>=20

--fsi4s3rbbehergvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZpyp0ACgkQFA3kzBSg
KbZwAg//evDpbsM2ljwvYiweqDlQzz4eSZT31H8tqXZ5ic8o5Oe40w5dqxo9WO7h
tND6TOrHdFByVlIiWD2Oa5jzz6mjI75baC2w3vF0/gw1I/hf44sbpL8dqQ0eHeic
xJKI1BIiMUp9ofvEuICO9/lV7b4qApWLTJPyLheus6znhRy5mjd+vPuRjrdlcqIM
Vgrs9xkurwRUhAKfb9gvix3c9uJ26fOz4QPnOL2/aNYuyIZXCI979XVwzYpYHn2A
5q6TA2OZDOdVi2YUaJu3o0hgK2qmyHV2Q6oQtU+2K+72KDdjTa8/zaLt5PR3xdnz
Yb0SNXTAywDsFi50OYSBGucTcglfs3HbF5dVGr+9ZMFwgZ50ug3gIBcgJbUj1J58
W/q1AbkjoAiDzNhR+p6pmYSitMUZNSJLNgKXjgx4wrz39B1mVQ2DMP8Q6FgFLhty
sWGH0xsRfPLownNx7y+RnitBngIKeWIFTnN7FYxNk1VbuWVYufPyjfzrVoShXCfO
lQO1zaqylvX1T5m4Bdgsw71L42fjBZ/sbE+G+zVj8OQ13MDzHgMDie7rt4fDz4jj
A0M8UV7/SeFdHWGogUSgszxD5Ye5RNnp7FLCYH6HpbXTZUZpDXOmAqPnldPQIXWn
emEIX/Re0LdLTMRYTQLQENdx/ttXkNsF4Rtco3PufIMJWk2dW48=
=sysT
-----END PGP SIGNATURE-----

--fsi4s3rbbehergvr--

