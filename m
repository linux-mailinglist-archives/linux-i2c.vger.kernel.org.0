Return-Path: <linux-i2c+bounces-2134-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDB086FD93
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 10:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A06451C20ADD
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 09:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E29364B6;
	Mon,  4 Mar 2024 09:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/QbL91x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084CE2BD1C;
	Mon,  4 Mar 2024 09:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709544342; cv=none; b=UGSp1l22twVH5IjChWB5mzkr3Au2ABYI542+86CHHaJlflI9llxk9yxDvl/6QgkwrIq8cpbPzJQugWYlxhDdPlXdqLowc/VHJrvzwkU2ZeC7qCg/ZITdyL9o3mVk+gGSgFsMkCSCaOB4Wm4kDz0fy7sMG1pJ3VfM/b4vNFmhngQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709544342; c=relaxed/simple;
	bh=f008UATUrI7sibR/TkxlbuJzutLyjgIg+maDCRMxPPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWr60VnxNcvzTexaNEltMosA0BSVX8OWhmLsb5xVR+W6l4tiGhdGfwCe9s2wc+6mDkTbEkBmi6cAjKuELibHb+cpTOuS7p4BIp5QZrOBxqD5z68ta0f61zZuJtPbsSxhPtxIsl2I0DRFTed2MCr88eWgfqhVHyetyEoKH0PsLrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/QbL91x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD03C433F1;
	Mon,  4 Mar 2024 09:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709544341;
	bh=f008UATUrI7sibR/TkxlbuJzutLyjgIg+maDCRMxPPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f/QbL91xIktoRsBhcjzTgpJjmyx5gE3520T97WhOSGzhK83xV8YVx8KW6TXir6j0v
	 8Lrywzv7U07XO1ohEGh4bHL4ieLoGNLIzTYACXgXCDghAs4h9CecSSTzKu2871NBzZ
	 sm9LgmLVPbdC9Yly/bsytQc8yPpNdyubzIVVeOSHuoTY1lzQuAbyiOKKxzWfeRllLb
	 KmRp23N4LOtU1Eke5dg4HXWVK3JCe2NxXMA0CoZRP1nH/nUPwzfDTIn2AM04Rf/17w
	 UjBPpUi2+s6H9OzFunp/qSQRTa0RNhfnRYNvdrVgj2MkSwGk2PHMvLllJ+byfCLI1Z
	 QKZjXg+pXyvxw==
Date: Mon, 4 Mar 2024 10:25:38 +0100
From: Wolfram Sang <wsa@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v2 08/11] i2c: nomadik: fetch i2c-transfer-timeout-us
 property from devicetree
Message-ID: <ZeWTklsK36jSzZWW@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-8-b32ed18c098c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rOTSJM5aE4jTNjnX"
Content-Disposition: inline
In-Reply-To: <20240229-mbly-i2c-v2-8-b32ed18c098c@bootlin.com>


--rOTSJM5aE4jTNjnX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 07:10:56PM +0100, Th=C3=A9o Lebrun wrote:
> Allow overriding the default timeout value (200ms) from devicetree,
> using the generic i2c-transfer-timeout-us property.
>=20
> The i2c_adapter->timeout field is an unaccurate jiffies amount;
> i2c-nomadik uses hrtimers for timeouts below one jiffy.
>=20
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

I agree to get the DT property here in the driver. We may later refactor
it to handle it in the I2C core. Syncing this new property with the
existing 'adapter->timeout' will be a tad annoying, though. But I guess
the shorter timeouts are a desired feature these days...

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--rOTSJM5aE4jTNjnX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXlk5IACgkQFA3kzBSg
KbaRSxAAmSt/pzGp5XIF3h7uIsHzvGvEGXZg6PHnvH2DulayTo3u3cBgnGDud+ZP
jHg/FqfwO2Lb6818/uloRuAuoi61YmlxoBRKLwJHUbz2TBGjI5rRIpVLRq8/BVg5
95uVU1/MetVec/Kyrtq8S3DpQhbD8BrzAQrui7RW/VBrr+jIUH9wOevEPWGG439V
35a7yjmQGqV7b4sWgZ3iaqhq7bya6VvCs9UMP7y+N1PVgSfRKrxlR3lIFAxujREV
Ed4yYySDk7A0Hd+KJ/xyUnAJAuzmo8K1cqishU+4oFzvBUJMmgHhXTzDNw2TJtRR
lzXhg/Pc9Uu5ay4qN1Tec7c9+VU/AUyw82UW3/rR64ubxc8x+PCfvxX2lCZNq+gL
uCIydfzj+BoRJyGEipx62qxBzIDZUFYr46v8Xc+xxM6/QRxMtyK4tyHqjGRlHHBx
8GQNCeiYVSgGI64k+bTsWzcPnBDMJpo+ZI1GiSninEZuf3GDhuLNCfg+jhmz+FzK
u2U05gyiV7D8PJuAOEadGOgpwOw1cyj84TEACKcch7yH1zwDO3kQmq2eaBV3NHpk
hdGIOWuIImVEmb0CkAHRDq4xcA4ydluQvcrW8RNSBt1U1pD/n2ka//Xri+gIYVp/
3UnUDoe1Zmz0x6h9xurqZ+ys2PplW047yo16PZ98qJsrtZB5jd4=
=mCbo
-----END PGP SIGNATURE-----

--rOTSJM5aE4jTNjnX--

