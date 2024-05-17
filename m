Return-Path: <linux-i2c+bounces-3572-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 400918C88E8
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 17:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71B601C218F3
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 15:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4526FE21;
	Fri, 17 May 2024 14:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iI1+Agzr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63956EB75
	for <linux-i2c@vger.kernel.org>; Fri, 17 May 2024 14:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715957882; cv=none; b=b25gG/yuIklHDJR5Ex79W7y/GIxfPWjDfb3I8mjCLbuZNQ9h7b33gnrETjCmS+Mf9HgHAGcfAjlz6k2rY8mY50ksXU3/HNSuJit9Hip9y8By8cdOLjwn/GEJWzztw8lVJBRtpfhl4dWSugyNZIx6ATx4N4+Ap4hsnAAKL7+oudY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715957882; c=relaxed/simple;
	bh=J9El9DMi7Aqogcqwn4M72J4HZnCmiEhSU8KAHVlqz1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNe+wspZeW9/K8b1r0V4may2yMtknOLhTNeu+EY1DSY3uuhocGIehn60n8g+bNFEqSwkP9x/Pu+FypaOywd5mxCM1N+DqxGZTHdnULmijYdwBtBF1eYV05coT3/FO0zpOydaxFaSNaJSFTXjQXYqt6OTwClRk9foe9+FMyMIXfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iI1+Agzr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=vl1S
	7NNfcQ1ji6oiWuXr42CZ86hhRSPk2gAQwY+aK9g=; b=iI1+AgzrWh7TGlxnr1LR
	18S+FljBpQQw+aF3Jw4mPoEz4FkEmIZPCxFt1l5pXLZYhYODMHE8ZNHI0YoZeaC+
	QfIg8BJR0YoiyFQmCFR1L8pXDuKXv7UeEOY+Gp7GWOZ9VjKSxRFSw1xkVBlER8to
	PFRI3gw5AToslyyu7UeSGnTykuU7MfbALmY4Sd8VrHLGz2NSBj5xy58bzjPz1H+G
	xAx7J5T5K9mgYjgA4DI3yj5teqhOzM2V9n+VIa/LT7Y7wUljPrfFcjo1A0bhe1PB
	SAGJMNaZtmbl4BbHGxOhPQRHBpDENtOWQGoT+MWIj/OCOExEwIQOP6BGw6vVKy9p
	Kw==
Received: (qmail 3529926 invoked from network); 17 May 2024 16:57:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 May 2024 16:57:57 +0200
X-UD-Smtp-Session: l3s3148p1@4KG6k6cY0ohehhtP
Date: Fri, 17 May 2024 16:57:57 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>
Cc: Mark Brown <broonie@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Emil Svendsen <emas@bang-olufsen.dk>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH 00/13] Analog Devices Inc. Automotive Audio Bus (A2B)
 support
Message-ID: <ucrnnveh2n3nhonbhvpxy7sl3ffaj3cdcx7pnb2h4dj5cwsznh@gfssqshjortk>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>, Mark Brown <broonie@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Emil Svendsen <emas@bang-olufsen.dk>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="exc5fy2rgxjrvidu"
Content-Disposition: inline
In-Reply-To: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>


--exc5fy2rgxjrvidu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>   On subordinate nodes the I2C interface functions in controller
>   (master) mode, providing an additional I2C adapter to the host for
>   each subordinate node connected to the A2B bus.

I am not sure I got this right? That would mean for an I2C adapter on a
subordinate node, that there might be targets connected to only that
subordinate node? How do its messages go to the host machine? Is I2C
encapsulated over I2C? I probably missed something.


--exc5fy2rgxjrvidu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZHcHUACgkQFA3kzBSg
KbYkSg//VsE4vNwHgpYpmukjdTai3yWCL7jcPpvdxCdL77d/laRwaHRS/Uda2G2K
MzkvfPugEynMx6QI1PNbeSu+yDgPQqpvweLp6Ija6u6FQ/gSKEozbM6sHFONJGZS
9PFwvBgRYqTidARUDPdI2vWaZHtZVQ8ERnnFKu/aQI9JTiHIoKoHrj26yR7XYK+r
9doFP50GQyUCcEOESZxwfdF/vhECFNnxkaEjoN6XXZlFy3xFZU3CHlk/2dpwb5sE
IxFFcJ7lPRRCijpM7WGmGcOhHgn0Fq7fZdCdmYIPAq07JVvuAFZlsqm9GMIxYbdH
CzZ+aOhlTroOitpWT0Dmar/Quci7jtL/DQqN5kL9mCn4ShF7JZT90qkV8kZ/EdmK
X2o3yQdSXIlDExRMAQYZ/KaNtxOdFpNjFxqzTxG066wiiHQlpEAKG8XVQh7KMNBV
C+GOBwGcl0aefgLuxgjZcnpnSrBJ+/2d+KnUpIDR2yLcpgTyzM0+jhkoDtujbS/A
ljHcw4FrHiG3GpnjtX4iXhcippoUXHWK5yAQkLKJbNFvTGf5RCoAp5ZQQLSrLUqR
SAFWE5rcZfxjOiGeuYwzCvnXk68p3s9wbqwZZoZhweSS7pmPhRiyYWq5sMfNyHSM
IrXGvesfjslIhXd8otw+ItGouLRoA1s0xBFD35mSeR7zwJKkGLs=
=HB+b
-----END PGP SIGNATURE-----

--exc5fy2rgxjrvidu--

