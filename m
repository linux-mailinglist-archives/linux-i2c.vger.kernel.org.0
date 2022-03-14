Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6B9F4D86DA
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Mar 2022 15:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242359AbiCNOTk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Mar 2022 10:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242365AbiCNOTg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Mar 2022 10:19:36 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48E481ADA8
        for <linux-i2c@vger.kernel.org>; Mon, 14 Mar 2022 07:18:25 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVQ-0004zI-Ju; Mon, 14 Mar 2022 15:17:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVH-000f2a-PX; Mon, 14 Mar 2022 15:16:54 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVF-0097aV-Ov; Mon, 14 Mar 2022 15:16:53 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        UNGLinuxDriver@microchip.com, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        Vladimir Zapolskiy <vz@mleia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Tomislav Denis <tomislav.denis@avl.com>,
        Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        =?utf-8?q?Andr=C3=A9_Gustavo_Nakagomi_Lopez?= <andregnl@usp.br>,
        Cai Huoqing <caihuoqing@baidu.com>, linux-iio@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-mips@vger.kernel.org, linux-rtc@vger.kernel.org,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>, dmaengine@vger.kernel.org
Subject: [PATCH v8 00/16] clk: provide new devm helpers for prepared and enabled clocks
Date:   Mon, 14 Mar 2022 15:16:27 +0100
Message-Id: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5140; i=uwe@kleine-koenig.org; h=from:subject; bh=UyYZYiS1jsIjibZ2MrufsJ1VrXFVRIfOx2nxS5wK9sc=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiL03mRL8wE3boX5TsxdQb7A/4ALVpT93/3rzycIlB hFpTWs+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYi9N5gAKCRDB/BR4rcrsCc4ZB/ 9EDZG3qguuMeWbZAfXaH9prZGcSynBDBtwqLtmnGRt28ZTaarFw88YmZERvpaHjVQ0WPcNKCMjBphZ C/YPMpezXK2TikRkYqr2gsFaWKLwJ5+rqhGqxNSg4wZqzBgxjEgMa4BRbXRgQZvFOb/8ucyk4f/y3U oXCTg8ZOWQwebvd7JJsMztn6aZl6uW9im2ZqZji8vnmZt0yG28aNRWS33RDwWlQzrat//LG5Pb7S41 7uVOkFnphQjm5eRjOvblGRbYIxlM0SEETKun6FycjvR4gk1OvqrePSrWZY01rN3iXQF/v/C3RrHXL6 fzr+e9MLjqZjR6qpuN+DvujbCtKzRp
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
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

Hello,

