Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EFF04DEA0C
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Mar 2022 19:22:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243880AbiCSSXy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Mar 2022 14:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243868AbiCSSXx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Mar 2022 14:23:53 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45FED2689A8;
        Sat, 19 Mar 2022 11:22:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C1A85B80D9B;
        Sat, 19 Mar 2022 18:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32FEC340EC;
        Sat, 19 Mar 2022 18:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647714148;
        bh=hhu+iiM+PEsCTNMjvrEDz1ucmDg+Fr+55HCY0c8/UsU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NXtiYgj8z1V7NwGkSTBqzfcsA2AcF0FUaqWmKBlbJdkZlY+5X/Y+POt10MISO2kS/
         +1wBVMn6in+UaYxrsB+ld5KedeYkHNIj02KA2XruXSe2eHDPJ8URwB8AcSYSv8ps+Z
         Ifuohar81D4hwwl9tgfqOVucJpMb+IwOwfp/yuzmcpASxtg1A0RlMGefuRRTYs6DZ8
         Xkap8/jSbiLBifie7GY6O1b3vhEHaGasq6nPAxrFZ7DCPkDSnV0SrTrqs0Z0rxACg7
         vwu2sYtiP3sQddRlnOw3C8WIjDKnbeTbeq2k5N++3G6fabIoEi1fRpinli5QNuYYzo
         nvfjeQZ5q5TAQ==
Date:   Sat, 19 Mar 2022 18:29:36 +0000
From:   Jonathan Cameron <jic23@kernel.org>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        UNGLinuxDriver@microchip.com, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
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
        linux-clk@vger.kernel.org, kernel@pengutronix.de,
        Vladimir Zapolskiy <vz@mleia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Tomislav Denis <tomislav.denis@avl.com>,
        Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        =?UTF-8?B?QW5kcsOp?= Gustavo Nakagomi Lopez <andregnl@usp.br>,
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
        <mallikarjunax.reddy@linux.intel.com>, dmaengine@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: Re: [PATCH v8 02/16] clk: Provide new devm_clk helpers for prepared
 and enabled clocks
Message-ID: <20220319182936.06d75742@jic23-huawei>
In-Reply-To: <20220314141643.22184-3-u.kleine-koenig@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
        <20220314141643.22184-3-u.kleine-koenig@pengutronix.de>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 14 Mar 2022 15:16:29 +0100
Uwe Kleine-K=C3=B6nig         <u.kleine-koenig@pengutronix.de> wrote:

> When a driver keeps a clock prepared (or enabled) during the whole
> lifetime of the driver, these helpers allow to simplify the drivers.
>=20
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Alexandru Ardelean <aardelean@deviqon.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

One trivial thing below.

> ---
>  drivers/clk/clk-devres.c | 31 ++++++++++++++
>  include/linux/clk.h      | 90 +++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 120 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
> index fb7761888b30..4707fe718f0b 100644
> --- a/drivers/clk/clk-devres.c
> +++ b/drivers/clk/clk-devres.c
> @@ -67,12 +67,43 @@ struct clk *devm_clk_get(struct device *dev, const ch=
ar *id)
>  }
>  EXPORT_SYMBOL(devm_clk_get);
> =20
> +struct clk *devm_clk_get_prepared(struct device *dev, const char *id)
> +{
> +	return __devm_clk_get(dev, id, clk_get, clk_prepare, clk_unprepare);

Nitpick but this spacing before } in functions is rather unusual and not
in keeping with the existing code in this file.

> +
> +}
> +EXPORT_SYMBOL(devm_clk_get_prepared);
> +
> +struct clk *devm_clk_get_enabled(struct device *dev, const char *id)
> +{
> +	return __devm_clk_get(dev, id, clk_get,
> +			      clk_prepare_enable, clk_disable_unprepare);
> +
> +}
> +EXPORT_SYMBOL(devm_clk_get_enabled);
> +
>  struct clk *devm_clk_get_optional(struct device *dev, const char *id)
>  {
>  	return __devm_clk_get(dev, id, clk_get_optional, NULL, NULL);
>  }
>  EXPORT_SYMBOL(devm_clk_get_optional);
> =20
> +struct clk *devm_clk_get_optional_prepared(struct device *dev, const cha=
r *id)
> +{
> +	return __devm_clk_get(dev, id, clk_get_optional,
> +			      clk_prepare, clk_unprepare);
> +
> +}
> +EXPORT_SYMBOL(devm_clk_get_optional_prepared);
> +
> +struct clk *devm_clk_get_optional_enabled(struct device *dev, const char=
 *id)
