Return-Path: <linux-i2c+bounces-5079-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B73793EF5D
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 10:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8DDBB23252
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 08:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F641386C6;
	Mon, 29 Jul 2024 08:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CbhaTnYy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F00136664
	for <linux-i2c@vger.kernel.org>; Mon, 29 Jul 2024 08:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722240279; cv=none; b=GMbYLDSG1UrTwzzYuAr2x6Hj3hTa6q6sNV+9wDKsVmLGkwxAPCY91tjgPyIrOt8FR5G6EQJUQW6nBPzSf/C7fRBe+H3L9hpvPApPp9Me00SbLfMaEGl62zMpYELp0LWAbgJEy8XQbh4miX1Rx1m+8JZuGQxXXC9zNuSJqXsuHoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722240279; c=relaxed/simple;
	bh=CDZ0MBUFqX50yePb3p0ZQmToR/m3XVu2w81bkufPTxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOB0iOSyz3yeSHcY0qi4ioGk3oelAzWajsLI5H9b3OPUrgSAQ7gN2jXsAPIGzGDIkeGzWe0sNfTN/fFUgIppuFJtDiZMHCxMTSIOdO9NeMO2rndLGx9B0Lm2xNV2qa6lQdsOFgiGEDCyngo8Rgl4Mnm8ZfqDi96uxuBiDIZaIyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CbhaTnYy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=CDZ0
	MBUFqX50yePb3p0ZQmToR/m3XVu2w81bkufPTxA=; b=CbhaTnYyJGc9/b4oM2QU
	MmkHC5V2NEMmxSP1mzULYZ6Bgj4H88tEC2VUEG5HVOmwh+woEwZBTk1bMqXRb05j
	FUuTv7PR6ELiK7yuC5CtCRR3ID3+aTF2HVdhIpFc30QrirI2CmPOTeePkfLuwc0r
	76t5J7TNue5niYBQ4FSAK54c33+BRo+OmvndSlE1lRnw/wRDxNoKspByB6tTZFwC
	sEyXEQOCcLE1QvvLbMUWKRYBgrrVqANo1/4mI/MbaMGlsH6FkvncrYzX+7yE0wGR
	HebhxQvzS+7E1X9vk66TyWm3VfH26kHUwwgsyx1/3i1PzFP/1/Uv+hhDYZfV58sC
	sw==
Received: (qmail 4025975 invoked from network); 29 Jul 2024 10:04:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jul 2024 10:04:35 +0200
X-UD-Smtp-Session: l3s3148p1@js3TT14e+NYujnsv
Date: Mon, 29 Jul 2024 10:04:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wolfram Sang <wsa@kernel.org>, Jean Delvare <khali@linux-fr.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: smbus: Handle stuck alerts
Message-ID: <ZqdNE2nFEmRU2y-l@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>, Wolfram Sang <wsa@kernel.org>,
	Jean Delvare <khali@linux-fr.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20220110172857.2980523-1-linux@roeck-us.net>
 <ZqajBUknxDaMp5wy@shikoro>
 <f5886c83-27c2-475d-b75a-4ad107d039ed@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sQ06tBKQpmyQTR8K"
Content-Disposition: inline
In-Reply-To: <f5886c83-27c2-475d-b75a-4ad107d039ed@roeck-us.net>


--sQ06tBKQpmyQTR8K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I think this can only work if we require .alert-handlers to start with a
> > sanity check to make sure their device really raised an interrupt
> > condition. And then return either -EBUSY or 0, similar to IRQ_HANDLED or
> > IRQ_NONE. Or?
>=20
> I think so, but I am not sure if it is worth the effort. It would require
> changing the API, and each driver supporting alert callbacks would have
> to implement code to detect if it actually got an interrupt.

The more I think about it, the more I like this proposal. I mean, irq
subsystem has IRQ_NONE also for a reason. And we do not have that many
alert handlers to convert. They could all return EBUSY by default
because that is what they currently behave like anyhow. That being said,
it will not be a top priority on my list.


--sQ06tBKQpmyQTR8K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmanTRMACgkQFA3kzBSg
KbbdJA//Z9cKpMQGyjFHhfJho+NAJZ8+C3JY0naTlcW47CtpkTxoNgeueM3nRcDt
DQzh5CPDyAWKP/8TCE1dwFn9N5Af8OaBQACr+bF/4GHelxStuVKB9xse8clBh8Ix
PSYs2nkutmFMJcQiYuN43nzn+eA5521sz3Rf6u1InoW0B3VGQkR+rRGrdccQapSi
Ag1oqNdPld7O6W2DksLkb9d2GXcB9n+qf9NlR0bDJtAF10Nlt6691WjhdNIsVAP7
diEiPwIGN/UrU+6ukUV/kWhnsraTn+n0cHENk44rdpOo4o39DMJrARtIVoGW2LUl
GujG/3s66d+sHohs3EViG7DX+Pi3iHe4F+YMYR0/NV93va9UTGGobmuqeeO0Cus/
48x5sB9k8zsEmgCOqvCPnxpaL813LeBSo9K0PhRaMAYYjvYUijSnSXy4cCB7hlLB
3ezxNyfKp/HyYosKacVzDd8H4IRPIaeEsotndSGJJ3eYyhv2A+8wLeOIsdgpHRxJ
zUZLj5VsIGNxSMntVUXb1fPW6xnbZFRy8OMw6uU7SNhh2lbBlIKgK1iLAV7S7N/f
daDsfuwaUR6ihl2loV43OhjpdTu+D7zNf3VyOwyZIHEOOVqWstRmuJS21ZMRvGxU
l3EPTqDzDxTGhXT+XtP11md/SIiXTBoOCeHfIpLf0/RkDx6ay6A=
=OVFI
-----END PGP SIGNATURE-----

--sQ06tBKQpmyQTR8K--

