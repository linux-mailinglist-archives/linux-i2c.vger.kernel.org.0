Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EFED39009A
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 14:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232064AbhEYMNd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 08:13:33 -0400
Received: from mx2.suse.de ([195.135.220.15]:38174 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231865AbhEYMNc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 May 2021 08:13:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1621944722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fq8F1pgJiBewPLhELJVzkzm+0rjTD8XWLO+uqVRQYwY=;
        b=gSF4C9wQN4z9e3iaKrrKYbCtXp3h7Y4ewwNohud4iCqtVIQLpaFBF4KGmhYoGtMX4/n06J
        Pcr15OJQX9egVw4EELNN5NH4clLOPX8I/o1+VncilD/wXgWULq9t2AFWX+erUZlJ2bwog1
        vfGodqmeXjqf12B2GLHTZvllFkpyHR4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1621944722;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fq8F1pgJiBewPLhELJVzkzm+0rjTD8XWLO+uqVRQYwY=;
        b=4orZDAp+PCOxSUq1db9s0hKFS3U0rGNFcCalAhCRcqctNvbquljvmdJzFWLWHHXaj5Rb8q
        OgE6kJuuMXgaF3CQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 19CD1AEA3;
        Tue, 25 May 2021 12:12:02 +0000 (UTC)
Date:   Tue, 25 May 2021 14:12:01 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Daniel Kurtz <djkurtz@chromium.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: i801: Replace waitqueue with completion API
Message-ID: <20210525141201.1fa59f3b@endymion>
In-Reply-To: <1d1054de-8b47-a6bb-a264-8456705e5875@gmail.com>
References: <561b74ab-b020-b0c7-c1ad-b7c3326245e3@gmail.com>
        <1d1054de-8b47-a6bb-a264-8456705e5875@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

Adding Daniel Kurtz, who wrote the original wait queue-based code, to
Cc. I'm not sure if Daniel is still into kernel code though.

On Sat, 22 May 2021 00:02:43 +0200, Heiner Kallweit wrote:
> Using the completion API is more intuitive and it allows to simplify
> the code. Note that we don't have to set priv->status = 0 any longer
> with the completion API.

OK, but you need to call reinit_completion() instead, which has the
same cost. So that's not a good argument ;-)

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 48 ++++++++++++++---------------------
>  1 file changed, 19 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index bfea94d02..738204d77 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -103,7 +103,7 @@
>  #include <linux/dmi.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> -#include <linux/wait.h>
> +#include <linux/completion.h>
>  #include <linux/err.h>
>  #include <linux/platform_device.h>
>  #include <linux/platform_data/itco_wdt.h>
> @@ -270,7 +270,7 @@ struct i801_priv {
>  	unsigned int features;
>  
>  	/* isr processing */
> -	wait_queue_head_t waitq;
> +	struct completion done;
>  	u8 status;
>  
>  	/* Command state used by isr for byte-by-byte block transactions */
> @@ -496,24 +496,19 @@ static int i801_wait_byte_done(struct i801_priv *priv)
>  static int i801_transaction(struct i801_priv *priv, int xact)
>  {
>  	int status;
> -	int result;
> +	unsigned long result;
>  	const struct i2c_adapter *adap = &priv->adapter;
>  
> -	result = i801_check_pre(priv);
> -	if (result < 0)
> -		return result;
> +	status = i801_check_pre(priv);
> +	if (status < 0)
> +		return status;
>  
>  	if (priv->features & FEATURE_IRQ) {
> +		reinit_completion(&priv->done);
>  		outb_p(xact | SMBHSTCNT_INTREN | SMBHSTCNT_START,
>  		       SMBHSTCNT(priv));
> -		result = wait_event_timeout(priv->waitq,
> -					    (status = priv->status),
> -					    adap->timeout);
> -		if (!result)
> -			status = -ETIMEDOUT;
> -
> -		priv->status = 0;
> -		return i801_check_post(priv, status);
> +		result = wait_for_completion_timeout(&priv->done, adap->timeout);
> +		return i801_check_post(priv, result ? priv->status : -ETIMEDOUT);
>  	}
>  
>  	/* the current contents of SMBHSTCNT can be overwritten, since PEC,
> @@ -638,7 +633,7 @@ static irqreturn_t i801_host_notify_isr(struct i801_priv *priv)
>   *      DEV_ERR - Invalid command, NAK or communication timeout
>   *      BUS_ERR - SMI# transaction collision
>   *      FAILED - transaction was canceled due to a KILL request
> - *    When any of these occur, update ->status and wake up the waitq.
> + *    When any of these occur, update ->status and signal completion.
>   *    ->status must be cleared before kicking off the next transaction.
>   *
>   * 2) For byte-by-byte (I2C read/write) transactions, one BYTE_DONE interrupt
> @@ -675,7 +670,7 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
>  	if (status) {
>  		outb_p(status, SMBHSTSTS(priv));
>  		priv->status = status;
> -		wake_up(&priv->waitq);
> +		complete(&priv->done);
>  	}
>  
>  	return IRQ_HANDLED;
> @@ -694,15 +689,15 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
>  	int i, len;
>  	int smbcmd;
>  	int status;
> -	int result;
> +	unsigned long result;
>  	const struct i2c_adapter *adap = &priv->adapter;
>  
>  	if (command == I2C_SMBUS_BLOCK_PROC_CALL)
>  		return -EOPNOTSUPP;
>  
> -	result = i801_check_pre(priv);
> -	if (result < 0)
> -		return result;
> +	status = i801_check_pre(priv);
> +	if (status < 0)
> +		return status;
>  
>  	len = data->block[0];
>  
> @@ -726,15 +721,10 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
>  		priv->count = 0;
>  		priv->data = &data->block[1];
>  
> +		reinit_completion(&priv->done);
>  		outb_p(priv->cmd | SMBHSTCNT_START, SMBHSTCNT(priv));
> -		result = wait_event_timeout(priv->waitq,
> -					    (status = priv->status),
> -					    adap->timeout);
> -		if (!result)
> -			status = -ETIMEDOUT;
> -
> -		priv->status = 0;
> -		return i801_check_post(priv, status);
> +		result = wait_for_completion_timeout(&priv->done, adap->timeout);
> +		return i801_check_post(priv, result ? priv->status : -ETIMEDOUT);
>  	}
>  
>  	for (i = 1; i <= len; i++) {
> @@ -1889,7 +1879,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	}
>  
>  	if (priv->features & FEATURE_IRQ) {
> -		init_waitqueue_head(&priv->waitq);
> +		init_completion(&priv->done);
>  
>  		err = devm_request_irq(&dev->dev, dev->irq, i801_isr,
>  				       IRQF_SHARED,

The clean-up isn't massive but I agree the code is a bit more pleasant
to read after the change, and I also see the binary size shrink a bit,
so I vote for it.

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
