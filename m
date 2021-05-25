Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6220439018B
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 15:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232991AbhEYNDS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 09:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233017AbhEYNDO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 May 2021 09:03:14 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1281AC061574
        for <linux-i2c@vger.kernel.org>; Tue, 25 May 2021 06:01:44 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id y184-20020a1ce1c10000b02901769b409001so12793152wmg.3
        for <linux-i2c@vger.kernel.org>; Tue, 25 May 2021 06:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mBWoysqn+oe3UVY7Bzc5bwcexxpWlEvMbiV9OuB/6zY=;
        b=aKOBlQaUWEh9twkUIBkdt4nFakdAuC5Nuzn7zSND2nUw5ray0sSBzCf1FMGvk7bzuv
         bqeyG64pKrUvynEPe50YVi6eXt5gBPwNdLXyjt2bcf04PtT2rfgHI3JsKF0xSBR+aMAF
         EeUqhW7PhX3t58l3rURZxnQ+cHMuOqw/mdCOl/+dEg451SkeNS53Z2xHV87SKjavLJgz
         /h0bzc7ZoiTHN8EMo9TQUoVqtZrDc8a5E8l6bJvHsAOjfwXwz9tR7v7CmjjPXT2y+bbc
         GopHxIiVZJN65DcXXonHfnpZDR+f1CTdTSK2I7zccy1gwtxjRp3zT0hbNUfQVmRrVFbQ
         3Xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mBWoysqn+oe3UVY7Bzc5bwcexxpWlEvMbiV9OuB/6zY=;
        b=JocDyNwxwc+R+gcjApiRFiUv/lNfXnnwSi0fBaRlehiUmkOJw1A7dR3FRG84F5snEo
         cq/lrPhadReEqPP3V1M/rQHli9+E8T34L3suScB+NMx/8k7kQLvFq7mmTQUKeD64NTMp
         UNJS2bi5UUcGHfZAgwG3q9rWdCrEmq07nXm12wcjFExMEyMJ3lE7ijMRY27mOpz77+1h
         x5jqR9EQqNskcjYFJleuFvJbWINeOFbZVbgc8SU267GbDVOLZystcODzfAerNCRZTJC3
         SzkVXnKmAScLjmkCmY3bmzbuc8Z1Qbv/gdS6KekoiwzMWjJcw9GahG26f/KVUrqGrMPA
         ehGQ==
X-Gm-Message-State: AOAM530WkkHajYpUjCftgeVnkUTAmVtpxcVMOh4ydMn0hUSSaP2oWg1v
        dzpuptwLkeEDI9qFAu432zDzp810zP8=
X-Google-Smtp-Source: ABdhPJyaF9AObSXB6UthAbw5YmxZ68NJNurMrP9HnRz8aLzSpCDjLJRywrsLzVUS7SN9AHiLxkKJ1g==
X-Received: by 2002:a1c:e408:: with SMTP id b8mr24385699wmh.85.1621947702118;
        Tue, 25 May 2021 06:01:42 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f38:4600:9069:8ff2:b3da:8683? (p200300ea8f38460090698ff2b3da8683.dip0.t-ipconnect.de. [2003:ea:8f38:4600:9069:8ff2:b3da:8683])
        by smtp.googlemail.com with ESMTPSA id r5sm12967872wmh.23.2021.05.25.06.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 06:01:39 -0700 (PDT)
Subject: Re: [PATCH 2/2] i2c: i801: Replace waitqueue with completion API
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Daniel Kurtz <djkurtz@chromium.org>, linux-i2c@vger.kernel.org
References: <561b74ab-b020-b0c7-c1ad-b7c3326245e3@gmail.com>
 <1d1054de-8b47-a6bb-a264-8456705e5875@gmail.com>
 <20210525141201.1fa59f3b@endymion>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <d220a961-6653-ec27-430c-727dbe88b665@gmail.com>
Date:   Tue, 25 May 2021 15:01:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210525141201.1fa59f3b@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 25.05.2021 14:12, Jean Delvare wrote:
> Hi Heiner,
> 
> Adding Daniel Kurtz, who wrote the original wait queue-based code, to
> Cc. I'm not sure if Daniel is still into kernel code though.
> 
> On Sat, 22 May 2021 00:02:43 +0200, Heiner Kallweit wrote:
>> Using the completion API is more intuitive and it allows to simplify
>> the code. Note that we don't have to set priv->status = 0 any longer
>> with the completion API.
> 
> OK, but you need to call reinit_completion() instead, which has the
> same cost. So that's not a good argument ;-)
> 
Maybe my comment wasn't clear enough. I didn't want to say that we
save something but that it's safe from a functional point of view
to remove clearing priv->status.

