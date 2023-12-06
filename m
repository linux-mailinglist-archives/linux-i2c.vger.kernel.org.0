Return-Path: <linux-i2c+bounces-629-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0E3806AB0
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Dec 2023 10:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25CBFB20C5E
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Dec 2023 09:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41560182A7;
	Wed,  6 Dec 2023 09:30:07 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8606EA4;
	Wed,  6 Dec 2023 01:30:00 -0800 (PST)
Received: from i53875b61.versanet.de ([83.135.91.97] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rAoE4-0008Mk-HT; Wed, 06 Dec 2023 10:29:52 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andi Shyti <andi.shyti@kernel.org>,
 Jensen Huang <jensenhuang@friendlyarm.com>
Cc: Jensen Huang <jensenhuang@friendlyarm.com>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: rk3x: fix potential spinlock recursion on poll
Date: Wed, 06 Dec 2023 10:29:51 +0100
Message-ID: <5298230.31r3eYUQgx@diego>
In-Reply-To: <20231206090641.18849-1-jensenhuang@friendlyarm.com>
References: <20231206090641.18849-1-jensenhuang@friendlyarm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Mittwoch, 6. Dezember 2023, 10:06:40 CET schrieb Jensen Huang:
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
> 
> Signed-off-by: Jensen Huang <jensenhuang@friendlyarm.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


> ---
>  drivers/i2c/busses/i2c-rk3x.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index a044ca0c35a1..94514637c3bd 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -200,6 +200,7 @@ struct rk3x_i2c {
>  	struct clk *clk;
>  	struct clk *pclk;
>  	struct notifier_block clk_rate_nb;
> +	int irq;
>  
>  	/* Settings */
>  	struct i2c_timings t;
> @@ -1087,13 +1088,18 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
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
> @@ -1310,6 +1316,8 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	i2c->irq = irq;
> +
>  	platform_set_drvdata(pdev, i2c);
>  
>  	if (i2c->soc_data->calc_timings == rk3x_i2c_v0_calc_timings) {
> 





