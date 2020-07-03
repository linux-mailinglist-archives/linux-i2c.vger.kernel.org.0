Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC8B6213866
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jul 2020 12:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725810AbgGCKJA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jul 2020 06:09:00 -0400
Received: from gloria.sntech.de ([185.11.138.130]:39116 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbgGCKJA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 3 Jul 2020 06:09:00 -0400
Received: from p5b127e6f.dip0.t-ipconnect.de ([91.18.126.111] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1jrIco-0005Z1-B5; Fri, 03 Jul 2020 12:08:54 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     John Keeping <john@metanate.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: rk3x: support master_xfer_atomic
Date:   Fri, 03 Jul 2020 12:08:53 +0200
Message-ID: <2391901.EFyQHPvyDf@phil>
In-Reply-To: <20200623120646.2175569-1-john@metanate.com>
References: <20200623120646.2175569-1-john@metanate.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Dienstag, 23. Juni 2020, 14:06:46 CEST schrieb John Keeping:
> Enable i2c transactions in irq disabled contexts like poweroff where the
> PMIC is connected via i2c.
> 
> Signed-off-by: John Keeping <john@metanate.com>

on a rk3288:
Tested-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/i2c/busses/i2c-rk3x.c | 39 +++++++++++++++++++++++++++++++----
>  1 file changed, 35 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index 15324bfbc6cb..8e3cc85d1921 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -10,6 +10,7 @@
>  #include <linux/module.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
> +#include <linux/iopoll.h>
>  #include <linux/errno.h>
>  #include <linux/err.h>
>  #include <linux/platform_device.h>
> @@ -1040,8 +1041,21 @@ static int rk3x_i2c_setup(struct rk3x_i2c *i2c, struct i2c_msg *msgs, int num)
>  	return ret;
>  }
>  
> -static int rk3x_i2c_xfer(struct i2c_adapter *adap,
> -			 struct i2c_msg *msgs, int num)
> +static int rk3x_i2c_wait_xfer_poll(struct rk3x_i2c *i2c)
> +{
> +	ktime_t timeout = ktime_add_ms(ktime_get(), WAIT_TIMEOUT);
> +
> +	while (READ_ONCE(i2c->busy) &&
> +	       ktime_compare(ktime_get(), timeout) < 0) {
> +		udelay(5);
> +		rk3x_i2c_irq(0, i2c);
> +	}
> +
> +	return !i2c->busy;
> +}
> +
> +static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
> +				struct i2c_msg *msgs, int num, bool polling)
>  {
>  	struct rk3x_i2c *i2c = (struct rk3x_i2c *)adap->algo_data;
>  	unsigned long timeout, flags;
> @@ -1075,8 +1089,12 @@ static int rk3x_i2c_xfer(struct i2c_adapter *adap,
>  
>  		rk3x_i2c_start(i2c);
>  
> -		timeout = wait_event_timeout(i2c->wait, !i2c->busy,
> -					     msecs_to_jiffies(WAIT_TIMEOUT));
> +		if (!polling) {
> +			timeout = wait_event_timeout(i2c->wait, !i2c->busy,
> +						     msecs_to_jiffies(WAIT_TIMEOUT));
> +		} else {
> +			timeout = rk3x_i2c_wait_xfer_poll(i2c);
> +		}
>  
>  		spin_lock_irqsave(&i2c->lock, flags);
>  
> @@ -1110,6 +1128,18 @@ static int rk3x_i2c_xfer(struct i2c_adapter *adap,
>  	return ret < 0 ? ret : num;
>  }
>  
> +static int rk3x_i2c_xfer(struct i2c_adapter *adap,
> +			 struct i2c_msg *msgs, int num)
> +{
> +	return rk3x_i2c_xfer_common(adap, msgs, num, false);
> +}
> +
> +static int rk3x_i2c_xfer_polling(struct i2c_adapter *adap,
> +				 struct i2c_msg *msgs, int num)
> +{
> +	return rk3x_i2c_xfer_common(adap, msgs, num, true);
> +}
> +
>  static __maybe_unused int rk3x_i2c_resume(struct device *dev)
>  {
>  	struct rk3x_i2c *i2c = dev_get_drvdata(dev);
> @@ -1126,6 +1156,7 @@ static u32 rk3x_i2c_func(struct i2c_adapter *adap)
>  
>  static const struct i2c_algorithm rk3x_i2c_algorithm = {
>  	.master_xfer		= rk3x_i2c_xfer,
> +	.master_xfer_atomic	= rk3x_i2c_xfer_polling,
>  	.functionality		= rk3x_i2c_func,
>  };
>  
> 




