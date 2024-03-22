Return-Path: <linux-i2c+bounces-2559-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6EF887131
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 17:49:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 603631C22014
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 16:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC725E091;
	Fri, 22 Mar 2024 16:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="C5Ewx1W/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0CA5D733
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 16:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711126139; cv=none; b=Kn9A0wy4TBlVNmGX7rGL9mH6UztDZAuFc+CZqu/D8ZaEXA83vNhVTAbCLHsCcKM6f26/yaXBnOV0SMSbCa9lzlpZJc65a8/J6N45vdXF4t0/dV9kFRXtT6o1H7QHOIteOxHnr0qvtEqcor/7TGmnNWogvn3D27EWBpeNgXGSyZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711126139; c=relaxed/simple;
	bh=zAoemAHmU7udkQ3XYnLvczYLS1pkZUfJvttJxIMjQeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3sG7MijTaY9sjJPZ+0ZiXpnt5+0eqU3jHzXgtTxkqnWFIXi3FfyRJ2b0bYQCH0lgLnjRytMTO7C7s7D7drRwHFUJOODD+SWJttJHmT4NaDuzEyGo5EOeeT6Rjrycy+96T7mL6P4eP2VZ+zQyw51HTiyB4e1KQ6iGM1wSlO8mFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=C5Ewx1W/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ezxi
	fZ/NdoltWKmyiuN6imx75HAhf4NgVqu/1YvSeb0=; b=C5Ewx1W/xQ3t7Ny7X3wq
	1OaJ45FEPAkLMBSzdSgEzZ37WKuAp+iNFi7wdpgvolxjlFs5YI8R50J7U4LU1Onb
	c/bgsMRNiT47Vq/CQ/fvSzj7W+LjUfCJRY41x3yt+gopV7zbErpMsh7MwXZ40V3Q
	FZn1nDgS02CrbdF5ZPqlgid9ZOYuUVHnYqB542i4G/yIpEjsTQLPJ8kgTyfk+ShR
	HrcGrKOBhl/LLBnNpMcPLod1ozLcpM7Knt9Ho9sDxUGzbhXKvunqy+2j/lQFJ/2O
	8w/wX7B/pQJTkQe/IEYkvdWAyKj2EUlGd6rjmjcpN3jpm3GqlbnKFTPRztTh9pxu
	HQ==
Received: (qmail 3924065 invoked from network); 22 Mar 2024 17:48:55 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 17:48:55 +0100
X-UD-Smtp-Session: l3s3148p1@YwRumUIUZNtehhtF
Date: Fri, 22 Mar 2024 17:48:54 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
Message-ID: <Zf22dmwBpN7Ctk3v@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
 <Zf2tSLJzujUHbJjp@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gk90DgmVWePBMrYC"
Content-Disposition: inline
In-Reply-To: <Zf2tSLJzujUHbJjp@smile.fi.intel.com>


--gk90DgmVWePBMrYC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >  static const struct i2c_algorithm at91_twi_algorithm =3D {
> > -	.master_xfer	=3D at91_twi_xfer,
> > +	.xfer	=3D at91_twi_xfer,
>=20
> Seems you made this by a script, can you check the indentations afterward=
s?

Yes, I noticed as well. But other (not converted) drivers have issues
there as well, so this will be a seperate patch.

Thanks!


--gk90DgmVWePBMrYC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmX9tnUACgkQFA3kzBSg
Kbbr8A//XEXud+6wIKsFTjfvJagkwqlNQp4For0+4AnAo3VuIMv44faNDOSxB63k
K+vOfRi2HAVzhVrYUBQLf4thG+KXeX+7OXTO+HUwm81u+mdor/KfhPshTZfelzR4
Sn9yxlg5kv2BQ3uCiNdv/7iznbabfUZPtQb9BnqBCj5O3nq5k1+WJYnm/1FamL9y
M4h0p+yg14kIIMPV8fvDzWKHwQGsrEUcVMGLo7Nhj2tFai5yPJZCMzHpakzhVZQE
wWsnWISmOwkFScr8cI8K8I5IQ1u4+2gDSUK0egM/spTBPqLfGamRt0SeVJnYEQQ7
Owy4DrIPRiOITKuNc/DG6/+TeujZjLkyRuVwHbmP2woTVZcpc9pijAxzZDi8uQZg
2zDdXj5mwtQMwkc+YwfTjnyAA8P8tbiAFdXgBcxn5w/4/by3uM4EtZBCEGhjXyDu
8yTFnBzKNuNJJ3tiixvkB/GrTApip1rQ1vMxqZ706IMyPKXLQkJpbkBgVQ7vZtSt
3AHRdwSBxBYBupcBKOxK5hMQLceYqyLnTVwppS7Om/ey7MkrnEFuCYWhmFuDb5MF
5Tk6iReI6pt7T2lU/JNW9vWpkeMHDomHJ7T23RSMUmzQfsi4YvWFFJ87Yd4JRtrD
wpacw1VztKHA12REQNWJHMwslzINn556NtcsRtarShBM5Xboofo=
=euQt
-----END PGP SIGNATURE-----

--gk90DgmVWePBMrYC--

