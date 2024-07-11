Return-Path: <linux-i2c+bounces-4898-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6304292E381
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 11:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8040B211A9
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 09:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A84156C69;
	Thu, 11 Jul 2024 09:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZMFnahuW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623F8153517
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 09:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720690323; cv=none; b=jdKl5UiiBss+Fbjys1DAxqkCtIWOLvIneiOi0rtTmb7rcDKwpn50Leim/S0JX2MMqToaIgnJLvDd5WaF2fs4hM5YGhi291Mqpt6mlYeHN5kDnvJGQv65WaLQzRHsJAmEims+Wt0/ewkX3rnYgSReRROIxp5JkD1fu/7vgd9/q/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720690323; c=relaxed/simple;
	bh=/K4xju8p6m4TilrAA0l9EIy4LFWGDl7Uo/w+n7SfL4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMOx6tTBn/L/PdRbwMXpTovN2ZXfbCPuv3T2WM7bNXTC+dSj2xcD7Kz9ySbXO/5hiahh6fgx4iPLGouiESwPGxx3gM/PTn/pp5cjX/UpBorYNv/lU1D0SQYa8SmrlnuJL2aTYQCBdcgFC1Gs4GJxOcrMpix6qx9vMIAaKsHis38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZMFnahuW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/K4x
	ju8p6m4TilrAA0l9EIy4LFWGDl7Uo/w+n7SfL4Q=; b=ZMFnahuWB/sq9/ZF7+jf
	hrPFNK0R8/vNZ+OuGc8D8bRFCOBfN6iMADiXgwlhdICq2PNGEyGtYENYBN3QYt+o
	e3ypD80B9h4PEt3jbeD/fHjxavZtoM0jDUFaK3ATyKerL3/VSsX464TM/oB8unG1
	8+wE0gQYr10iDhD0fsd1nELRllk/86wVAp18wYBSXzwtsflAMhdaWVJQLcrfPISb
	qGJSRSb0/PpDEJTEK1HB/h2Nxgq/hIPzPN0RvmVahPpdWZhR53A4PBj52c0igOXq
	6wCdux4cUV6QG7AtRu3qOnHq/n2pRiMp0Ri7+U9qjCBbKDUuiPA7/UDVXxFtQ8u5
	Ow==
Received: (qmail 795187 invoked from network); 11 Jul 2024 11:31:58 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jul 2024 11:31:58 +0200
X-UD-Smtp-Session: l3s3148p1@u7Iob/UcNNEgAwDPXwmZAIsFIv4n+Dpm
Date: Thu, 11 Jul 2024 11:31:57 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
	Alain Volmat <alain.volmat@st.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mark HostNotify target address as used
Message-ID: <Zo-mjdgXQd-opb7R@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
	Alain Volmat <alain.volmat@st.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20240710085506.31267-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8Oc0izMmPGwjjRq6"
Content-Disposition: inline
In-Reply-To: <20240710085506.31267-2-wsa+renesas@sang-engineering.com>


--8Oc0izMmPGwjjRq6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 10:55:07AM +0200, Wolfram Sang wrote:
> I2C core handles the local target for receiving HostNotify alerts. There
> is no separate driver bound to that address. That means userspace can
> access it if desired, leading to further complications if controllers
> are not capable of reading their own local target. Bind the local target
> to the dummy driver so it will marked as "handled by the kernel" if the
> HostNotify feature is used. That protects aginst userspace access and
> prevents other drivers binding to it.
>=20
> Fixes: 2a71593da34d ("i2c: smbus: add core function handling SMBus host-n=
otify")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Fixed the commit message, rebased to for-current and applied to
for-current, thanks!


--8Oc0izMmPGwjjRq6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaPpo0ACgkQFA3kzBSg
KbbUpw/+Jaxs4GwneP0P8fGi00uhdAnwstPGDr9lk8TCgYGHNDmmgGkcjhQrv8RJ
KHJ3uesRV+o9H7hgD2aaUtRL0+TTc8h3LK0EsQuqJF+33ydPwUf5foE7jDi6aPh1
kVUaRcPsOVmG81nk+d3goSdIcv7xlq8ZLZ8ekiPIu0/IWN7Ah4n5F6qLj671Odud
aKFtn5XNKD9WKcaZxTP6PblCi4XjKNPGA6LHDKy9EI965OMKdUvFGFWHAjDb1Wf0
x9jqunwN6bBRXZ1Q7ar1UKeAfT5FkQPjnKtOG9xpL52zlCN8d8UTMtwTJVRnUXMr
lD3tFJq4sYksG9qTkZpHsGLpqbaugx4G5s3Egw/asdJ/3H/QBdEkU7PSClMiNpwS
+ivoz2MLhU7gurU8s+qAut0Wd+htKOnlQ8l0449LDMkm13bEYpc1UZKDhGcdLiKb
jIl9pct0N88vX7lPjiGBuqV1f6XYLxQsSWhlPVQAuNxgvy1Bx5kFkKsea2pZ9MMY
7u1/VWJliIDxzGHrzU7RHJhCl+kMRf2UJ2vBut7U7s5Rhwf9DsCEMmMuKSbAL9cW
2x6Muu53MazzFdDkOUO4XdYu+o3I588o8EMe5nXw6oBmsh3NnFa0tKu8/fHOUIGu
tJGsx1ybqgyii9xbQD4dHv05Th1b2xpqcg1kMi/4r4k7D9kZQSc=
=JXwk
-----END PGP SIGNATURE-----

--8Oc0izMmPGwjjRq6--

