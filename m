Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943B228A7AF
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Oct 2020 16:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387964AbgJKOJ2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Oct 2020 10:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387885AbgJKOJ2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Oct 2020 10:09:28 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE794C0613CE
        for <linux-i2c@vger.kernel.org>; Sun, 11 Oct 2020 07:09:27 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d23so7018005pll.7
        for <linux-i2c@vger.kernel.org>; Sun, 11 Oct 2020 07:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6eolskcedr1OistvNOu8vNv3IbtR/OVZDWRpMDmYOFY=;
        b=a2GdWN6OkAKloflNt+7qwyC8O2edjN0YXKUS9K6Euy6j2KjYwwzYtKJVlyEy4o32ta
         /GSC0DzxWUmXCboCSAQQA8Fn+R8VWGJp32/aslQ2B/RYps/UdAO2G5SXQSsxlvctxIRL
         H+SQe0Tm3CRPeEwRAxfavxMQlMSnk9lXmcLz1s9S5OoPQnobm3aN4U6lKKwqZ5HqeD/M
         lEefm0tOCXXb0BHcmNLamgJMhytuHGRbAPh/gL8wiYLVrGw7twj4HAG64kdO8MsPPwWg
         268AQdsqsk4LR0osuHdSRHUxhuC1SSV7DvQSpYmaZ2ev3KWV796TV2nyUZxm+g3seOaX
         1HBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6eolskcedr1OistvNOu8vNv3IbtR/OVZDWRpMDmYOFY=;
        b=aU+CliR+aZh6/a1AGBBR896kHepOEnIe7eg0DF6b6PJwoyTFY61yheJcP4qAyvA1oo
         1bVCgTNwLCtaLnQQZlQLs42d1zslz1OkxQSnmJyM2f4KTCDps5IPj10/G/V86YxEm+jl
         mLnCG/16IS89GnPMhg9cpi1B+I9qmuWqpiqO1+Dz6PuixNCFRCU9NhATitIULzTE/B7m
         fGd9lhg5SHb6b7SJTEcnO+Ek5omOu+3ptI2g67mOGrcNuiv5j9p+ow7aaquz7Ka1NOup
         0LQ9fmGivICuFX7jFV3Q/SbgmdJafjISssf7OCbQ8OA2M4kMsSsrgBwPDCvOaabC2hXw
         ObfA==
X-Gm-Message-State: AOAM532+O+BcbguhDcnGN5okn0mMXJuplrZSxbrQXv8aM134RgM/UsRq
        b+C2iO5j+xbZHWl5v4wgPOez
X-Google-Smtp-Source: ABdhPJxqCdE0RY8urVWkfAPQnev4H5vsDjrcWdxmzI+e5lpvFntQXK3PYt3LVXt0qYLcBRZUAXX65A==
X-Received: by 2002:a17:902:6847:b029:d3:d44c:3c7b with SMTP id f7-20020a1709026847b02900d3d44c3c7bmr18911981pln.53.1602425367277;
        Sun, 11 Oct 2020 07:09:27 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:28d:c562:841e:ecfd:8468:c018])
        by smtp.gmail.com with ESMTPSA id d6sm16340396pjr.51.2020.10.11.07.09.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Oct 2020 07:09:26 -0700 (PDT)
Date:   Sun, 11 Oct 2020 19:39:20 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org
Subject: Re: [PATCH 2/3] i2c: owl: Add support for atomic transfers
Message-ID: <20201011140920.GB4971@Mani-XPS-13-9360>
References: <cover.1602190168.git.cristian.ciocaltea@gmail.com>
 <1af37112fafd6cf069dfe864560f77996f57d80d.1602190168.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1af37112fafd6cf069dfe864560f77996f57d80d.1602190168.git.cristian.ciocaltea@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Oct 09, 2020 at 12:44:40AM +0300, Cristian Ciocaltea wrote:
