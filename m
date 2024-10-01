Return-Path: <linux-i2c+bounces-7128-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 707BD98B73F
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 10:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05C3BB249C9
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 08:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4115D19ABA4;
	Tue,  1 Oct 2024 08:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MbqYtV63"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5111C199FD7
	for <linux-i2c@vger.kernel.org>; Tue,  1 Oct 2024 08:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727772051; cv=none; b=jgS49AslbvGwbHHNClcKWIcXo49NKaUkVueTHdX3arhkVMce0/glFttaVLomIligDeVIFapT2g0z1kaSQyaPJY3ZvSjw9KPgjF1qskWwMxORZoUVisXC3zHexNh7761RocV6Z3NAjVgFyYAKFbdCwG88HQRNrj2kUebSAiH7Vrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727772051; c=relaxed/simple;
	bh=j4WMJo55ds4cvdDSMrIE//LyiNstl71gSiv0rxg9kXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AVB1V2B3i2TF2VL+BGwmm3csRUpzfXmV5XgDeiG3anDF7az66jMiM1cROwZ5Foc43u2E8MULTyOVRLH10hdB4lfQYHt758pkF30Y6F81A85aBxwyOp9inCQFRsE+ZBHFJsaI42M0F76qvjcuahTskCz4fISobdY7DZumbwnYVgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MbqYtV63; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=j4WM
	Jo55ds4cvdDSMrIE//LyiNstl71gSiv0rxg9kXo=; b=MbqYtV63glAAND/KVemF
	xoPZEPdb+fs+fa6VWVoSrEoBSAHLIjsHIbZwHrFGM1TzbgDM/YF3Bd1LX7BVuWIp
	u5jXhWN9IiwVY/kx0p5299ZeHpq/8C440evvXd+kdDirhZ+7Jn1RPO6GgGF9R/DZ
	yv4T/B3wVySAhnf+urH4Xnism8HZ8WOBOnyNyJpCGWEi1vTGhtjP6w0caD2b28Y5
	MvkgI0GEIfSCSHnVU5yfR8Ggt387zYa4o+eLfpX0OutXRtfAhw8sr2tx5mChZFRa
	Ay0y+iNsNoNs5lyeaJd0qKsRwU7OfH2nc7UD5rEQriLUP7a0QLOYbHPJX4wS4SA8
	KA==
Received: (qmail 2451667 invoked from network); 1 Oct 2024 10:40:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Oct 2024 10:40:42 +0200
X-UD-Smtp-Session: l3s3148p1@kDLYRmYjFroujnuV
Date: Tue, 1 Oct 2024 10:40:42 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: Switch back to struct platform_driver::remove()
Message-ID: <Zvu1ijtQF30IScM5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
	linux-i2c@vger.kernel.org
References: <fde732497283c2a4b079731a84be583eafcdc781.1727537108.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p2etycYN5IBc6QVS"
Content-Disposition: inline
In-Reply-To: <fde732497283c2a4b079731a84be583eafcdc781.1727537108.git.ukleinek@kernel.org>


--p2etycYN5IBc6QVS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 29, 2024 at 09:21:57AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>=20
> Convert all platform drivers below drivers/i2c to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>=20
> given the simplicity of the individual changes I do this all in a single
> patch. Please tell and I will happily split it.

I think one patch is perfect.

> I based this on Fridays's next, feel free to drop changes that result in
> a conflict when you come around to apply this. I'll care for the fallout
> at a later time then. (Having said that, if you use b4 am -3 and git am
> -3, there should be hardly any conflict.)

On rc1 and Andi's current i2c-host-next, this works without conflicts.

> Note I didn't Cc: all the individual driver maintainers to not trigger
> sending limits and spam filters.

Perfect again IMO.

Andi, do you want to take it? This is a typical after-rc1-cleanup patch,
so it should be applied soon for testing and send to Linus for rc2.


--p2etycYN5IBc6QVS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmb7tYYACgkQFA3kzBSg
KbaObRAAkCj9NN8fqLMb8Rrx3F1EzK7nRql2DzeffnlJdSg5ElN4hP4pOQ9aQuYP
zfqQXrKttdkUBYkPNBDz9r0C5Z9wkxv+Vs1bo+kCvMTm3MMIHjoOGbw330mnfTZu
q5W1nWrAMM5Bn594G97kHYxWm263V1rNyDYHtxi5AxK4cEptsQH0jKVK1eSeWF/y
VdnndhCYm2wjM4Zo8U3534nY65XvAkTJwMeoEOw1aSsTbN3St2zghJthMDRpbLAL
PEaZUlNtATI/HpaCMCP8wTYnuCEJ01fOnCm1urREG0FH23gun6vcFDhYmQngwIqT
xo/SlusJwS6ClWyLRPXjQormaQFar/ZEki2iJErwzjA2HbmB8k3wMDOSSiiMpVVE
6k+xO40s4Xy/0isKAsS3JYWoSqknEunwLgAkgwyrkQyXDn56gMtMw7+rpXfdsHi+
Xabm6HeW62yXvlszLIXhc0Bv5ZdmUrYAyWyw7V8pw2IpQcxPR/4pZkzdl6mQFJmn
A+JlDB6Wb3PkTBZUBRuNVLeTHqtFI8yuQl5K1pJ+B88SJmE18wW1yENbB/qFln7w
OX39ONqf95u8bOrMxUHdW6EqchOqVp4GIi+4BT97xmzMZ5Zon+P4QrD78gjRL3uT
nEuDWPCaLCRrAXRHBV6rDXbyUzRsNBg1POYQ3B1/RwDLUN/opY4=
=1A5k
-----END PGP SIGNATURE-----

--p2etycYN5IBc6QVS--

