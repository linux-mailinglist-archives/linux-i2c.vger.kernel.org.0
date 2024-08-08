Return-Path: <linux-i2c+bounces-5220-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 228AF94C091
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 17:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEE701F216A8
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 15:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A22B18EFF1;
	Thu,  8 Aug 2024 15:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NTHOAgwn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CED18DF75
	for <linux-i2c@vger.kernel.org>; Thu,  8 Aug 2024 15:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723129720; cv=none; b=ChEpIt4FjFO2eeDP5zjV7qqmt8c9Sn0wLpARRKBpCQz1WEtgapzHcX9xJ0VVl3G3UOMYz4lDBWjdfWJXe3lQX/HaBzP6Un8GRHmNLb8kUVmnLQyx2CLYWRfCGmkIaRR1ylR2eSXLHczAjHQJSxGjNUCFN+MLpcJO6xmwkLBKtj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723129720; c=relaxed/simple;
	bh=w4R25BPgS5phZlT1l4auPlaUzCSJiEfnbiR3AJUJ7Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxmNAdzczhoHb4URBeUgK498aaLrLEoBTLuUe4YedJP7+HExWgfveLBKpxGgC3bOgyKE3PkWEdeoIBU+9LnBsBzbqeAzYA7fhQpW/he5/bLtfDvVLftsgswAJKrl7DNOR3ohX4n8+6HNhc/oj1Zwk/SBCcSTfMRJKvs5ehs4Tes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NTHOAgwn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ve8L
	lTcqJOjzP7isM+JdryITAP9551O9yPbo/RFx+AU=; b=NTHOAgwnCwb/3N10kJrv
	tPOddDACm+HtzA1Bzk6OXNusk13dgX5VKkhoQqkYDb2i+MHUa/QwU1TP6beXiP3C
	+V0YgTnCOoW22E2bxmzCRLAzjsEe0GtMax7U5yGgQOsNNpfRvDME1NYaJZbrdfck
	cbk5bCVBBLwrfJJGDTM/fwVQTFaYpB61jPzrbx4FiL0JBYZOrxEH9fIwNYosaBBj
	nbm2lk9Fue95NRB/ElRVU3EjWiC29CSEH+lUQNHcDyQX3SoWM5SFXw9zl8Ng43FE
	thQZMGq+VNYgLn8bET1rmqiesdAh1FauHNANjgOGjuBL+a1Js8EHYkV9fY0A82L8
	NQ==
Received: (qmail 351774 invoked from network); 8 Aug 2024 17:08:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Aug 2024 17:08:35 +0200
X-UD-Smtp-Session: l3s3148p1@jOCZZi0f1URtKPBr
Date: Thu, 8 Aug 2024 17:08:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, p.zabel@pengutronix.de,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 04/11] i2c: riic: Enable runtime PM autosuspend support
Message-ID: <ZrTfc5imZgvduGc8@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu <claudiu.beznea@tuxon.dev>, chris.brandt@renesas.com,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
 <20240711115207.2843133-5-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wyJIwvqvaRJYLemY"
Content-Disposition: inline
In-Reply-To: <20240711115207.2843133-5-claudiu.beznea.uj@bp.renesas.com>


--wyJIwvqvaRJYLemY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 02:52:00PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Enable runtime PM autosuspend support for the RIIC driver. With this, in
> case there are consecutive xfer requests the device wouldn't be runtime
> enabled/disabled after each consecutive xfer but after the
> the delay configured by user. With this, we can avoid touching hardware
> registers involved in runtime PM suspend/resume saving in this way some
> cycles. The default chosen autosuspend delay is zero to keep the
> previous driver behavior.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Basically, OK with me. I'd just like a comment here like:

/* Default 0 to save power. Can be overridden via sysfs for lower latency */
> +	pm_runtime_set_autosuspend_delay(dev, 0);
> +	pm_runtime_use_autosuspend(dev);

Other than that:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--wyJIwvqvaRJYLemY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma033MACgkQFA3kzBSg
KbaT4A//XCkpAcVYza+MfVUBCF0Nxci3BvJ7/aNEWvqASBIdFHWQFMzCVeJi1qcJ
TvZcxxo8EbcFdfF1W3Of6OYEZgbn1AhJhPRhCgDEo6j7kKyBhtXOOSXH4nTNh7sn
21U1ztQRmSFnX1HzWrB5V+du2pzclFXESPP5dqUmxJe5fPqUkCXGvMOJ4mWCDO5b
J/+3aMV48yWxbiSkMgGL1Z9hDiUGxFLgftfVN1F5mhdNakY+nfsqjASF78DanwB8
w/JkXjCQrkqWVUmazmCy2hLJ9PD/gN1XipFgS/8g7ZYzOBya5P9f+/Nh4OO9VfPd
JpoiOWLcOcRf26DjIsuybQJH2TqC0v+icwinbR8s55ekrWMjLeZS9q9GsKdSqEwh
DBJVuMWbbEu2OMjDBL2aKGcrKSJEyFBHAd0USDISyEudbHt3duThmgfg179UMZ0Z
z+H+R85V81f5KqgJxpod4Qhu06gHwChRBDTzcfszNRhg/qUsY+GoYM7ngrN5sOHN
lniuB/pWjwxS1rRkIijq9+FfwJl8Tp8PUtd5UD4YSVr9FsvbhBaWGJ2seES0pOfB
KFRfhtH4tAmIp29KmT9qQS/3LQWo/11r1VBtZpTkawKYauWHFgSSMAToQDSeo3CG
NceoaaBR50JCS+AellLOfGeTJVDUgdy0fOJCKQLpO6zbYC066xU=
=7V5+
-----END PGP SIGNATURE-----

--wyJIwvqvaRJYLemY--