> +{
> +	return __devm_clk_get(dev, id, clk_get_optional,
> +			      clk_prepare_enable, clk_disable_unprepare);
> +
> +}
> +EXPORT_SYMBOL(devm_clk_get_optional_enabled);
> +
>  struct clk_bulk_devres {
>  	struct clk_bulk_data *clks;
>  	int num_clks;
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 266e8de3cb51..b011dbba7109 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -449,7 +449,7 @@ int __must_check devm_clk_bulk_get_all(struct device =
*dev,
>   * the clock producer.  (IOW, @id may be identical strings, but
>   * clk_get may return different clock producers depending on @dev.)
>   *
> - * Drivers must assume that the clock source is not enabled.
> + * Drivers must assume that the clock source is neither prepared nor ena=
bled.
>   *
>   * devm_clk_get should not be called from within interrupt context.
>   *
> @@ -458,6 +458,47 @@ int __must_check devm_clk_bulk_get_all(struct device=
 *dev,
>   */
>  struct clk *devm_clk_get(struct device *dev, const char *id);
> =20
> +/**
> + * devm_clk_get_prepared - devm_clk_get() + clk_prepare()
> + * @dev: device for clock "consumer"
> + * @id: clock consumer ID
> + *
> + * Returns a struct clk corresponding to the clock producer, or
> + * valid IS_ERR() condition containing errno.  The implementation
> + * uses @dev and @id to determine the clock consumer, and thereby
> + * the clock producer.  (IOW, @id may be identical strings, but
> + * clk_get may return different clock producers depending on @dev.)
> + *
> + * The returned clk (if valid) is prepared. Drivers must however assume =
that the
> + * clock is not enabled.
> + *
> + * devm_clk_get_prepared should not be called from within interrupt cont=
ext.
> + *
> + * The clock will automatically be unprepared and freed when the
> + * device is unbound from the bus.
> + */
> +struct clk *devm_clk_get_prepared(struct device *dev, const char *id);
> +
> +/**
> + * devm_clk_get_enabled - devm_clk_get() + clk_prepare_enable()
> + * @dev: device for clock "consumer"
> + * @id: clock consumer ID
> + *
> + * Returns a struct clk corresponding to the clock producer, or valid IS=
_ERR()
> + * condition containing errno.  The implementation uses @dev and @id to
> + * determine the clock consumer, and thereby the clock producer.  (IOW, =
@id may
> + * be identical strings, but clk_get may return different clock producers
> + * depending on @dev.)
> + *
> + * The returned clk (if valid) is prepared and enabled.
> + *
> + * devm_clk_get_prepared should not be called from within interrupt cont=
ext.
> + *
> + * The clock will automatically be disabled, unprepared and freed when t=
he
> + * device is unbound from the bus.
> + */
> +struct clk *devm_clk_get_enabled(struct device *dev, const char *id);
> +
>  /**
>   * devm_clk_get_optional - lookup and obtain a managed reference to an o=
ptional
>   *			   clock producer.
> @@ -469,6 +510,29 @@ struct clk *devm_clk_get(struct device *dev, const c=
har *id);
>   */
>  struct clk *devm_clk_get_optional(struct device *dev, const char *id);
> =20
> +/**
> + * devm_clk_get_optional_prepared - devm_clk_get_optional() + clk_prepar=
e()
> + * @dev: device for clock "consumer"
> + * @id: clock consumer ID
> + *
> + * Behaves the same as devm_clk_get_prepared() except where there is no =
clock
> + * producer.  In this case, instead of returning -ENOENT, the function r=
eturns
> + * NULL.
> + */
> +struct clk *devm_clk_get_optional_prepared(struct device *dev, const cha=
r *id);
> +
> +/**
> + * devm_clk_get_optional_enabled - devm_clk_get_optional() +
> + *                                 clk_prepare_enable()
> + * @dev: device for clock "consumer"
> + * @id: clock consumer ID
> + *
> + * Behaves the same as devm_clk_get_enabled() except where there is no c=
lock
> + * producer.  In this case, instead of returning -ENOENT, the function r=
eturns
> + * NULL.
> + */
> +struct clk *devm_clk_get_optional_enabled(struct device *dev, const char=
 *id);
> +
>  /**
>   * devm_get_clk_from_child - lookup and obtain a managed reference to a
>   *			     clock producer from child node.
> @@ -813,12 +877,36 @@ static inline struct clk *devm_clk_get(struct devic=
e *dev, const char *id)
>  	return NULL;
>  }
> =20
> +static inline struct clk *devm_clk_get_prepared(struct device *dev,
> +						const char *id)
> +{
> +	return NULL;
> +}
> +
> +static inline struct clk *devm_clk_get_enabled(struct device *dev,
> +					       const char *id)
> +{
> +	return NULL;
> +}
> +
>  static inline struct clk *devm_clk_get_optional(struct device *dev,
>  						const char *id)
>  {
>  	return NULL;
>  }
> =20
> +static inline struct clk *devm_clk_get_optional_prepared(struct device *=
dev,
> +							 const char *id)
> +{
> +	return NULL;
> +}
> +
> +static inline struct clk *devm_clk_get_optional_enabled(struct device *d=
ev,
> +							const char *id)
> +{
> +	return NULL;
> +}
> +
>  static inline int __must_check devm_clk_bulk_get(struct device *dev, int=
 num_clks,
>  						 struct clk_bulk_data *clks)
>  {