this is another try to convince the relevant people that
devm_clk_get_enabled() is a nice idea. Compared to v7 (back in May 2021) this
series is rebased to v5.17-rc8 and converts quite some drivers that open code
devm_clk_get_enabled() up to now (patches #3 - #11).

A concern about devm_clk_get_enabled() in v7 was that it helps people to be
lazy and I agree that in some situations when devm_clk_get_enabled() is used it
would be more efficient and sensible to care to only enable the clk when really
needed.

On the other hand, the function is right for some users, e.g. the watchdog
drivers. For the others it's not so simple to judge. Given that there are a
lot of drivers that are lazy even if doing so is some effort (i.e. calling
clk_prepare_enable() and devm_add_action()) convinces me, that introducing the
function family is sensible. (And if you want to work on these drivers,
grepping for devm_clk_get_enabled gives you a few candidates once the
series is in :-)

Otherwise looking at the diffstat of this series:

 48 files changed, 257 insertions(+), 851 deletions(-)

is quite convincing. Just the first two patches (which introduce the new
functions) account for

 2 files changed, 169 insertions(+), 17 deletions(-)

. A rough third of the added lines is documentation. The rest is driver
updates which then has:

 46 files changed, 88 insertions(+), 834 deletions(-)

which makes a really nice cleanup.

The series is build-tested on arm64, m68k, powerpc, riscv, s390, sparc64
and x86_64 using an allmodconfig.

Best regards
Uwe

Uwe Kleine-König (16):
  clk: generalize devm_clk_get() a bit
  clk: Provide new devm_clk helpers for prepared and enabled clocks
  hwmon: Make use of devm_clk_get_enabled()
  iio: Make use of devm_clk_get_enabled()
  hwrng: meson - Don't open-code devm_clk_get_optional_enabled()
  bus: bt1: Don't open code devm_clk_get_enabled()
  gpio: vf610: Simplify error handling in probe
  drm/meson: dw-hdmi: Don't open code devm_clk_get_enabled()
  rtc: ingenic: Simplify using devm_clk_get_enabled()
  clk: meson: axg-audio: Don't duplicate devm_clk_get_enabled()
  watchdog: Make use of devm_clk_get_enabled()
  pwm: atmel: Simplify using devm_clk_get_prepared()
  rtc: at91sam9: Simplify using devm_clk_get_enabled()
  i2c: imx: Simplify using devm_clk_get_enabled()
  spi: davinci: Simplify using devm_clk_get_enabled()
  dmaengine: lgm: Fix error handling

 drivers/bus/bt1-apb.c                 | 23 +------
 drivers/bus/bt1-axi.c                 | 23 +------
 drivers/char/hw_random/meson-rng.c    | 20 +-----
 drivers/clk/clk-devres.c              | 96 ++++++++++++++++++++++-----
 drivers/clk/meson/axg-audio.c         | 36 ++--------
 drivers/dma/lgm/lgm-dma.c             |  8 +--
 drivers/gpio/gpio-vf610.c             | 45 +++----------
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 48 +++++---------
 drivers/hwmon/axi-fan-control.c       | 15 +----
 drivers/hwmon/ltc2947-core.c          | 17 +----
 drivers/hwmon/mr75203.c               | 26 +-------
 drivers/hwmon/sparx5-temp.c           | 19 +-----
 drivers/i2c/busses/i2c-imx.c          | 12 +---
 drivers/iio/adc/ad7124.c              | 15 +----
 drivers/iio/adc/ad7768-1.c            | 17 +----
 drivers/iio/adc/ad9467.c              | 17 +----
 drivers/iio/adc/ingenic-adc.c         | 15 +----
 drivers/iio/adc/lpc18xx_adc.c         | 18 +----
 drivers/iio/adc/rockchip_saradc.c     | 44 +-----------
 drivers/iio/adc/ti-ads131e08.c        | 19 +-----
 drivers/iio/adc/xilinx-ams.c          | 15 +----
 drivers/iio/adc/xilinx-xadc-core.c    | 18 +----
 drivers/iio/frequency/adf4371.c       | 17 +----
 drivers/iio/frequency/admv1013.c      | 15 +----
 drivers/iio/frequency/adrf6780.c      | 16 +----
 drivers/iio/imu/adis16475.c           | 15 +----
 drivers/pwm/pwm-atmel.c               | 16 +----
 drivers/rtc/rtc-at91sam9.c            | 22 ++----
 drivers/rtc/rtc-jz4740.c              | 21 +-----
 drivers/spi/spi-davinci.c             | 11 +--
 drivers/watchdog/cadence_wdt.c        | 17 +----
 drivers/watchdog/davinci_wdt.c        | 18 +----
 drivers/watchdog/imgpdc_wdt.c         | 31 +--------
 drivers/watchdog/imx2_wdt.c           | 15 +----
 drivers/watchdog/imx7ulp_wdt.c        | 15 +----
 drivers/watchdog/loongson1_wdt.c      | 17 +----
 drivers/watchdog/lpc18xx_wdt.c        | 30 +--------
 drivers/watchdog/meson_gxbb_wdt.c     | 16 +----
 drivers/watchdog/of_xilinx_wdt.c      | 16 +----
 drivers/watchdog/pic32-dmt.c          | 15 +----
 drivers/watchdog/pic32-wdt.c          | 17 +----
 drivers/watchdog/pnx4008_wdt.c        | 15 +----
 drivers/watchdog/qcom-wdt.c           | 16 +----
 drivers/watchdog/rtd119x_wdt.c        | 16 +----
 drivers/watchdog/st_lpc_wdt.c         | 16 +----
 drivers/watchdog/stm32_iwdg.c         | 31 +--------
 drivers/watchdog/visconti_wdt.c       | 18 +----
 include/linux/clk.h                   | 90 ++++++++++++++++++++++++-
 48 files changed, 257 insertions(+), 851 deletions(-)


base-commit: 09688c0166e76ce2fb85e86b9d99be8b0084cdf9
-- 
2.35.1

