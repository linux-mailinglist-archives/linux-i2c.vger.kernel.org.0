Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA102A5D23
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Nov 2020 04:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbgKDDfx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Nov 2020 22:35:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbgKDDfx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Nov 2020 22:35:53 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF88C061A4D;
        Tue,  3 Nov 2020 19:35:53 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id x13so15358418pgp.7;
        Tue, 03 Nov 2020 19:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SO49T3VR/YJ5jd/JOHX3W5H7QIx0c+3qzyGkKH0b+HU=;
        b=mHySa94F/wNv9PJJ4XVJDxJGKBwBsA51wBj+WWRrMGMAHfqc1KctLrEe2Cx5DrGfPc
         rIwi6bdgKX2QOl2KchiwwHYEitL8fCPT4zWL7TDBVT69q5L9d0f0JqaCjZnbIqAi/om5
         dh9lymjf9Ss+BbgLo65ZbE9QbejR5/dlBYf4ykYjcfU6o9CG1ZYAXTol+LgB5HrGXOVr
         ny+QSxvPeclkhpgRYg2wbT0AvsxLPzTSS5d4hx1kVDUzUbDUXWeu8avFmqB9079vz3sO
         azBfgp7OM73x8WTyiYRjVFgGN5tYbozAB471PBmdXGs1mODK+3CiiEz9epucZIbRPpXH
         obKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SO49T3VR/YJ5jd/JOHX3W5H7QIx0c+3qzyGkKH0b+HU=;
        b=P4yV8Zfr5vYI9zlbzBk8Ecs3TWtApvAG9LoOY+fPzYYF7pgU/6uk5Rvnk4BCmAC6kf
         Xw3u5lQemUd4wqEBT0FH8SZfI2e+5FuFUr9OLdt96GvGKRmLVV60jtNElwQgTzsMkVzJ
         /2Ag8SCzyUS6Ghf/m3TPqrwWENADu13IRDpPHol906Oq142GwgWAgZRQhepY2eCUagFb
         CKKVhkAkk49uDo1LT5f3KzETZnoflM2jIZWMigOmiRmQYza0BylhwEdj/Kw3H24nYDKs
         OB4w4uXKFWar67CDqpi3SATLABWXbEsiKv1gk6TdX6vCP1K8/FQ8Ga2YUaMm5gde6UZ6
         4K3Q==
X-Gm-Message-State: AOAM532XjLo82a+MFLFCSkLdewY1gABNLaEAWLnf2H5QOQWwwp7CI9TP
        jeomAJyb32n3HqiJa6k7AKs=
X-Google-Smtp-Source: ABdhPJysaTXZl7hhm3blHQZaSHmt62knxvK33jh7eq4S1L+v+QcY1yGG4Tllhds6uqzdcEyZZ0Qzsw==
X-Received: by 2002:a63:1947:: with SMTP id 7mr11913090pgz.350.1604460952662;
        Tue, 03 Nov 2020 19:35:52 -0800 (PST)
Received: from [10.230.28.234] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id j19sm560916pfn.107.2020.11.03.19.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 19:35:51 -0800 (PST)
Subject: Re: [PATCH v3 5/6] i2c: iproc: handle master read request
To:     Dhananjay Phadke <dphadke@linux.microsoft.com>,
        rayagonda.kokatanur@broadcom.com
Cc:     andriy.shevchenko@linux.intel.com,
        bcm-kernel-feedback-list@broadcom.com, brendanhiggins@google.com,
        f.fainelli@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        lori.hikichi@broadcom.com, rjui@broadcom.com,
        sbranden@broadcom.com, wsa@kernel.org
References: <20201102035433.6774-6-rayagonda.kokatanur@broadcom.com>
 <20201102035433.6774-6-rayagonda.kokatanur@broadcom.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <861d734f-c776-f70b-e414-a4b32c0f991e@gmail.com>
Date:   Tue, 3 Nov 2020 19:35:49 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201102035433.6774-6-rayagonda.kokatanur@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 11/2/2020 10:19 PM, Dhananjay Phadke wrote:
> On Mon,  2 Nov 2020 09:24:32 +0530, Rayagonda Kokatanur wrote:
> 
>> Handle single or multi byte master read request with or without
>> repeated start.
>>
>> Fixes: c245d94ed106 ("i2c: iproc: Add multi byte read-write support for slave mode")
>> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
>> ---
>>  drivers/i2c/busses/i2c-bcm-iproc.c | 215 +++++++++++++++++++++++------
>>  1 file changed, 170 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
>> index 7a235f9f5884..22e04055b447 100644
>> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
>> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
>> @@ -160,6 +160,11 @@
>>  
>>  #define IE_S_ALL_INTERRUPT_SHIFT     21
>>  #define IE_S_ALL_INTERRUPT_MASK      0x3f
>> +/*
>> + * It takes ~18us to reading 10bytes of data, hence to keep tasklet
>> + * running for less time, max slave read per tasklet is set to 10 bytes.
>> + */
>> +#define MAX_SLAVE_RX_PER_INT         10
>>  
> 
> In patch [3/6], you've enabled IS_S_RX_THLD_SHIFT in slave ISR bitmask,
> however it's not actually used in processing rx events.
> 
> Instead of hardcoding this threshold here, it's better to add a
> device-tree knob for rx threshold, program it in controller and handle
> that RX_THLD interrupt. This will give more flexibility to drain the rx
> fifo earlier than -
> (1) waiting for FIFO_FULL interrupt for transactions > 64B.
> (2) waiting for start of read transaction in case of master write-read.

The Device Tree is really intended to describe the hardware FIFO size,
not watermarks, as those tend to be more of a policy/work load decision.
Maybe this is something that can be added as a module parameter, or
configurable via ioctl() at some point.
-- 
Florian
