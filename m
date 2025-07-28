Return-Path: <linux-i2c+bounces-12052-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB04B1370D
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jul 2025 10:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A28F188E1AA
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jul 2025 08:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D27D22D9F7;
	Mon, 28 Jul 2025 08:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LyM5hlQI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2424D3398B
	for <linux-i2c@vger.kernel.org>; Mon, 28 Jul 2025 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753692918; cv=none; b=Phrk7chToMU9zOtllNmOjfxjURG2GHFYsmU4lwiCO3m+yruB/5xIcBaxTB/+vPioyTgRbZDLmTpP448f5ScVlmAWB3POGwL1pRfHgoL3UElYJdNbarF48K3QsRiKRsQAcDPuIaveXpMAcTC3bDfE7V364TzKtjPEY2emRThTYp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753692918; c=relaxed/simple;
	bh=gnCHQZ1z+8JJt8cCbafcvsbEAy5AmOf/papLmhtzlvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AxZ+xEklfGmy0pOeLUD19yYrG6J4y7qGxrN79eFA7IMwHwNj48LvKefdmU5dOn37k4lNbNAIrnw6ZlzWziK7/GGax2apQJdLpnYxS1ea2w31LOdzcEoqZ0d7PdSaRUVqeTendf8/rpx6tOdPpeGPk5tjiDRPJfRZKSmH3wqFP84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LyM5hlQI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=UAQU
	jGuxUG1E1fe0gubyQ/yevPLFRNpllTNyC2US9Fo=; b=LyM5hlQIgEw39YvSI5xY
	oio5Iim46ONy+cV4DpCGcUEzbMyu9hPdhTeLudF1PDQ9ihcKeBpHd+cIrVspfzbJ
	aVlhbSPDrUJ3Yl9wAWKXrxnfEwtnr2qWuwKDoNmixbXoYIiV+2Rej2c331u0PVnG
	SJfGiCo8V1A1A00vCnYkD2DCLMHrg1x604NKKSdSO+roApHyJbDO9YwtI4jTv0rw
	S3B+A5ZayX5WDRJzeTgqACIKRqQYDgxoLPV3cIrjRXzoyjyU1ZEiCrVvf5q1nVqO
	w+N4SFTXLd8N+yfvC5WOeqnMuFGtRQ1yFu3sOnCA2dayuprR8h+EHRaJoxMPu91b
	xQ==
Received: (qmail 3374383 invoked from network); 28 Jul 2025 10:55:14 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jul 2025 10:55:14 +0200
X-UD-Smtp-Session: l3s3148p1@WXsrc/k6xL4gAwDPXyC3AG0QzsW8mHdp
Date: Mon, 28 Jul 2025 10:55:13 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: git@amd.com, michal.simek@amd.com, peda@axentia.se,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	radhey.shyam.pandey@amd.com, srinivas.goud@amd.com,
	shubhrajyoti.datta@amd.com, manikantaguntupalli09@gmail.com,
	Jonathan Stroud <jonathan.stroud@amd.com>
Subject: Re: [PATCH 1/1] PCA9541: Increase I2C bus arbitration timeout
Message-ID: <aIc68UkzN_l0gZ_D@shikoro>
References: <20250711124503.3390451-1-manikanta.guntupalli@amd.com>
 <20250711124503.3390451-2-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OhhEuFFUUn3RXVrr"
Content-Disposition: inline
In-Reply-To: <20250711124503.3390451-2-manikanta.guntupalli@amd.com>


--OhhEuFFUUn3RXVrr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

thanks for your patch.

>  /* arbitration timeouts, in jiffies */
> -#define ARB_TIMEOUT	(HZ / 8)	/* 125 ms until forcing bus ownership */
> -#define ARB2_TIMEOUT	(HZ / 4)	/* 250 ms until acquisition failure */
> +#define ARB_TIMEOUT	(HZ)		/* 1 s until forcing bus ownership */
> +#define ARB2_TIMEOUT	(2 * HZ)	/* 2 s until acquisition failure */

Can't we use the timeout value of the parent struct i2c_adapter? This is
by default HZ and can be set by userspace via IOCTL depending on the
actual use case. So, we would use (pseudo-code, probably):

254         unsigned long timeout =3D jiffies + 2 * client->adapter->timeou=
t;
255                 /* give up after this time */
256=20
257         data->arb_timeout =3D jiffies + client->adapter->timeout;

?


> +			dev_info(&client->dev, "I2C Bus Arbiter timeout, forcing take bus\n");

'dev_warn' for both?

Happy hacking,

   Wolfram


--OhhEuFFUUn3RXVrr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiHOvEACgkQFA3kzBSg
KbatTQ/+L8h4Vly4HssKkyPlR1LNMN/n6UYsi/FxKfSW6hD56m+7BQ+rhrOfr6So
+xItBoITdU9ps2srR58symHHsv24qIqNmp7UiDTOClqISFXY4cjsbU0KeLPCuwPx
fU3/MkgKp/lrYPfAb7r/PU5Ya76xQx8jufM8L2w+2vxHLDFoHZIvQxFXo9ScTJTd
3h/lpnOBAVOvx++l8L5seqOZ/2KiJmijPjOVfXdkNFDDh3mafXQKXn1D0r9v/Tsp
ZONfCqVJYNsfYC5VjXby4owsYJYMHp1DvBQ4hFqhAWxFzIMa13j67eSBgN6EEf9u
CK/w+gqvZfgGHnFfpLggUAOME9xe8CGFy/iCojIxe8dR24uyYgLV+5pwzGKpOouX
yIZoq2IzAcuSn7TWY5L+QAdmROpv4KoRpxNDIqvY5G9tCmPrsdC6hCERQVXGIBxh
LzANQh4iYrjOywQrD3ODGLZw7rtlZsDiUQeJOntANYkj/OH4I0iCOLQWDtkFCA3Q
vBH0PmtOZy9Wditv8D9dCJNr9asDK+RMQFegcR0nTW1h8D3uqIOrWJeU9hYz/GjU
a9Tj5ZLBpc4xGedzF1BdISApZWp6oN2MhvW+z1s8DU8lZInp0ewYO8MDFt3HBtIc
4+WD4qlcBtuvpSvuQNP+LQTVuQ/5YNyzjpACfSsXoxIqu+F4gcI=
=Oc/c
-----END PGP SIGNATURE-----

--OhhEuFFUUn3RXVrr--

