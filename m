Return-Path: <linux-i2c+bounces-2333-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0341F878F60
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Mar 2024 09:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B11C8281BC4
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Mar 2024 08:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D31E6997D;
	Tue, 12 Mar 2024 08:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXWn4pMe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C20269D04;
	Tue, 12 Mar 2024 08:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710230612; cv=none; b=LgK0CVK2cDNstXQZSxL2m/wti8IdIo8xxWt57//rNLlbG36g3TXKX3NKyWNgRwzyzidAJs7T74XeMo0gStDk1BlnakgLU6E99C2KJ/wnUjkjwcrA3qqzAWK2gS15TrZYpFy2KGUHBxqhhvaDp0RfH7xKf91y/nUdeFwKmp3bv1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710230612; c=relaxed/simple;
	bh=7CSXkSa3VNcY7x9b6by6FO8IPWIdgHGiqUx6k0fKoo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UA6tbP/e1nk17ts2exKxJ6vXFSbnTjPLgku9Yqg8/7uenstArnz6Nt40UnsymqKXFLsBf4rB657WukOBmYfqYEqBqbGqEXrZmnesqNEyBSh6NUzhtB1dSaxvOmMaSiMPJAaMFM1P6UPYaEXVztc6sZAZVOcZgcWx5d146aysPq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXWn4pMe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D4DC433C7;
	Tue, 12 Mar 2024 08:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710230610;
	bh=7CSXkSa3VNcY7x9b6by6FO8IPWIdgHGiqUx6k0fKoo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GXWn4pMeQg4hJsAkIuEH/dvhu5T8dLwWVRrGftqgwMwBYiZl0C3puzKCtdzWFrN7p
	 gwR5tOBCsKepUM0L1+VQCxoLpLtMb6B+KZQl7ArGelO/pmj6hr4nfuvkGprlzZ3qmM
	 UeEfu90878dwAoUylCYtFeiih9QICuFvQ6UIISX3SRELBGMBKdCfjOTSXgP9M0jnpk
	 HmK5M6fp5QQhIVTKBncymtqYSzLtQlJEzp42lA1X9IulXYVq3/ffSL7iuQ3mSJ84hm
	 Ez7uopf+12pzCQL/d/3d60MrnRv9ZLk4k1/IvmKVVnBhuL1vt5xtdjT2l4AB7Bw4zU
	 udv4ffal4JQhg==
Date: Tue, 12 Mar 2024 09:03:27 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Tony Lindgren <tony@atomide.com>
Cc: Thomas Richard <thomas.richard@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
	theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com,
	u-kumar1@ti.com
Subject: Re: [PATCH v4 03/18] i2c: omap: wakeup the controller during
 suspend() callback
Message-ID: <ZfAMT8CDW1VKW0qR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
	theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com,
	u-kumar1@ti.com
References: <20240102-j7200-pcie-s2r-v4-0-6f1f53390c85@bootlin.com>
 <20240102-j7200-pcie-s2r-v4-3-6f1f53390c85@bootlin.com>
 <20240308084240.GK52537@atomide.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qxnn2a5IXmQEXJ6+"
Content-Disposition: inline
In-Reply-To: <20240308084240.GK52537@atomide.com>


--Qxnn2a5IXmQEXJ6+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 08, 2024 at 10:42:40AM +0200, Tony Lindgren wrote:
> * Thomas Richard <thomas.richard@bootlin.com> [240304 15:36]:
> > A device may need the controller up during suspend_noirq() or
> > resume_noirq().
> > But if the controller is autosuspended, there is no way to wakeup it du=
ring
> > suspend_noirq() or resume_noirq() because runtime pm is disabled at this
> > time.
> >=20
> > The suspend() callback wakes up the controller, so it is available until
> > its suspend_noirq() callback (pm_runtime_force_suspend()).
> > During the resume, it's restored by resume_noirq() callback
> > (pm_runtime_force_resume()). Then resume() callback enables autosuspend.
>=20
> Reviewed-by: Tony Lindgren <tony@atomide.com>

I fully trust Tony and I assume that this series should go in via some
other tree than I2C. So:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Andi, do you agree?


--Qxnn2a5IXmQEXJ6+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXwDE8ACgkQFA3kzBSg
KbZneQ/+KWOJptPe830nsn7JfSUf3AOnK9q6xIxIiubJncJXVEeQU9CREDaUg9qm
bI/l+empAXTCyZjGwuEjah2mFlBcT1y1+hNXAPG0px0omBk/p774NjskL0zONP4u
rWQ6gc3Wl5cEyNBoZzUml+jdXYg8Ie2HL2Ymhxcpl4Y8bHiQT8WXyHdBDlD10hzK
Q7oKeMO4aaoBHrnb8GTIPJkm6XaYNJHV7fVwf/b8pzzajEYoRJasGIdhs0U4b2aM
gfC3C3/eTf035xZmqXvesTt0j3Kqbn5HxkcCG531iGpXUc6FthYKHHd77a46DwCe
pCzGtTo8o7ezUnYOdySYJic5ZJEChC795pdl4rsrHMRM5B/NseT9ieAIvisVS4Ll
mYQyCzW7jrhqT9A56/o+0rudG8LXs+b+MedNFDFcvCDv3LwWSt9imYDhvClKWMIJ
4I+rDBS0ONXz/PqMD77QIOtuILV85GvDrbrmFUSiIzP/LtbIpUaFoRBQFw6QSpKI
S3doeQqZayubO7DkMYhU4wrhSs5n6fKRHP4fr11VSclA8czlRuLKvm8vJrzmM5kh
WU8UXU/JXpUHdQz3GSbIcHEs5e3AJa0JdCN+4x+qgSI4FYH5rr+SFnqnX6qXXipW
+cNJyxzVT59Y4MQYLNhwXxa5FGwlKdOJuory0HQRv+qRip/+f8Y=
=P3pn
-----END PGP SIGNATURE-----

--Qxnn2a5IXmQEXJ6+--

