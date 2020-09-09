Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC0B26333B
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 19:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730717AbgIIQ75 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 12:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbgIIQ7U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Sep 2020 12:59:20 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5887C061573;
        Wed,  9 Sep 2020 09:59:19 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id e23so4613344eja.3;
        Wed, 09 Sep 2020 09:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NITVXCSl7BVc2dfQjN50vkiAOcxU13M8Ih81Zr5I7gQ=;
        b=YC40ozP4sGC5QRnYvmmYNQ5JO0QQp2itLrYd3m6uP0JHUhgxgxEJJi3Dqbyku03Ine
         OgpVXumYCpc1Xn+g/WLBJTSZapgu5daSvBVi7GOsPvcpPwLUQU8QFtkKkwGepcLxsvZI
         vsTJLAM+Ke6WEyxZKymRvsn/MiERg3/aIrtTmux3mjN7DOpGI7iRfTAKUfnvM1lFCF6j
         3VyBuFTJzc3BAL+9CIF1GJM9NJlEPUGIsGBKEePLwgSrefWwc0wcbJK2HASdgXazcVu/
         07psxDzFkByTSJFLZjmToS/WXk3EpNYJIh6NKR5uU5U+5n9LbzNsodF5LV1ZUMC29rhR
         v0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NITVXCSl7BVc2dfQjN50vkiAOcxU13M8Ih81Zr5I7gQ=;
        b=g/Ivk4MSi3PNDj3OyBRYxf5/JLBt20GR+sQg3IZ0ylMu9UU4UWLdfVVJpG2YipUm8k
         Scx5K9hE1IeRAxqfvCsZqwSvkbpQkVSaQ2Cfy7XH6sr9wW6N4Cn4eUzTLnq/L7/zASft
         tdrzNTaKPj7fozhjcOvOFI/6iZD14xbD/pauYcBG6ABNjmLXaZ5LVXYgWHOQdqvpIpRr
         6VfeuDMxDfxwVlo2fuULkqLuLQzhkuXhbVtqgiI/NsEnnunWEdx9oOQAaxYpIvY9rCw7
         x9OvmHps8Fal7zU0XAxZh3kdg27egVFBGLeODqCasxCLPt/4vgaqyoAb4rlT3E5Pu4dd
         d3IA==
X-Gm-Message-State: AOAM530I4SrH5jhqioT1BqxhaIsO8iYKOZBMh7VVITVDWoNmgHnohgpO
        fY34SfyD8hJ26In+KQek3mNmiiDQNCY=
X-Google-Smtp-Source: ABdhPJw6bVr07ndZxCr+L3dt0opUMVl6GpBDrfsPHR1WcT+kRUvOQYCI5akYSTv0q1AfUwohb25P5A==
X-Received: by 2002:a17:906:bcd5:: with SMTP id lw21mr4629548ejb.430.1599670758387;
        Wed, 09 Sep 2020 09:59:18 -0700 (PDT)
Received: from BV030612LT ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id a5sm3113455edl.6.2020.09.09.09.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 09:59:17 -0700 (PDT)
Date:   Wed, 9 Sep 2020 19:59:15 +0300
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org
Subject: Re: [PATCH v2 1/1] i2c: busses: Add support for atomic transfers in
 Actions Semi Owl driver
Message-ID: <20200909165915.GA387239@BV030612LT>
References: <b6c56858854805b0f03e29b7dde40b20796d5c93.1599561278.git.cristian.ciocaltea@gmail.com>
 <20200909151748.GA11397@mani>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909151748.GA11397@mani>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mani,

Thanks for the review!

