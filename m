Return-Path: <linux-i2c+bounces-3095-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EECE8B0535
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 11:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43E901F22D49
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 09:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C603158A39;
	Wed, 24 Apr 2024 09:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WHhiHQrP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E718158A24
	for <linux-i2c@vger.kernel.org>; Wed, 24 Apr 2024 09:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713949260; cv=none; b=n6xGNU+tt9KwlqY5zT/Xe40FiS3JMcc/MI74jZat96UsanJmoDiBZLW/ft1Gn6NpFNPamPOYdlHPxZn3+HgR8buLsRtns/QJUXmdyBGZH15O7vkMzGd8LoBJpcUpa1IpZ/7QNJHG8W6wh3oLRqMXv5sY2F1LQOBazdNVOdTT6ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713949260; c=relaxed/simple;
	bh=rlodAndDMyPA39Cl9zBq3gC2CE9mIUDdBUkS7hl2nGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9k26SASMiQBEik9EZhICfSZcS3F4HH2lJwATXLa2w1i0WpbXUcL40GF27JqSPwd9n7p468iqNPS9emtrLWIT6aeFI+BUSPQpZC1zc8I1wTslsLd3hYHZmsB4YVcS86dzr2SsfiuMk7/CRP92IyTu2Kl7zgbwkjTNXSHXynrW/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WHhiHQrP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=F/rZ
	bYMw94pfUTMXvodaO2dpVGh5mtleHLV+nawJR/g=; b=WHhiHQrPoBK5rpd5VA86
	giFZK/WK5QrP+Scmd3x1x3hLwHAF5BGRil3N9lSCG/OkS7EjhlOb3KHy5j81KxIJ
	XaXBUVIuMGaM18HHTUgJRkx01WQ3RabIM3Zz5b5JakCGhRZrb6kOTPWQedekx4RO
	R/H8oUjWLc1AF8CuHTrkFFdjh3jDINTYXczzFDoJQUKxUfdADEEN+AIaDHbZTkHW
	svfje4hrAL8SZZycmdvgqYPnU2K6Cm4h1DkYBcpDF9Erlb7TJw1UvXCdUwuDhFWg
	KO3RQsxqrhiqKIfhkyCrfRinbr1jsOR+GIFjr58RNV1q4R9FpRfaOVQoxeJtDkMu
	uw==
Received: (qmail 501040 invoked from network); 24 Apr 2024 11:00:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Apr 2024 11:00:53 +0200
X-UD-Smtp-Session: l3s3148p1@L6tq6NMWFsgujntt
Date: Wed, 24 Apr 2024 11:00:53 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/18] i2c: remove printout on handled timeouts
Message-ID: <sbkymvjmrufouqqscpmrui5kcd466gj6yn2bqwf3lhfk55mjos@n4ydx6wzyq4k>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
 <ZihNbtiVDkxgUDGk@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tk743gnx4tnmnqhg"
Content-Disposition: inline
In-Reply-To: <ZihNbtiVDkxgUDGk@surfacebook.localdomain>


--tk743gnx4tnmnqhg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Wed, Apr 24, 2024 at 03:08:14AM +0300, Andy Shevchenko wrote:
> Wed, Apr 10, 2024 at 01:24:14PM +0200, Wolfram Sang kirjoitti:
> > While working on another cleanup series, I stumbled over the fact that
> > some drivers print an error on I2C or SMBus related timeouts. This is
> > wrong because it may be an expected state. The client driver on top
> > knows this, so let's keep error handling on this level and remove the
> > prinouts from controller drivers.
> >=20
> > Looking forward to comments,
>=20
> I do not see an equivalent change in I=C2=B2C core.

There shouldn't be. The core neither knows if it is okay or not. The
client driver knows.

> IIRC in our case (DW or i801 or iSMT) we often have this message as the o=
nly

Often? How often?

> one that points to the issues (on non-debug level), it will be much harde=
r to
> debug for our customers with this going away.

The proper fix is to print the error in the client driver. Maybe this
needs a helper for client drivers which they can use like:

	i2c_report_error(client, retval, flags);

The other thing which is also more helpful IMO is that we have
trace_events for __i2c_transfer. There, you can see what was happening
on the bus before the timeout. It can easily be that, if device X
times out, it was because of the transfer before to device Y which locks
up the bus. A simple "Bus timed out" message will not help you a lot
there.

And, keep in mind the false positives I mentioned in the coverletter.

All the best,

   Wolfram


--tk743gnx4tnmnqhg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYoykAACgkQFA3kzBSg
KbbLuBAAjzqZT2iFY7Av9H0s+wlzFx3PbOQR9XN1fKqU/9jvT5vumaPsTH+2fUZY
sOMPYFZUeYiZIcZqbWOUYa5Gkg5oZyrnNIbFOpV97VM9nHq5tMBrn80hdTccNBcn
dga0E8zizsjSv80+pRwrfrfzzAALZnRZ8pPCPf6NjfnhVuhVbM3nfTJ1cDKPzYLw
d0+t0YJKs0J2Ez92HZh4sxYyhELQ2hNFKLFcJqLBQI194Y6AQ/SP376ZTWRzaRCr
KTLHH/wpuWERvzrQBBm+MOpZ14LKy+oKzOYKUndYCFw1dZOART808i/5Zcaqzop7
FRZpqfJzwLh/JtT9GiunHLkHbLIRI59otzBHejzX/oCkIRylcxrn5DEkTFsKsdZ+
Ay1VMdtxGSVMkha8uFlq51uW06MqpDdiEqbtjkOsNBepk8hbt0trJOkGuezlNOGp
wmZeJ62f5JVrHxHHpjQwSkIy8Cm+vMtEKmJZ6exv7LRyAx2FhXFDzqwOAkNBZzNx
H2P24MVMK31rQMLcQGBQavb7O4d3Jsq1glbLHShaHkQeZYBu4aFj/zQfe+meCak/
HIpzWTFHiM2a8pAM/AnFy/Na/pUKFyE6Pwsk5cQg95VqC6sJzywwVI9AH1WaZ+cL
tED/pttmbdvulRljvoIXXsYWtCy+ENKqygemMVgNK26O1aANdr4=
=g/wq
-----END PGP SIGNATURE-----

--tk743gnx4tnmnqhg--

