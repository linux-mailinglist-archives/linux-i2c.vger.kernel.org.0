Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7E456FB8E8
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233921AbjEHUyU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233811AbjEHUyB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:54:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7382483D6
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:45 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r5-000303-P6; Mon, 08 May 2023 22:53:11 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r3-0024oy-Nl; Mon, 08 May 2023 22:53:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r2-002YUk-Pw; Mon, 08 May 2023 22:53:08 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thor Thayer <thor.thayer@linux.intel.com>,
        Elie Morisse <syniurge@gmail.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
        Phil Edworthy <phil.edworthy@renesas.com>,
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
        Peter Korsgaard <peter.korsgaard@barco.com>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        linux-rpi-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, Guenter Roeck <groeck@chromium.org>,
        chrome-platform@lists.linux.dev,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        linux-renesas-soc@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-mips@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        linux-omap@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH 00/89] i2c: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:51:37 +0200
Message-Id: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=12259; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=CUiyRkHedGuUngm1XVS44bTPkh5X8UNxtDmuuxmkXfI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWA/sUJy//6LnoJE8pZ1jpYWJb4ReEOteWEqx nBbdvdRxiaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgPwAKCRCPgPtYfRL+ TrMyB/47jd7Ku/xKY+yn8Pz8lCxZfeQrwdKR0Ava+mmos9tRoEvf3C/fjgZ6JdPMn2xAOuFj5L0 ChlkHdf+cjgqrDShJg+TdHgusB/fqdoi2SilcdhEg4do3/OuaNy0bmP1lx97NUPi74d38/N8hO4 Wjf9h6QZucyKU5j9n9VuRVgPMcA35GhgWZ+Ga+hU+dlTINCOxdJu/al05N7Ex74ppPtfxjCBTQO f0LzVF+aO+5Q9Uyx/0Q1RBhNY2vAtr4I1t+5bybE+u1pqJ9AZNAgk+NuN67I1nNSjBRl0BtYaE3 u5cZFNC9MgmA4TtzZbTz14vLP4QKcyyxwruCQNqDFAK21Isv
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

