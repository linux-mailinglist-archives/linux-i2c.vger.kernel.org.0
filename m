Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD28A263413
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 19:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730400AbgIIROJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 13:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730252AbgIIPa1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Sep 2020 11:30:27 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 139E5C0619C6
        for <linux-i2c@vger.kernel.org>; Wed,  9 Sep 2020 08:17:59 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id q4so1483915pjh.5
        for <linux-i2c@vger.kernel.org>; Wed, 09 Sep 2020 08:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lxomaUFyGRKilrUFZcIY7/bWZldlI+e6WC4qMP3FId4=;
        b=HE090ecSFk0jzOjOcs6/fwBeViGwXTCfW0N5H7NrQqD2XUh03p5pyhh8OP85BT68cs
         FPUrRQlw3bOkeSbD8JAo7ZBL+pdRnv+qAQlhTliaouwO8x4zfMrsr4KSDBqUsbtCduyu
         PKrVmvqSeA1ygJQDKRU8Aqf/K/N51oePA2KAD2TzY6SqxPrzuvmvydydwLaCtIKBJRYl
         9ocpspgIxNoU/O2wnvxmbWIZWglG1C2EWJXrmQseljkVb84nCbUdx6i9sprXsuXAbbwD
         pDtvc/QDeFwSkq7hMYgoVOUgD229P5+2xdR0SO+c6UyNNKhfaVifhRC0zmpUbEvLSrIO
         n/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lxomaUFyGRKilrUFZcIY7/bWZldlI+e6WC4qMP3FId4=;
        b=PY4k1VGa9zwL7UREhCHTpv27Cj1FdiJi/omI36iHHGHi1fobnCC54pGkw89y5Lx6/S
         kd8j0q16gQPM0tgJAMiH1i/x6nN5wwYbxw/vP6yYXit76yXEEKqx8mNojmcQGnm67aBK
         dTGeQua7cRHJCWjpH5oYqFozEskOx8EXMk+lgx135UD65TZF9sjmQ6uR3inonjYG3rP/
         yKuR1XqkCa2Cy8RxiM/9tuq1kmDrdoUbAxKdPDesHIG3G1FskemiI1YAfbVb4/7u73c2
         yTY+b2nmsknDVhiqXxnoNAiBOcHbJ+Pio0IfAo0tm76qtMORJb2UU3AA33MOXbIIrfIY
         P+zw==
X-Gm-Message-State: AOAM531ApUBU8m9k6tsY8ni8buS2S/WOSPmOXA/x0Rr7C/IIjiiWYIKb
        lr4QkjZ8s68JCfYFwGsSKZQ0
X-Google-Smtp-Source: ABdhPJz5l8ASUIYFWoL+Bh+kYA7MFXJLFKpN2/ESElpCSb9/x5e2GdY86jK3ovB1ujjsBKK4/36nkA==
X-Received: by 2002:a17:90b:1211:: with SMTP id gl17mr1256048pjb.87.1599664676371;
        Wed, 09 Sep 2020 08:17:56 -0700 (PDT)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id s20sm3144816pfu.112.2020.09.09.08.17.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Sep 2020 08:17:55 -0700 (PDT)
Date:   Wed, 9 Sep 2020 20:47:48 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org
Subject: Re: [PATCH v2 1/1] i2c: busses: Add support for atomic transfers in
 Actions Semi Owl driver
Message-ID: <20200909151748.GA11397@mani>
References: <b6c56858854805b0f03e29b7dde40b20796d5c93.1599561278.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6c56858854805b0f03e29b7dde40b20796d5c93.1599561278.git.cristian.ciocaltea@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Cristi,

On 0908, Cristian Ciocaltea wrote:
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

Thanks for the patch! I just have couple of minor comments and other
than that it looks good to me.

> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> ---
> Changes in v2:
>  - Dropped unused return codes from owl_i2c_xfer_data(), per Mani's review
>  - Rebased patch on v5.9-rc4
> 
>  drivers/i2c/busses/i2c-owl.c | 78 ++++++++++++++++++++++++++----------
>  1 file changed, 57 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
> index 672f1f239bd6..29605257831f 100644
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
> @@ -161,29 +164,25 @@ static void owl_i2c_set_freq(struct owl_i2c_dev *i2c_dev)
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
>  	fifostat = readl(i2c_dev->base + OWL_I2C_REG_FIFOSTAT);
>  	if (fifostat & OWL_I2C_FIFOSTAT_RNB) {
>  		i2c_dev->err = -ENXIO;
> -		goto stop;
> +		return;
>  	}
>  
>  	/* Handle bus error */
>  	stat = readl(i2c_dev->base + OWL_I2C_REG_STAT);
>  	if (stat & OWL_I2C_STAT_BEB) {
>  		i2c_dev->err = -EIO;
> -		goto stop;
> +		return;
>  	}
>  
>  	/* Handle FIFO read */
> @@ -196,18 +195,28 @@ static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
>  	} else {
>  		/* Handle the remaining bytes which were not sent */
>  		while (!(readl(i2c_dev->base + OWL_I2C_REG_FIFOSTAT) &
> -			 OWL_I2C_FIFOSTAT_TFF) && i2c_dev->msg_ptr < msg->len) {
> +			OWL_I2C_FIFOSTAT_TFF) && i2c_dev->msg_ptr < msg->len) {

Spurious change?

>  			writel(msg->buf[i2c_dev->msg_ptr++],
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
> @@ -235,8 +244,8 @@ static int owl_i2c_check_bus_busy(struct i2c_adapter *adap)
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
> @@ -280,11 +289,12 @@ static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
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
> @@ -352,20 +362,33 @@ static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
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

You are not clearing the pending interrupts here.

Thanks,
Mani

> +
>  	ret = i2c_dev->err < 0 ? i2c_dev->err : num;
>  
>  err_exit:
> @@ -379,9 +402,22 @@ static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
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
