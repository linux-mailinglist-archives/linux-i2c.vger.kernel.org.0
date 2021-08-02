Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0483DDDE4
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Aug 2021 18:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbhHBQm6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Aug 2021 12:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbhHBQm5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Aug 2021 12:42:57 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46422C06175F
        for <linux-i2c@vger.kernel.org>; Mon,  2 Aug 2021 09:42:47 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id h24-20020a1ccc180000b029022e0571d1a0so354286wmb.5
        for <linux-i2c@vger.kernel.org>; Mon, 02 Aug 2021 09:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uOPuN9Sroj+XaQcs045K4/a+JlCBFeDr8Dhw2Pwr0Cc=;
        b=WvD/grDqzsZbnOWXOX2i/01SJUSgyzMM+TGb2p/cxUVi1IYE8obIrrLvpTsNkJgAaD
         s8EEVZ1YJQH8p0KHCVlDHN3nCahSAIHiTwSXMLN5AyZ7GqAK9amG3elcqTuzDp3TqYjc
         11hKpz7GFY73M9JIccTPBYEYEW1Ytm/pO8VgbEYZ0jCB9hUNkBYAcFDPnZsMNsPz0BAH
         050bnZNFdFeHvbrW+nC1qN9BYVFcvtETBOT6NjDMcFOKzt3bLhNV4fEyO4dWQOYAx2s6
         yDRxNPxLLKZ6yuExeeJWa7fYCuqHNML7yQvsaHwMlKoEhjM6IzG8aWnatq4CoGjHZe7K
         aqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uOPuN9Sroj+XaQcs045K4/a+JlCBFeDr8Dhw2Pwr0Cc=;
        b=lgcYR2j8uKgG2kS0rTH32voCI+Trxt9KA1o8JErIZ/VJlLXMWeO0h+X95MB93eazsv
         ZcvG+UBgbbhKsaB9JYCcnMcFWCxYy1Mdq4YvN4AVHs631iuc9OJN7d6p4xty2C/a8H9c
         zj3G5CVt8UfjP2zCyIVW6eNN6zN9R4jmuxfzLYBr53lX0hLab6p3J0RpBdSTwcGBW1Mi
         mTCoIzzL4PcTw4+Fh4VtUs4NLSQp877t1NDstL7T5umFxvKfpX78UbOr+lVW9Z9MwQQ/
         c5c01CfJyzwYMj8vsGGy/RIu6NxMqZg4EODgudWInobFckKhmfQdrOPkDCMWXxylFpRb
         8hCg==
X-Gm-Message-State: AOAM531SCAUoF9lYIDral2cRZS0GtLZzwO3FwxFUsvQD2dadSiuYnO1I
        aMXyc1EZZBEDuMVNToHenI76b4StSUnOEQ==
X-Google-Smtp-Source: ABdhPJxIMifaL/qMWGnt3paYU3WzIxgZp3BuNJXlY2vCvHgg6ksjXP/2cpgZY5J2r5HD7SAd8g7tAg==
X-Received: by 2002:a7b:c92f:: with SMTP id h15mr15980366wml.20.1627922565669;
        Mon, 02 Aug 2021 09:42:45 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:31b9:1387:a0dc:6571? (p200300ea8f10c20031b91387a0dc6571.dip0.t-ipconnect.de. [2003:ea:8f10:c200:31b9:1387:a0dc:6571])
        by smtp.googlemail.com with ESMTPSA id z6sm10687263wmp.1.2021.08.02.09.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Aug 2021 09:42:45 -0700 (PDT)
Subject: Re: [PATCH 01/10] i2c: i801: Don't call pm_runtime_allow
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
 <c0eeddf6-f630-d18b-cdae-0d74ed095f9c@gmail.com>
 <20210802145347.605ce8d5@endymion>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <b0bca52e-2bbc-18ef-5134-d5b6fe9df2bf@gmail.com>
Date:   Mon, 2 Aug 2021 18:31:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210802145347.605ce8d5@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02.08.2021 14:53, Jean Delvare wrote:
> Hi Heiner,
> 
> On Sun, 01 Aug 2021 16:16:56 +0200, Heiner Kallweit wrote:
>> Drivers should not call pm_runtime_allow(), see
>> Documentation/power/pci.rst. Therefore remove the call and leave this
>> to user space. Also remove the not needed call to pm_runtime_forbid().
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index 92ec291c0..362e74761 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -1891,7 +1891,6 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>  	pm_runtime_set_autosuspend_delay(&dev->dev, 1000);
>>  	pm_runtime_use_autosuspend(&dev->dev);
>>  	pm_runtime_put_autosuspend(&dev->dev);
>> -	pm_runtime_allow(&dev->dev);
>>  
>>  	return 0;
>>  }
>> @@ -1900,7 +1899,6 @@ static void i801_remove(struct pci_dev *dev)
>>  {
>>  	struct i801_priv *priv = pci_get_drvdata(dev);
>>  
>> -	pm_runtime_forbid(&dev->dev);
>>  	pm_runtime_get_noresume(&dev->dev);
>>  
>>  	i801_disable_host_notify(priv);
> 
> These calls were added by Jarkko (Cc'd) and I'm not familiar with power
> management so I'll need an explicit ack from him before I can accept
> this patch.
> 
The calls were part of the initial submission for rpm support and supposedly
just copied from another driver. But fine with me to wait for his feedback.

Heiner
