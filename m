Return-Path: <linux-i2c+bounces-5224-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE7B94C11B
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 17:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AE952889EC
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 15:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8CE190679;
	Thu,  8 Aug 2024 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PM6z/hFM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B752B190676
	for <linux-i2c@vger.kernel.org>; Thu,  8 Aug 2024 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723130759; cv=none; b=V7G99vaasi3wJbP+uJd4ivqA01kmndQas0/3b77aKB/9Cj9u514FeCRmX3y/+yhjMnWOQ9ICD/UUsPENkFf3iEeS9BIFbEcx0oeDh1B7qnssrtffaWpL8dzjmw1PQYieaBwEGL4MzHnJrXDvIFoamDxW+mfTm3sNI/GtPt63Vhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723130759; c=relaxed/simple;
	bh=yZSdhAeriQBvEwlIPlA4E/h7HDRDO81uC5zyS31ik6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUWgtN9PbZzwb/9FfmSWjawIsMfS3rkkzKsuBRoj8Xtahqg1c681E1neDcbFLT36EXVIN5WPWGLIkYTRs5zKFvA5KravE1BCVtQgd+hbwkKhgYeqte2wvVWngx0lFCf+cCJhCmrPB+orLRy9ekGBSdKhOy73nmI1S/FBCt8aE9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PM6z/hFM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=9Fdc
	ANs1on3I97A255uoAnclJyRo9UTpI5fg6RNrTuQ=; b=PM6z/hFMtapvopOa6SY2
	ZDrhMHOCM1fQuSeJAw/HiMXGNJ3BQWRHDVla7li1HebDe6IPWwKrOUFAXYSlL74I
	jPM68v6meNkz/JNmbMy0UMjgw00kPmQWUs/l7FF53Q3aS7811m8SWjCLdaHTO7/g
	ubnVD/hoXaTE5AbgQNUr1wU4iObpmXE15hPxnkhPRvu/Kru0ECxzfwfKenUgoBjj
	CH1OHj2w30W2GFaAdeuOii9rvS9IL5sk9pNgUhm/5aoFz4VJIeh4g96YEAZXco3q
	Ikr9YHrpivggNJmALlHOnsUC/iuZrLiSn5Pwl1PghM718q/FFc7qWS+dunVCWDJW
	dA==
Received: (qmail 356473 invoked from network); 8 Aug 2024 17:25:55 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Aug 2024 17:25:55 +0200
X-UD-Smtp-Session: l3s3148p1@ptePpC0fczVtKPBr
Date: Thu, 8 Aug 2024 17:25:54 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, p.zabel@pengutronix.de,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 08/11] i2c: riic: Add support for fast mode plus
Message-ID: <ZrTjgqBlq0xM5VDq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu <claudiu.beznea@tuxon.dev>, chris.brandt@renesas.com,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
 <20240711115207.2843133-9-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3fJ13j0m+/v9PmJB"
Content-Disposition: inline
In-Reply-To: <20240711115207.2843133-9-claudiu.beznea.uj@bp.renesas.com>


--3fJ13j0m+/v9PmJB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	if (info->fast_mode_plus && t->bus_freq_hz == I2C_MAX_FAST_MODE_PLUS_FREQ)
> +		riic_clear_set_bit(riic, 0, ICFER_FMPE, RIIC_ICFER);

Shouldn't that be something like

	t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ

? On R-Car, we have to enable the FM+ bit as soon as we exceed plain
FastMode bus speeds.


--3fJ13j0m+/v9PmJB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma044IACgkQFA3kzBSg
Kbahlw//clBKVVxJR8v/y4MjuV+7h+izOqHoMEN1O8HcQPXZXo5wHGA045nNLvtc
woeB8Nj+tOdQq0lsGbee+JBNqDB/TMs/4dVPhDrt1dAaxjQVUYAInxAYmSw6cisL
FFzXuepXyV8MtEZHLN82aJSapPQlr8fYD3ZcxEqBiq1yLXmf8ftmqS1ix//fN41H
JOVpscDFjSxBu/EiYu15bxdv2oOs5My5jQ2h0kaPVtI65zT3wbCY8lNQmxUx87N2
+JwDNG8szdCOZprcfL9y9piAv6phAMeTReDA/r0age9l70dtPwsmr8rql0iJRaQu
SthS1MKIOPMgHKPCbVcs0HrFFnT8y6sXDA3pDn4QuDQfO231i1ILDe0/hHEM4Dbm
GRt0JGhjPCSjvEje/07LILFxqsA8I9ao85J1E+U9Cg/4N3UjYu30gHovWVgvdofI
vGwDRFjRXzqgeb/GYdjOQNAUtO9HSym1JvH4FbDDpE0DfMbdfniVTpOjkW46D1gz
mDUroBtaCn4PElVqc6F6pvhlU8fMEfCdT+pkKWDU39Piuyc2TkOaVeyzmuiyZdL8
bmKOTb3oWHpF1nfqdWjob+U0Ht+Vnzpr/09tx/4Vs0LOtO67PvELXYLevVGI3Nk6
unZzwDbeAZyl4lnluKFLcm4coh55jXjOAUA4CpnF4iI681upAr4=
=X0bi
-----END PGP SIGNATURE-----

--3fJ13j0m+/v9PmJB--

