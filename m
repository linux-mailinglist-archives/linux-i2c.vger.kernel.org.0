Return-Path: <linux-i2c+bounces-3618-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4858CAC68
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 12:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CF94B2156B
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 10:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3655973539;
	Tue, 21 May 2024 10:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PvlGCWbJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D6473173;
	Tue, 21 May 2024 10:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716288195; cv=none; b=LfAQSp6Md9urA3EUJUnncPHWhH2D09DNxaPQ8SKJSBRn+EUyC2ZQlabFB6aD5pdDPUAGxtFPQ826Q3VioeGRVTVtJv4X6t+zv8bwAbpMcx0awml/XIbVxwC+s7xkpCQxon0x1++LTxpseXGGc7rD3r+mRhiKUdyWhvQcOlx6iws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716288195; c=relaxed/simple;
	bh=8UBOj6p0fXqyvtdIPctQRf1rtkQtpy9K2lzno53x+7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBmBKAaHBf1+FBhN+MN0kWHwE7Yv181wmWMlhRijZRgR0WCExvlPJ5Qy/p8i9SpjYBObMx/eB+7Y0dZ9AQPXD/Wkih+1FL/T0Psw7uflOuwvaozOkfy2bnUx+i1G/1rVfG0ffUEcHJQJl0OFOjQblXbHIeaOFWZMfhKegeVJiOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PvlGCWbJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E043C2BD11;
	Tue, 21 May 2024 10:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716288194;
	bh=8UBOj6p0fXqyvtdIPctQRf1rtkQtpy9K2lzno53x+7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PvlGCWbJ7TJmuM2IKy/KZsHOsPW6YkfZWIb9G4ul1hTomoU7Ku5AfYKDtXaUi51B1
	 OqUS5kmlnyldZ6LI/ECVh49lw8o9tarxJNQi0rXG4iH5GVPvp5VAGiE5elB/suaKuX
	 w2uXTnaOx20Uaix+VouFIZbu7MoJyTryz3jsr0PkbFXAW1DS6BOUkBfqNKFaogtAnd
	 vKHFC6TN34J0AvqFbOcJjQH2GKJWb8+y+n5NRI7u2vR10klJH+Q26JG3aoC4bs//6k
	 BC7BvzVTJgeEftTOD0SOaDufrkRA9q8mEXVwi9e8hc5WOpul1GnOXtihZYGgdyIc+2
	 RltEkELEmRvdg==
Date: Tue, 21 May 2024 11:43:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <ALSI@bang-olufsen.dk>
Cc: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 02/13] regmap: add A2B support
Message-ID: <840887df-88af-4235-aed3-6d1e03197d7f@sirena.org.uk>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
 <20240517-a2b-v1-2-b8647554c67b@bang-olufsen.dk>
 <49cd7b8e-d104-4136-bf7d-7eb45725c596@sirena.org.uk>
 <hpid3fdj3igswrqtwavudhgicsadnacbyxbg65to5yr4hduzst@yjspwxnwsw6c>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="St7M108N36sHj33E"
Content-Disposition: inline
In-Reply-To: <hpid3fdj3igswrqtwavudhgicsadnacbyxbg65to5yr4hduzst@yjspwxnwsw6c>
X-Cookie: Eloquence is logic on fire.


--St7M108N36sHj33E
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 06:27:19AM +0000, Alvin =C5=A0ipraga wrote:
> On Fri, May 17, 2024 at 03:42:31PM GMT, Mark Brown wrote:

> > (looks like you'll need to add
> > the hook for the bus there).

> I am not sure what you mean by this, can you elaborate?

I didn't check but I don't think we have flags at the bus level.

--St7M108N36sHj33E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZMergACgkQJNaLcl1U
h9CSTgf/QQ1StDcAzJXlybD/xqdF15O3+KIogLD1ZLOcgaFE1RXBo6CGx3eBFVwD
Qn6pDxYFyi13O94/sl11FxmYPk/Of7ejjB0z9NB5orfk9vwWBkTGEbKTtwpps//X
kxO35VVAaPyLG8+f/liuoHMB+51kTR/OB/jaKyBEY+LyNxctTCrScagH/GsS6XfO
SwUyF1Lv2iuopRx+mJdO4e0xZkeBEPonp6mXiVeJKCF/n/Y7SxHfMm8wHdcOrD8P
W9HkUQK3wk5GLhvk3KsyJXRrQrbPDitFT60k/nRZGC/E0UjRA2hGwPo259B4OyFV
KBpg0UVPsOhhlb5ZSx4SNHgFvZBDmA==
=vtdb
-----END PGP SIGNATURE-----

--St7M108N36sHj33E--

