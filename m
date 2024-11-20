Return-Path: <linux-i2c+bounces-8078-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7325B9D340A
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 08:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25E59B225DA
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 07:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B031586C8;
	Wed, 20 Nov 2024 07:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YtCAEX6G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550EB156F20
	for <linux-i2c@vger.kernel.org>; Wed, 20 Nov 2024 07:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732087026; cv=none; b=Cha+WvVpBmB1+0tVy17k3dzJ8+2Hkczj9pr1FcbalpFXnJ+8Q0MGA968jheO1AZ+LVFYuOpkqhvGhzjvw5XSMJIAjXtoGmfAB+O1PL+4YDJP2W87vNMB7Bbd8qsFq6rPECWORnNFcKS8MoVA+qyEy/uEJWNjtxZkfb2cgDNKXqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732087026; c=relaxed/simple;
	bh=9Ok8HGFM9GaYS41pHwjApgiENauv8MWfQ0+jXVddl+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnV8VUJAluLqDp7DLszTem9ixl7oMMloYVHnlkTrUJTzPUVKotFi7WERMWcpZd2rM2TtXiMKuaUJ9oMIMbnzKyHRUzDZ780X9fnmZNms623fSts5wtzhCVB9rpq19Yij5Vs2yxB2gldokq0b/NtN55VPUwqNvmhVjYeOlNKAeNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YtCAEX6G; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KQns
	4F/G7bpvC66xIhHiCyGIMxVG3ycVdVBTSpq/EQA=; b=YtCAEX6GiKUy1keNKUa0
	NlhioP32n/VwU4wNJze2dxNdIffN+3UihngEpU6b1/QP80g7nIO8zTk0c+f3axNC
	H1tu4Jgh8f8F1Rs2Bs2JB3DSSCoBAMZiEQAbf5ykQ1Mb/GFfcxoal4LCoX1NWEIE
	T3Mqn9OaAXRikwiW8ht5M183LtTxgEFekWkfTsilt8iI8cCPfMBneDNAogrkjhBx
	UbKSJEliOVBfO73s9hRgmxIuT+io7qlP6G2+k6Um3TWA130b7pI7D7LCOhEnWmaZ
	L/chpnVmcmmvwpOJl00ojy5UMAR7zs89UPOQM7ieEFFQsonQkSmGPnvwnCL4byO6
	Cw==
Received: (qmail 810963 invoked from network); 20 Nov 2024 08:16:59 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2024 08:16:59 +0100
X-UD-Smtp-Session: l3s3148p1@4jiF71InfsUgAwDPXxznANR4Jedc6XSv
Date: Wed, 20 Nov 2024 08:16:59 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: cgbc: Convert to use struct
 platform_driver::remove()
Message-ID: <Zz2M68kCkuZvzzel@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241016091323.12578-2-u.kleine-koenig@baylibre.com>
 <twrnl6zi3tzluj4z7yutb34r7ljr3jbk5jzf6jzcygxt5yq6iv@h7cwqlbtcayg>
 <Zz10-aGTFmWcw-1e@shikoro>
 <r34ulkawh3c3e2mzyv4eskla7e76z73otpbp4ei2gddarabyxk@pcuw2a3kards>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WkVmiUO8w3NpEA8b"
Content-Disposition: inline
In-Reply-To: <r34ulkawh3c3e2mzyv4eskla7e76z73otpbp4ei2gddarabyxk@pcuw2a3kards>


--WkVmiUO8w3NpEA8b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 08:01:20AM +0100, Andi Shyti wrote:
> > > This driver has not been merged yet.
> >=20
> > It is in Lee's MFD tree, and thus, in -next.  It will go to Linus' tree
> > this mergewindow.
>=20
> right! I saw it but forgot about it... then I will pin this
> patch for later.

Lee provided an immutable branch with all the patches. If you pull it
into your tree next time, you probably won't forget :)


--WkVmiUO8w3NpEA8b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmc9jOcACgkQFA3kzBSg
KbYP7g//WKJHLi1q/oDCk0Wzy/2XbLhC/TuVpiHRJ1wXrwIGmYCxV6xSvU0rzT6X
7888tiDv9p/AIvq51ApZee9O8/XWCJcahuYeFniDOE1TAXjo06YQO+qhB43AjrDE
fPIZtT2m6OX5EfckNQgGvmPLbJQre/Cs1P3tR5SyoL4tRaLH4qULDnhSwyknsPKH
7A9Q2zIWVAx/XfXeAZtYKtAEIuKGygbragtqVXtWlEjKRFSVXNOIyPsjq8gQor/+
OktEEIWA0SH4mmBJtlEYyoT0HXWFxc1eKCz13b257XPRD694zGiYrMgdAaAeHHt6
6haZqRk17oJln02uoA0IfPF6IS6yt1cThONPYZt3E3XK8kLnYMute4pNb4NB5Wdo
mezCGaYIuwvc80eRcAo08fi3Px14UZyAdFUoK3fAIfKjCpdSqZ68ZnZvrtVoiiFI
jidY4BgVTG8VALJ/0eIfr74qfJBljC/xmti5DEB2gGv8UCMSl2yXGgexHowCDAxC
kjHKnlTEHjj4O6xOMJB9lJmOYhGbqVCgtqqg33N/TSx50iMF1SQP6cnKle+bfNRL
SviACU3vKY5Qj/CQYh73z4ec0I01B5OOucRWMxrU/Lk+0/UdDeqs2jrqa9nnnTwK
4N2rHuUBmjy7whKjWQLzSeQ/jovJzoe6zsil4jG6C/6y6UfC1T0=
=38VI
-----END PGP SIGNATURE-----

--WkVmiUO8w3NpEA8b--

