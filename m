Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81A39D6BC5
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2019 00:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfJNWxI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Oct 2019 18:53:08 -0400
Received: from mail.kmu-office.ch ([178.209.48.109]:32902 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfJNWxH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Oct 2019 18:53:07 -0400
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
        by mail.kmu-office.ch (Postfix) with ESMTPSA id D2B375C2B8E;
        Tue, 15 Oct 2019 00:53:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
        t=1571093582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0ikWvkfhOc4sgAuTFnYkPeFJJI5YHkbKrwEKsY0DxWg=;
        b=b3TREBCyg7Ie12QOPqe071B3pYMbqWPZsRJtUThrCLUvwRehB0XTGskv5eJ3CvlMmbiD7Y
        4DHIRdpyYBB5alQgnoqajYvan+AMRzKFmSc8GSba5q0sWNuY6tv9KfGkBhMKvxqmMC7U76
        fy1Spnv6AS96srFmlmKiqX7akrWDg4k=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date:   Tue, 15 Oct 2019 00:53:02 +0200
From:   Stefan Agner <stefan@agner.ch>
To:     Stefan Lengfeld <contact@stefanchrist.eu>
Cc:     linux-i2c@vger.kernel.org, wsa+renesas@sang-engineering.com,
        linux-i2c-owner@vger.kernel.org, s.riedmueller@phytec.de
Subject: Re: [RFC PATCH 3/3] i2c: imx: implement master_xfer_atomic callback
In-Reply-To: <20190415213432.8972-4-contact@stefanchrist.eu>
References: <20190403124019.8947-1-wsa+renesas@sang-engineering.com>
 <20190415213432.8972-1-contact@stefanchrist.eu>
 <20190415213432.8972-4-contact@stefanchrist.eu>
Message-ID: <1a7f76f33460dd75c52b95a3a9354817@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all Stefans, :-)

From the other thread:
> Currently, no.
> 
> I'm doing the kernel work voluntary in my spare time and right now there
> is not much free time left. I did not submit my master_xfer_atomic patch
> for the i.MX driver, because I feared breaking the DMA path or other
> non-i.MX6 platforms for that driver.

Does not look to bad from what I can tell.

> So if you like to invest some time to polish the patch or rewrite it
> completely, feel free to do it. If you submit a patch for review, I
> would definitely find some time to test it on my i.MX6 boards and give
> my Tested-by.
> 
> I'm also cc'ing Stefan Riedmueller, because he is currently maintaining
> the i.MX6 boards at Phytec and is maybe also interested in upstreaming
> the code.

Not sure yet I can find the time to pick it up. Just looked through the
code and saw some things I probably would look at/address.


