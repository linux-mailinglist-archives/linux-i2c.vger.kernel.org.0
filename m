Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06B1F229D92
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 18:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729000AbgGVQz0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 12:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbgGVQzZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jul 2020 12:55:25 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 201A6C0619DC
        for <linux-i2c@vger.kernel.org>; Wed, 22 Jul 2020 09:55:25 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id y3so2588005wrl.4
        for <linux-i2c@vger.kernel.org>; Wed, 22 Jul 2020 09:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W/L5P6Wi4l5w5E61NWRVDyen6nCeOgGhib6kkyx3xg4=;
        b=Gug+wemwkv5z2RLWjjalbOFEuEkFtC0ykSLnBs/RB/j5fl8oDtHwbf+UvDFuur5oO2
         iOxEehek0b8oyIZ2hfEEuDtjBhX/77LZob3QNQQLJDNbWXwOq6ZB5E/tOFChQdPhYn/x
         md2N62uo++EmN2+MfnhZRE3dhfxo1FTGCuV6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W/L5P6Wi4l5w5E61NWRVDyen6nCeOgGhib6kkyx3xg4=;
        b=IHXY86xe80AQi+18muF85Tb7IC2m+YcFBvM6tzp9aSdiOzMPMwHgwIrmO+377FiOfn
         iJNyr018jW21Fuk0PUsDItOElCSl9dLa1TNsbD+stvF+pQ5HY7/mKksN2on+Zc0VnhNS
         7PGNrRUaudiY83q6PE3hPsQjgx8zz6BzPM0lDFI1tr1wohhXs+tzZlxQ2jDbBrFeuke1
         t7h+dckwElJJLyfYs3B5Lexy8e5MdJ4QuZK+0neWjo5AYcCIblENLp3fUtNmRuPpq6OT
         6wax+cwDvKfp+ZfB7b+w5l9xCsG2SmuwBgqO0/u0G+NwXcilU5n23UFen1ASjzqN1SxV
         n09w==
X-Gm-Message-State: AOAM5324DcIUnHEgOM73Gh5Gmv7VSipRHD+kNewHZEoCpnJYVIiixxfi
        KgZ8F7OiGWN6RfVPIvu+Ew0J4BYQfJ9E6b16
X-Google-Smtp-Source: ABdhPJwhuP7o3LsaaCn1Ff99xaHdCwRo78eNMDryKf/WrKKuGYq+hmYdzoXUSDl/VoQeJyZLAkOkSg==
X-Received: by 2002:adf:fd4e:: with SMTP id h14mr434451wrs.251.1595436923597;
        Wed, 22 Jul 2020 09:55:23 -0700 (PDT)
Received: from [10.136.8.242] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id j8sm565902wrd.85.2020.07.22.09.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 09:55:22 -0700 (PDT)
Subject: Re: [PATCH] i2c: iproc: fix race between client unreg and isr
From:   Ray Jui <ray.jui@broadcom.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Dhananjay Phadke <dphadke@linux.microsoft.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com
References: <1595115599-100054-1-git-send-email-dphadke@linux.microsoft.com>
 <116ac90c-8b49-ca89-90a4-9a28f43a7c50@broadcom.com>
 <20200722104128.GK1030@ninjato>
 <5048cf44-e2c2-ee31-a9fb-b823f16c2c7d@broadcom.com>
Message-ID: <0995d57c-890c-cdd3-7ddf-ece6bc454528@broadcom.com>
Date:   Wed, 22 Jul 2020 09:55:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5048cf44-e2c2-ee31-a9fb-b823f16c2c7d@broadcom.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 7/22/2020 8:51 AM, Ray Jui wrote:
> 
> On 7/22/2020 3:41 AM, Wolfram Sang wrote:
>>
>>>> +	synchronize_irq(iproc_i2c->irq);
>>>
>>> If one takes a look at the I2C slave ISR routine, there are places where
>>> IRQ can be re-enabled in the ISR itself. What happens after we mask all
>>> slave interrupt and when 'synchronize_irq' is called, which I suppose is
>>> meant to wait for inflight interrupt to finish where there's a chance
>>> the interrupt can be re-enable again? How is one supposed to deal with that?
>>
>> I encountered the same problem with the i2c-rcar driver before I left
>> for my holidays.
>>
> 
> I think the following sequence needs to be implemented to make this
> safe, i.e., after 'synchronize_irq', no further slave interrupt will be
> fired.
> 
> In 'bcm_iproc_i2c_unreg_slave':
> 
> 1. Set an atomic variable 'unreg_slave' (I'm bad in names so please come
> up with a better name than this)
> 
> 2. Disable all slave interrupts

Actually, thinking about it more, 1. and 2. here need to be an atomic
operation so it needs to be wrapped by a spin lock/unlock (and it is
safe to do so here before calling synchronize_irq below).

Same applies to the two read-modify-write sequneces to enable some of
the slave interrupts in the 'bcm_iproc_i2c_slave_isr' routine.

> 
> 3. synchronize_irq
> 
> 4. Set slave to NULL
> 
> 5. Erase slave addresses
> 
> In the ISR routine, it should always check against 'unreg_slave' before
> enabling any slave interrupt. If 'unreg_slave' is set, no slave
> interrupt should be re-enabled from within the ISR.
> 
> I think the above sequence can ensure no further slave interrupt after
> 'synchronize_irq'. I suggested using an atomic variable instead of
> variable + spinlock due to the way how sync irq works, i.e., "If you use
> this function while holding a resource the IRQ handler may need you will
> deadlock.".
> 
> Thanks,
> 
> Ray
> 
>>>> +	iproc_i2c->slave = NULL;
>>>> +
>>>>  	/* Erase the slave address programmed */
>>>>  	tmp = iproc_i2c_rd_reg(iproc_i2c, S_CFG_SMBUS_ADDR_OFFSET);
>>>>  	tmp &= ~BIT(S_CFG_EN_NIC_SMB_ADDR3_SHIFT);
>>>>
