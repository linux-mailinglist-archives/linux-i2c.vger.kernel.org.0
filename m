Return-Path: <linux-i2c+bounces-5041-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF9F9380F1
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Jul 2024 13:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 372D31F21AD3
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Jul 2024 11:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BC58526A;
	Sat, 20 Jul 2024 11:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WrB7ETgE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF3B4779E
	for <linux-i2c@vger.kernel.org>; Sat, 20 Jul 2024 11:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721474370; cv=none; b=KYrYFZRm8p+mltbKCHH+d0jSGAfogivmc88wSU3/GvOYipgwhtzxusxiH8Aw4aidDfZ3svilE49EUW0S1bwbp3jyf2VOSz2ogYj57wMNRISaik2ISXBY4A43BYNUHaooDYLczy+z5c6FsdPzzZxP2HiGD6kfzVIeYcxI+K6ZYAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721474370; c=relaxed/simple;
	bh=ZmVfYblAn9yxwSEoOkL6BO2JJgeXRtuob86K2UqiD+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flYeVxkg8ZqRxxm9hgwzJdyl+9zjwRhtvJN0RqCAlfu2UlO7iAnpLOmo1XqYghDHydl0NP19YpOC3aCaTFOC+R1Pzt7hYCwjzQurRRSZ25LGolnVoQd9UjPtNfYjX4bFNPLenJ359rOIe5G58ig6f3N5L6JEHn414I19LrM8n6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WrB7ETgE; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=YOgE
	XK/plHLGMeWezE7E8XJibFO8/+qHHTyuLApzQ94=; b=WrB7ETgEmIoxJB3fbARE
	vkqFZ2VUodqpATAEYDoHsWBXC+mKqIp5k7ujl2dlqOB8rXw3M7AJCz5Wf05Pg+HX
	fNtl4i0ZjWyWP2yzXuBmWT7oRbIIqAYIDn2EP4X66tnSKqYEWM9cpnKFRUDknFa1
	WwIuWSt1tajTvdDRG6ndMgcmOXvTnK/mX5mo8PGTdwY0zltv8vfgqmuEfFfXYAEl
	7nGfSdLCmD3gZNk+mLicbqQ63UFezVhR4k7EpiFwfsPCnCOnc5z5JSlCXHVf8gwU
	Z7ppcsLUHwNA+msD1ypKYvyPLWJAKVbJ6kQSHSkbbZzHL5rpDSQkBGPtJXttHkLE
	Vg==
Received: (qmail 1449691 invoked from network); 20 Jul 2024 13:19:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Jul 2024 13:19:25 +0200
X-UD-Smtp-Session: l3s3148p1@XXwJ/KsdRpYujnsv
Date: Sat, 20 Jul 2024 13:19:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host for v6.11 - part 2
Message-ID: <ZpudPAKFtrIszTMS@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <csu2tvshcxyz7yib2mrcczxa345m2qu6lavngulzq35b2hi7bz@ao5p3do67q7p>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tjI2IUrVEG8qOmgB"
Content-Disposition: inline
In-Reply-To: <csu2tvshcxyz7yib2mrcczxa345m2qu6lavngulzq35b2hi7bz@ao5p3do67q7p>


--tjI2IUrVEG8qOmgB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>       i2c: piix4: Register SPDs

I just saw that this patch has:

    Reviewed-by: Guenter Roeck <linux@roeck-us.net>
    Tested-by: Guenter Roeck <linux@roeck-us.net>
    Reviewed-and-tested-by: Guenter Roeck <linux@roeck-us.net>

So, that's doubled. Could you kindly fix it?


--tjI2IUrVEG8qOmgB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmabnTwACgkQFA3kzBSg
KbY6qRAAhXiscxaUj8xtsq2kmzyz6YSfIO/rXTlmQ5zKj1VKj+F4tqw16QX7F4WO
NmAW728LxBTN1eN/ELKwxy/Jl21JcQiO5WPP1cmgUTXSnBZe86q1UWoB/sy7oBFD
fLN5h+JyUyLbe2zwz8R7fQmTi6NUAXH+nCrQS9yJXUjYGreKVlqBgCRNiqAFt03t
9eHUgErOGuXSEn98uTTMxyM1nveMtjmfT/lJd1IX8cpmdPuCR9e+Q8w9gGu0PSoS
6oUprdrzqE8O69zjtorg018K+fmKbNio9DoXW97P8PjYwaske3iF0S8PBvTHit13
Q5J37BZpKyEF8Gj0qx5GCu9GqXOGrS5ped0dTU0WvDc8SMWX5QiIL8fmlDmLWGM8
nh3mytkQuGiOu1j8M6UAUn88OKTDoSI+vzqalQ/qjXZ1g13eLNWCDA3CwiY+scbn
UZpuQR1vzyiBGS+tmAmHsP/dqvdOpadKLqipQDBZYtIwpRbsdM8q7jcgWWFrbHFm
98jROOGnzwkm8hdXaiSgwgMjo6rp4YFv3FRYE/hcZXd/hqYgLkquLQtmZz8kPJS9
goUVMSo3VA5SmeowV/aV8Amo5S+HwXEP57FnVGzqAb2IdvwcEHOzVluMoBcH/XJY
Iy9wYs3yfqnUTcGfwgAgkU6AblL6mWa+FDWFMHYp3KwP79QrdFU=
=VvOz
-----END PGP SIGNATURE-----

--tjI2IUrVEG8qOmgB--