this series convers the drivers below drivers/i2c to the .remove_new()
callback of struct platform_driver(). The motivation is to make the
remove callback less prone for errors and wrong assumptions. See commit
5c5a7680e67b ("platform: Provide a remove callback that returns no
value") for a more detailed rationale.

All but one driver already returned zero unconditionally in their
.remove() callback, so converting them to .remove_new() is trivial.
i2c-davinci has two patches in this series, first the error path is
improved to not return an error code, then it's converted as the others
drivers are.

The two davinci patches are also the only interdependency in this
series. I was unsure if I should split the series in two, the busses and
the mux changes; if convenient these can be applied independent of each
other.

Best regards
Uwe

Uwe Kleine-König (89):
  i2c: altera: Convert to platform remove callback returning void
  i2c: amd-mp2-plat: Convert to platform remove callback returning void
  i2c: aspeed: Convert to platform remove callback returning void
  i2c: at91-core: Convert to platform remove callback returning void
  i2c: au1550: Convert to platform remove callback returning void
  i2c: axxia: Convert to platform remove callback returning void
  i2c: bcm-iproc: Convert to platform remove callback returning void
  i2c: bcm-kona: Convert to platform remove callback returning void
  i2c: bcm2835: Convert to platform remove callback returning void
  i2c: brcmstb: Convert to platform remove callback returning void
  i2c: cadence: Convert to platform remove callback returning void
  i2c: cbus-gpio: Convert to platform remove callback returning void
  i2c: cht-wc: Convert to platform remove callback returning void
  i2c: cpm: Convert to platform remove callback returning void
  i2c: cros-ec-tunnel: Convert to platform remove callback returning
    void
  i2c: davinci: Improve error reporting for problems during .remove()
  i2c: davinci: Convert to platform remove callback returning void
  i2c: designware-platdrv: Convert to platform remove callback returning
    void
  i2c: digicolor: Convert to platform remove callback returning void
  i2c: dln2: Convert to platform remove callback returning void
  i2c: emev2: Convert to platform remove callback returning void
  i2c: exynos5: Convert to platform remove callback returning void
  i2c: gpio: Convert to platform remove callback returning void
  i2c: gxp: Convert to platform remove callback returning void
  i2c: highlander: Convert to platform remove callback returning void
  i2c: hix5hd2: Convert to platform remove callback returning void
  i2c: ibm_iic: Convert to platform remove callback returning void
  i2c: img-scb: Convert to platform remove callback returning void
  i2c: imx-lpi2c: Convert to platform remove callback returning void
  i2c: imx: Convert to platform remove callback returning void
  i2c: iop3xx: Convert to platform remove callback returning void
  i2c: isch: Convert to platform remove callback returning void
  i2c: jz4780: Convert to platform remove callback returning void
  i2c: kempld: Convert to platform remove callback returning void
  i2c: lpc2k: Convert to platform remove callback returning void
  i2c: meson: Convert to platform remove callback returning void
  i2c: microchip-corei2c: Convert to platform remove callback returning
    void
  i2c: mlxbf: Convert to platform remove callback returning void
  i2c: mlxcpld: Convert to platform remove callback returning void
  i2c: mpc: Convert to platform remove callback returning void
  i2c: mt65xx: Convert to platform remove callback returning void
  i2c: mt7621: Convert to platform remove callback returning void
  i2c: mv64xxx: Convert to platform remove callback returning void
  i2c: mxs: Convert to platform remove callback returning void
  i2c: npcm7xx: Convert to platform remove callback returning void
  i2c: ocores: Convert to platform remove callback returning void
  i2c: octeon-platdrv: Convert to platform remove callback returning
    void
  i2c: omap: Convert to platform remove callback returning void
  i2c: opal: Convert to platform remove callback returning void
  i2c: pasemi-platform: Convert to platform remove callback returning
    void
  i2c: pca-platform: Convert to platform remove callback returning void
  i2c: pnx: Convert to platform remove callback returning void
  i2c: powermac: Convert to platform remove callback returning void
  i2c: pxa: Convert to platform remove callback returning void
  i2c: qcom-cci: Convert to platform remove callback returning void
  i2c: qcom-geni: Convert to platform remove callback returning void
  i2c: qup: Convert to platform remove callback returning void
  i2c: rcar: Convert to platform remove callback returning void
  i2c: riic: Convert to platform remove callback returning void
  i2c: rk3x: Convert to platform remove callback returning void
  i2c: rzv2m: Convert to platform remove callback returning void
  i2c: s3c2410: Convert to platform remove callback returning void
  i2c: scmi: Convert to platform remove callback returning void
  i2c: scx200_acb: Convert to platform remove callback returning void
  i2c: sh7760: Convert to platform remove callback returning void
  i2c: sh_mobile: Convert to platform remove callback returning void
  i2c: simtec: Convert to platform remove callback returning void
  i2c: st: Convert to platform remove callback returning void
  i2c: stm32f4: Convert to platform remove callback returning void
  i2c: stm32f7: Convert to platform remove callback returning void
  i2c: sun6i-p2wi: Convert to platform remove callback returning void
  i2c: synquacer: Convert to platform remove callback returning void
  i2c: tegra-bpmp: Convert to platform remove callback returning void
  i2c: tegra: Convert to platform remove callback returning void
  i2c: uniphier-f: Convert to platform remove callback returning void
  i2c: uniphier: Convert to platform remove callback returning void
  i2c: versatile: Convert to platform remove callback returning void
  i2c: viperboard: Convert to platform remove callback returning void
  i2c: wmt: Convert to platform remove callback returning void
  i2c: xgene-slimpro: Convert to platform remove callback returning void
  i2c: xiic: Convert to platform remove callback returning void
  i2c: xlp9xx: Convert to platform remove callback returning void
  i2c: mux: arb-gpio-challenge: Convert to platform remove callback
    returning void
  i2c: mux: demux-pinctrl: Convert to platform remove callback returning
    void
  i2c: mux: gpio: Convert to platform remove callback returning void
  i2c: mux: gpmux: Convert to platform remove callback returning void
  i2c: mux: mlxcpld: Convert to platform remove callback returning void
  i2c: mux: pinctrl: Convert to platform remove callback returning void
  i2c: mux: reg: Convert to platform remove callback returning void

 drivers/i2c/busses/i2c-altera.c             |  6 ++----
 drivers/i2c/busses/i2c-amd-mp2-plat.c       |  5 ++---
 drivers/i2c/busses/i2c-aspeed.c             |  6 ++----
 drivers/i2c/busses/i2c-at91-core.c          |  6 ++----
 drivers/i2c/busses/i2c-au1550.c             |  5 ++---
 drivers/i2c/busses/i2c-axxia.c              |  6 ++----
 drivers/i2c/busses/i2c-bcm-iproc.c          |  6 ++----
 drivers/i2c/busses/i2c-bcm-kona.c           |  6 ++----
 drivers/i2c/busses/i2c-bcm2835.c            |  6 ++----
 drivers/i2c/busses/i2c-brcmstb.c            |  5 ++---
 drivers/i2c/busses/i2c-cadence.c            |  6 ++----
 drivers/i2c/busses/i2c-cbus-gpio.c          |  6 ++----
 drivers/i2c/busses/i2c-cht-wc.c             |  6 ++----
 drivers/i2c/busses/i2c-cpm.c                |  6 ++----
 drivers/i2c/busses/i2c-cros-ec-tunnel.c     |  6 ++----
 drivers/i2c/busses/i2c-davinci.c            | 14 ++++++--------
 drivers/i2c/busses/i2c-designware-platdrv.c |  6 ++----
 drivers/i2c/busses/i2c-digicolor.c          |  6 ++----
 drivers/i2c/busses/i2c-dln2.c               |  6 ++----
 drivers/i2c/busses/i2c-emev2.c              |  6 ++----
 drivers/i2c/busses/i2c-exynos5.c            |  6 ++----
 drivers/i2c/busses/i2c-gpio.c               |  6 ++----
 drivers/i2c/busses/i2c-gxp.c                |  6 ++----
 drivers/i2c/busses/i2c-highlander.c         |  6 ++----
 drivers/i2c/busses/i2c-hix5hd2.c            |  6 ++----
 drivers/i2c/busses/i2c-ibm_iic.c            |  6 ++----
 drivers/i2c/busses/i2c-img-scb.c            |  6 ++----
 drivers/i2c/busses/i2c-imx-lpi2c.c          |  6 ++----
 drivers/i2c/busses/i2c-imx.c                |  6 ++----
 drivers/i2c/busses/i2c-iop3xx.c             |  6 ++----
 drivers/i2c/busses/i2c-isch.c               |  6 ++----
 drivers/i2c/busses/i2c-jz4780.c             |  5 ++---
 drivers/i2c/busses/i2c-kempld.c             |  6 ++----
 drivers/i2c/busses/i2c-lpc2k.c              |  6 ++----
 drivers/i2c/busses/i2c-meson.c              |  6 ++----
 drivers/i2c/busses/i2c-microchip-corei2c.c  |  6 ++----
 drivers/i2c/busses/i2c-mlxbf.c              |  6 ++----
 drivers/i2c/busses/i2c-mlxcpld.c            |  6 ++----
 drivers/i2c/busses/i2c-mpc.c                |  6 ++----
 drivers/i2c/busses/i2c-mt65xx.c             |  6 ++----
 drivers/i2c/busses/i2c-mt7621.c             |  6 ++----
 drivers/i2c/busses/i2c-mv64xxx.c            |  6 ++----
 drivers/i2c/busses/i2c-mxs.c                |  6 ++----
 drivers/i2c/busses/i2c-npcm7xx.c            |  5 ++---
 drivers/i2c/busses/i2c-ocores.c             |  6 ++----
 drivers/i2c/busses/i2c-octeon-platdrv.c     |  5 ++---
 drivers/i2c/busses/i2c-omap.c               |  6 ++----
 drivers/i2c/busses/i2c-opal.c               |  6 ++----
 drivers/i2c/busses/i2c-pasemi-platform.c    |  5 ++---
 drivers/i2c/busses/i2c-pca-platform.c       |  6 ++----
 drivers/i2c/busses/i2c-pnx.c                |  6 ++----
 drivers/i2c/busses/i2c-powermac.c           |  6 ++----
 drivers/i2c/busses/i2c-pxa.c                |  6 ++----
 drivers/i2c/busses/i2c-qcom-cci.c           |  6 ++----
 drivers/i2c/busses/i2c-qcom-geni.c          |  5 ++---
 drivers/i2c/busses/i2c-qup.c                |  5 ++---
 drivers/i2c/busses/i2c-rcar.c               |  6 ++----
 drivers/i2c/busses/i2c-riic.c               |  6 ++----
 drivers/i2c/busses/i2c-rk3x.c               |  6 ++----
 drivers/i2c/busses/i2c-rzv2m.c              |  6 ++----
 drivers/i2c/busses/i2c-s3c2410.c            |  6 ++----
 drivers/i2c/busses/i2c-scmi.c               |  6 ++----
 drivers/i2c/busses/i2c-sh7760.c             |  6 ++----
 drivers/i2c/busses/i2c-sh_mobile.c          |  5 ++---
 drivers/i2c/busses/i2c-simtec.c             |  6 ++----
 drivers/i2c/busses/i2c-st.c                 |  6 ++----
 drivers/i2c/busses/i2c-stm32f4.c            |  6 ++----
 drivers/i2c/busses/i2c-stm32f7.c            |  6 ++----
 drivers/i2c/busses/i2c-sun6i-p2wi.c         |  6 ++----
 drivers/i2c/busses/i2c-synquacer.c          |  6 ++----
 drivers/i2c/busses/i2c-tegra-bpmp.c         |  6 ++----
 drivers/i2c/busses/i2c-tegra.c              |  6 ++----
 drivers/i2c/busses/i2c-uniphier-f.c         |  6 ++----
 drivers/i2c/busses/i2c-uniphier.c           |  6 ++----
 drivers/i2c/busses/i2c-versatile.c          |  5 ++---
 drivers/i2c/busses/i2c-viperboard.c         |  6 ++----
 drivers/i2c/busses/i2c-wmt.c                |  6 ++----
 drivers/i2c/busses/i2c-xgene-slimpro.c      |  6 ++----
 drivers/i2c/busses/i2c-xiic.c               |  6 ++----
 drivers/i2c/busses/i2c-xlp9xx.c             |  6 ++----
 drivers/i2c/busses/scx200_acb.c             |  6 ++----
 drivers/i2c/muxes/i2c-arb-gpio-challenge.c  |  5 ++---
 drivers/i2c/muxes/i2c-demux-pinctrl.c       |  6 ++----
 drivers/i2c/muxes/i2c-mux-gpio.c            |  6 ++----
 drivers/i2c/muxes/i2c-mux-gpmux.c           |  6 ++----
 drivers/i2c/muxes/i2c-mux-mlxcpld.c         |  5 ++---
 drivers/i2c/muxes/i2c-mux-pinctrl.c         |  6 ++----
 drivers/i2c/muxes/i2c-mux-reg.c             |  6 ++----
 88 files changed, 180 insertions(+), 343 deletions(-)

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

