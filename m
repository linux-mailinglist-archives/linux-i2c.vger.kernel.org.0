Return-Path: <linux-i2c+bounces-2562-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A31A8871AD
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 18:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A88D51C216D2
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 17:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D695FDA8;
	Fri, 22 Mar 2024 17:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cNmYtKwO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5160257875
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711127389; cv=none; b=ib3Lm3oDbtx5eIfAezrjXBRBYdw3PsXtVAjwLosNEKVrzv9fprSlS6WyOjBb2fnjiWPU0N4Iwf9cDVCn5P39n9m6y+PJLoikvRB1CZXETKWqqOzUOzkZUzQsh/g+840tEBO+ymmT0Vrm05RZZgjI1WbwE+Juh4KjD2kjr1OdERI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711127389; c=relaxed/simple;
	bh=WFSROxQZOVxFu47A+8VqRSUCe8TRaljA8PS0t5b553Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOLZY8htwYtBkfF7/oBiVJpugFBYNSYeHArZLXLJcMb7iwYro7fdPpE+3HSCwLttkq5GoGzwY5QyKz/4xTCZU1CG19WVkmtFlw3rG5SWl23iHmB7mhXHb6xIoWl43EDU0OxNAoM2utb0EVBjU+knP2t7mUhfvlRM5yo99/+oSQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cNmYtKwO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WFSR
	OxQZOVxFu47A+8VqRSUCe8TRaljA8PS0t5b553Y=; b=cNmYtKwO5Cu5IWiuRD5o
	Rra1wfWzl7faA6KT3pVfA9ipAZ93fnWCDyioXrFmupshiecN38ZhuEn20Lv197ck
	wliUCprkQUA+jo49CTtVw9txv7lkqS3TK7Sph3u8PGimL8isWCSjBtDUOvzRJC0c
	HV4nrVroNyYOMldN5AgE4PNKHFpmVyKgXYoBCwPSXbXBzaxGbeNIbPfQZpKPIkJj
	OW/7uewh3zH5HPeHcYM/IfiHiY62bvPzBSsPOmiOjbDOgKSwOamu6D/qtV+wk6R+
	BNT0hTYDcakbO1754UvcuMCQVFvDQRT4cCISEjn5KLHZbq2psaT5U9oxZ+uoJ87t
	pw==
Received: (qmail 3929014 invoked from network); 22 Mar 2024 18:09:43 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 18:09:43 +0100
X-UD-Smtp-Session: l3s3148p1@P2He40IU0sJehhtF
Date: Fri, 22 Mar 2024 18:09:42 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <groeck@google.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, linux-i2c@vger.kernel.org,
	Elie Morisse <syniurge@gmail.com>,
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
Message-ID: <Zf27VpOHPXAtHCLr@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <groeck@google.com>,
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
 <Zf22G4jC2gIlzhi_@shikoro>
 <CABXOdTc14kfPpkF96KG-oeLRTLvjxAD_gtOO2TQFLnHMLNoU_Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="un7BlYMtStBuO9gz"
Content-Disposition: inline
In-Reply-To: <CABXOdTc14kfPpkF96KG-oeLRTLvjxAD_gtOO2TQFLnHMLNoU_Q@mail.gmail.com>


--un7BlYMtStBuO9gz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Kind of odd though to change function names but not parameter names of
> those very same functions.

Ouch, this is definitely a valid point. Seems like this series will need
a respin after all. Will wait for further comments, though.

Thanks!


--un7BlYMtStBuO9gz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmX9u1YACgkQFA3kzBSg
KbZSKA//Q8484MbfzpPKmvUS0QA73oCgcHXOiIKbRKOfwXWkquKc1vuGV6LbxWG+
oPc84UQGrv+MjAhAMX/ZpO2VdGp+ej/a1j1kNYihlqVTkY/rRWPMa5y1oNB2H5Xq
tFjFmqgwbqm/K/OND3KcJw8zAmXCTgCvgQDyQx76B6KMydRGzKel/sM29TwW6mTm
HCQ9klGLK273LaNEAwn4vkLQ6BtVmjI1CpnjIp3hSRWdW9IytTQlM2weh0gQ+D2p
OerYgE9JUZp4dgPgLIR60J3AER1DaZtHMVH5NwMLT8xMLa/L3RgkSaTbxa/D2tvm
K2XQbEWvx8HsxtEIUEcIy936gmSyZ7Nta1mJv+5yN+DLHdGoo9KNl6vcMxzXLgpM
02/ySV8tMq+Q4cX/fIVZxaeudi69toWj1QcjLg11KaJDo4ndbPqBwYRkSYJ+o2Nh
aJNDu7J+5ud051bq05bFRaCitl7kyEdv5WEjwk5RTLDD1xvwR84SZ3ElcQ6Jnb/I
VaA1JNnKw/et4KmEF4A65wphnC8pC/gmH5c9SrPs6w7dUw44dla+p+jPrgtvUOnY
sqhCnFNLZ5MGuyhTemuWVdGNNvwwuTYFf/VYKi7mdRVsCRdLQIoHklH7FUfmwhpM
G5oEk4nI7j9MbLPl4WOjrZ9k5wZQnd5zRSWHj/aw5xmVCbNVKsQ=
=dqSs
-----END PGP SIGNATURE-----

--un7BlYMtStBuO9gz--

