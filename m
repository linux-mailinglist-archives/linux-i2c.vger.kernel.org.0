Return-Path: <linux-i2c+bounces-899-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F155B819D06
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 11:39:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B8DF1F2252D
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 10:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2A5224D3;
	Wed, 20 Dec 2023 10:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="qorYyphY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FB222303;
	Wed, 20 Dec 2023 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1703068655; x=1734604655;
  h=date:from:to:cc:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to:subject;
  bh=g+TPrc8PqsX2A6MOEoxOpOrmmDnEXK+JiSxFz/fzK0M=;
  b=qorYyphYsqiyjby+z2kKSOdcHxhL1v8lJdL/OdREpAf2RpxfX8mPAc3f
   J6zJLY25w1G8vv0SDmv2PbC+jfWv8rCjZMGp1EOMhA/6b3awg+9hvzyqS
   W+EHSAlYG4AC8UOKtESewiJic6dQ3XpSbsTA9gRo47Ht8qN+yT+h7ycAt
   I23oFoLSag1Ad04B3Q3m8CxMnGsS8LAP0WDIZJeYHZKQpmLz2MvfG6Drf
   2+QLcXaOuvKnEi5YbL7ZpfgG1TmvPLGlJtX212LCORW0z2+U6kYhIHARz
   YCD7/WcSIduDlIJZve8NKV8qcEuqruMbhI2u4JODVa7uU4TMvZjHQjpD9
   w==;
X-IronPort-AV: E=Sophos;i="6.04,291,1695679200"; 
   d="scan'208";a="34607338"
Subject: Re: Re: [PATCH] i2c: i2c-imx: allow bus recovery on non-muxable pads
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Dec 2023 11:37:27 +0100
Received: from herburgerg-w2 (herburgerg-w2.tq-net.de [10.122.52.145])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id D2DF5280075;
	Wed, 20 Dec 2023 11:37:26 +0100 (CET)
Date: Wed, 20 Dec 2023 11:37:21 +0100
From: Gregor Herburger <gregor.herburger@ew.tq-group.com>
To: esben@geanix.com
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux@ew.tq-group.com" <linux@ew.tq-group.com>
Message-ID: <ZYLD4WgOPFB9ccym@herburgerg-w2>
References: <20231218-i2c-imx-recovery-v1-1-f69fa85b228c@ew.tq-group.com>
 <87frzyprhq.fsf@geanix.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87frzyprhq.fsf@geanix.com>

Hi Esben,

I had another look at your patch and tested it on a LX2160a SoC without
pinctrl. I agree that using the generic GPIO recovery you suggested is
the better solution.

To make your solution work I had to make a small change (see below).

