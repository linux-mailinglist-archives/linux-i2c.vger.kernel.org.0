Return-Path: <linux-i2c+bounces-2347-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE35E87A2EF
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Mar 2024 07:21:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C55341C216DF
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Mar 2024 06:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA38713AD8;
	Wed, 13 Mar 2024 06:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NtNihdWS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766741642A;
	Wed, 13 Mar 2024 06:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710310880; cv=none; b=CKWZZgRe7wCroT0fPyGgrwcmk99qGZ+MZu8zXwMMd+VCTYCGJRV3JbJ6e8cdB5JZOqDCGZnCTGW+sNgUF7EtlOvTID/0cdhInBt9pbJJ6elpd407WJlWMNO1lh3x5dW/BZm7yjLFhWdsikOf8EG/QrejwsvgDp79H1bWiOr95xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710310880; c=relaxed/simple;
	bh=Kf6Rjwq8Q1L9x0D8vIvoKvL60yatJLvjveDYXD/c7gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xnh59m8tOppVe/4K/2tgFA8Ug9EDB6YAv0wwOFsqrZe7crd376uCw8EW1k1dOatFOnWExmv65o9Rln6SPPG7i6tj3MIvv0VSeKc1aNinIR9dgEeAaHjHPV1kzn8Ybv67raPCyRhP4FJpvJ/gZtJKkDnpYuzA/jmePEEuSzXApBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NtNihdWS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D745C433C7;
	Wed, 13 Mar 2024 06:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710310880;
	bh=Kf6Rjwq8Q1L9x0D8vIvoKvL60yatJLvjveDYXD/c7gA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NtNihdWSavdZK7WJ7rW+uC0ywk1ZLKAmigCAUwxsZUA4LOLM8E2g9JQHQ7y+PfFbI
	 U0j5+YurMymB4TupTy0krDJSIOzqf7MwVMT9jJ2ra12uNhkeL6/N8w2RNBB9M85q57
	 ACmkvUktWcH+tJoT/qE1BSYU1gbjxP9cpIUop7/6hX+/JRi5HmH6nEI5KJuWgnEo9t
	 YQ0sbFc6L4+F9uWBR0jjI5nNJBCGj4t87pVTLEtwOqfN+9s/rYLUVkYAe/Av4Ybxx3
	 T0SySpLc85/Kd1g+opSMUY6oPyCZl9fT7H0LJykOUzxxKF54al5+FxVFTl5ltlCSiI
	 o9KtJxRkR1xIA==
Date: Wed, 13 Mar 2024 07:21:16 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>,
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
Message-ID: <ZfFF3LpzesdwZH2t@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>,
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
 <ZfAMT8CDW1VKW0qR@shikoro>
 <63oaudxrjdqredpbh4rojcpgjh5tot2tx2gs2kpfplwgjmrluw@f3x2x5us5hw5>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5scK1x9kjxT2H4q5"
Content-Disposition: inline
In-Reply-To: <63oaudxrjdqredpbh4rojcpgjh5tot2tx2gs2kpfplwgjmrluw@f3x2x5us5hw5>


--5scK1x9kjxT2H4q5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> Agree... but who is going to take this? Eventually I can just
> this one.

Usually, it should be stated in the coverletter what the suggested path
for upstreaming is. If it is not, then I apply my gut feeling what
should be better. With this series (and seeing that there are no other
omap patches pending), I assume some other tree so I ack in advance. If
I am wrong and should apply it independently, people will tell me at
this stage. That's how I handle it.

Happy hacking,

   Wolfram


--5scK1x9kjxT2H4q5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXxRdcACgkQFA3kzBSg
Kba8phAAhAo3TFrjiov9KU/9ImhFn6FAJISY+9pjqIRBEVJVf+LM/ky3QcorHKZI
dMtQR+V1gj8en3ZBi2oZSQB3VW8Ije4evX/CtxviumW34i1cH0NyN3dn0WLrTwb3
Le+u1d8LSRIO+hIHLpRQ3WuRfk5TEI052bHmSJINKqh1TjHImKIn+niRruR+cb77
7KNJwqPjFu1NnLgNV4nP56Jwh8wRO1oUEZrHq3st3yX3c6sq7oNovYoqenFtiNjt
SkpsuJupYCYob+sH5b2F+ZhtSMSM0C7JvLk7oQSxuEJ5UeIxuDD1u/zhMMW1AjQ7
c+f/y1SEeSQkwHt5ywEEYFxuHgQNV/YedJwFDT4j/U5kWL5dT2ZEslZIao+y0gEt
f5ktqsPVeYCWDVZL56I0kNNDpJiR78uZxuBk5YB7VXLlihnmNVcD7cNYhRecU7d+
gv1A21XSiCZLXK96YS9PqBKODRY5I+yqv2geNBOEW4KJvacFR8aQ9big1Oizppgm
RYyHdnbkrfAUHU1NrVmYsn1kgboUxgi0E+mD0bImSXEUW/G1bHofOo+g2ccKSdXR
jFlvQzck0qQQuxJCHlOTlTGZuqKVIkZ0x8ItqMQkSSP9GXtICdDWrl63V6+Yki5a
josi4NEL739wHNHZDYyjd8wyR+CkkDsaQBH4eLrBYjOdyCvNybU=
=jpCM
-----END PGP SIGNATURE-----

--5scK1x9kjxT2H4q5--

