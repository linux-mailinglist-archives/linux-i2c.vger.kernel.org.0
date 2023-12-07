Return-Path: <linux-i2c+bounces-644-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A282F80832D
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 09:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EBA41F222AE
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 08:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29654328B6;
	Thu,  7 Dec 2023 08:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="apBinFhY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [IPv6:2a01:4f8:c0c:51f3::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23A1BC6;
	Thu,  7 Dec 2023 00:37:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1701938223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ItJvp86mvKeMDbvON2mlBeaPlnTZSQtaPqu7Y3Wk7gc=;
	b=apBinFhY27PhsJ07Cw8uCjWrCpuBCPMK6GzUR0aOWW5xTxRSCNgeP0H8ZpHndVXiHzIJek
	7RBgE81Zb1CJwIL3wY5aosDGgdKxnSCQL5vTOreX624afVuqQDQ6tQVfxxXbOh86cFOicD
	mX4yi4bmZl+dyplE/4A5Vkjf7xYmPYHUdU1NDWR2+kOREsEL56pH8VOWOUv9QYMmAVLqLV
	rSgE6Mv+wUVyrvmjiJP09lpSFoXmNCnRl+OTWuJWn2ER71IT4bAY+epz3HDR1/717pbC/j
	SKXXbzGYOGXwlqw3VEY4TUQW5bRcl4q9vzzRYHKWkGoiTwHvJ67/He09CzU9sw==
Date: Thu, 07 Dec 2023 09:37:03 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Jensen Huang <jensenhuang@friendlyarm.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Andi Shyti <andi.shyti@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Chris Morgan <macroalpha82@gmail.com>,
 Benjamin Bara <bbara93@gmail.com>
Subject: Re: [PATCH v2] i2c: rk3x: fix potential spinlock recursion on poll
In-Reply-To: <20231207082200.16388-1-jensenhuang@friendlyarm.com>
References: <20231207082200.16388-1-jensenhuang@friendlyarm.com>
Message-ID: <ebf6cf8ec3b5befd673d295061fa2738@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2023-12-07 09:21, Jensen Huang wrote:
> Possible deadlock scenario (on reboot):
> rk3x_i2c_xfer_common(polling)
>     -> rk3x_i2c_wait_xfer_poll()
>         -> rk3x_i2c_irq(0, i2c);
>             --> spin_lock(&i2c->lock);
>             ...
>         <rk3x i2c interrupt>
>         -> rk3x_i2c_irq(0, i2c);
>             --> spin_lock(&i2c->lock); (deadlock here)
> 
> Store the IRQ number and disable/enable it around the polling transfer.
> This patch has been tested on NanoPC-T4.

In case you haven't already seen the related discussion linked below, 
please have a look.  I also added more people to the list of recipients, 
in an attempt to make everyone aware of the different approaches to 
solving this issue.

https://lore.kernel.org/all/655177f4.050a0220.d85c9.3ba0@mx.google.com/T/#m6fc9c214452fec6681843e7f455978c35c6f6c8b

> Signed-off-by: Jensen Huang <jensenhuang@friendlyarm.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> ---
> Changes in v2:
>  - Add description for member 'irq' to fix build warning
> 
>  drivers/i2c/busses/i2c-rk3x.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rk3x.c 
> b/drivers/i2c/busses/i2c-rk3x.c
> index a044ca0c35a1..4362db7c5789 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -178,6 +178,7 @@ struct rk3x_i2c_soc_data {
>   * @clk: function clk for rk3399 or function & Bus clks for others
>   * @pclk: Bus clk for rk3399
>   * @clk_rate_nb: i2c clk rate change notify
> + * @irq: irq number
>   * @t: I2C known timing information
>   * @lock: spinlock for the i2c bus
>   * @wait: the waitqueue to wait for i2c transfer
> @@ -200,6 +201,7 @@ struct rk3x_i2c {
>  	struct clk *clk;
>  	struct clk *pclk;
>  	struct notifier_block clk_rate_nb;
> +	int irq;
> 
>  	/* Settings */
>  	struct i2c_timings t;
> @@ -1087,13 +1089,18 @@ static int rk3x_i2c_xfer_common(struct
> i2c_adapter *adap,
> 
>  		spin_unlock_irqrestore(&i2c->lock, flags);
> 
> -		rk3x_i2c_start(i2c);
> -
>  		if (!polling) {
> +			rk3x_i2c_start(i2c);
> +
>  			timeout = wait_event_timeout(i2c->wait, !i2c->busy,
>  						     msecs_to_jiffies(WAIT_TIMEOUT));
>  		} else {
> +			disable_irq(i2c->irq);
> +			rk3x_i2c_start(i2c);
> +
>  			timeout = rk3x_i2c_wait_xfer_poll(i2c);
> +
> +			enable_irq(i2c->irq);
>  		}
> 
>  		spin_lock_irqsave(&i2c->lock, flags);
> @@ -1310,6 +1317,8 @@ static int rk3x_i2c_probe(struct platform_device 
> *pdev)
>  		return ret;
>  	}
> 
> +	i2c->irq = irq;
> +
>  	platform_set_drvdata(pdev, i2c);
> 
>  	if (i2c->soc_data->calc_timings == rk3x_i2c_v0_calc_timings) {

