Return-Path: <linux-i2c+bounces-2558-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE66887121
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 17:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 940331C21B7E
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 16:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8765D72F;
	Fri, 22 Mar 2024 16:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SusbELVL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC5F5D729
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 16:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711126054; cv=none; b=BIKwVClj/1DccEIIjF56Zhwdtgr4bjfJisCB6MH2BDOd0hl2iOzbOEy6lULoH77BvlYCqbNXQ5SgV0raz8MiQJwXwHk/CLMX5xeGpKuxYoBmhRsIS/0WeTxCdXDBLCcqeCyqco8Bql0L101ezT8KHAfqFpcd13tpwyEO5SWtg4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711126054; c=relaxed/simple;
	bh=qvSq9KJ8v4lS2XRWA030SlZVY6brnDRMxRpdfBEXl68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LukCK5h3M8IviGvSY34iHe+IO8O2DeZvlpZdmuRIgUjKx65NHuHE8XbLAc7sn4rt+qzYgDFW3Tj2cJBsF1AAlcVgGvnhr8+AKnUaxqKEgpGdbD3EceB9ZPwEWzGizRVqE4xrpBns5gsOqgHkIh7JHcnf+JGpXxhGMPadJtOCrrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SusbELVL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=qvSq
	9KJ8v4lS2XRWA030SlZVY6brnDRMxRpdfBEXl68=; b=SusbELVLWoGcXjR0uw/N
	vi0sJrpp2Y39ZnmOG7CNzMgPhLJURyC8Ho1V2uCRlcvnaxkMo5ejfDKJAgJ8LD5+
	ErO+aG0llBV4NOPJR7LTMZIboa5omtT/2jAbOJcqJOQ/wBxQNzfz5+r/+Eu9muqU
	u3o0Cfqet5Kvqs6P5W5slQ6Inml6Pmf4/TNCQC3zDhVHGnArXFWwCjrnwGWQo0Vk
	kR4mF6CHRGyH7rhaQs2WGWMZhevxcrSvBnSpJ6U14YPLXLKwARnJ4YpJUailRc5N
	gw95oEIJLLt23XAQDl4rzIwSuGoN/zc3BQAG+xnAB9zO2ISuT7ciBBNHPzUvdSSR
	FA==
Received: (qmail 3923149 invoked from network); 22 Mar 2024 17:47:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 17:47:24 +0100
X-UD-Smtp-Session: l3s3148p1@gWAOlEIU/rlehhtF
Date: Fri, 22 Mar 2024 17:47:23 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: linux-i2c@vger.kernel.org, Elie Morisse <syniurge@gmail.com>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jean-Marie Verdun <verdun@hpe.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Ajay Gupta <ajayg@nvidia.com>,
	Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>,
	Robert Richter <rric@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Conghui Chen <conghui.chen@intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
	Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
Message-ID: <Zf22G4jC2gIlzhi_@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-i2c@vger.kernel.org, Elie Morisse <syniurge@gmail.com>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jean-Marie Verdun <verdun@hpe.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Ajay Gupta <ajayg@nvidia.com>,
	Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>,
	Robert Richter <rric@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Conghui Chen <conghui.chen@intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
	Ryan Wanner <Ryan.Wanner@microchip.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
 <e8dff9d4-ed15-44e9-ae9a-2e77845ec40b@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9lYJOkUv0cPFV6j6"
Content-Disposition: inline
In-Reply-To: <e8dff9d4-ed15-44e9-ae9a-2e77845ec40b@microchip.com>


--9lYJOkUv0cPFV6j6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com> # for at91
> Probably file names themselves will need some care, in a second time.

Totally true. I am aware of that. But one step after the other...


--9lYJOkUv0cPFV6j6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmX9thcACgkQFA3kzBSg
KbYGfw/+LQ3hxBO2X+O6EGQNj9zWf2B5N5sjnoAM9/9Me+X81oLmIkTF01pWe8R3
bIHrKR3dMTkxZIPm+WlZDGrUAEK1UKTgtzjM7MWEsb+rQ2RpH3/Wk+gKVsGI0Qt3
9oT+NKxyhdMXSggbOzoquWHAzB/LzL0sYoDtGre6k/rDEduSPqkDlaZ+BGmDO6uq
I2efrkUJgN0Qf5YyqKeu54G5K0e8xk+/Igp4Z9GlSJ4BOMOFSVmDO8DFw8SU92Nt
E8o1H2djbmOzxgdzIVVNQm9meh3ywyJ5ioL1gR0PyaG52jNMyQTxo9s8KI4Kok2g
NTj9dthAfLnCNRnrG/DHKAVnA7bX1SQ/CtddEvpZjY8DUfElpO10ejozu0aXXKzu
KXLxApqMcuzEVYG8LP/NqXNqPu8QhYdWWgwhiyEok9nsJWBIcv+Jsu/LFMoReo+j
PaiXkF3ANW6doXSn9v1B8jOdoGQnPsaPjpXbI69ZNNX2/Q3AoFrunfzrWh58hU2E
VEHLY/ZrvSe/8PiFCPPauo1jjT9a3sgW2moYeh9DjpkjwWFPamUol3fhtH811QGe
qw/gHCLtNeD4zyV5YtMs1YSn5kClt4DzjPXISGI7uvZIvsYuZlN8QnbKk9No5YjY
eLqZFiQT/VIBRHqACzaH7xbkdHW6UNcT5irBPAyy7YWElz0nkTA=
=ScZ5
-----END PGP SIGNATURE-----

--9lYJOkUv0cPFV6j6--