>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 48 ++++++++++++++---------------------
>>  1 file changed, 19 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index bfea94d02..738204d77 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -103,7 +103,7 @@
>>  #include <linux/dmi.h>
>>  #include <linux/slab.h>
>>  #include <linux/string.h>
>> -#include <linux/wait.h>
>> +#include <linux/completion.h>
>>  #include <linux/err.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/platform_data/itco_wdt.h>
>> @@ -270,7 +270,7 @@ struct i801_priv {
>>  	unsigned int features;
>>  
>>  	/* isr processing */
>> -	wait_queue_head_t waitq;
>> +	struct completion done;
>>  	u8 status;
>>  
>>  	/* Command state used by isr for byte-by-byte block transactions */
>> @@ -496,24 +496,19 @@ static int i801_wait_byte_done(struct i801_priv *priv)
>>  static int i801_transaction(struct i801_priv *priv, int xact)
>>  {
>>  	int status;
>> -	int result;
>> +	unsigned long result;
>>  	const struct i2c_adapter *adap = &priv->adapter;
>>  
>> -	result = i801_check_pre(priv);
>> -	if (result < 0)
>> -		return result;
>> +	status = i801_check_pre(priv);
>> +	if (status < 0)
>> +		return status;
>>  
>>  	if (priv->features & FEATURE_IRQ) {
>> +		reinit_completion(&priv->done);
>>  		outb_p(xact | SMBHSTCNT_INTREN | SMBHSTCNT_START,
>>  		       SMBHSTCNT(priv));
>> -		result = wait_event_timeout(priv->waitq,
>> -					    (status = priv->status),
>> -					    adap->timeout);
>> -		if (!result)
>> -			status = -ETIMEDOUT;
>> -
>> -		priv->status = 0;
>> -		return i801_check_post(priv, status);
>> +		result = wait_for_completion_timeout(&priv->done, adap->timeout);
>> +		return i801_check_post(priv, result ? priv->status : -ETIMEDOUT);
>>  	}
>>  
>>  	/* the current contents of SMBHSTCNT can be overwritten, since PEC,
>> @@ -638,7 +633,7 @@ static irqreturn_t i801_host_notify_isr(struct i801_priv *priv)
>>   *      DEV_ERR - Invalid command, NAK or communication timeout
>>   *      BUS_ERR - SMI# transaction collision
>>   *      FAILED - transaction was canceled due to a KILL request
>> - *    When any of these occur, update ->status and wake up the waitq.
>> + *    When any of these occur, update ->status and signal completion.
>>   *    ->status must be cleared before kicking off the next transaction.
>>   *
>>   * 2) For byte-by-byte (I2C read/write) transactions, one BYTE_DONE interrupt
>> @@ -675,7 +670,7 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
>>  	if (status) {
>>  		outb_p(status, SMBHSTSTS(priv));
>>  		priv->status = status;
>> -		wake_up(&priv->waitq);
>> +		complete(&priv->done);
>>  	}
>>  
>>  	return IRQ_HANDLED;
>> @@ -694,15 +689,15 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
>>  	int i, len;
>>  	int smbcmd;
>>  	int status;
>> -	int result;
>> +	unsigned long result;
>>  	const struct i2c_adapter *adap = &priv->adapter;
>>  
>>  	if (command == I2C_SMBUS_BLOCK_PROC_CALL)
>>  		return -EOPNOTSUPP;
>>  
>> -	result = i801_check_pre(priv);
>> -	if (result < 0)
>> -		return result;
>> +	status = i801_check_pre(priv);
>> +	if (status < 0)
>> +		return status;
>>  
>>  	len = data->block[0];
>>  
>> @@ -726,15 +721,10 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
>>  		priv->count = 0;
>>  		priv->data = &data->block[1];
>>  
>> +		reinit_completion(&priv->done);
>>  		outb_p(priv->cmd | SMBHSTCNT_START, SMBHSTCNT(priv));
>> -		result = wait_event_timeout(priv->waitq,
>> -					    (status = priv->status),
>> -					    adap->timeout);
>> -		if (!result)
>> -			status = -ETIMEDOUT;
>> -
>> -		priv->status = 0;
>> -		return i801_check_post(priv, status);
>> +		result = wait_for_completion_timeout(&priv->done, adap->timeout);
>> +		return i801_check_post(priv, result ? priv->status : -ETIMEDOUT);
>>  	}
>>  
>>  	for (i = 1; i <= len; i++) {
>> @@ -1889,7 +1879,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>  	}
>>  
>>  	if (priv->features & FEATURE_IRQ) {
>> -		init_waitqueue_head(&priv->waitq);
>> +		init_completion(&priv->done);
>>  
>>  		err = devm_request_irq(&dev->dev, dev->irq, i801_isr,
>>  				       IRQF_SHARED,
> 
> The clean-up isn't massive but I agree the code is a bit more pleasant
> to read after the change, and I also see the binary size shrink a bit,
> so I vote for it.
> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> Tested-by: Jean Delvare <jdelvare@suse.de>
> 

