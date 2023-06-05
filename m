Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78926722045
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 09:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231734AbjFEHz5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 03:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231719AbjFEHzj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 03:55:39 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11CB81B7
        for <linux-i2c@vger.kernel.org>; Mon,  5 Jun 2023 00:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=qNV9qf6rhJyxF+PFiRZlT81q/Mvm
        db/EcAsD5Y7RO4A=; b=o54X53HfsxbpVsf5OsUMs5hqfUKh1FtMAgIvGYf/ao8X
        OfgN/S/1QbXgW8iXetNizszdV6LmLLnwJIh/Ml2IAWrSsKhBUlY5kCxt0pa+RfrM
        Hgft1OFLr+tM1Ea0Ob4WmgW4UT5YMSDHvFkIuQkEfMYIGIj3rB9wkDUyFzgsx04=
Received: (qmail 2935631 invoked from network); 5 Jun 2023 09:54:54 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jun 2023 09:54:54 +0200
X-UD-Smtp-Session: l3s3148p1@qaPYN1391MQujnt4
Date:   Mon, 5 Jun 2023 09:54:53 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Thor Thayer <thor.thayer@linux.intel.com>,
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
Message-ID: <ZH2UzYLPEQay3MBT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Thor Thayer <thor.thayer@linux.intel.com>,
        Elie Morisse <syniurge@gmail.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
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
        Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>,
        Robert Richter <rric@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Vignesh R <vigneshr@ti.com>, Michael Ellerman <mpe@ellerman.id.au>,
        Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Rob Herring <robh@kernel.org>,
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
        linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Jerome Brunet <jbrunet@baylibre.com>,
        chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        Benjamin Fair <benjaminfair@google.com>,
        linux-rockchip@lists.infradead.org, openbmc@lists.ozlabs.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nancy Yuen <yuenn@google.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
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
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Patrick Venture <venture@google.com>, linux-mips@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>, asahi@lists.linux.dev,
        kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org,
        linux-i2c@vger.kernel.org
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230601073322.ww25ajaurktqsryr@pengutronix.de>
 <ZHijKtBbH2sCSuT4@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pOTGJ+ASVLoKQ1Xi"
Content-Disposition: inline
In-Reply-To: <ZHijKtBbH2sCSuT4@shikoro>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pOTGJ+ASVLoKQ1Xi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 01, 2023 at 03:54:50PM +0200, Wolfram Sang wrote:
>=20
> > I wonder how this series will go in. My expectation was that Wolfram
> > picks up the whole series via his tree?!
>=20
> Will do. I am currently super-busy, though.

Whole series applied to for-next. I squashed all the commits into one.
These are mostly simple changes which we won't revert anyhow, but fix
incrementally if we ever find an issue.


--pOTGJ+ASVLoKQ1Xi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR9lM0ACgkQFA3kzBSg
KbZSPhAAsfk7pusys7GFW8hUTH1/MqaEtjs2e4zgiR1STw1eeim+O6Ayd8LuEdGz
eXWZfv2E4SYhFi1+lXo4jFP3tPkCynMqn8BLbfRwq6XzXboMRQtEOXXnmRM7aOKN
5x2CbAPlQQZ3A4Bbht92ESvKN54WRDM8V5wg0YUkowAlK6wtG0H8ajUOqYJdfVeN
OPftzfdxQUDphHtitAoIYgHrz8UDxZSuASIjHBbb5ppBwZNtxc81DQYuIE42ajf8
uYRrujqm1lKaRKdWvbZrOwZ42he5QLFl88mVLpQ9OmuhexOuBryk/847XdGDUMP6
LdI40mazpIk+X2txyOySPbR0e3nCmq8gHBUKw1VQ3FMcCwAf60CxaO6fz0WLKPnU
ezWsW6ETk7l52upnb0oSFnTH7ZHBN30Ebtb6xqMoDWs4i6RX/DX//leVHoHb+rD1
tj0EV3wgmvXgyo2wcha8I05YeTYiFofK5PmHq3L3yXBDusslXdEsyVdFU/Mjy01G
vFMWb2wJliDaJy3u9c2LkNBeWdlScTUM7U978o1sakXd6k4AcFJ9iufF0QDoTKqF
iZmdoZaQuVCiGtwB/gUFMtbQDnikh1r2XxLSeeIIe1Fj2yfWr/GzVUq2tCzWu2J/
D0nf7ftd8Y/SK1BYHfuuHox68zo4O8+CNB9WKjgkdt4JsXBlV0U=
=xv1r
-----END PGP SIGNATURE-----

--pOTGJ+ASVLoKQ1Xi--
