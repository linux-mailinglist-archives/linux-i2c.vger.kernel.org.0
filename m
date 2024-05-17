Return-Path: <linux-i2c+bounces-3571-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3E98C886C
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 16:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2295CB2677A
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 14:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8559C657CE;
	Fri, 17 May 2024 14:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="T6OLDccb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A5D1F93E
	for <linux-i2c@vger.kernel.org>; Fri, 17 May 2024 14:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715957371; cv=none; b=hliiNxO7XGfw8Vv76xLo3s/eBlIEUJkQR6WGd2k/Mvpvyn7evtqv/wg14JT+uj6yC7swgdTm78/g0qDN5oA7wJkUV1xHR31CiE2wwsShF5w52BJxi8u+E52dYKoaRLtU8TvqgOh7tV3woE11J5sYYSPIbyqGhs+GHCJBV2IT5V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715957371; c=relaxed/simple;
	bh=Oxw+nuKA9rnYPKRIGfenJc3ay8ovsXLycrgw3KYUz34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlpcTDrhgomlziIkEbwk4oZZHjYvVyRb4eC1IwgleEJ5CszPMSNLR0cF29zmEMeBIafOqqWJHAP9MJliwMSXN/jDBm6tuzmfTELeHuHEi9aER+USmZNW5OKRLVzRBrQ1VyYSeLTfhNr6w0vDfgzGQTIdAiPOf9BnVB42lbh1BEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=T6OLDccb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ZLjM
	Tcq7/ZFNTdNivNN26gmdDNwnrL40lhfEgqQilyA=; b=T6OLDccbTOBPHNx85Yb3
	7LHMIiuVJHeHnrh438m6msQG/HAx8iQFzcLrd6zD7Dzk5c1Sr0+y+DVpBqTqjmHL
	FieA/7DcfMK77UgOq+bP+5HOj/CU0zuOEYYA4fPHGZuFBtOBwwCJpFYFT7ljhi00
	SwFWhtStET0DVJoPDhZM8S3RdwyYhrJordDhjjznT1+85Y4/4uUWTpVRMphrCZX1
	dkF9RyBmt/iBlNWeZtF+ecjSN9umVrMplQBo75rhBI6Q9eTcdT4QewNodO0NbVS0
	Dx5rFr1bjjKUKUQkyQIDJE2tAFfERuKgQHqFxdntzgqYzBkPiKS3DxHFadJWflyI
	PA==
Received: (qmail 3527947 invoked from network); 17 May 2024 16:49:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 May 2024 16:49:20 +0200
X-UD-Smtp-Session: l3s3148p1@At/tdKcYlqVehhtP
Date: Fri, 17 May 2024 16:49:20 +0200
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
Subject: Re: [PATCH 04/13] a2b: add AD24xx I2C interface driver
Message-ID: <iyxpcmz5okfzvplla4glmuqsoky4cd6fv7orhsgqjepvdrivnp@63z64jwlsks4>
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
 <20240517-a2b-v1-4-b8647554c67b@bang-olufsen.dk>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dorvg4mucua5ph6e"
Content-Disposition: inline
In-Reply-To: <20240517-a2b-v1-4-b8647554c67b@bang-olufsen.dk>


--dorvg4mucua5ph6e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	/*
> +	 * Enforce some basic assumptions this function makes about the
> +	 * transfer. If this proves insufficient, some more complex logic will
> +	 * be needed.
> +	 */
> +	if (num > 2 || (num == 2 && msgs[0].addr != msgs[1].addr))
> +		return -EOPNOTSUPP;

As you populated 'ad24xx_i2c_adapter_quirks' in the I2C driver, you can
drop this. The I2C core will do the checks for you.


--dorvg4mucua5ph6e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZHbnAACgkQFA3kzBSg
KbZ4cw//UnCNrCAjv+QHEiqmbznWqnH2N8ZbotvveAWo1o9CG2q5H7qtEMABxRJM
Ga0FDhpW815gVCjjjeMQ4d3e7g3rE3kutQOSqPXquB6BbOzYMU2NI3MRnNyuZ4GU
vi8VQ0LO4fpUtK4VimfSXF60MeI2M6dSf7KYx9vd5GG30nlfv3Uru82dzxi4b0WV
bk6tIaViAK4sNvKAnK+WDZnEhptZ3Fpzi0TNjAuqvPWoL61SAAZCvwzrFcbnlenY
Nia81UoDvKT8vi3I9ckhi0QUV6gU8xec4DmkUZDRhi8W4pmBtfto2Lo+nQcLkpVH
UcDB2ZDKfjlRvoIDuPLOhdL2vkl5l5weVVU0X9/cQ9Ej8Iv+KiNhNep5GfMisCw0
I0MUtQEtvxr7O3Pa4J+AEVfDPojmY1pSPMidxrVwmrClN11LQQmroplAbyFBLDER
lziCL5EkExgbguvmWsZpDPzTJUCmanXrvTJiFnAOptbzkShNNvpCnvj/HALU4T1d
biP5v5CMroDnOQZNK5RwrPVj0fKp1gYnkW/CAd15Hl/YzIcfjvpR+qeBozJsxSAP
s+2EgsMRGyDpAkm0Y7S5eSAzYdfFq4qAzYarLMCq2PNWFFkmBVltklW5VF1kneXG
o4b1vZNEfzEu1+RlbOF9UcKRpti0s4s8Qp4lc1bpgfozWNh86S0=
=x2If
-----END PGP SIGNATURE-----

--dorvg4mucua5ph6e--

