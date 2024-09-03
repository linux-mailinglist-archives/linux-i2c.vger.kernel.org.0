Return-Path: <linux-i2c+bounces-6018-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7309A9699AF
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 12:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A51801C22F7E
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 10:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846AC17A93C;
	Tue,  3 Sep 2024 10:03:00 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A562AEFD
	for <linux-i2c@vger.kernel.org>; Tue,  3 Sep 2024 10:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.139.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725357780; cv=none; b=A4ccwvlhmP3bwKKUryPQCqzlQ0p+NLmgLCeiwLuySARUChwFSNqrekwC+7BuFxnk3aJf6bEucHcqchenIhoeoSLBzIn86NgoqAFcHVFPrPTt5HAy0MaBhqV2V+YW7hcXVH7bVGeKwlZHpmmcwk3BvTjsG16TwAvYYjOkhbZZKqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725357780; c=relaxed/simple;
	bh=18by/gEF2xltAEkizKcy2m1B0c268K/B41hBU0mMJDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEKi+zhGN1dmWRCJko1Z8qmq6vwyRbs77IHDe5NPHR6IuoJnvmAiSiueaAZBr8K8KyRJNAxqqgN3MES5ATWiGieKUBZpM+8ff9q0oB3TcY/QqyN2O9SIHukEN62W1TAp3k5U5OFFLBSumLF6/edCvb4E1t/SR6i0Le6StaZhuxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de; spf=pass smtp.mailfrom=the-dreams.de; arc=none smtp.client-ip=135.181.139.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=the-dreams.de
Received: from localhost (p54b330d8.dip0.t-ipconnect.de [84.179.48.216])
	by pokefinder.org (Postfix) with ESMTPSA id 62984A441F2;
	Tue,  3 Sep 2024 11:57:01 +0200 (CEST)
Date: Tue, 3 Sep 2024 11:57:00 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [GIT PULL] at24 updates for v6.12-rc1
Message-ID: <ZtbdbGvLorrzrFiV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240902124311.31147-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V215Gr2mtPE68MzH"
Content-Disposition: inline
In-Reply-To: <20240902124311.31147-1-brgl@bgdev.pl>


--V215Gr2mtPE68MzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Please pull the following commit adding a new device-tree compatible for
> at24 for the next release cycle.

Thanks, pulled!


--V215Gr2mtPE68MzH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbW3WkACgkQFA3kzBSg
KbYJQQ/9HXpwP7qUa9RAoKg6TufVekJ1Er+ltlhq9D8wa6E2DMg42VSny/Smahwp
UDDD18B7mlKQtPIheowZdijfbQe3QXLtsh8eWHVlCJpPp5RWmKqZ8h1mpKmyTRF0
ERuRBX1pBt9ik0lk/aRo1QAw8MmvBB8QLv35CRxY4iLWvE4eORnAh8kMHu9JK9hO
Rsby8xZtaILzbGv7MiL9DtHOTZZZxJ13iU+cq+KBKs6Fmcv1eIysi2NSx51e5p3M
k/09pefTgrvVCBrXM5bKcOmZhhmKFQrwgrPRHk1gXfT63pLBj4tlr8oJ96H7PDwP
aFAZbC1UTm4OU22Bu8iAaANxMSm1NGgYr1gi4iNVgXYO/vgeiALgm246/JOONhbM
+t/Ctg1glZsZB3H6iCrfLrEQtgG68RDxONJwYk23LrTWDeRKlDi1yaN/rV7pObxk
F63tw4uNNck5akuOx/qkW1NAYtCC66P3cVDz6ngMUPTQj+F4RBLindwuY9y/Op9e
oGNXcnS3aZpAoHO2SvRSA+31ZlMKzbtvEH+WTxigG+HV6tUrWx/ydQ2ThLMUNtPT
978PYSf2P8ZOtLzDmQB5jIHUp/fwGk4fH6JnLjkDRasTJvfnXyXdwFfzAlX6NtZz
Qwi+mTCpI6omsaWJIT/991khzz09BVHxHkYDcBzKfiB/chYste8=
=+reM
-----END PGP SIGNATURE-----

--V215Gr2mtPE68MzH--

