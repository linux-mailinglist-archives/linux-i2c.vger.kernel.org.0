Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26E7A5605C9
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 18:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbiF2Q0y convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 29 Jun 2022 12:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231512AbiF2Q0y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 12:26:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EEA93617A
        for <linux-i2c@vger.kernel.org>; Wed, 29 Jun 2022 09:26:53 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1o6aWR-0006oI-Ij; Wed, 29 Jun 2022 18:26:35 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1o6aWK-003Qov-VO; Wed, 29 Jun 2022 18:26:32 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1o6aWN-000Dce-Hf; Wed, 29 Jun 2022 18:26:31 +0200
Message-ID: <a088652dbf603579ed5ba663df31d26ef2b2eb56.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] i2c: Add Renesas RZ/V2M controller
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date:   Wed, 29 Jun 2022 18:26:31 +0200
In-Reply-To: <20220628194526.111501-3-phil.edworthy@renesas.com>
References: <20220628194526.111501-1-phil.edworthy@renesas.com>
         <20220628194526.111501-3-phil.edworthy@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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

On Di, 2022-06-28 at 20:45 +0100, Phil Edworthy wrote:
> Yet another i2c controller from Renesas that is found on the RZ/V2M
> (r9a09g011) SoC. It can support only 100kHz and 400KHz operation.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2:
>  - Use the new NOIRQ_SYSTEM_SLEEP_PM_OPS() as suggested by Arnd
>  - Lots of small fixes based on Geert's review
> ---
>  drivers/i2c/busses/Kconfig     |  10 +
>  drivers/i2c/busses/Makefile    |   1 +
>  drivers/i2c/busses/i2c-rzv2m.c | 530 +++++++++++++++++++++++++++++++++
>  3 files changed, 541 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-rzv2m.c
> 
[...]
> diff --git a/drivers/i2c/busses/i2c-rzv2m.c b/drivers/i2c/busses/i2c-rzv2m.c
> new file mode 100644
> index 000000000000..ab326d557dc5
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-rzv2m.c
> @@ -0,0 +1,530 @@
[...]
> +static int rzv2m_i2c_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rzv2m_i2c_priv *priv;
> +	struct reset_control *rstc;
> +	struct i2c_adapter *adap;
> +	struct resource *res;
> +	int irq, ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(struct rzv2m_i2c_priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(priv->clk)) {
> +		dev_err_probe(dev, PTR_ERR(priv->clk), "Can't get clock\n");
> +		return PTR_ERR(priv->clk);
> +	}
> +
> +	rstc = devm_reset_control_get(dev, NULL);

Please don't use devm_reset_control_get. This should probably be
devm_reset_control_get_shared().

regards
Philipp
