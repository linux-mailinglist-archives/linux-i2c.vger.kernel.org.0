Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82E7C467F94
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Dec 2021 22:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353883AbhLCV5K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Dec 2021 16:57:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236017AbhLCV5K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Dec 2021 16:57:10 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD4BC061751
        for <linux-i2c@vger.kernel.org>; Fri,  3 Dec 2021 13:53:45 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id o29so3423484wms.2
        for <linux-i2c@vger.kernel.org>; Fri, 03 Dec 2021 13:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=0RICwt6n+0p1DmKQHDse5Rg02J1b12Yn91yFN86jSr4=;
        b=nUkJU2ifuKXmSUrw06ibLJaVrEtbVaIc4BNN6jTZ+BmhFGn+K7cEjow98rJSNk//z7
         8p36ptUmTc2EPz5t5WeB7CAq35Duc/p3pGrymhV9ndWNenYxv9oyqclo77lK84pznZVM
         gaU07O9HpZr8rvfDgsiLipme2kmnw51UPpKqf3uYjYJ72lD2fVFJijV3jZS1HMfb1hrU
         aM2DZ79m1CVo17HVH0HsAfNNt1SdFSxuK/k6owiBDv7BlfcnI1vLeWbDeAuKffJDrqNt
         3BXeLwRj63WPiUvWUEabYRFLNTRDgYIYODVt/u2v2Cj22vFd3LJ/R6cROw6b8HMpME+W
         60Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=0RICwt6n+0p1DmKQHDse5Rg02J1b12Yn91yFN86jSr4=;
        b=Pe+nVIFoTwxxMhNeRYKu+m8bVNKnv5PET06ee56a4sJnGhcUnM7xmrX9R6/YIlccl5
         7vsB/ZYUiGlnZ5VIJrALWD+dSyDHIRZckmv+wvSPVUdEwlKpFnlbgetcrlM1zYkDHw6q
         ycdkbyAtqz26A0DSOqA0VBBpdfZijyz+4/ju32IT3/N8T/iN6i3+Qaw5+vSGI3DAMhoB
         Csr4StZIXla7IkOQpbDgkO3HpkF6+7ilB5dYl5mPB3eVwBFhvCJdKQ6SJquSjb4KKfdW
         J+4qMKGIrGBl42grwlTSBSwq2prAZPoeSBCUCzscMkcF2zUHfYVAll6Jw6NqcAB6cdqU
         0mdQ==
X-Gm-Message-State: AOAM531ZDxJuYZ38ToPqop3JxUhArBudhLtT0L0oH+dH9qqiq6ZdV71h
        7v5iSFVe6gB7hjLkCDplEEC6ea6SMDQ=
X-Google-Smtp-Source: ABdhPJw0SatBHItRTvwzDDN59aafNjtJRfxbZ0PSECUzCHay2+etPN46n4tzRW56J+kUg0w3qM7ySQ==
X-Received: by 2002:a05:600c:b43:: with SMTP id k3mr18130430wmr.159.1638568423990;
        Fri, 03 Dec 2021 13:53:43 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:3570:727:6afe:902f? (p200300ea8f1a0f00357007276afe902f.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:3570:727:6afe:902f])
        by smtp.googlemail.com with ESMTPSA id l2sm6551009wmq.42.2021.12.03.13.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 13:53:43 -0800 (PST)
Message-ID: <d2185fd1-94a6-d1f2-1394-dba737ae416e@gmail.com>
Date:   Fri, 3 Dec 2021 22:25:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] i2c: i801: Don't read back cleared status in
 i801_check_pre()
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <f0d7dd91-5b35-d5bb-33b7-dacc632c542a@gmail.com>
 <20211203105914.393ffd24@endymion>
 <31f34ce9-bf1f-29fc-a2c1-6ad549b5dd16@gmail.com>
In-Reply-To: <31f34ce9-bf1f-29fc-a2c1-6ad549b5dd16@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 03.12.2021 13:55, Heiner Kallweit wrote:
> On 03.12.2021 10:59, Jean Delvare wrote:
>> Hi Heiner,
>>
>> On Thu, 02 Dec 2021 10:53:05 +0100, Heiner Kallweit wrote:
>>> I see no need to read back the registers to verify that the bits
>>> have actually been cleared. I can't imagine any scenario where
>>> the bits would remain set after a write to them.
>>
>> This happened at least once in the past. See this archived message:
>>
>> https://www.spinics.net/lists/linux-i2c/msg02651.html
>>
> 
> "My last attempt locked the SMBus, but I was able to
> recover by repeatedly writing to the HST_STS register, as may times as
> the block length."
> 
> OK, this was 11 yrs ago, so at least I wouldn't be able to recall in
> detail what happened back then ..
> 
> Question is how you did this "repeatedly writing to the HST_STS
> register". Something like the following?
> 
> while (status = in (STATUS))
> 	out(STATUS, status);
> 
> Or maybe the driver started the loop to process the next byte?
> I think it's not likely that when writing a status bit it
> remained set. As we now know E32B is ignored in I2C mode, therefore
> the chip can read/write only one byte in a row, and w/o setting
> SMBHSTCNT_START in between it wouldn't touch the next byte.