> Atomic transfers are required to properly power off a machine through
> an I2C controlled PMIC, such as the Actions Semi ATC260x series.
> 
> System shutdown may happen with interrupts being disabled and, as a
> consequence, the kernel may hang if the driver does not support atomic
> transfers.
> 
> This functionality is essentially implemented by polling the FIFO
> Status register until either Command Execute Completed or NACK Error
> bits are set.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/i2c/busses/i2c-owl.c | 76 ++++++++++++++++++++++++++----------
>  1 file changed, 56 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
> index a163b8f308c1..547132768119 100644
> --- a/drivers/i2c/busses/i2c-owl.c
> +++ b/drivers/i2c/busses/i2c-owl.c
> @@ -14,6 +14,7 @@
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  
> @@ -76,6 +77,7 @@
>  #define OWL_I2C_FIFOCTL_TFR	BIT(2)
>  
>  /* I2Cc_FIFOSTAT Bit Mask */
> +#define OWL_I2C_FIFOSTAT_CECB	BIT(0)
>  #define OWL_I2C_FIFOSTAT_RNB	BIT(1)
>  #define OWL_I2C_FIFOSTAT_RFE	BIT(2)
>  #define OWL_I2C_FIFOSTAT_TFF	BIT(5)
> @@ -83,7 +85,8 @@
>  #define OWL_I2C_FIFOSTAT_RFD	GENMASK(15, 8)
>  
>  /* I2C bus timeout */
> -#define OWL_I2C_TIMEOUT		msecs_to_jiffies(4 * 1000)
> +#define OWL_I2C_TIMEOUT_MS	(4 * 1000)
> +#define OWL_I2C_TIMEOUT		msecs_to_jiffies(OWL_I2C_TIMEOUT_MS)
>  
>  #define OWL_I2C_MAX_RETRIES	50
>  
> @@ -161,15 +164,11 @@ static void owl_i2c_set_freq(struct owl_i2c_dev *i2c_dev)
>  	writel(OWL_I2C_DIV_FACTOR(val), i2c_dev->base + OWL_I2C_REG_CLKDIV);
>  }
>  
> -static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
> +static void owl_i2c_xfer_data(struct owl_i2c_dev *i2c_dev)
>  {
> -	struct owl_i2c_dev *i2c_dev = _dev;
>  	struct i2c_msg *msg = i2c_dev->msg;
> -	unsigned long flags;
>  	unsigned int stat, fifostat;
>  
> -	spin_lock_irqsave(&i2c_dev->lock, flags);
> -
>  	i2c_dev->err = 0;
>  
>  	/* Handle NACK from slave */
> @@ -179,7 +178,7 @@ static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
>  		/* Clear NACK error bit by writing "1" */
>  		owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_FIFOSTAT,
>  				   OWL_I2C_FIFOSTAT_RNB, true);
> -		goto stop;
> +		return;
>  	}
>  
>  	/* Handle bus error */
> @@ -189,7 +188,7 @@ static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
>  		/* Clear BUS error bit by writing "1" */
>  		owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_STAT,
>  				   OWL_I2C_STAT_BEB, true);
> -		goto stop;
> +		return;
>  	}
>  
>  	/* Handle FIFO read */
> @@ -207,13 +206,23 @@ static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
>  			       i2c_dev->base + OWL_I2C_REG_TXDAT);
>  		}
>  	}
> +}
> +
> +static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
> +{
> +	struct owl_i2c_dev *i2c_dev = _dev;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&i2c_dev->lock, flags);
> +
> +	owl_i2c_xfer_data(i2c_dev);
>  
> -stop:
>  	/* Clear pending interrupts */
>  	owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_STAT,
>  			   OWL_I2C_STAT_IRQP, true);
>  
>  	complete_all(&i2c_dev->msg_complete);
> +
>  	spin_unlock_irqrestore(&i2c_dev->lock, flags);
>  
>  	return IRQ_HANDLED;
> @@ -241,8 +250,8 @@ static int owl_i2c_check_bus_busy(struct i2c_adapter *adap)
>  	return 0;
>  }
>  
> -static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> -			       int num)
> +static int owl_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg *msgs,
> +			       int num, bool atomic)
>  {
>  	struct owl_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
>  	struct i2c_msg *msg;
> @@ -286,11 +295,12 @@ static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  		goto err_exit;
>  	}
>  
> -	reinit_completion(&i2c_dev->msg_complete);
> +	if (!atomic)
> +		reinit_completion(&i2c_dev->msg_complete);
>  
> -	/* Enable I2C controller interrupt */
> +	/* Enable/disable I2C controller interrupt */
>  	owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_CTL,
> -			   OWL_I2C_CTL_IRQE, true);
> +			   OWL_I2C_CTL_IRQE, !atomic);
>  
>  	/*
>  	 * Select: FIFO enable, Master mode, Stop enable, Data count enable,
> @@ -358,20 +368,33 @@ static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  
>  	spin_unlock_irqrestore(&i2c_dev->lock, flags);
>  
> -	time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
> -						adap->timeout);
> +	if (atomic) {
> +		/* Wait for Command Execute Completed or NACK Error bits */
> +		ret = readl_poll_timeout_atomic(i2c_dev->base + OWL_I2C_REG_FIFOSTAT,
> +						val, val & (OWL_I2C_FIFOSTAT_CECB |
> +							    OWL_I2C_FIFOSTAT_RNB),
> +						10, OWL_I2C_TIMEOUT_MS * 1000);
> +	} else {
> +		time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
> +							adap->timeout);
> +		if (!time_left)
> +			ret = -ETIMEDOUT;
> +	}
>  
>  	spin_lock_irqsave(&i2c_dev->lock, flags);
> -	if (time_left == 0) {
> +
> +	if (ret) {
>  		dev_err(&adap->dev, "Transaction timed out\n");
>  		/* Send stop condition and release the bus */
>  		owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_CTL,
>  				   OWL_I2C_CTL_GBCC_STOP | OWL_I2C_CTL_RB,
>  				   true);
> -		ret = -ETIMEDOUT;
>  		goto err_exit;
>  	}
>  
> +	if (atomic)
> +		owl_i2c_xfer_data(i2c_dev);
> +
>  	ret = i2c_dev->err < 0 ? i2c_dev->err : num;
>  
>  err_exit:
> @@ -385,9 +408,22 @@ static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  	return ret;
>  }
>  
> +static int owl_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> +			int num)
> +{
> +	return owl_i2c_xfer_common(adap, msgs, num, false);
> +}
> +
> +static int owl_i2c_xfer_atomic(struct i2c_adapter *adap,
> +			       struct i2c_msg *msgs, int num)
> +{
> +	return owl_i2c_xfer_common(adap, msgs, num, true);
> +}
> +
>  static const struct i2c_algorithm owl_i2c_algorithm = {
> -	.master_xfer    = owl_i2c_master_xfer,
> -	.functionality  = owl_i2c_func,
> +	.master_xfer	     = owl_i2c_xfer,
> +	.master_xfer_atomic  = owl_i2c_xfer_atomic,
> +	.functionality	     = owl_i2c_func,
>  };
>  
>  static const struct i2c_adapter_quirks owl_i2c_quirks = {
> -- 
> 2.28.0
> 
