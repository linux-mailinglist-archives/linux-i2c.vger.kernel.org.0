Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA6864F849
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Dec 2022 09:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiLQIkr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Dec 2022 03:40:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiLQIkp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Dec 2022 03:40:45 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C18CE58
        for <linux-i2c@vger.kernel.org>; Sat, 17 Dec 2022 00:40:41 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso3235074wmo.1
        for <linux-i2c@vger.kernel.org>; Sat, 17 Dec 2022 00:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TWcd74s0SsXn3f1/MgiLC71+z7Ai0VCF5L2P7ZM0GOQ=;
        b=qHzajmubwmv6arYyozcRwp/lNcV5SVDwKyOEbojT5omMzhXWpIOkSp6y6thsDMEWWc
         uH6prEHf6uWjguVa8vBWc7mW3OjE+PUm76d7zrOTRwFtepyVgvPYoOuBlApnxgyYIWbS
         STkNMYv3+KPYrRJE+pfT6qazFMwPcbReS3B6SekT6XyYMqSQaI/Ao+cq5ZSTiVVLK67Z
         03ATmUgOr1fEG+tv7xy2oxVs5UU5/lEBmDhrL1cQuPqMbcr7ZJaYj6BE5NS9lX4KAGmt
         9/3QXG879LYA0a8RQ8wFtTwSLAw4hvUJ11YT/UaWhXO1KupHM8uEE02Q4p0foIpDOjB3
         p62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TWcd74s0SsXn3f1/MgiLC71+z7Ai0VCF5L2P7ZM0GOQ=;
        b=enNMTkJ3iBCYMU18ah3PPVERlvs2mCLExV8Qdt7gQ7BrVJlYvL27aBfIpVn+0EYZ7y
         5CxubjhbQO5q0FdkXJgNW/+AoNsctFZLy7ADBj4QWvWaWN7gyCEDz65hFmAOh71Hxsv2
         kkS/lu2rHAzaoZsEYm74K0FcQvNcaLyrLpYsONMK+tOOf0fRoWHDoCz6h9Z2qXiYp+qe
         I0e/GG2nwFLnHWTsVJvGJMpYjkn2O2vSPzQoXeUNWixw6PUnDwX54wEvFLHc4ina8pyc
         qJ+lSaH8xUujlLwJI0YxtKA4fEJhs+yV9wzN6aLnGDfzdIylfzLWXm8XzqpDLEPxJThx
         wWlg==
X-Gm-Message-State: AFqh2kr1/eJfmpgvcCLD33x3YK9jINHs8794CXEqlyEMq3HDHIVFBVuv
        YAexXDm8qdlI/EHWfarC5Yw=
X-Google-Smtp-Source: AMrXdXsoGUX6YvL1JXnekCk8nDmP3+ucxKsVby6CXRxf9MMVZ+fKGvh9ZRJsxW37DspqYO6GcO0X2g==
X-Received: by 2002:a05:600c:5125:b0:3d3:4012:8da8 with SMTP id o37-20020a05600c512500b003d340128da8mr4987339wms.40.1671266439704;
        Sat, 17 Dec 2022 00:40:39 -0800 (PST)
Received: from ?IPV6:2a01:c22:7af7:5300:8868:b389:215f:d1? (dynamic-2a01-0c22-7af7-5300-8868-b389-215f-00d1.c22.pool.telefonica.de. [2a01:c22:7af7:5300:8868:b389:215f:d1])
        by smtp.googlemail.com with ESMTPSA id o3-20020a05600c510300b003cfa3a12660sm22647741wms.1.2022.12.17.00.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 00:40:39 -0800 (PST)
Message-ID: <9e610b21-a058-c70b-60f4-f6c2814175b9@gmail.com>
Date:   Fri, 16 Dec 2022 21:23:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/8] i2c: i801: make FEATURE_HOST_NOTIFY dependent on
 FEATURE_IRQ
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
 <08ccd96f-deca-72b9-e14e-917434736ca3@gmail.com>
 <20220607144804.57e60cf1@endymion.delvare>
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20220607144804.57e60cf1@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DATE_IN_PAST_12_24,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 07.06.2022 14:48, Jean Delvare wrote:
> Hi Heiner,
> 
> On Fri, 15 Apr 2022 18:55:10 +0200, Heiner Kallweit wrote:
>> Host notification uses an interrupt, therefore it makes sense only if
>> interrupts are enabled.
> 
> It would be nice to have this comment in the code itself.
> 
OK

>> Make this dependency explicit by removing
>> FEATURE_HOST_NOTIFY if FEATURE_IRQ isn't set.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index c481f121d..eccdc7035 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -1756,6 +1756,9 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>  	dev_info(&dev->dev, "SMBus using %s\n",
>>  		 priv->features & FEATURE_IRQ ? "PCI interrupt" : "polling");
>>  
>> +	if (!(priv->features & FEATURE_IRQ))
>> +		priv->features &= ~FEATURE_HOST_NOTIFY;
> 
> Earlier in this function, there's an action which depends on the
> FEATURE_HOST_NOTIFY flag being set. While this will only result in a
> useless action and wouldn't cause a bug as far as I can see, wouldn't
> it be cleaner to move that piece of code *after* the check you're
> adding?
> 
Yes, this would be better. Will be part of v2.

>> +
>>  	i801_add_tco(priv);
>>  
>>  	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
> 
> Looks good, tested OK on my system (non-regression only, I'm not using
> the Host Notify feature).
> 