On Wed, Sep 09, 2020 at 08:47:48PM +0530, Manivannan Sadhasivam wrote:
> Hi Cristi,
> 
> On 0908, Cristian Ciocaltea wrote:
> > Atomic transfers are required to properly power off a machine through
> > an I2C controlled PMIC, such as the Actions Semi ATC260x series.
> > 
> > System shutdown may happen with interrupts being disabled and, as a
> > consequence, the kernel may hang if the driver does not support atomic
> > transfers.
> > 
> > This functionality is essentially implemented by polling the FIFO
> > Status register until either Command Execute Completed or NACK Error
> > bits are set.
> > 
> 
> Thanks for the patch! I just have couple of minor comments and other
> than that it looks good to me.
> 
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> > ---
> > Changes in v2:
> >  - Dropped unused return codes from owl_i2c_xfer_data(), per Mani's review
> >  - Rebased patch on v5.9-rc4
> > 
> >  drivers/i2c/busses/i2c-owl.c | 78 ++++++++++++++++++++++++++----------
> >  1 file changed, 57 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
> > index 672f1f239bd6..29605257831f 100644
> > --- a/drivers/i2c/busses/i2c-owl.c
> > +++ b/drivers/i2c/busses/i2c-owl.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/i2c.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/io.h>
> > +#include <linux/iopoll.h>
> >  #include <linux/module.h>
> >  #include <linux/of_device.h>
> >  
> > @@ -76,6 +77,7 @@
> >  #define OWL_I2C_FIFOCTL_TFR	BIT(2)
> >  
> >  /* I2Cc_FIFOSTAT Bit Mask */
> > +#define OWL_I2C_FIFOSTAT_CECB	BIT(0)
> >  #define OWL_I2C_FIFOSTAT_RNB	BIT(1)
> >  #define OWL_I2C_FIFOSTAT_RFE	BIT(2)
> >  #define OWL_I2C_FIFOSTAT_TFF	BIT(5)
> > @@ -83,7 +85,8 @@
> >  #define OWL_I2C_FIFOSTAT_RFD	GENMASK(15, 8)
> >  
> >  /* I2C bus timeout */
> > -#define OWL_I2C_TIMEOUT		msecs_to_jiffies(4 * 1000)
> > +#define OWL_I2C_TIMEOUT_MS	(4 * 1000)
> > +#define OWL_I2C_TIMEOUT		msecs_to_jiffies(OWL_I2C_TIMEOUT_MS)
> >  
> >  #define OWL_I2C_MAX_RETRIES	50
> >  
> > @@ -161,29 +164,25 @@ static void owl_i2c_set_freq(struct owl_i2c_dev *i2c_dev)
> >  	writel(OWL_I2C_DIV_FACTOR(val), i2c_dev->base + OWL_I2C_REG_CLKDIV);
> >  }
> >  
> > -static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
> > +static void owl_i2c_xfer_data(struct owl_i2c_dev *i2c_dev)
> >  {
> > -	struct owl_i2c_dev *i2c_dev = _dev;
> >  	struct i2c_msg *msg = i2c_dev->msg;
> > -	unsigned long flags;
> >  	unsigned int stat, fifostat;
> >  
> > -	spin_lock_irqsave(&i2c_dev->lock, flags);
> > -
> >  	i2c_dev->err = 0;
> >  
> >  	/* Handle NACK from slave */
> >  	fifostat = readl(i2c_dev->base + OWL_I2C_REG_FIFOSTAT);
> >  	if (fifostat & OWL_I2C_FIFOSTAT_RNB) {
> >  		i2c_dev->err = -ENXIO;
> > -		goto stop;
> > +		return;
> >  	}
> >  
> >  	/* Handle bus error */
> >  	stat = readl(i2c_dev->base + OWL_I2C_REG_STAT);
> >  	if (stat & OWL_I2C_STAT_BEB) {
> >  		i2c_dev->err = -EIO;
> > -		goto stop;
> > +		return;
> >  	}
> >  
> >  	/* Handle FIFO read */
> > @@ -196,18 +195,28 @@ static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
> >  	} else {
> >  		/* Handle the remaining bytes which were not sent */
> >  		while (!(readl(i2c_dev->base + OWL_I2C_REG_FIFOSTAT) &
> > -			 OWL_I2C_FIFOSTAT_TFF) && i2c_dev->msg_ptr < msg->len) {
> > +			OWL_I2C_FIFOSTAT_TFF) && i2c_dev->msg_ptr < msg->len) {
> 
> Spurious change?

I have just fixed a small indentation issue (removed extra space char
in front of OWL_I2C...). I will revert it if you think it's not the right
context for doing this (located ~10 lines bellow the previous edit).

> >  			writel(msg->buf[i2c_dev->msg_ptr++],
> >  			       i2c_dev->base + OWL_I2C_REG_TXDAT);
> >  		}
> >  	}
> > +}
> > +
> > +static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
> > +{
> > +	struct owl_i2c_dev *i2c_dev = _dev;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&i2c_dev->lock, flags);
> > +
> > +	owl_i2c_xfer_data(i2c_dev);
> >  
> > -stop:
> >  	/* Clear pending interrupts */
> >  	owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_STAT,
> >  			   OWL_I2C_STAT_IRQP, true);
> >  
> >  	complete_all(&i2c_dev->msg_complete);
> > +
> >  	spin_unlock_irqrestore(&i2c_dev->lock, flags);
> >  
> >  	return IRQ_HANDLED;
> > @@ -235,8 +244,8 @@ static int owl_i2c_check_bus_busy(struct i2c_adapter *adap)
> >  	return 0;
> >  }
> >  
> > -static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> > -			       int num)
> > +static int owl_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg *msgs,
> > +			       int num, bool atomic)
> >  {
> >  	struct owl_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
> >  	struct i2c_msg *msg;
> > @@ -280,11 +289,12 @@ static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> >  		goto err_exit;
> >  	}
> >  
> > -	reinit_completion(&i2c_dev->msg_complete);
> > +	if (!atomic)
> > +		reinit_completion(&i2c_dev->msg_complete);
> >  
> > -	/* Enable I2C controller interrupt */
> > +	/* Enable/disable I2C controller interrupt */
> >  	owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_CTL,
> > -			   OWL_I2C_CTL_IRQE, true);
> > +			   OWL_I2C_CTL_IRQE, !atomic);
> >  
> >  	/*
> >  	 * Select: FIFO enable, Master mode, Stop enable, Data count enable,
> > @@ -352,20 +362,33 @@ static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> >  
> >  	spin_unlock_irqrestore(&i2c_dev->lock, flags);
> >  
> > -	time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
> > -						adap->timeout);
> > +	if (atomic) {
> > +		/* Wait for Command Execute Completed or NACK Error bits */
> > +		ret = readl_poll_timeout_atomic(i2c_dev->base + OWL_I2C_REG_FIFOSTAT,
> > +						val, val & (OWL_I2C_FIFOSTAT_CECB |
> > +							    OWL_I2C_FIFOSTAT_RNB),
> > +						10, OWL_I2C_TIMEOUT_MS * 1000);
> > +	} else {
> > +		time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
> > +							adap->timeout);
> > +		if (!time_left)
> > +			ret = -ETIMEDOUT;
> > +	}
> >  
> >  	spin_lock_irqsave(&i2c_dev->lock, flags);
> > -	if (time_left == 0) {
> > +
> > +	if (ret) {
> >  		dev_err(&adap->dev, "Transaction timed out\n");
> >  		/* Send stop condition and release the bus */
> >  		owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_CTL,
> >  				   OWL_I2C_CTL_GBCC_STOP | OWL_I2C_CTL_RB,
> >  				   true);
> > -		ret = -ETIMEDOUT;
> >  		goto err_exit;
> >  	}
> >  
> > +	if (atomic)
> > +		owl_i2c_xfer_data(i2c_dev);
> 
> You are not clearing the pending interrupts here.

