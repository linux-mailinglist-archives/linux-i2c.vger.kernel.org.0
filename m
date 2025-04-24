Return-Path: <linux-i2c+bounces-10611-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E54A9A5D1
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 10:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E7EC463699
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 08:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E0720B811;
	Thu, 24 Apr 2025 08:27:49 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF611F2BB5;
	Thu, 24 Apr 2025 08:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.139.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483269; cv=none; b=KxXOoyJ6lXEwUyuVjveO1u7tQNbejNmcSedAoAvWysnyv4jZOIbJDYrc9Pp0PMntjgE7M7KN/FxRWE1P6DFS/HY9ZJn2J0Drex3oWy7wz7/gCW5wzyDPqpAIK0MoVHzMyfeEdLPEm3JtSF9vpPzvEqt+kQjJfOfZqdWctp5fRBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483269; c=relaxed/simple;
	bh=Bjn3JWZQBUn+D4yw5VVxGddLhIebdHNjWM7dgu1Hj/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RqFfl0JgjsUpM8lcwwo6f2sZdrO0ucyto2RkQIREaZq1WozNXy1FqCQUrgvhm09weM6KDY6y7a53JuZCLQyb++DWUDryyg+W759wlUyHFGpLZumalro9nEXULrorMQIfxgphwH+k8KCi05qZMGMU1uORGggaepKMuxKy8PkULbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de; spf=pass smtp.mailfrom=the-dreams.de; arc=none smtp.client-ip=135.181.139.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=the-dreams.de
Received: from localhost (p5486c924.dip0.t-ipconnect.de [84.134.201.36])
	by pokefinder.org (Postfix) with UTF8SMTPSA id 81809A41FA1;
	Thu, 24 Apr 2025 10:27:44 +0200 (CEST)
Date: Thu, 24 Apr 2025 10:27:43 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] i2c: mux: ltc4306: use new GPIO line value setter
 callbacks
Message-ID: <aAn1_-Wuel-CaUIn@shikoro>
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
	protocol="application/pgp-signature"; boundary="V/cTdx4ZqfhhtzD1"
Content-Disposition: inline
In-Reply-To: <CAMRc=MeYs0W31Kj-o530_8+EvhoDNzyZunk4xu6PbwK8N1OE4Q@mail.gmail.com>


--V/cTdx4ZqfhhtzD1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 09:16:48AM +0200, Bartosz Golaszewski wrote:
> On Mon, Apr 7, 2025 at 10:08=E2=80=AFAM Peter Rosin <peda@axentia.se> wro=
te:
> >
> > Hi!
> >
> > 2025-04-07 at 09:17, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > struct gpio_chip now has callbacks for setting line values that return
> > > an integer, allowing to indicate failures. Convert the driver to using
> > > them.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Applied to for-next, thanks!


--V/cTdx4ZqfhhtzD1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgJ9f8ACgkQFA3kzBSg
KbZs+w/7BpHPAQ+RaFXl40JiYlKbBHeigtBqppoPaS83FpQl8J3FG2wZCKkHwEqO
t+MvnlH5Lbn1Y2mXmMJN/7tFbkGbEXExmYf9i7QDocHPg3irRo7TTJyvITFYcfhT
btLfINAwWAd41nGPPLkqHGp3O8m9rehwTgegIExNZ8auXwbtbHsG4bgUDpY/JnSq
ZUWQEfw7DGkwRpJif28COS3KIKcA3IXjIGoe/lvFP5HAAmsTsjyfyzGcB9vhAWTl
6RJdmcX/7CTfvetWp98cpf1L3kW8SGHaEGqQR84cu+qrSsbc4CC1BgUNaFEWNiBh
Z4oCcwM7hWfdhQR9vjiCUTQ0/PWZ0mvaiW38lTclqluOTckEFDYz/SEj3ml6CVwJ
0AcnDppOdAqHfz0pW6mI61FbY6dT7oQR0/SZMDuXws4/Kj7Krv6zY0R87seVBNR7
Mwb/76xUu9HRNYxsX9rPJJjMClKo+0I1eW4kwb4clqcxIQzTl91Xph6/6ivV12yY
swsMZgCIZ33PPjVdP3075L800Ligqqyc8tEFiYciylpmJo0rXPCgqITlRz++9u2B
OuV0NeE+HKK48IDwl31eJIVXgN+XCDZiO5MjmW0cWyj+HYjl9nMesokb+wTpnXaF
VaE0LFKLoUPWA0oj2ZcVBYyDVBI/pbCcbKPKJ6xICO7/xEgONis=
=iSX0
-----END PGP SIGNATURE-----

--V/cTdx4ZqfhhtzD1--

