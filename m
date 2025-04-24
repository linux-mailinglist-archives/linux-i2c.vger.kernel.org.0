Return-Path: <linux-i2c+bounces-10610-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8737BA9A5A8
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 10:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD5557A51D4
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 08:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC23207A2A;
	Thu, 24 Apr 2025 08:20:05 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FBB19CCEA;
	Thu, 24 Apr 2025 08:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.139.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745482805; cv=none; b=WZF42kKyAeKWwhu8CQslmAgsAPL1GoCxvIV4NxoLpNzK6adywlMDkClXHEQJ2d9hHpI+pNG3AXWWJbCacjQAv98PtbNw1pASjPTmkAvoKp4FV6WJhqJVsprD6xIScLnPLSHCiVBBYIi1PmGobQDXUAwnZUleL2bZk+zvyesk1RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745482805; c=relaxed/simple;
	bh=RrjENBwGBydfJ3wNE3Qb/aLC0QcnJGiP9/DanmF+4TY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G37Lpd0L0N1aocnWOLm5DRt8dmRnQfkYPP8viOwMWQwvcf62zMbU5BZSCi+INh9FaS9nN5UYDaQKUz3fNr8STxsh8HRjogQeE7QDNHhf2mlkU1p/RugWM0llizvpele6ux54Y8uNUW1csyp+42WYG87vwIB60hHOCRbSk3TOglE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de; spf=pass smtp.mailfrom=the-dreams.de; arc=none smtp.client-ip=135.181.139.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=the-dreams.de
Received: from localhost (p5486c924.dip0.t-ipconnect.de [84.134.201.36])
	by pokefinder.org (Postfix) with UTF8SMTPSA id 8CF42A400EE;
	Thu, 24 Apr 2025 10:10:41 +0200 (CEST)
Date: Thu, 24 Apr 2025 10:10:40 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] i2c: mux: ltc4306: use new GPIO line value setter
 callbacks
Message-ID: <aAnyAASQID8SK107@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Peter Rosin <peda@axentia.se>,
	Andi Shyti <andi.shyti@kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250407-gpiochip-set-rv-i2c-mux-v1-1-7330a0f4df1a@linaro.org>
 <16b14e5e-e5eb-5203-4cdf-44fbde9a5688@axentia.se>
 <CAMRc=MeYs0W31Kj-o530_8+EvhoDNzyZunk4xu6PbwK8N1OE4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wOEuWl4I5xqqjUrR"
Content-Disposition: inline
In-Reply-To: <CAMRc=MeYs0W31Kj-o530_8+EvhoDNzyZunk4xu6PbwK8N1OE4Q@mail.gmail.com>


--wOEuWl4I5xqqjUrR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I just realized their emails didn't pop up in b4 --auto-to-cc. Cc'ed
> now. Wolfram, Andi: do you want to pick it up or should I take it via
> the GPIO tree?

If there is no dependency in your tree, then I prefer to pick it myself.


--wOEuWl4I5xqqjUrR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgJ8f0ACgkQFA3kzBSg
Kbb2ORAApGJ1FGxEhKM7cqNVETbPYWu4LnFSMldEADzZTfDj0OoYrLg+CAuFKdwE
spNDQiLi0INKL5ldauQ/c8NoeS8hadkLt3WR50O9/PTQrOO0Qf9iEJAi5yXwT7P0
hl/lbU2UXE7CIFateJVGygip7S6zA8fX8LQtzn2DR2oMkqA5FnAumCCNae2o2LI8
m4zTu93KjvtdOugKgatkGS0BllpuhxxWJOTTRwKcEa9QJdU6/rmmp/5GCP40RlnE
kyJAIAnk/CM+2b/GEWDQYKYTPfMYvn1hTDZw7v5p7/YqZ6tRsi0alompjEWfbnpc
Q12EbzS5D2U+cTg5KLFdhFESCHeFqRrsjQyVWi6lCvXSvovB7h1F8JG/FsDQK79d
ytIif5tEriAOMKzcJ1/z8X0/BCFT0KjhMAgOFp16rP4+ZI7mCEAq3s2OuhXnCFUR
h0X8n35Q2y2RYTRKwm+CyY4JTck1frJR0vz/oLFO7hE50ruW+z8YZP3XcOE9sYM2
zjx7tFUUeVoM/C0xL2lDQjboZQ+Z6DgITFo/C0d9c5ETnSkwbQF1PrDVNrBdMXd9
cFedWmv3ujOtYtidRDDglywAoJfMtUBXD4h+sqFlkEPVxQnVuFTm2w3pLiaKL1Mp
Cs8kKEWODT0vq5zDvQBVUKXEagBM5a6dvo7bFLl9HX+1m3ue9xs=
=hxPe
-----END PGP SIGNATURE-----

--wOEuWl4I5xqqjUrR--

