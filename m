Return-Path: <linux-i2c+bounces-3417-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8D68BC7BB
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 08:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27DDFB20F03
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 06:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAE24DA06;
	Mon,  6 May 2024 06:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Z4uuakRL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFCE3BBE8
	for <linux-i2c@vger.kernel.org>; Mon,  6 May 2024 06:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714977777; cv=none; b=dz82dNrulbdEOxlLiHxb4lN8v/gaJc+pMoPL7P+Wz0DSIZtCLF8ZlHAQfgsz6BsKDkdQb9n6awmkk5MZhWgVe33WPVrfjT4khxKdU+Nj6aDPmJZTpgKoCX4sxhrha6uuo1C+2ybMtMMn2y+2CeP1kwohw6sMmZ6cvTLUwyjxLGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714977777; c=relaxed/simple;
	bh=nex5O26cUvAvL3ka+pH6k2XQgsIMPgOT9DOa+Q4eIYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ci9ZwWJgpOa1tkIqM8FGRQ4Af0SZ2K2HmqzGhZ2fz4HosZfhX+jYf/3MpkW/JO8MIfCHYhDCMyIVIvJPEIQqs/zFa7lLvYvy06NKP/vPW2P9wEuiuMGVQAUHI2nSZWgzmPnBCuT6o3Baqz5sCxfKzhQ4NLKrp4vP/0Caxw8QExk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Z4uuakRL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=nex5
	O26cUvAvL3ka+pH6k2XQgsIMPgOT9DOa+Q4eIYc=; b=Z4uuakRLyv7KSGYPTT7m
	MuYfaHe1nqGM17oxgLVuu4q9ChLRtwKKQzYtzoIjPR//VBzkUsIejui5P+3G0X33
	qhOlKEAmmX+NENH3rMa0iVuVC3fTAFWNIS3AlMMVn4N6FUA3uXJEjmSLVoww1dyv
	amYnXNi+1INy/AX+1GoqwOQB6XcjJBDC0XIhpUmxgB+rOUrXMFIKSfSiGUw8fHrX
	+Ko0GXbAAmb0Rk4wtumIpSjhSeXl731BeGtvqQbAAEZTnDYr6PeKiBHp61p18hhP
	kCvt24ztwGey0itKcRQ8JBiQh5isGyrptcSO+4QNCvvQ/4L2mHHY3kxMDlF79agU
	RQ==
Received: (qmail 84243 invoked from network); 6 May 2024 08:42:49 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 May 2024 08:42:49 +0200
X-UD-Smtp-Session: l3s3148p1@olqJYMMX5rMgAwDPXzrfAO1ieDVkyUqz
Date: Mon, 6 May 2024 08:42:45 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Wolfram Sang <wsa@kernel.org>, 
	Peter Rosin <peda@axentia.se>, Peter Korsgaard <peter.korsgaard@barco.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, Vadim Pasternak <vadimp@nvidia.com>, 
	Michael Shych <michaelsh@nvidia.com>, Guenter Roeck <linux@roeck-us.net>, 
	Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, "open list:AMD KFD" <dri-devel@lists.freedesktop.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	linux-media@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] i2c: mux: Remove class argument from
 i2c_mux_add_adapter()
Message-ID: <vu3vfpw24hl6obm7smbgxja2xho4jebg5onehnio5av25vxut5@7oldfkfgrszo>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Wolfram Sang <wsa@kernel.org>, 
	Peter Rosin <peda@axentia.se>, Peter Korsgaard <peter.korsgaard@barco.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, Vadim Pasternak <vadimp@nvidia.com>, 
	Michael Shych <michaelsh@nvidia.com>, Guenter Roeck <linux@roeck-us.net>, 
	Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, "open list:AMD KFD" <dri-devel@lists.freedesktop.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	linux-media@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <17145dc5-e68e-4566-bedf-251bebe36ebb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cucy77nhppbompf7"
Content-Disposition: inline
In-Reply-To: <17145dc5-e68e-4566-bedf-251bebe36ebb@gmail.com>


--cucy77nhppbompf7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 10:55:39PM +0200, Heiner Kallweit wrote:
> 99a741aa7a2d ("i2c: mux: gpio: remove support for class-based device
> instantiation") removed the last call to i2c_mux_add_adapter() with a
> non-null class argument. Therefore the class argument can be removed.
>=20
> Note: Class-based device instantiation is a legacy mechanism which
> shouldn't be used in new code, so we can rule out that this argument
> may be needed again in the future.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

For the record, I will apply this patch once Andi sends me his pull
request because there is a dependency in there.


--cucy77nhppbompf7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmY4e+UACgkQFA3kzBSg
KbajMQ//Q/eB+kl4FeNpZjryYfjnQ7n7O6UoNwhSom4I8yNSwsKuW11uPlGO2Ykv
5F/GZy+exfdQ03lNIncbhnFhn+qj4JdtIku4B0HblNyL4tsKdrauWA8FDb21YFgT
HefvU0OcO1l+mMiPzltii0dvuXs2m3PH/5WCM+n6Sh8lBQUIemGiJrM0yG9OD9en
6XgXkxzWrEKpAW+Yla5gFGDV5UmAAll4LnOM9rprGITyUzIFoADcl/TcDDFneYkS
Z1YA/m4ehqKBXgUb8NcLS1yBOf2Eed5aXoHDMxxr03j1NqybJR0RXPLVW2YSwZYU
R8cfUZcGlUDUlCYQDx9HWMHp4MOiWGGduqVJfiBZobN6pC/m2Os1JNBP0eSt8kNF
zekrJRHyAGHqS0ehNCFczwERgVwFZ3f+8t0xsuXSTHEwbfjKfvIUTl46L9mvc62X
ctdf641RagBedgTryHAThhO2SCDxjj9Z6SgUYipo5b8+voaf2yDf9n4dIXhkn1Li
aU42xlq2DiL03xPumEY7GGUL89z8AnNygp8YlBHcMS+rAIAVn4McvHmj9fmBpkQf
x10yvP1qUCgj9cq1C4zHT/gycf6tNG8wDutxWFKvHIUH0KPKYGaXRQ8O0+uy3VNy
qqLtPqBcMyciJtbwDnjAlKNwbPMeWIDZe2qTyd56g7ZAmXrrhBg=
=crMB
-----END PGP SIGNATURE-----

--cucy77nhppbompf7--