I assumed this is not needed for atomic contexts since the controller
interrupt is disabled (please see the comment above: Enable/disable I2C
controller interrupt).

Otherwise I will simply move the clear pending interrupts code from 
owl_i2c_interrupt() to owl_i2c_xfer_data().

> Thanks,
> Mani
> 
> > +
> >  	ret = i2c_dev->err < 0 ? i2c_dev->err : num;
> >  
> >  err_exit:
> > @@ -379,9 +402,22 @@ static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> >  	return ret;
> >  }
> >  
> > +static int owl_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> > +			int num)
> > +{
> > +	return owl_i2c_xfer_common(adap, msgs, num, false);
> > +}
> > +
> > +static int owl_i2c_xfer_atomic(struct i2c_adapter *adap,
> > +			       struct i2c_msg *msgs, int num)
> > +{
> > +	return owl_i2c_xfer_common(adap, msgs, num, true);
> > +}
> > +
> >  static const struct i2c_algorithm owl_i2c_algorithm = {
> > -	.master_xfer    = owl_i2c_master_xfer,
> > -	.functionality  = owl_i2c_func,
> > +	.master_xfer	     = owl_i2c_xfer,
> > +	.master_xfer_atomic  = owl_i2c_xfer_atomic,
> > +	.functionality	     = owl_i2c_func,
> >  };
> >  
> >  static const struct i2c_adapter_quirks owl_i2c_quirks = {
> > -- 
> > 2.28.0
> > 

Kind regards,
Cristi
