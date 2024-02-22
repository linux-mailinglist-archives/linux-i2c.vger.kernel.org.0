Return-Path: <linux-i2c+bounces-1928-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA86860353
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 20:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C88A1F2ACDE
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 19:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A073D6AFBF;
	Thu, 22 Feb 2024 19:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dMhLdZCo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48DF6AF95
	for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 19:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708631742; cv=none; b=Flvz4lTRpqYCMneXLVWUMZVgbAFDsbe1fkVQGW1+sPRVPAD4SZJb7U0euYxgtR5AlJ/CZwM36K8PTvs7JJD+9jEruJqAJMMCWE4UZoR8YYwCF0BLfVrWcgwfZQas1ukENqAvU4ox8AzsD/LAL5POiusYXocxRNDgNJj87suO0V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708631742; c=relaxed/simple;
	bh=Xj8O+DPx4wU2UfJYi69n5ttyXQyRDoWMxk1LCwlpI8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RimT5r5ideMGTtkApd87Ez0OPuWe2qgFBWDUNxPlxC3FovQAk4fcGv+lv3tLKdrWvMVC4yzo+44cqacYd3bwc7NRYKzhlKuweR8+miBshslHTcHF2W+SQ2kU1BZybhBtOI/7eKBFSXfnDIcj3RJHaD5NRe059zfqArHn2bWHfvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dMhLdZCo; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=jhVW
	YIYPS+WQc6qJONpuGdYkkC+vizXSWdkxmtKR2Zw=; b=dMhLdZCo1B8/rATCc2vu
	mLNgJZko4QxGxAqBAHcqm1HMnlSyh3p6MujX/axkL2zz8dOKBqbrKaSsWZzlK2/1
	lLOLt6chZwcranpAh2zMDdV6DcIHwWDRDhnPfEYVSMYcEKJaZjkHmRGpV9Qo2k1q
	QAtgFkfbF3TTzNf1+9Uer1VUghhsvMhMPxCrjVcRcSDZwqTSfYA3QG+cI/UmCweK
	rGJuAkiEyQyyIGAdDDDUn2aHixyNcPeHL+JOW4FjSeYjpFHe5ZHN8iUbSqKQbe8A
	Nd+ANcb1k4G1B8J5XWOa6OJ10OnuAYQKf3vyh+MsQFvWm4QblGP6iD2T9nu1PTRC
	zQ==
Received: (qmail 4086918 invoked from network); 22 Feb 2024 20:55:30 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Feb 2024 20:55:30 +0100
X-UD-Smtp-Session: l3s3148p1@iyNN0/0R+OQujnsZ
Date: Thu, 22 Feb 2024 20:55:29 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: Remove obsolete i2c.txt
Message-ID: <ZdemsdGQE0RtilCd@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-sound@vger.kernel.org
References: <20240222174343.3482354-2-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xwbnszeJhFgpzihu"
Content-Disposition: inline
In-Reply-To: <20240222174343.3482354-2-robh@kernel.org>


--xwbnszeJhFgpzihu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 10:43:42AM -0700, Rob Herring wrote:
> Everything in i2c.txt is covered by schemas/i2c/i2c-controller.yaml in
> dtschema project, so remove i2c.txt and update links to it in the tree.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Differences to i2c.txt:

* In the schema, "clock-frequency" has a minimum of 1kHz and a maximum
  of 3MHz. Why? The specs do not say anything about a minimum freq and
  fastest speed mentioned in the docs is 5Mhz (Ultra fast mode).

* new binding "i2c-scl-clk-low-timeout-us" has a description which I do
  not understand. What is a waiting state?

* new binding "no-detect" is broken. At the least, it should be named
  something like "bus-fully-described" and then the OS can decide to
  leave out auto-detection mechanisms. If you are interested in the
  latter, you can simply disable class based instantiation on the host
  controller. No need to describe this in DT.

> Wolfram, you can take it or I can.

Once we are done, I guess it is better if you take it.

Thanks for the work,

   Wolfram


--xwbnszeJhFgpzihu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXXprEACgkQFA3kzBSg
Kba7Ng//f2uJIbUxhVqaRPb6cEvRbSMkgp3fOuy7aYo9Chftjp+DCOgB+z/d29DB
4q9Hsd4mNQAHMYKPeieoE/wm6PC7fQQqw/F4mczeiKY+XS1PpFwSXjS3flVBPYOW
UeUYPRZCvWFck7FCOUF9XK2qR/88V1pSDzw5kHf8+CABuFX2RSjyVmiXFbdSV1qf
/I4DfO2M40MkAVGkKIwJcaCBuk6QMjGrJqw+qWYnYmAWsltiWgdy/pOt1Ge03ieM
CinXc9GP6Jg4eDUcpWLETd3ehz9uV40IPugp7fXJxIR38V0Pxbz1G9BUbPjPCj28
Mp3lm3o/60TE68NXU0DEN75PpVz/M/zkv9cx0UJucMDFplec/4BH38TzTsNlAPWV
R5Sh6wD4y6MgfkxqTVEeEaQibH7JTSYK5PwWmR8MNyGk1YN5+avCk2YbUxs618wJ
jauxhbeZNDQ+XWplirsMKB0lrWbV75OxiJ4sGljcpy16MfXaMfP7J7HG+18GOuS1
wD0qBTKzSVrClGu79/LwV90OieqSpAJuEbex5Ls4wNV5/VJUj7t4PH2rOPDZRxc4
nlOpJ5SYSgWwOnGYVgh6wDr6QFCmZGZpQbQlxlezaRkwhQZKmA87/jM+ZkFt8Rwc
3d5oj6TIiOFWfkl3zdbl9/voX7DTTY3ku/KgG5OvEPy9nl120C0=
=o5Lw
-----END PGP SIGNATURE-----

--xwbnszeJhFgpzihu--