I mixed something up, START is needed only once.

> Of course I may be wrong with my assumptions ..
> 
> 
>> This was in i801_check_post(), not i801_check_pre(), but that was the
>> same code. Which was removed in
>> 6cad93c4bbd62ecfa2e1b3a95c1ac4f6f27764c7 because there was little point
>> in checking the same condition twice.
>>
>> Unfortunately it seems that the error messages were copied manually so
>> we lack the details of which status bit couldn't be cleared exactly.
>>
>> Granted, it was caused by a driver bug, which was fixed since (commit
>> c074c39d62306efa5ba7c69c1a1531bc7333d252) but this shows that the
>> condition can actually trigger.
>>
>>> Whilst at it, change involved syslog messages to use pci_dbg() et al.
>>> to simplify them.
>>
>> Fine with me.
>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> ---
>>>  drivers/i2c/busses/i2c-i801.c | 22 +++-------------------
>>>  1 file changed, 3 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-i801.c
>>> b/drivers/i2c/busses/i2c-i801.c index 720f7e9d0..a82aaef27 100644
>>> --- a/drivers/i2c/busses/i2c-i801.c
>>> +++ b/drivers/i2c/busses/i2c-i801.c
>>> @@ -328,22 +328,14 @@ static int i801_check_pre(struct i801_priv
>>> *priv) 
>>>  	status = inb_p(SMBHSTSTS(priv));
>>>  	if (status & SMBHSTSTS_HOST_BUSY) {
>>> -		dev_err(&priv->pci_dev->dev, "SMBus is busy, can't use it!\n");
>>> +		pci_err(priv->pci_dev, "SMBus is busy, can't use it!\n");
>>>  		return -EBUSY;
>>>  	}
>>>  
>>>  	status &= STATUS_FLAGS;
>>>  	if (status) {
>>> -		dev_dbg(&priv->pci_dev->dev, "Clearing status flags (%02x)\n",
>>> -			status);
>>> +		pci_dbg(priv->pci_dev, "Clearing status flags (%02x)\n", status);
>>>  		outb_p(status, SMBHSTSTS(priv));
>>> -		status = inb_p(SMBHSTSTS(priv)) & STATUS_FLAGS;
>>> -		if (status) {
>>> -			dev_err(&priv->pci_dev->dev,
>>> -				"Failed clearing status flags (%02x)\n",
>>> -				status);
>>> -			return -EBUSY;
>>> -		}
>>>  	}
>>>  
>>>  	/*
>>> @@ -356,16 +348,8 @@ static int i801_check_pre(struct i801_priv *priv)
>>>  	if (priv->features & FEATURE_SMBUS_PEC) {
>>>  		status = inb_p(SMBAUXSTS(priv)) & SMBAUXSTS_CRCE;
>>>  		if (status) {
>>> -			dev_dbg(&priv->pci_dev->dev,
>>> -				"Clearing aux status flags (%02x)\n", status);
>>> +			pci_dbg(priv->pci_dev, "Clearing aux status flags (%02x)\n", status);
>>>  			outb_p(status, SMBAUXSTS(priv));
>>> -			status = inb_p(SMBAUXSTS(priv)) & SMBAUXSTS_CRCE;
>>> -			if (status) {
>>> -				dev_err(&priv->pci_dev->dev,
>>> -					"Failed clearing aux status flags (%02x)\n",
>>> -					status);
>>> -				return -EBUSY;
>>> -			}
>>>  		}
>>>  	}
>>>  
>>
>> So I'm not too sure what to do with this. On the one hand, the code you
>> want to remove could be useful to catch and investigate future bugs.
>> The rest of the code does assume that the status bits are properly
>> cleared before starting a new transaction. On the other hand, it is
>> slowing down the driver a bit when all is fine. Is that really worth
>> optimizing?
>>
> 
> In a follow-up mail in the thread you mentioned is the following.
> I noticed the same (the 1ms delay is too short) and have related patches
> in my tree. However I'd like to finalize the cleanups first.
> 
> "While working on this issue, I noticed that the piece of code which is
> supposed to let the i2c-i801 driver recover in case of a transaction
> timeout, did not always work."
> 

