Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0F202560EF
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Aug 2020 21:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbgH1TCT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Aug 2020 15:02:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgH1TCR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Aug 2020 15:02:17 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF01C061264;
        Fri, 28 Aug 2020 12:01:45 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id i17so23006edx.12;
        Fri, 28 Aug 2020 12:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=spC9lTnsRljSoai893DjFjRCs6gaK6sA3q4tyRdTCgA=;
        b=N1NWfxnhbGcLD4pR4yA55lHO0YJGf/zxalK02BOdgVZyfsDxXGNJ3FdRovhTeXJHrf
         s766/nmYckGGFYNWyqQTR71E+Jr+XrcVF6ZDwIBfMv2oQOifzRY0n2bFmD3GVkCSs1df
         aSEQcbnCXOwt+Nc3iKBVOB1pp7/6qg/XcWJ1TAFnuV6q/yi/790PNmISe0euOyVx4u7L
         Pfv2oFq1uabD6aNCCogM8PcLLUEeeZCO8/z+RZSIrafNFOSy7yqHqZEBP63sVsysj67e
         3AhupqM8ASDoVH6HInIcCWmvzUqQ40BT76yNMUGGlaanMvy5+0U02A++6Km5W8aoLS+9
         r0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=spC9lTnsRljSoai893DjFjRCs6gaK6sA3q4tyRdTCgA=;
        b=ddqH0Qo3U9v4r3UlPEzSvrfCzvDrNar1C1NStqs3j5PzTQC5uc2MOBjUExLJsEaMRt
         I4vMavCOwab/doAbGxHQTdcCTId1j+l4GpTLwOpGo0NFfRSj+PEJacZpdTXfx31DLDVR
         4jwCTyRVxxvO3/AuZL8Ni9js0GU0N380HjaNnrdVt+rWfyjn0GYsZpNBdBSBET16mJMI
         naoZmZGHUgO28AC7yz3K0Gqlu+VBkC8BpO3BcpFQ/9mesS4mRjtHaZj9hKbzx8joTUvT
         N2ti0x5saIoRHq490iHCnSy2WH+Kav/dqun6nVwWP819c6SEPFDIUvQNTRdB9eZeSFF6
         A9KQ==
X-Gm-Message-State: AOAM531sNJNJp1101/qnxOEwwY/OAEy+IUWXghynSfmt98Lp8y5KeH+l
        IRt4iyCpHEyBcB70X8ZR8W0=
X-Google-Smtp-Source: ABdhPJzKP7TG5o7eM5x+7uCrtE23tSZ+l1ym6nzP4vIZ6PmMK3nIejdMg2Zw6Pd+gybOP+GMu8fwCg==
X-Received: by 2002:a50:fb99:: with SMTP id e25mr117126edq.281.1598641303994;
        Fri, 28 Aug 2020 12:01:43 -0700 (PDT)
Received: from BV030612LT ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id r26sm74168eds.79.2020.08.28.12.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 12:01:42 -0700 (PDT)
Date:   Fri, 28 Aug 2020 22:01:40 +0300
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org
Subject: Re: [PATCH 1/1] i2c: busses: Add support for atomic transfers in
 Actions Semi Owl driver
Message-ID: <20200828190140.GA2545846@BV030612LT>
References: <b086ef6d355d9730c839359e15eb06175283e323.1596485741.git.cristian.ciocaltea@gmail.com>
 <20200828130404.GB17309@mani>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828130404.GB17309@mani>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mani,

Thanks for the review!

On Fri, Aug 28, 2020 at 06:34:04PM +0530, Manivannan Sadhasivam wrote:
> On 0803, Cristian Ciocaltea wrote:
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
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-owl.c | 80 ++++++++++++++++++++++++++----------
> >  1 file changed, 59 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
> > index 672f1f239bd6..90dd2e814313 100644
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
> > +static int owl_i2c_xfer_data(struct owl_i2c_dev *i2c_dev)
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
> > +		return 1;
> 
> This looks odd! And moreover you're not making use of this return value
> anywhere.

You are right, that's just a leftover from my initial implementation
and I totally missed it when I did the final cleanup. Thanks for
spotting it!

> Thanks,
> Mani

If there is nothing else, I can submit the revised patch.

Regards,
Cristi

> >  	}
> >  
> >  	/* Handle bus error */
> >  	stat = readl(i2c_dev->base + OWL_I2C_REG_STAT);
> >  	if (stat & OWL_I2C_STAT_BEB) {
> >  		i2c_dev->err = -EIO;
> > -		goto stop;
> > +		return 1;
> >  	}
> >  
> >  	/* Handle FIFO read */
> > @@ -196,18 +195,30 @@ static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
> >  	} else {
> >  		/* Handle the remaining bytes which were not sent */
> >  		while (!(readl(i2c_dev->base + OWL_I2C_REG_FIFOSTAT) &
> > -			 OWL_I2C_FIFOSTAT_TFF) && i2c_dev->msg_ptr < msg->len) {
> > +			OWL_I2C_FIFOSTAT_TFF) && i2c_dev->msg_ptr < msg->len) {
> >  			writel(msg->buf[i2c_dev->msg_ptr++],
> >  			       i2c_dev->base + OWL_I2C_REG_TXDAT);
> >  		}
> >  	}
> >  
> > -stop:
> > +	return 0;
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
> > +
> >  	/* Clear pending interrupts */
> >  	owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_STAT,
> >  			   OWL_I2C_STAT_IRQP, true);
> >  
> >  	complete_all(&i2c_dev->msg_complete);
> > +
> >  	spin_unlock_irqrestore(&i2c_dev->lock, flags);
> >  
> >  	return IRQ_HANDLED;
> > @@ -235,8 +246,8 @@ static int owl_i2c_check_bus_busy(struct i2c_adapter *adap)
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
> > @@ -280,11 +291,12 @@ static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
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
> > @@ -352,20 +364,33 @@ static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
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
> > +
> >  	ret = i2c_dev->err < 0 ? i2c_dev->err : num;
> >  
> >  err_exit:
> > @@ -379,9 +404,22 @@ static int owl_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
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
