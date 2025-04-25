Return-Path: <linux-i2c+bounces-10623-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F255FA9C316
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Apr 2025 11:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB8224A5581
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Apr 2025 09:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9B62153C7;
	Fri, 25 Apr 2025 09:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SK/c6+b6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AE7233D88
	for <linux-i2c@vger.kernel.org>; Fri, 25 Apr 2025 09:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572470; cv=none; b=D6KvXisXUxTLUMwPGhmz0xqltP/h0/7dgoEj7BOcqnig2STEkF50AqS7RYNEeGDQpXKP4U+g5ySPsF/lXrirQr4NSGH9hV/m8oA/GmLa2RwtKo+fcFC1taBi434g2Nc4TqSuXzfKV1RvngNJnYUuvOaAHg585L8OsK1j8LVXMWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572470; c=relaxed/simple;
	bh=7EgrSjYq/q+AEXrtHLG+GPhFy7CyRECDNOQR3ymqGno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=exv+OVcjwcPkclQdG2vJuAo/iP8B9w9ubSz45ZCEgatqaYgEqisNL/yASKxveg9sDf47jsJsoOzq44oqjEA4BJp8stTTATIRNFZmhPYeMQJDI2Fbyg5g01We9ZVasNnRkO2Un6hjkugBTPR9OmpNLPp9YYhlcQWeDsQ3vHIfUdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SK/c6+b6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=LjSE
	ovQMAg8Bps9xT8LjGwQNRn9cWiTYIsHJmA9mGoU=; b=SK/c6+b6qV6JZoekod7b
	Pwe+6nFydr4XfPcE36tXXcJmWS3a8G9W8fb6nnSSRxl3SZuDFJf162XdrDyBYQ4S
	gDPsbg1I+6SnWxcGBFxMwsWf1HyRlmkA4yFlpiVJ94mc7E5ZdSgBZkAFCfV7/T9p
	enOF2s9guMTzHB4HhcXwfs7ceALhIZuylR7uH4h02v83ACTRiNTcVitjzxTQuvj1
	nEK171CGo04ECIBsKJPJha3S/pRodjcIlR/YP4Qfn+5jG/jn5aU8NrV4B/dS0uu6
	PgoorTb1tHwALstZy8mqh64ciP7X5eOudBIlJ4ui0NjC2Pyroma5QQgOxZe1HmyE
	oQ==
Received: (qmail 3763468 invoked from network); 25 Apr 2025 11:14:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Apr 2025 11:14:19 +0200
X-UD-Smtp-Session: l3s3148p1@HolgwpYz1KQgAwDPXx6JAAunYj8Nf7DC
Date: Fri, 25 Apr 2025 11:14:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v8] i2c: riic: Implement bus recovery
Message-ID: <aAtSayFrtSh9LC-J@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Andy Shevchenko <andy@kernel.org>
References: <20250407121859.131156-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aAC8f0dAMERD8GjW@shikoro>
 <CA+V-a8sM2mFS--zLSZt28mOUDuO2FpW0TsaV50A_VxFZ-juP4Q@mail.gmail.com>
 <aAFgwEB4SdgH-1fQ@shikoro>
 <CA+V-a8tmTqFi4iqGhR3cfUgKw7mxJrm6ixGAHq747ptrL3t2jA@mail.gmail.com>
 <aAITBfrOI0GAhGRA@shikoro>
 <aAikKreK-BCP-zLp@shikoro>
 <CA+V-a8uHxfmJLOO25acfK2=EZt41f_G6LShNpeL9RVy-X=Q3Cw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/0jAnBZn5C350odU"
Content-Disposition: inline
In-Reply-To: <CA+V-a8uHxfmJLOO25acfK2=EZt41f_G6LShNpeL9RVy-X=Q3Cw@mail.gmail.com>


--/0jAnBZn5C350odU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Prabhakar,

> I prepared a setup on SMARC2 RZ/G3S and I can confirm it is working

This is good news!

> (but this is failing on SMARC RZ/G2L I'll look further into this)

This not so much. Hmmm, are you verifying against the same I2C device
on the carrier board? If you compare against different I2C devices on
the module board, the culprit might be the I2C device.

> For the SMARC2 RZ/G3S to make sure the I2C GPIO pins behave as
> opendrain I have the below patch for pinctrl

Do you really need this patch? The GPIO lines are wired to SCL/SDA which
are already pulled up. Search for R118 in the module schematics.

All the best,

   Wolfram


--/0jAnBZn5C350odU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgLUmcACgkQFA3kzBSg
KbaDQw//WZEzf3cMdP/Ssa5HfstoUHnRnWb1KR2nSv+u9ua4vMZZLNWEa12wjIXi
XM/MYCQP5IVo30aFEZVCURV4pszjP0ZveILER71JIqUNI3uze9wR9rGbPnJ6Lf05
YNGpyOmBErZIVT++Z6VL1P1MYU5ulpdcIEwaG5A6fHkyasG6Z+65ns9wWnNAEbt8
9Z9F1tRcxr66e+t5c19einq4ezbewdKnZfImrizalwd72Hag3+eer4WkauPkuzJC
iA1jnV5I21RjPQHqK6duXvsuglgMihC+nQ+kZRA2vPXCZAkCKvBc6wR+CDuI82qK
zWvTzdCYHXb0V2cjp3kBFE/fHPS+0zUefMUg3DUhaobhurBauNMqm7Ox0McKn6Mt
Dy8TnHRYh75iW3I4g1x8FCn1YAiysMIPDc7Rt33M/hRyymfA4jsYIWDd7j1JL3iR
wQCspAVbOBiwHxVfAcRimx7Lb8mdVBv11k8qk20kWgDqeJaBZT06N+5cchu+rKn9
qCLTRTx9EYf736ZzguwC3mgdmejiaui7x+VYgiCt6Jl4V1UG3AxEGV/r3AV/TogG
4gJVD2SDZrfZtSfLClj7hdC795HHlbPqKiZ9jdqSyBGcd3KerGOPYiFbTSNlJ2xd
FIMMKGqxa4FSP0grQw6H1sAcrrqbL4qXtK7p8DjFhHPOZdUl+FM=
=sBlp
-----END PGP SIGNATURE-----

--/0jAnBZn5C350odU--

