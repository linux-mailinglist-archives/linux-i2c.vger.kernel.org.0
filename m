Return-Path: <linux-i2c+bounces-5991-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E809683C1
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 11:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 037F7282763
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 09:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8937187335;
	Mon,  2 Sep 2024 09:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ezwk635C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE3344C76
	for <linux-i2c@vger.kernel.org>; Mon,  2 Sep 2024 09:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725270845; cv=none; b=uQMqg7HEjDsXwV+QOx1SMYJXYemwuE9WibPsVPzv5B6gHHzmLQKLozVuwJQRuAR5vHylwo3Te/f0ol/fy8wSvZgpW2oF2v9l89fcvDQ/a9WH2HlKcbf6cJr1LRXaSxKUo5qiRcL797XXek505NnDD4tKDq43PTZw0cVGXmB0Bzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725270845; c=relaxed/simple;
	bh=hXRv+sNFU7zToazwf3LoUju82vsFgWy3rQGuQbrm/mY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gCMQovINmwinsmYzn7fHwX7SRttCJNq4DvhC/ML+g4BDH5eoVYaVxqBWvARhqO34KdtecnbBcdwrpXKmpEF1w5Ob3Rz3RlgHz1bF8MNdDVcP1/kaEuQNmAfD/Opzo5FMswvP06mjX3NTgVm0qG3kRIAmidt0GWZjGm4t92ZKAUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ezwk635C; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hXRv
	+sNFU7zToazwf3LoUju82vsFgWy3rQGuQbrm/mY=; b=ezwk635CyN1S8QeO/Mm2
	h2d7zIa8m7QMWmMKCYm8FySdoMZg9D+0SMWwDZiU2yBT/v7tCFAldlTd6vllcFnw
	gmM/wzGHqW14Zp6grti9BwOc3QW0YS7XvDl0pL4RaZZe2NSSOLEbiPBvIrt8nP70
	3R5BbZg3TV4D6+jEd1bFQicaLn3yHH0ijJuNbTHGVUm/lfavsbgiMszGb2WGcYmL
	/+8ZoH6UeSj9wvSIoCaW/FkvU1vq/un68MT1k27wrFNCesY4KQTgahoOK3pa0HQd
	a1ZAN7xAUik96jOCR4qHKQiM1mH0o4nLLKd1cTaxtg0CzblW6ut1ls/ABHe1fPcu
	dQ==
Received: (qmail 4063629 invoked from network); 2 Sep 2024 11:53:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Sep 2024 11:53:48 +0200
X-UD-Smtp-Session: l3s3148p1@kVXX6h8hMI8gAwDPXwdRANgvu6DX4+2c
Date: Mon, 2 Sep 2024 11:53:47 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: Remove I2C_COMPAT config symbol and related code
Message-ID: <ZtWLK5WVczDLlvdo@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <80c4a898-5867-4162-ac85-bdf7c7c68746@gmail.com>
 <ZtQueK8Y9x0FCWD1@shikoro>
 <b41c44d9-75f9-4c45-ad95-e896179a6249@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3DdAljpbCmvc13UV"
Content-Disposition: inline
In-Reply-To: <b41c44d9-75f9-4c45-ad95-e896179a6249@gmail.com>


--3DdAljpbCmvc13UV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > It seems, however, that this slipped through the cracks. My Debian
> > kernelconfig has I2C_COMPAT still enabled, so I am reluctant to remove
> > it from one kernel release to the next.
> >=20
> One reason may be that the default for I2C_COMPAT is still y.
> We should switch this to n, even though it doesn't help in cases like
> make oldconfig.

Yes, but we should still do it.

> > I wonder if we need some printout that it is really going away for a few
> > kernel releases.
> >=20
> This may be a compromise.
> However I wonder how likely it is that somebody uses the latest kernel
> and hasn't updated his userspace tools for > 15 yrs.

I am not worrying about using old versions of lmsensors, this is super
unlikely. I worry about custom applications using the deprecated path.
Like, IPMI docs advertised this path up to now (I fixed it). And why
should one change that path if the kernel is not complaining?


--3DdAljpbCmvc13UV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbViygACgkQFA3kzBSg
KbarpA/9E+pmsZeeH1kTjuKBs3XqIxLTKWDre5IcUSPa61iExKggSFJAEAiRNJAJ
V4QDg33xZx9ThLcD+Gu0lHfDS+5l/CztV6liuZVHyg2GcbwYad3Psx9+dRUKA76+
SK8h9Pxl9kAOWY6gQYxCqMmYv58NZchcOYVe80vEF6sYs0KZ4SQqruovH0p0uuTW
tbtd0O+hTH0ApFajOm5J7f902v5im38qOfr5yaY52zIwfxMOMrraWsTq4B7Nptbw
MUu6MPSad7nVo/ovZrV2KfNs6SU6rrfJm4cp79Upj3+1u7teQN2dpz+54d82lgGC
60rj0xLRuux89AUNC+hbc4SHWq0NvU4wOW+v8nJij1g2WJQGQrG8+/aT6Kp9nfd5
qCMub4JWouTdowttIukgOq0thyGjukXYsQM6aAWcI1FynslzRz02tBnnD6K2v5fv
rmEKFDic4YIJwDGFnATYT2w120eQOkOjsHWr1FqqYiMPJzaeUHvzj88shHPGoZQ0
mXzI1xF1LD18nxBuIAnLw3hoTEx2+Z1aNQ5Jm7icnt0Oxaykr6MKDApmo6QPo8Pn
2jIWoIrFQhr+2UNUr/Pf0tBbQadb92/pGrEKHuEjRR9DQP0OIPfaPrD3cc8UKHu8
1NxVQ5R6u0QWneLsJGfPbE0OLBcLpTwwyPmXpIjWL3bAqy5rVZE=
=69S4
-----END PGP SIGNATURE-----

--3DdAljpbCmvc13UV--

