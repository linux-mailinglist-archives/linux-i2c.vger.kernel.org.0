Return-Path: <linux-i2c+bounces-4057-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5DD90AD53
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 13:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 033371F22297
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 11:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DD7194C6C;
	Mon, 17 Jun 2024 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HpA8sHn4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846B4186E56;
	Mon, 17 Jun 2024 11:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718625004; cv=none; b=Ig7/of5LBSQErcoSBAbSfFxKZYH1Ly1EmLI5JkgodDZx28VezLKmOhfnE49ak5H9Xt8ZqYtWfpGUX4/GpzOKBGbUJTkjCP559JNOrFycFyMJGYDQ7i3zy3tKib+tHdH80NDLLGUP1G1Ijqejfjzvc3+aOlX/kntmbIqg15h1HL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718625004; c=relaxed/simple;
	bh=OqoQ6ZxH5cHIMs3+jLFrcIOTsDPqWQXiXFgsGcvQtmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+vmeHhTWobZGRqrmhNT6BADkBav8/Ug/KLosFKyINYMveYCmZ++9H5R5Qbw9ZyYD5CPf6Me3GLv0+NeXuMeHApPm4ZEI6V/Fs/34aXVpzY3rmePJVQkqHjWkwcU+gEQsnjw3Po/LCeTeeCuSX8blPvwxSbPhlHgkxBmuWtSDsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HpA8sHn4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710F0C2BD10;
	Mon, 17 Jun 2024 11:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718625004;
	bh=OqoQ6ZxH5cHIMs3+jLFrcIOTsDPqWQXiXFgsGcvQtmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HpA8sHn4I/uwMAoESG+goOFTmifzrpBQCu9dGkOqZXt8LYQqIz5QC28pY7Sf0V0im
	 Rg3jeH3eikunEuigeTgUzbTZ+0Imva19O0s2muNxA4UevqUFDN3pgh2gkZqiPaumdk
	 vcSLpVPa9akY/UIDqIsvq5tskgFgDB2P4D3sgld14Q56O303qkj5x6nQhfEvRRQi4M
	 Gk0JUzOUemjLwycr4PfdBBZYJkpP7j747BOm1btJ2rnG35Qrq2fQkzKmtodhX7c5Fi
	 Hx77E015tcScm9SmYjLY9TNQ7XuuFlhEtg/818x62PvlE5UBoaSBkrYLy4pAeurPpG
	 nK8oyrEht/AUQ==
Date: Mon, 17 Jun 2024 12:49:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2] dt-bindings: drop stale Anson Huang from maintainers
Message-ID: <440bb6fa-2e26-4a64-8c53-bebf706a1079@sirena.org.uk>
References: <20240617065828.9531-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jfSjzlj0zX5Rl/R2"
Content-Disposition: inline
In-Reply-To: <20240617065828.9531-1-krzysztof.kozlowski@linaro.org>
X-Cookie: Life is the urge to ecstasy.


--jfSjzlj0zX5Rl/R2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 08:58:28AM +0200, Krzysztof Kozlowski wrote:
> Emails to Anson Huang bounce:
>=20
>   Diagnostic-Code: smtp; 550 5.4.1 Recipient address rejected: Access den=
ied.
>=20
> Add IMX platform maintainers for bindings which would become orphaned.

Acked-by: Mark Brown <broonie@kernel.org>

--jfSjzlj0zX5Rl/R2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZwItoACgkQJNaLcl1U
h9D5Wwf/Q7ZtAKp5HRIsqeh8PBxnOEEF8ljY8bCew6Q7rvMXTsxiI2WXFX0ykufr
bDY0Ho5rMIUGwQf/F1v+q6ZS6TEUbnawVgxkKBRJTDeK8Uxs9bXPSfCu8oZY888f
YzPOYmhnDVtIWvoHZFUO6klplmBwPYQn3WqXYi4M2eap2IHsTxAUrrcyiL4uLVAG
yqNRTuUyg4+YAkj/te942l7M/obYkf3Nxb/1HM3vZypXDeUhg+ubgr3TKF8LRpg3
LBmfcA+m586XLOoQUPbLcilqogjAJuokkNwNMia0ny9IINWjZ6izZ/1Oe/fCnHSn
vX0livBtYHzSS6lauBj/V6L4gSTz+w==
=b38n
-----END PGP SIGNATURE-----

--jfSjzlj0zX5Rl/R2--

