Return-Path: <linux-i2c+bounces-10385-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDEBA8B164
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 08:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D5643A9E38
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 06:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C7C23E337;
	Wed, 16 Apr 2025 06:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JJL/06eQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ED723E229
	for <linux-i2c@vger.kernel.org>; Wed, 16 Apr 2025 06:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744786533; cv=none; b=VAtZiHsJnz7ERafBL4Nsd8guRu2sMdOreWlcaW5YLVuuSa36riKYVBeLcCAEJW6i2dVRda35iU40FWWHOKEk4zTPXNc/pOtkRHRYvA5JxWqa8yB9a3cFVpc2soBPJXLFReTeNPU4maxyPgElRANDcKfOtDj0ow/OC00rdYzU4jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744786533; c=relaxed/simple;
	bh=9AWnnDPt11sXZ68zVw3VobBypj8iGzpX/p3WzL6YkMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhJLbSHa8xR8ZZnBRcr0EOfvGjrsLROoqv67p3xGsYy8X4vbPwf2t9QUYfLiKrspmuDzfjvm4W+ltXPHmJFUlnJrcFU3i4QE6BES/vsOS3GigUlfDTHdsp01+20cZEFKKFzSTN2uqHjZeaZqLTsmz0ccEelCRzq8dIpCRcWcYIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JJL/06eQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=9AWn
	nDPt11sXZ68zVw3VobBypj8iGzpX/p3WzL6YkMs=; b=JJL/06eQo222JFOy5ont
	b0BisnKAsfelOJXqgPtd7BLy9pRtgU8EJansG5KHmbiUM3wQRhyKoQJZjMFwcsxk
	AteyPP61XowKlKwAg1jWERPFtkU0L4NRjgzaC/PTD2AUx4L8p/QEOe9UUsd/bBLF
	JjgSPwKM25Vw9591dkZwRYeVMrieyoGnqOSq7+ai3qC9LsxxM1yzRX5ZBEaMa01O
	wkD47a673deFxrALPvgnhG12lRlA58mWXbzYYQaLlb+EsS0Erlu77Yw8DGmWM4HI
	iKHxap9jyHJ8/pfhahVXkeMHpHFAS9WUbopTEYGsNqtvZ6raavzB2LW+xxdtAl6I
	Ig==
Received: (qmail 601464 invoked from network); 16 Apr 2025 08:55:28 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Apr 2025 08:55:28 +0200
X-UD-Smtp-Session: l3s3148p1@bSs8xd8y0Lgujnsq
Date: Wed, 16 Apr 2025 08:55:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v4 5/7] i2c: core: Do not dereference fwnode in struct
 device
Message-ID: <Z_9UX9xkGjvhnub_@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
 <20250414100409.3910312-6-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uOld3320BOoglIIe"
Content-Disposition: inline
In-Reply-To: <20250414100409.3910312-6-andriy.shevchenko@linux.intel.com>


--uOld3320BOoglIIe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 01:01:55PM +0300, Andy Shevchenko wrote:
> In order to make the underneath API easier to change in the future,
> prevent users from dereferencing fwnode from struct device.
> Instead, use the specific device_set_node() API for that.
>=20
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I'll check this patch later today. Rest of the series looks good to me
already.

Thanks!


--uOld3320BOoglIIe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf/VF8ACgkQFA3kzBSg
Kba3+hAAmfNvum5FEcfQ6hqrsUfbDMAROGyPm4V1DU+wUmncR6PDbQr/Rs01wFIm
Cn7dv7sx7dOCx3V6sKLzy463ffLVR82jaIme1gtin7Wfesg5JU62wEG3JsSrvlw2
+U+8IwYVxToPhAu47xQi+lDFPMOVuBluGnb8pI3LouJ3RxfpaS0w8+1FbuWGpex1
mdlSllWxNW6+2/hkIzokpTfvimvl6ZMSeteXP6FTc0wUttd87QiSQwpVATtOPN/+
XDWf43huWPtZxGwYUVUwPtHNEPLX2PfN7OAFIDvBPVeuGLCKOaKwX8y/LpWginWn
38KSZfm9lqGBTU6Jnm8kXwBxRSOa8Ba14HotPKcmpvrwzxAyyR+IHV6Od3L/zABv
93I1+dNEJRyVmFBggimWNTZGALu/tgv32sN/rCtTB4STuePy4lXERZGhbCOIvL0n
z9dZqAybLXv9u60n8slnB//NwrGBRGBr6Bdc0mlAC4/cGBRftggrSQpJ49MmG1sx
ExFvacJNf9SRHY4EVYCDpnpJtuaVT/fZ6yXg6wkYEsfoC3keBJP8zJgmZIDDGtkJ
+1ZkDFoPm7+MAvI/QHbd7QOXdgoO/BTPybY3EeEr7BDQbiFwNPdskjdABeZLRLhx
RlNA4o851ASS4M+gzc+Tu/ezjg1mXyofhlTMzIz9FDNGoJ2j0+c=
=zQR6
-----END PGP SIGNATURE-----

--uOld3320BOoglIIe--

