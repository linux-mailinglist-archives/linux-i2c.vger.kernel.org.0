Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC804679F4
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Dec 2021 16:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351880AbhLCPIP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Dec 2021 10:08:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352480AbhLCPIO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Dec 2021 10:08:14 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93D29C061751
        for <linux-i2c@vger.kernel.org>; Fri,  3 Dec 2021 07:04:50 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id i5so6389264wrb.2
        for <linux-i2c@vger.kernel.org>; Fri, 03 Dec 2021 07:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=K6yONHeZtkLu471x8wl/IBM/gXBSc+RMev7owfJMNJg=;
        b=IR7kTM1fZKlUHmP0kBPWnYXmhvoXrdCLoyloeZbiR20+n3Ng9C4PXPAHgjOxilpZC9
         buHmnzzQb8SYiTFA4XijFn3dgfLI+TcZpDtOqNrbXWKvBbCZxHk71Wmu3kROf7ijp2KK
         evTEV+bHY3//UCcVuwmXiIs6X5KS0Pv7MCmeRoi2TaImMsJdCGP7H+pJnGlT3yOZ29A+
         DMJMtpC3SjBnBuqv2JJ9jyAYvaTr+GSmjmO7UGIjg4LMRLGKfIhZIMyHnN7DZZia4VsX
         oinQZD3MJmUSr2tc8CVN7+fRtXze7Bw8ACaQosgCEuW5qe/xx9Fk+y6ZMEG1Z5Wqyebr
         lAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=K6yONHeZtkLu471x8wl/IBM/gXBSc+RMev7owfJMNJg=;
        b=479uooXi0I1Zn2c9odDmElPmt+AonunV3PN0PVpfTP0bvYeYHuMRWQnOVTlaVhd+xB
         aHiLujMZulhXvigBfUXvNjB87a2F6WX4nRADf3t7v23aWlwmw2nh3n8wjzut3eu1UJiP
         HogdKT+Z0x3bhvYmmqmqVcwFJQ2UVEMUM+7SE421Cm4OhCx88iRJGNEihG9MnMFvIKEE
         p4S0xpl8qoKi/4REmnj2Hu3ton5qftd8IroirjkxwPC6a+9jbydwLPIWojIpT2Dou/VS
         WIZdiAufTd3G4n5wNH/CfGyUeEsNmIwmhOj3hX4tFMTYP+YHwnlxJ+RNRcb6VqgqgQhV
         dhjQ==
X-Gm-Message-State: AOAM532QRA37o05+bfKpivarBIEAB2HKizgyGIuh6OjzEIB7RJ3o0weq
        yHL5gNdAE8bpG842WMAm5ualgqJKvL8=
X-Google-Smtp-Source: ABdhPJyte5l5UZX0vqZ7yZ4LMTl9GxKJPT+ZLnoo0iNEsU+1kA7s5+B9VryIMuVRRh9XJ7XUGLDqaQ==
X-Received: by 2002:a5d:6449:: with SMTP id d9mr22448608wrw.332.1638543888070;
        Fri, 03 Dec 2021 07:04:48 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:ddb4:c635:82a6:bc31? (p200300ea8f1a0f00ddb4c63582a6bc31.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:ddb4:c635:82a6:bc31])
        by smtp.googlemail.com with ESMTPSA id p12sm3158643wro.33.2021.12.03.07.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 07:04:47 -0800 (PST)
Message-ID: <31f34ce9-bf1f-29fc-a2c1-6ad549b5dd16@gmail.com>
Date:   Fri, 3 Dec 2021 13:55:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <f0d7dd91-5b35-d5bb-33b7-dacc632c542a@gmail.com>
 <20211203105914.393ffd24@endymion>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] i2c: i801: Don't read back cleared status in
 i801_check_pre()
In-Reply-To: <20211203105914.393ffd24@endymion>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 03.12.2021 10:59, Jean Delvare wrote:
> Hi Heiner,
> 
> On Thu, 02 Dec 2021 10:53:05 +0100, Heiner Kallweit wrote:
>> I see no need to read back the registers to verify that the bits
>> have actually been cleared. I can't imagine any scenario where
>> the bits would remain set after a write to them.
> 
> This happened at least once in the past. See this archived message:
> 
> https://www.spinics.net/lists/linux-i2c/msg02651.html
> 

