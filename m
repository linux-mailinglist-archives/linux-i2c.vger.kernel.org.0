Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF524DA1E5
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Mar 2022 19:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240754AbiCOSGO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Mar 2022 14:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245048AbiCOSGN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Mar 2022 14:06:13 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39542205E8;
        Tue, 15 Mar 2022 11:05:00 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id qx21so43187918ejb.13;
        Tue, 15 Mar 2022 11:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7bpalvhMp7syEkA5bOD6m3Hiadeq1GFGR2u5DFZQUPg=;
        b=DFsEVIcpVFZmsLrzVsuXGfCDAOQo45HphHPPHqSlOIJqflipspyIX6nDmHEdm7p5ZN
         qStS1Me4q0ChYcco/kXFdiYP6BFh8vXOSO+RranC2vJEEDyM2cTCdEwWsBLGXaFTO3cm
         ZrLXhRs0Zr57Jp4HWFlA6dsjObFGsCSo2ta1XqASGUjr5h2618FD/7YtapV90aJTALFH
         26YUJTPAW2tj1bjGYJa3B53LWudxdy+KC1sO3IaOfXY9WMLiKhQeh7CYPtaRCelYukQ0
         ykHuhInylyATUkZelWpM9ZbZh88D3lun1+FtqQDueri5iYlC11fvs52nKVwDvhxDADZb
         itcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7bpalvhMp7syEkA5bOD6m3Hiadeq1GFGR2u5DFZQUPg=;
        b=yVfeJO3gp/REeXZIAbrCfnUauoMDNukzvOt+Ib7pMTueQeZnhQIdN2WBQ9/6zyb6zw
         xNMrU8Otvg13BeDddgnh/rZ3uOpHmbwd/NBcwex85O+R+6TRZXFxNMs1j+EauSvrnuSM
         Pm5QX6PpavKom9jkLi7WLaXVvwer5rQdBFHCX3HHf1tJXu/6wc/vaigfg1+ivlhjUcAo
         klmFHc9KrcZP5pjj/6oPJ9/c3T1UbHd4SUTMlcn0sClHF1DQJyWIxPV/y0Zzsi6rgxy9
         t9h/Ej0hC89MhvoJYPmA2JISLdv1gExzoaLlKpGTGnuuiC0oMDH1Hgjy5uIQWAM/4vq7
         Zz/A==
X-Gm-Message-State: AOAM530Clz67FnSELuQ15ggvBCzqWF1EVfqlFx1bcpwTtteZjaDKElG3
        eXcXRw5FmpnUrIi4XirIVp0QDNBnKzvZISRXXig=
X-Google-Smtp-Source: ABdhPJxW6+1eFC3OcTirM9mgeDfTXvBfatrTIVC6OBa4JEN+KNKCGi5wT8QrdQtnyTpzndOFbCuPp9umJm3+8HzbnXM=
X-Received: by 2002:a17:906:4cc7:b0:6d0:7efb:49f with SMTP id
 q7-20020a1709064cc700b006d07efb049fmr23301879ejt.639.1647367498316; Tue, 15
 Mar 2022 11:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 15 Mar 2022 20:03:44 +0200
Message-ID: <CAHp75VdH4vGr57v6tfkRuxh-3agRKO8C08+DH8dsB1HnPfnz5Q@mail.gmail.com>
Subject: Re: [PATCH v8 00/16] clk: provide new devm helpers for prepared and
 enabled clocks
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        linux-hwmon@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
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
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Tomislav Denis <tomislav.denis@avl.com>,
        Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        =?UTF-8?Q?Andr=C3=A9_Gustavo_Nakagomi_Lopez?= <andregnl@usp.br>,
        Cai Huoqing <caihuoqing@baidu.com>,
        linux-iio <linux-iio@vger.kernel.org>,
        linux-crypto <linux-crypto@vger.kernel.org>,
        linux-amlogic <linux-amlogic@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-pwm@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        dmaengine <dmaengine@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 14, 2022 at 5:14 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> this is another try to convince the relevant people that
