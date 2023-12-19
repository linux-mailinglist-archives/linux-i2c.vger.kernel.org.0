Return-Path: <linux-i2c+bounces-859-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 704C88184EB
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 10:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E87CB22684
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 09:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5401427A;
	Tue, 19 Dec 2023 09:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="AGZkkQLN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E14F1426D;
	Tue, 19 Dec 2023 09:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1702979936; x=1734515936;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ICkzegM7gZOvkNqsWhAjmgW9haK24Yiw2UCFyLlQ4ck=;
  b=AGZkkQLNpCPEbsEuWJX078qOEHqdbsvbuobJBmeIef2SetgU7oPq03tg
   DuWyGNmZpeM4rimR0mvSfpjp/iEZ+M17jDkMtFyEzR9JxkLdbQpviclO7
   idIg7aHCvvajZJEwOYBm8W5GRnhYMxLylTGhSkghBq8pGdH7Hs3khcGMJ
   8ZehVJx/hmE87kXM6uetlzF1V5Dk9X25Imp7DPbhdMGYJZmQB5vRAN0hR
   r2yHtQqEO48g3Jj+qG3ONtdfQuF3qYNJNBI5Gt3zVJTU1cfre51CXHwQI
   Cki7nV8M6AJ6OkCaG4BEXLAYVSKzKwyzmaHgVadiyLv8v6S67pezp2B0a
   g==;
X-IronPort-AV: E=Sophos;i="6.04,287,1695679200"; 
   d="scan'208";a="34582001"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Dec 2023 10:58:48 +0100
Received: from herburgerg-w2 (herburgerg-w2.tq-net.de [10.122.52.145])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 483E3280075;
	Tue, 19 Dec 2023 10:58:48 +0100 (CET)
Date: Tue, 19 Dec 2023 10:58:42 +0100
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
Subject: Re: Re: [PATCH] i2c: i2c-imx: allow bus recovery on non-muxable pads
Message-ID: <ZYFpUpP0Ll5c99py@herburgerg-w2>
References: <20231218-i2c-imx-recovery-v1-1-f69fa85b228c@ew.tq-group.com>
 <87frzyprhq.fsf@geanix.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frzyprhq.fsf@geanix.com>

Hi Esben,

On Tue, Dec 19, 2023 at 07:43:21AM +0000, esben@geanix.com wrote:
> Gregor Herburger <gregor.herburger@ew.tq-group.com> writes:
> 
> > Currently the i2c-imx driver assumes that for bus recovery the i2c pins
> > can be reconfigured as gpio via pinctrl.
> >
> > But bus recovery can also be done with a gpio electrically connected to
> > i2c scl.
> >
> > Modify i2c_imx_init_recovery_info to allow bus recovery on platforms
> > without pinctrl. In this case only use scl-gpio and
> > i2c_generic_scl_recovery.
> 
> Why not move to use the generic GPIO recovery instead?  Will something
> like this be able to cover at least the same scenarios as your change?

I was not aware of the generic GPIO recovery functions. At a first
glance I think your solution should work. I will give it a try and test
it on hardware.

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
> -- 
> 2.43.0
> 
> 
> /Esben
> 