On Tue, Dec 19, 2023 at 07:43:21AM +0000, esben@geanix.com wrote:
> Why not move to use the generic GPIO recovery instead?  Will something
> like this be able to cover at least the same scenarios as your change?
> 
> From 7e432496bae8c7ac35c21504bc1cd03f1dfef97f Mon Sep 17 00:00:00 2001
> Message-ID: <7e432496bae8c7ac35c21504bc1cd03f1dfef97f.1702971634.git.esben@geanix.com>
> From: Esben Haabendal <esben@geanix.com>
> Date: Tue, 25 May 2021 11:25:44 +0200
> Subject: [PATCH] i2c: imx: move to generic GPIO recovery
> 
> Starting with
> commit 75820314de26 ("i2c: core: add generic I2C GPIO recovery")
> GPIO bus recovery is supported by the I2C core, so we can remove the
> driver implementation and use that one instead.
> 
> As a nice side-effect, pinctrl becomes optional, allowing bus recovery on
> LS1021A, which does not have such luxury, but can be wired up to use extra
> fixed GPIO pins.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 62 ++++--------------------------------
>  1 file changed, 7 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 1775a79aeba2..824d8bbb9be5 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -212,10 +212,6 @@ struct imx_i2c_struct {
>  	const struct imx_i2c_hwdata	*hwdata;
>  	struct i2c_bus_recovery_info rinfo;
>  
> -	struct pinctrl *pinctrl;
> -	struct pinctrl_state *pinctrl_pins_default;
> -	struct pinctrl_state *pinctrl_pins_gpio;
> -
>  	struct imx_i2c_dma	*dma;
>  	struct i2c_client	*slave;
>  	enum i2c_slave_event last_slave_event;
> @@ -1357,24 +1353,6 @@ static int i2c_imx_xfer_atomic(struct i2c_adapter *adapter,
>  	return result;
>  }
>  
> -static void i2c_imx_prepare_recovery(struct i2c_adapter *adap)
> -{
> -	struct imx_i2c_struct *i2c_imx;
> -
> -	i2c_imx = container_of(adap, struct imx_i2c_struct, adapter);
> -
> -	pinctrl_select_state(i2c_imx->pinctrl, i2c_imx->pinctrl_pins_gpio);
> -}
> -
> -static void i2c_imx_unprepare_recovery(struct i2c_adapter *adap)
> -{
> -	struct imx_i2c_struct *i2c_imx;
> -
> -	i2c_imx = container_of(adap, struct imx_i2c_struct, adapter);
> -
> -	pinctrl_select_state(i2c_imx->pinctrl, i2c_imx->pinctrl_pins_default);
> -}
> -
>  /*
>   * We switch SCL and SDA to their GPIO function and do some bitbanging
>   * for bus recovery. These alternative pinmux settings can be
> @@ -1385,43 +1363,17 @@ static void i2c_imx_unprepare_recovery(struct i2c_adapter *adap)
>  static int i2c_imx_init_recovery_info(struct imx_i2c_struct *i2c_imx,
>  		struct platform_device *pdev)
>  {
> -	struct i2c_bus_recovery_info *rinfo = &i2c_imx->rinfo;
> +	struct i2c_bus_recovery_info *bri = &i2c_imx->rinfo;
>  
> -	i2c_imx->pinctrl = devm_pinctrl_get(&pdev->dev);
> -	if (!i2c_imx->pinctrl) {
> -		dev_info(&pdev->dev, "pinctrl unavailable, bus recovery not supported\n");
> +	bri->pinctrl = devm_pinctrl_get(&pdev->dev);
> +	if (PTR_ERR(bri->pinctrl) == -ENODEV) {
> +		bri->pinctrl = NULL;
>  		return 0;
Should not return here to allow setting of adapter.bus_recovery_info
later.

>  	}
> -	if (IS_ERR(i2c_imx->pinctrl)) {
> -		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
> -		return PTR_ERR(i2c_imx->pinctrl);
> -	}
> -
> -	i2c_imx->pinctrl_pins_default = pinctrl_lookup_state(i2c_imx->pinctrl,
> -			PINCTRL_STATE_DEFAULT);
> -	i2c_imx->pinctrl_pins_gpio = pinctrl_lookup_state(i2c_imx->pinctrl,
> -			"gpio");
> -	rinfo->sda_gpiod = devm_gpiod_get(&pdev->dev, "sda", GPIOD_IN);
> -	rinfo->scl_gpiod = devm_gpiod_get(&pdev->dev, "scl", GPIOD_OUT_HIGH_OPEN_DRAIN);
> -
> -	if (PTR_ERR(rinfo->sda_gpiod) == -EPROBE_DEFER ||
> -	    PTR_ERR(rinfo->scl_gpiod) == -EPROBE_DEFER) {
> -		return -EPROBE_DEFER;
> -	} else if (IS_ERR(rinfo->sda_gpiod) ||
> -		   IS_ERR(rinfo->scl_gpiod) ||
> -		   IS_ERR(i2c_imx->pinctrl_pins_default) ||
> -		   IS_ERR(i2c_imx->pinctrl_pins_gpio)) {
> -		dev_dbg(&pdev->dev, "recovery information incomplete\n");
> -		return 0;
> -	}
> -
> -	dev_dbg(&pdev->dev, "using scl%s for recovery\n",
> -		rinfo->sda_gpiod ? ",sda" : "");
> +	if (IS_ERR(bri->pinctrl))
> +		return PTR_ERR(bri->pinctrl);
>  
> -	rinfo->prepare_recovery = i2c_imx_prepare_recovery;
> -	rinfo->unprepare_recovery = i2c_imx_unprepare_recovery;
> -	rinfo->recover_bus = i2c_generic_scl_recovery;
> -	i2c_imx->adapter.bus_recovery_info = rinfo;
> +	i2c_imx->adapter.bus_recovery_info = bri;
>  
>  	return 0;
>  }

Best regards,
Gregor

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