> devm_clk_get_enabled() is a nice idea. Compared to v7 (back in May 2021) =
this
> series is rebased to v5.17-rc8 and converts quite some drivers that open =
code
> devm_clk_get_enabled() up to now (patches #3 - #11).
>
> A concern about devm_clk_get_enabled() in v7 was that it helps people to =
be
> lazy and I agree that in some situations when devm_clk_get_enabled() is u=
sed it
> would be more efficient and sensible to care to only enable the clk when =
really
> needed.
>
> On the other hand, the function is right for some users, e.g. the watchdo=
g
> drivers. For the others it's not so simple to judge. Given that there are=
 a
> lot of drivers that are lazy even if doing so is some effort (i.e. callin=
g
> clk_prepare_enable() and devm_add_action()) convinces me, that introducin=
g the
> function family is sensible. (And if you want to work on these drivers,
> grepping for devm_clk_get_enabled gives you a few candidates once the
> series is in :-)

FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
for drivers/iio

Thanks for doing this!

> Otherwise looking at the diffstat of this series:
>
>  48 files changed, 257 insertions(+), 851 deletions(-)
>
> is quite convincing. Just the first two patches (which introduce the new
> functions) account for
>
>  2 files changed, 169 insertions(+), 17 deletions(-)
>
> . A rough third of the added lines is documentation. The rest is driver
> updates which then has:
>
>  46 files changed, 88 insertions(+), 834 deletions(-)
>
> which makes a really nice cleanup.
>
> The series is build-tested on arm64, m68k, powerpc, riscv, s390, sparc64
> and x86_64 using an allmodconfig.
>
> Best regards
> Uwe
>
> Uwe Kleine-K=C3=B6nig (16):
>   clk: generalize devm_clk_get() a bit
>   clk: Provide new devm_clk helpers for prepared and enabled clocks
>   hwmon: Make use of devm_clk_get_enabled()
>   iio: Make use of devm_clk_get_enabled()
>   hwrng: meson - Don't open-code devm_clk_get_optional_enabled()
>   bus: bt1: Don't open code devm_clk_get_enabled()
>   gpio: vf610: Simplify error handling in probe
>   drm/meson: dw-hdmi: Don't open code devm_clk_get_enabled()
>   rtc: ingenic: Simplify using devm_clk_get_enabled()
>   clk: meson: axg-audio: Don't duplicate devm_clk_get_enabled()
>   watchdog: Make use of devm_clk_get_enabled()
>   pwm: atmel: Simplify using devm_clk_get_prepared()
>   rtc: at91sam9: Simplify using devm_clk_get_enabled()
>   i2c: imx: Simplify using devm_clk_get_enabled()
>   spi: davinci: Simplify using devm_clk_get_enabled()
>   dmaengine: lgm: Fix error handling
>
>  drivers/bus/bt1-apb.c                 | 23 +------
>  drivers/bus/bt1-axi.c                 | 23 +------
>  drivers/char/hw_random/meson-rng.c    | 20 +-----
>  drivers/clk/clk-devres.c              | 96 ++++++++++++++++++++++-----
>  drivers/clk/meson/axg-audio.c         | 36 ++--------
>  drivers/dma/lgm/lgm-dma.c             |  8 +--
>  drivers/gpio/gpio-vf610.c             | 45 +++----------
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 48 +++++---------
>  drivers/hwmon/axi-fan-control.c       | 15 +----
>  drivers/hwmon/ltc2947-core.c          | 17 +----
>  drivers/hwmon/mr75203.c               | 26 +-------
>  drivers/hwmon/sparx5-temp.c           | 19 +-----
>  drivers/i2c/busses/i2c-imx.c          | 12 +---
>  drivers/iio/adc/ad7124.c              | 15 +----
>  drivers/iio/adc/ad7768-1.c            | 17 +----
>  drivers/iio/adc/ad9467.c              | 17 +----
>  drivers/iio/adc/ingenic-adc.c         | 15 +----
>  drivers/iio/adc/lpc18xx_adc.c         | 18 +----
>  drivers/iio/adc/rockchip_saradc.c     | 44 +-----------
>  drivers/iio/adc/ti-ads131e08.c        | 19 +-----
>  drivers/iio/adc/xilinx-ams.c          | 15 +----
>  drivers/iio/adc/xilinx-xadc-core.c    | 18 +----
>  drivers/iio/frequency/adf4371.c       | 17 +----
>  drivers/iio/frequency/admv1013.c      | 15 +----
>  drivers/iio/frequency/adrf6780.c      | 16 +----
>  drivers/iio/imu/adis16475.c           | 15 +----
>  drivers/pwm/pwm-atmel.c               | 16 +----
>  drivers/rtc/rtc-at91sam9.c            | 22 ++----
>  drivers/rtc/rtc-jz4740.c              | 21 +-----
>  drivers/spi/spi-davinci.c             | 11 +--
>  drivers/watchdog/cadence_wdt.c        | 17 +----
>  drivers/watchdog/davinci_wdt.c        | 18 +----
>  drivers/watchdog/imgpdc_wdt.c         | 31 +--------
>  drivers/watchdog/imx2_wdt.c           | 15 +----
>  drivers/watchdog/imx7ulp_wdt.c        | 15 +----
>  drivers/watchdog/loongson1_wdt.c      | 17 +----
>  drivers/watchdog/lpc18xx_wdt.c        | 30 +--------
>  drivers/watchdog/meson_gxbb_wdt.c     | 16 +----
>  drivers/watchdog/of_xilinx_wdt.c      | 16 +----
>  drivers/watchdog/pic32-dmt.c          | 15 +----
>  drivers/watchdog/pic32-wdt.c          | 17 +----
>  drivers/watchdog/pnx4008_wdt.c        | 15 +----
>  drivers/watchdog/qcom-wdt.c           | 16 +----
>  drivers/watchdog/rtd119x_wdt.c        | 16 +----
>  drivers/watchdog/st_lpc_wdt.c         | 16 +----
>  drivers/watchdog/stm32_iwdg.c         | 31 +--------
>  drivers/watchdog/visconti_wdt.c       | 18 +----
>  include/linux/clk.h                   | 90 ++++++++++++++++++++++++-
>  48 files changed, 257 insertions(+), 851 deletions(-)
>
>
> base-commit: 09688c0166e76ce2fb85e86b9d99be8b0084cdf9
> --
> 2.35.1
>


--=20
With Best Regards,
Andy Shevchenko