"My last attempt locked the SMBus, but I was able to
recover by repeatedly writing to the HST_STS register, as may times as
the block length."

OK, this was 11 yrs ago, so at least I wouldn't be able to recall in
detail what happened back then ..

Question is how you did this "repeatedly writing to the HST_STS
register". Something like the following?

while (status = in (STATUS))
	out(STATUS, status);

Or maybe the driver started the loop to process the next byte?
I think it's not likely that when writing a status bit it
remained set. As we now know E32B is ignored in I2C mode, therefore
the chip can read/write only one byte in a row, and w/o setting
SMBHSTCNT_START in between it wouldn't touch the next byte.
Of course I may be wrong with my assumptions ..


> This was in i801_check_post(), not i801_check_pre(), but that was the
> same code. Which was removed in
> 6cad93c4bbd62ecfa2e1b3a95c1ac4f6f27764c7 because there was little point
> in checking the same condition twice.
> 
> Unfortunately it seems that the error messages were copied manually so
> we lack the details of which status bit couldn't be cleared exactly.
> 
> Granted, it was caused by a driver bug, which was fixed since (commit
> c074c39d62306efa5ba7c69c1a1531bc7333d252) but this shows that the
> condition can actually trigger.
> 
>> Whilst at it, change involved syslog messages to use pci_dbg() et al.
>> to simplify them.
> 
> Fine with me.
> 
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 22 +++-------------------
>>  1 file changed, 3 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c
>> b/drivers/i2c/busses/i2c-i801.c index 720f7e9d0..a82aaef27 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -328,22 +328,14 @@ static int i801_check_pre(struct i801_priv
>> *priv) 
>>  	status = inb_p(SMBHSTSTS(priv));
>>  	if (status & SMBHSTSTS_HOST_BUSY) {
>> -		dev_err(&priv->pci_dev->dev, "SMBus is busy, can't use it!\n");
>> +		pci_err(priv->pci_dev, "SMBus is busy, can't use it!\n");
>>  		return -EBUSY;
>>  	}
>>  
>>  	status &= STATUS_FLAGS;
>>  	if (status) {
>> -		dev_dbg(&priv->pci_dev->dev, "Clearing status flags (%02x)\n",
>> -			status);
>> +		pci_dbg(priv->pci_dev, "Clearing status flags (%02x)\n", status);
>>  		outb_p(status, SMBHSTSTS(priv));
>> -		status = inb_p(SMBHSTSTS(priv)) & STATUS_FLAGS;
>> -		if (status) {
>> -			dev_err(&priv->pci_dev->dev,
>> -				"Failed clearing status flags (%02x)\n",
>> -				status);
>> -			return -EBUSY;
>> -		}
>>  	}
>>  
>>  	/*
>> @@ -356,16 +348,8 @@ static int i801_check_pre(struct i801_priv *priv)
>>  	if (priv->features & FEATURE_SMBUS_PEC) {
>>  		status = inb_p(SMBAUXSTS(priv)) & SMBAUXSTS_CRCE;
>>  		if (status) {
>> -			dev_dbg(&priv->pci_dev->dev,
>> -				"Clearing aux status flags (%02x)\n", status);
>> +			pci_dbg(priv->pci_dev, "Clearing aux status flags (%02x)\n", status);
>>  			outb_p(status, SMBAUXSTS(priv));
>> -			status = inb_p(SMBAUXSTS(priv)) & SMBAUXSTS_CRCE;
>> -			if (status) {
>> -				dev_err(&priv->pci_dev->dev,
>> -					"Failed clearing aux status flags (%02x)\n",
>> -					status);
>> -				return -EBUSY;
>> -			}
>>  		}
>>  	}
>>  
> 
> So I'm not too sure what to do with this. On the one hand, the code you
> want to remove could be useful to catch and investigate future bugs.
> The rest of the code does assume that the status bits are properly
> cleared before starting a new transaction. On the other hand, it is
> slowing down the driver a bit when all is fine. Is that really worth
> optimizing?
> 

In a follow-up mail in the thread you mentioned is the following.
I noticed the same (the 1ms delay is too short) and have related patches
in my tree. However I'd like to finalize the cleanups first.

"While working on this issue, I noticed that the piece of code which is
supposed to let the i2c-i801 driver recover in case of a transaction
timeout, did not always work."
