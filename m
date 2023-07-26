Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF987638BA
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 16:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233196AbjGZONd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 10:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233675AbjGZOMN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 10:12:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57AE12D61;
        Wed, 26 Jul 2023 07:11:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E8FFD61AFB;
        Wed, 26 Jul 2023 14:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02A2C433C8;
        Wed, 26 Jul 2023 14:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690380717;
        bh=8JjXu0Maujx8eEcNdXSwfZEHNpW0CTakHMFqiSveX0s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=guhEAV/+O+f0HXeCuuXXtgycAY84caokmcZKCByb3Gvbw8rO+qq5XJlWEzn6shnwo
         j6c0q5ozHggoYY/Gy74aCXSMwPkRT8FArCPoaG91oNHQp1jJlqIq3DelgvggI0tnBe
         BzCTOH3jngqLfoKlmQTAVXkIShOe328lMYdJ/hjQAfokMyB8lSR233EOrVOGE+aaHO
         pahonTvI3wdyzVaFmVmNZz3tisZZm04nV5aWlN59yVal6LSQTyRoJLYGr9SVVL0iMX
         bfETLJAgquT55OcOLzrDryatq47wjJDM5/gVnDHTmmMrrobAqMbmyoTKRH2OgJkbXd
         MsNMzsYyEkxAw==
Date:   Wed, 26 Jul 2023 16:11:53 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     carlos.song@nxp.com
Cc:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, xiaoning.wang@nxp.com,
        haibo.chen@nxp.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i2c: imx-lpi2c: add bus recovery feature
Message-ID: <20230726141153.hpnpmxxci463nvpc@intel.intel>
References: <20230724105546.1964059-1-carlos.song@nxp.com>
 <20230724105546.1964059-2-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724105546.1964059-2-carlos.song@nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Carlos,

Quite a different patch this v2.

On Mon, Jul 24, 2023 at 06:55:45PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Add bus recovery feature for LPI2C.
> Need add gpio pinctrl, scl-gpios and sda-gpios configuration in dts.

mmhhh... I already asked you in the previous version to update
the commit log... where is the DTS?

> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 51 ++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 158de0b7f030..e93ff3b5373c 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -107,6 +107,7 @@ struct lpi2c_imx_struct {
>  	unsigned int		txfifosize;
>  	unsigned int		rxfifosize;
>  	enum lpi2c_imx_mode	mode;
> +	struct i2c_bus_recovery_info rinfo;

if this is in the i2c_adapter, why do you also need it here? You
keep this place allocated even if it is optional.

>  };
>  
>  static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx,
> @@ -134,6 +135,8 @@ static int lpi2c_imx_bus_busy(struct lpi2c_imx_struct *lpi2c_imx)
>  
>  		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
>  			dev_dbg(&lpi2c_imx->adapter.dev, "bus not work\n");
> +			if (lpi2c_imx->adapter.bus_recovery_info)
> +				i2c_recover_bus(&lpi2c_imx->adapter);

what is the recover_bus() function that will get called?

>  			return -ETIMEDOUT;
>  		}
>  		schedule();
> @@ -191,6 +194,8 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct *lpi2c_imx)
>  
>  		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
>  			dev_dbg(&lpi2c_imx->adapter.dev, "stop timeout\n");
> +			if (lpi2c_imx->adapter.bus_recovery_info)
> +				i2c_recover_bus(&lpi2c_imx->adapter);
>  			break;
>  		}
>  		schedule();
> @@ -323,6 +328,8 @@ static int lpi2c_imx_txfifo_empty(struct lpi2c_imx_struct *lpi2c_imx)
>  
>  		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
>  			dev_dbg(&lpi2c_imx->adapter.dev, "txfifo empty timeout\n");
> +			if (lpi2c_imx->adapter.bus_recovery_info)
> +				i2c_recover_bus(&lpi2c_imx->adapter);
>  			return -ETIMEDOUT;
>  		}
>  		schedule();
> @@ -525,6 +532,44 @@ static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> +/*
> + * We switch SCL and SDA to their GPIO function and do some bitbanging
> + * for bus recovery. These alternative pinmux settings can be
> + * described in the device tree by a separate pinctrl state "gpio". If

What is the description in the device tree?

> + * this is missing this is not a big problem, the only implication is
> + * that we can't do bus recovery.
> + */
> +static int lpi2c_imx_init_recovery_info(struct lpi2c_imx_struct *lpi2c_imx,
> +				  struct platform_device *pdev)
> +{
> +	struct i2c_bus_recovery_info *rinfo = &lpi2c_imx->rinfo;
> +
> +	/*
> +	 * When there is no pinctrl state "gpio" in device tree, it means i2c
> +	 * recovery function is not needed, so it is not a problem even if
> +	 * pinctrl state "gpio" is missing. Just do not initialize the I2C bus
> +	 * recovery information.
> +	 */
> +	rinfo->pinctrl = devm_pinctrl_get(&pdev->dev);
> +	if (IS_ERR(rinfo->pinctrl)) {
> +		if (PTR_ERR(rinfo->pinctrl) == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");

nit: "can't get pinctrl..." sounds like error and this is not an
error. Just "bus recovery not supported" is more a friendly
message.

> +		return PTR_ERR(rinfo->pinctrl);
> +	} else if (!rinfo->pinctrl) {
> +		return -ENODEV;

this is the unsupported case and here I would return '0' as it's
not an error.

> +	}
> +
> +	if (IS_ERR(pinctrl_lookup_state(rinfo->pinctrl, "gpio"))) {
> +		dev_dbg(&pdev->dev, "recovery information incomplete\n");
> +		return 0;
> +	}
> +
> +	lpi2c_imx->adapter.bus_recovery_info = rinfo;
> +
> +	return 0;
> +}
> +
>  static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
>  {
>  	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL |
> @@ -603,6 +648,12 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
>  	lpi2c_imx->txfifosize = 1 << (temp & 0x0f);
>  	lpi2c_imx->rxfifosize = 1 << ((temp >> 8) & 0x0f);
>  
> +	/* Init optional bus recovery function */
> +	ret = lpi2c_imx_init_recovery_info(lpi2c_imx, pdev);
> +	/* Give it another chance if pinctrl used is not ready yet */
> +	if (ret == -EPROBE_DEFER)
> +		goto rpm_disable;

what about other errors like -ENOMEM?

Andi

>  	ret = i2c_add_adapter(&lpi2c_imx->adapter);
>  	if (ret)
>  		goto rpm_disable;
> -- 
> 2.34.1
> 
