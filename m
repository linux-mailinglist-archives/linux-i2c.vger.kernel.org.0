Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7D2719479
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jun 2023 09:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232124AbjFAHkl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jun 2023 03:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232062AbjFAHig (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Jun 2023 03:38:36 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8AB81B7
        for <linux-i2c@vger.kernel.org>; Thu,  1 Jun 2023 00:34:11 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q4coI-0002fI-SS; Thu, 01 Jun 2023 09:33:26 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q4coF-004Iia-Ri; Thu, 01 Jun 2023 09:33:23 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q4coF-00A54n-3w; Thu, 01 Jun 2023 09:33:23 +0200
Date:   Thu, 1 Jun 2023 09:33:22 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Thor Thayer <thor.thayer@linux.intel.com>,
        Elie Morisse <syniurge@gmail.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Michal Simek <michal.simek@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Jochen Friedrich <jochen@scram.de>,
        Benson Leung <bleung@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Baruch Siach <baruch@tkos.co.il>,
        Jean-Marie Verdun <verdun@hpe.com>,
        Nick Hawkins <nick.hawkins@hpe.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Jean Delvare <jdelvare@suse.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Chris Pringle <chris.pringle@phabrix.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stefan Roese <sr@denx.de>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>, Robert Richter <rric@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Vignesh R <vigneshr@ti.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>, Rob Herring <robh@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jim Cromie <jim.cromie@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wei Chen <harperchen1110@gmail.com>,
        George Cherian <gcherian@marvell.com>,
        Peter Rosin <peda@axentia.se>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-aspeed@lists.ozlabs.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Jan Dabros <jsd@semihalf.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Guenter Roeck <groeck@chromium.org>,
        linux-riscv@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Jerome Brunet <jbrunet@baylibre.com>,
        chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        Benjamin Fair <benjaminfair@google.com>,
        linux-rockchip@lists.infradead.org, openbmc@lists.ozlabs.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nancy Yuen <yuenn@google.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-sunxi@lists.linux.dev, Joel Stanley <joel@jms.id.au>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
        linux-mediatek@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Patrick Venture <venture@google.com>,
        linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>, asahi@lists.linux.dev,
        kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 00/89] i2c: Convert to platform remove callback returning
 void
Message-ID: <20230601073322.ww25ajaurktqsryr@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t3p72aozx6nadzgj"
Content-Disposition: inline
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--t3p72aozx6nadzgj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Dropped Phil Edworthy from recipents as his email address has problems]

Hello,

On Mon, May 08, 2023 at 10:51:37PM +0200, Uwe Kleine-K=F6nig wrote:
> this series convers the drivers below drivers/i2c to the .remove_new()
> callback of struct platform_driver(). The motivation is to make the
> remove callback less prone for errors and wrong assumptions. See commit
> 5c5a7680e67b ("platform: Provide a remove callback that returns no
> value") for a more detailed rationale.
>=20
> All but one driver already returned zero unconditionally in their
> .remove() callback, so converting them to .remove_new() is trivial.
> i2c-davinci has two patches in this series, first the error path is
> improved to not return an error code, then it's converted as the others
> drivers are.
>=20
> The two davinci patches are also the only interdependency in this
> series. I was unsure if I should split the series in two, the busses and
> the mux changes; if convenient these can be applied independent of each
> other.

I wonder how this series will go in. My expectation was that Wolfram
picks up the whole series via his tree?!

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--t3p72aozx6nadzgj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR4ScIACgkQj4D7WH0S
/k5tFwgAlOnFyNSd/y+RTxXNPFfhdLDFrGmy0vVlKgNWr54rj45mpn2vKbWNVNMh
uHJkfu86+59kw2Z0mV0P0MetDeJReqHGuXrjQe87Pkus+gNIQ6yV0pH5TFAVpTxR
eD04UBlV5+o939pFIOX+jBdeGDvPcSeECFfwxplSVVvUU6jJ6g0LiCDNdn6eNxHD
g2Dnl8SpsU1t5iM62pyjZlBoscqvjfFiBCGdT80CmYeMPJM5UnBEdJOmpybfa8Ce
scJdDvHFUP2jh1LC+0RQ43raxUyZon0Lie6tT6IbAoOXUiTqpcZ6NOhyobMzOcHq
FIkEZoeC8nKcmthV7foaEY5TgzmK+w==
=LLVA
-----END PGP SIGNATURE-----

--t3p72aozx6nadzgj--
