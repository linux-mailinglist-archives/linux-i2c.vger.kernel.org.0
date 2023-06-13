Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0654472EFE8
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 01:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231903AbjFMXT6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jun 2023 19:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241704AbjFMXT6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jun 2023 19:19:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 285D119B2;
        Tue, 13 Jun 2023 16:19:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A14D862E72;
        Tue, 13 Jun 2023 23:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92ADAC433C8;
        Tue, 13 Jun 2023 23:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686698392;
        bh=00coPlPXq6Ktp19aty/LWQkO7wWlaavBkvbNCMX5SbQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=egp3dL+4CxEETZh0irhPP7WF+JjV8Pa97+xdQA7mFDesH95x5MA9mr+mxuJ3fXh0y
         1Y0aSHmjopW0HBd/CHN/WrJJ4F1jiFBvwa3OmhenyHy8SVvTOv8YLodquyAZCBYU9l
         uVZevqEC4x1ZokS/BUg/V9e+b92LWRdITkox7MnYbRZwXGChUZa2Eyb7jOf4vj+2Go
         mene99vWxPTpUgT7MGmc0fTLg8Lle+lFKC16AbllacoTr2T1L4q48yZSW7gr3oaQeM
         lnFdOxbY2sqMtnIcBBwYYhaFO+dom0BkPNum3SomYa3e19bGY9dZmNUwn/cg1M3Cr/
         CNtKb2A5KqZnw==
Date:   Wed, 14 Jun 2023 01:19:48 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     carlos.song@nxp.com
Cc:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        Anson.Huang@nxp.com, xiaoning.wang@nxp.com, haibo.chen@nxp.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: imx-lpi2c: add bus recovery feature
Message-ID: <20230613231948.bsxuou4nnwbg2ui5@intel.intel>
References: <20230529074302.3612294-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230529074302.3612294-1-carlos.song@nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Mon, May 29, 2023 at 03:43:01PM +0800, carlos.song@nxp.com wrote:
> From: Clark Wang <xiaoning.wang@nxp.com>
> 
> Add bus recovery feature for LPI2C.
> Need add gpio pinctrl, scl-gpios and sda-gpios configuration in dts.

please update the commit message according to the dts changes, as
well.

[...]

> +static void lpi2c_imx_prepare_recovery(struct i2c_adapter *adap)
> +{
> +	struct lpi2c_imx_struct *lpi2c_imx;
> +
> +	lpi2c_imx = container_of(adap, struct lpi2c_imx_struct, adapter);
> +
> +	pinctrl_select_state(lpi2c_imx->pinctrl, lpi2c_imx->pinctrl_pins_gpio);
> +}
> +
> +static void lpi2c_imx_unprepare_recovery(struct i2c_adapter *adap)
> +{
> +	struct lpi2c_imx_struct *lpi2c_imx;
> +
> +	lpi2c_imx = container_of(adap, struct lpi2c_imx_struct, adapter);
> +
> +	pinctrl_select_state(lpi2c_imx->pinctrl, lpi2c_imx->pinctrl_pins_default);
> +}
> +
> +/*
> + * We switch SCL and SDA to their GPIO function and do some bitbanging
> + * for bus recovery. These alternative pinmux settings can be
> + * described in the device tree by a separate pinctrl state "gpio". If

is this still true?

> + * this is missing this is not a big problem, the only implication is
> + * that we can't do bus recovery.
> + */
> +static int lpi2c_imx_init_recovery_info(struct lpi2c_imx_struct *lpi2c_imx,
> +		struct platform_device *pdev)
> +{
> +	struct i2c_bus_recovery_info *rinfo = &lpi2c_imx->rinfo;
> +
> +	lpi2c_imx->pinctrl = devm_pinctrl_get(&pdev->dev);
> +	if (!lpi2c_imx->pinctrl || IS_ERR(lpi2c_imx->pinctrl)) {
> +		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
> +		return PTR_ERR(lpi2c_imx->pinctrl);
> +	}
> +
> +	lpi2c_imx->pinctrl_pins_default = pinctrl_lookup_state(lpi2c_imx->pinctrl,
> +			PINCTRL_STATE_DEFAULT);
> +	lpi2c_imx->pinctrl_pins_gpio = pinctrl_lookup_state(lpi2c_imx->pinctrl,
> +			"gpio");
> +	rinfo->sda_gpiod = devm_gpiod_get(&pdev->dev, "sda", GPIOD_IN);
> +	rinfo->scl_gpiod = devm_gpiod_get(&pdev->dev, "scl", GPIOD_OUT_HIGH_OPEN_DRAIN);
> +
> +	if (PTR_ERR(rinfo->sda_gpiod) == -EPROBE_DEFER ||
> +	    PTR_ERR(rinfo->scl_gpiod) == -EPROBE_DEFER) {
> +		return -EPROBE_DEFER;
> +	} else if (IS_ERR(rinfo->sda_gpiod) ||
> +		   IS_ERR(rinfo->scl_gpiod) ||
> +		   IS_ERR(lpi2c_imx->pinctrl_pins_default) ||
> +		   IS_ERR(lpi2c_imx->pinctrl_pins_gpio)) {
> +		dev_dbg(&pdev->dev, "recovery information incomplete\n");
> +		return 0;
> +	}

Why not use these assignement from the default
i2c_init_recovery()? Is there anything you are doing I am not
seeing?

> +
> +	dev_info(&pdev->dev, "using scl%s for recovery\n",
> +		 rinfo->sda_gpiod ? ",sda" : "");

is there any case when sda_gpiod is NULL?

> +
> +	rinfo->prepare_recovery = lpi2c_imx_prepare_recovery;
> +	rinfo->unprepare_recovery = lpi2c_imx_unprepare_recovery;
> +	rinfo->recover_bus = i2c_generic_scl_recovery;
> +	lpi2c_imx->adapter.bus_recovery_info = rinfo;

do you need also the set_scl() function? It should be mandatory.

> +
> +	return 0;
> +}

Besides, this is a copy/paste from i2c-imx.c, any chance to put
the two things together?

Andi