On 2019-04-15 23:34, Stefan Lengfeld wrote:
> Rework the read and write code paths in the driver to support operation
> in atomic contexts. To achieve this, the driver must not rely on IRQs
> and not call schedule(), e.g. via a sleep routine, in these cases.
> 
> With this patch the driver supports normal operation, DMA transfers and
> now the polling mode or also called sleep-free or IRQ-less operation. It
> makes the code not simpler or easier to read, but atomic I2C transfers
> are needed on some hardware configurations, e.g. to trigger reboots on
> an external PMIC chip.
> 
> The patch is tested on a phyCORE-i.MX6 Solo board.
> 
> Signed-off-by: Stefan Lengfeld <contact@stefanchrist.eu>
> ---
>  drivers/i2c/busses/i2c-imx.c | 128 +++++++++++++++++++++++++----------
>  1 file changed, 93 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 42fed40198a0..180d803007aa 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -409,7 +409,7 @@ static void i2c_imx_dma_free(struct imx_i2c_struct *i2c_imx)
>  	dma->chan_using = NULL;
>  }
>  
> -static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy)
> +static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int
> for_busy, bool atomic)
>  {
>  	unsigned long orig_jiffies = jiffies;
>  	unsigned int temp;
> @@ -439,15 +439,39 @@ static int i2c_imx_bus_busy(struct
> imx_i2c_struct *i2c_imx, int for_busy)
>  				"<%s> I2C bus is busy\n", __func__);
>  			return -ETIMEDOUT;
>  		}
> -		schedule();
> +		if (!atomic)
> +			schedule();
> +		else
> +			udelay(100);
>  	}
>  
>  	return 0;
>  }
>  
> -static int i2c_imx_trx_complete(struct imx_i2c_struct *i2c_imx)
> +static int i2c_imx_trx_complete(struct imx_i2c_struct *i2c_imx, bool atomic)
>  {
> -	wait_event_timeout(i2c_imx->queue, i2c_imx->i2csr & I2SR_IIF, HZ / 10);
> +	if (!atomic) {
> +		wait_event_timeout(i2c_imx->queue, i2c_imx->i2csr & I2SR_IIF, HZ / 10);
> +	} else {
> +		int counter = 0;
> +
> +		while (1) {
> +			unsigned int reg;
> +
> +			reg = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> +			i2c_imx->i2csr = reg;
> +			if (reg & I2SR_IIF)
> +				break;
> +
> +			if (counter > 1000) {
> +				dev_err(&i2c_imx->adapter.dev, "<%s> TXR timeout\n", __func__);
> +				return -EIO;
> +			}
> +			udelay(100);
> +			counter++;
> +		}
> +		imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2SR);

I think this can be done much nicer with readl_poll_timeout_atomic().

> +	}
>  
>  	if (unlikely(!(i2c_imx->i2csr & I2SR_IIF))) {
>  		dev_dbg(&i2c_imx->adapter.dev, "<%s> Timeout\n", __func__);
> @@ -525,7 +549,7 @@ static int i2c_imx_clk_notifier_call(struct
> notifier_block *nb,
>  	return NOTIFY_OK;
>  }
>  
> -static int i2c_imx_start(struct imx_i2c_struct *i2c_imx)
> +static int i2c_imx_start(struct imx_i2c_struct *i2c_imx, bool atomic)
>  {
>  	unsigned int temp = 0;
>  	int result;
> @@ -538,23 +562,32 @@ static int i2c_imx_start(struct imx_i2c_struct *i2c_imx)
>  	imx_i2c_write_reg(i2c_imx->hwdata->i2cr_ien_opcode, i2c_imx, IMX_I2C_I2CR);
>  
>  	/* Wait controller to be stable */
> -	usleep_range(50, 150);
> +	if (!atomic)
> +		usleep_range(50, 150);
> +	else
> +		udelay(50);
>  
>  	/* Start I2C transaction */
>  	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>  	temp |= I2CR_MSTA;

Should we disable interrupts already here?

>  	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> -	result = i2c_imx_bus_busy(i2c_imx, 1);
> +	result = i2c_imx_bus_busy(i2c_imx, 1, atomic);
>  	if (result)
>  		return result;
>  
> -	temp |= I2CR_IIEN | I2CR_MTX | I2CR_TXAK;
> +	if (!atomic) {
> +		temp |= I2CR_IIEN | I2CR_MTX | I2CR_TXAK;
> +	} else {
> +		temp |= I2CR_MTX | I2CR_TXAK;
> +		temp &= ~I2CR_IIEN; /* Disable interrupt */
> +	}
> +
>  	temp &= ~I2CR_DMAEN;
>  	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
>  	return result;
>  }
>  
> -static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx)
> +static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx, bool atomic)
>  {
>  	unsigned int temp = 0;
>  
> @@ -576,7 +609,7 @@ static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx)
>  	}
>  
>  	if (!i2c_imx->stopped)
> -		i2c_imx_bus_busy(i2c_imx, 0);
> +		i2c_imx_bus_busy(i2c_imx, 0, atomic);
>  
>  	/* Disable I2C controller */
>  	temp = i2c_imx->hwdata->i2cr_ien_opcode ^ I2CR_IEN,
> @@ -657,7 +690,7 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
>  	/* The last data byte must be transferred by the CPU. */
>  	imx_i2c_write_reg(msgs->buf[msgs->len-1],
>  				i2c_imx, IMX_I2C_I2DR);
> -	result = i2c_imx_trx_complete(i2c_imx);
> +	result = i2c_imx_trx_complete(i2c_imx, false);
>  	if (result)
>  		return result;
>  
> @@ -716,7 +749,7 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
>  
>  	msgs->buf[msgs->len-2] = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
>  	/* read n byte data */
> -	result = i2c_imx_trx_complete(i2c_imx);
> +	result = i2c_imx_trx_complete(i2c_imx, false);
>  	if (result)
>  		return result;
>  
> @@ -729,7 +762,7 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
>  		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>  		temp &= ~(I2CR_MSTA | I2CR_MTX);
>  		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> -		i2c_imx_bus_busy(i2c_imx, 0);
> +		i2c_imx_bus_busy(i2c_imx, 0, false);
>  	} else {
>  		/*
>  		 * For i2c master receiver repeat restart operation like:
> @@ -747,7 +780,7 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
>  	return 0;
>  }
>  
> -static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs)
> +static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct
> i2c_msg *msgs, bool atomic)
>  {
>  	int i, result;
>  
> @@ -756,7 +789,7 @@ static int i2c_imx_write(struct imx_i2c_struct
> *i2c_imx, struct i2c_msg *msgs)
>  
>  	/* write slave address */
>  	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
> -	result = i2c_imx_trx_complete(i2c_imx);
> +	result = i2c_imx_trx_complete(i2c_imx, atomic);
>  	if (result)
>  		return result;
>  	result = i2c_imx_acked(i2c_imx);
> @@ -770,7 +803,7 @@ static int i2c_imx_write(struct imx_i2c_struct
> *i2c_imx, struct i2c_msg *msgs)
>  			"<%s> write byte: B%d=0x%X\n",
>  			__func__, i, msgs->buf[i]);
>  		imx_i2c_write_reg(msgs->buf[i], i2c_imx, IMX_I2C_I2DR);
> -		result = i2c_imx_trx_complete(i2c_imx);
> +		result = i2c_imx_trx_complete(i2c_imx, atomic);
>  		if (result)
>  			return result;
>  		result = i2c_imx_acked(i2c_imx);
> @@ -780,7 +813,7 @@ static int i2c_imx_write(struct imx_i2c_struct
> *i2c_imx, struct i2c_msg *msgs)
>  	return 0;
>  }
>  
> -static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct
> i2c_msg *msgs, bool is_lastmsg)
> +static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct
> i2c_msg *msgs, bool is_lastmsg, bool atomic)
>  {
>  	int i, result;
>  	unsigned int temp;
> @@ -793,7 +826,7 @@ static int i2c_imx_read(struct imx_i2c_struct
> *i2c_imx, struct i2c_msg *msgs, bo
>  
>  	/* write slave address */
>  	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
> -	result = i2c_imx_trx_complete(i2c_imx);
> +	result = i2c_imx_trx_complete(i2c_imx, atomic);
>  	if (result)
>  		return result;
>  	result = i2c_imx_acked(i2c_imx);
> @@ -826,7 +859,7 @@ static int i2c_imx_read(struct imx_i2c_struct
> *i2c_imx, struct i2c_msg *msgs, bo
>  	for (i = 0; i < msgs->len; i++) {
>  		u8 len = 0;
>  
> -		result = i2c_imx_trx_complete(i2c_imx);
> +		result = i2c_imx_trx_complete(i2c_imx, atomic);
>  		if (result)
>  			return result;
>  		/*
> @@ -854,7 +887,7 @@ static int i2c_imx_read(struct imx_i2c_struct
> *i2c_imx, struct i2c_msg *msgs, bo
>  				temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>  				temp &= ~(I2CR_MSTA | I2CR_MTX);
>  				imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> -				i2c_imx_bus_busy(i2c_imx, 0);
> +				i2c_imx_bus_busy(i2c_imx, 0, atomic);
>  			} else {
>  				/*
>  				 * For i2c master receiver repeat restart operation like:
> @@ -885,8 +918,8 @@ static int i2c_imx_read(struct imx_i2c_struct
> *i2c_imx, struct i2c_msg *msgs, bo
>  	return 0;
>  }
>  
> -static int i2c_imx_xfer(struct i2c_adapter *adapter,
> -						struct i2c_msg *msgs, int num)
> +static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
> +			       struct i2c_msg *msgs, int num, bool atomic)
>  {
>  	unsigned int i, temp;
>  	int result;
> @@ -900,11 +933,11 @@ static int i2c_imx_xfer(struct i2c_adapter *adapter,
>  		goto out;
>  
>  	/* Start I2C transfer */
> -	result = i2c_imx_start(i2c_imx);
> +	result = i2c_imx_start(i2c_imx, atomic);
>  	if (result) {
>  		if (i2c_imx->adapter.bus_recovery_info) {
>  			i2c_recover_bus(&i2c_imx->adapter);

Hm, it seems that the generic recovery mechanism uses
gpiod_get_value_cansleep, so we cannot allow to recover when using
atomic mode...

> -			result = i2c_imx_start(i2c_imx);
> +			result = i2c_imx_start(i2c_imx, atomic);
>  		}
>  	}
>  
> @@ -922,7 +955,7 @@ static int i2c_imx_xfer(struct i2c_adapter *adapter,
>  			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>  			temp |= I2CR_RSTA;
>  			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> -			result = i2c_imx_bus_busy(i2c_imx, 1);
> +			result = i2c_imx_bus_busy(i2c_imx, 1, atomic);
>  			if (result)
>  				goto fail0;
>  		}
> @@ -946,13 +979,17 @@ static int i2c_imx_xfer(struct i2c_adapter *adapter,
>  			(temp & I2SR_SRW ? 1 : 0), (temp & I2SR_IIF ? 1 : 0),
>  			(temp & I2SR_RXAK ? 1 : 0));
>  #endif
> -		if (msgs[i].flags & I2C_M_RD)
> -			result = i2c_imx_read(i2c_imx, &msgs[i], is_lastmsg);
> -		else {
> -			if (i2c_imx->dma && msgs[i].len >= DMA_THRESHOLD)
> -				result = i2c_imx_dma_write(i2c_imx, &msgs[i]);
> -			else
> -				result = i2c_imx_write(i2c_imx, &msgs[i]);
> +		if (msgs[i].flags & I2C_M_RD) {
> +			result = i2c_imx_read(i2c_imx, &msgs[i], is_lastmsg, atomic);
> +		} else {
> +			if (!atomic) {
> +				if (i2c_imx->dma && msgs[i].len >= DMA_THRESHOLD)
> +					result = i2c_imx_dma_write(i2c_imx, &msgs[i]);
> +				else
> +					result = i2c_imx_write(i2c_imx, &msgs[i], atomic);
> +			} else {
> +				result = i2c_imx_write(i2c_imx, &msgs[i], atomic);
> +			}
>  		}
>  		if (result)
>  			goto fail0;
> @@ -960,7 +997,7 @@ static int i2c_imx_xfer(struct i2c_adapter *adapter,
>  
>  fail0:
>  	/* Stop I2C transfer */
> -	i2c_imx_stop(i2c_imx);
> +	i2c_imx_stop(i2c_imx, atomic);
>  
>  	pm_runtime_mark_last_busy(i2c_imx->adapter.dev.parent);
>  	pm_runtime_put_autosuspend(i2c_imx->adapter.dev.parent);
> @@ -972,6 +1009,18 @@ static int i2c_imx_xfer(struct i2c_adapter *adapter,
>  	return (result < 0) ? result : num;
>  }
>  
> +static int i2c_imx_xfer(struct i2c_adapter *adapter,
> +			struct i2c_msg *msgs, int num)
> +{
> +	return i2c_imx_xfer_common(adapter, msgs, num, false);
> +}
> +
> +static int i2c_imx_xfer_atomic(struct i2c_adapter *adapter,
> +			       struct i2c_msg *msgs, int num)
> +{
> +	return i2c_imx_xfer_common(adapter, msgs, num, true);
> +}
> +
>  static void i2c_imx_prepare_recovery(struct i2c_adapter *adap)
>  {
>  	struct imx_i2c_struct *i2c_imx;
> @@ -1044,8 +1093,9 @@ static u32 i2c_imx_func(struct i2c_adapter *adapter)
>  }
>  
>  static const struct i2c_algorithm i2c_imx_algo = {
> -	.master_xfer	= i2c_imx_xfer,
> -	.functionality	= i2c_imx_func,
> +	.master_xfer = i2c_imx_xfer,
> +	.master_xfer_atomic = i2c_imx_xfer_atomic,
> +	.functionality = i2c_imx_func,
>  };
>  
>  static int i2c_imx_probe(struct platform_device *pdev)
> @@ -1123,6 +1173,14 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  	/* Set up platform driver data */
>  	platform_set_drvdata(pdev, i2c_imx);
>  
> +	/*
> +	 * Driver's PM callbacks are safe to be called in atomic contexts.
> +	 * Providing this information to the PM subsystem is required for the
> +	 * 'master_xfer_atomic' implementation that calls PM routines in IRQ
> +	 * less/atomic contexts.
> +	 */
> +	pm_runtime_irq_safe(&pdev->dev);

Hm, I guess this is about getting around scheduling in rpm_suspend.

This does not look particular pretty as it also affects regular
operation.

I wonder if its really necessary. It seems that the i2c-omap.c driver
uses runtime PM as well, but does not use pm_runtime_irq_safe.

From what I can tell pm_runtime_put_autosuspend sets RPM_ASYNC, and
according to the documentation in __pm_runtime_suspend, it can be called
when RPM_ASYNC is set...

--
Stefan


> +
>  	pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
>  	pm_runtime_use_autosuspend(&pdev->dev);
>  	pm_runtime_set_active(&pdev->dev);
