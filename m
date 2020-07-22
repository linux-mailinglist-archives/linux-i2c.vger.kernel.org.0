Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26FC6229BCA
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 17:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732799AbgGVPve (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 11:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbgGVPvd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jul 2020 11:51:33 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE0BC0619DF
        for <linux-i2c@vger.kernel.org>; Wed, 22 Jul 2020 08:51:33 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id x5so1806032wmi.2
        for <linux-i2c@vger.kernel.org>; Wed, 22 Jul 2020 08:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QwvWVEQbb5l+QeR7ou4F4tycJerTZv4zQvE+I2aax+g=;
        b=cJGTfcbi2jLmAH6vzA8Xo1nh8Xzi6KcE0J1uSC+Nzfr/n5sn7E+YMRRJ+hdSr88+db
         +yaBfklWQql1JFWiIUjooVTfJL+fSrNDP1q7V0gxuJFDCF9K7HEEJ6JWHDSMeFfU4pZw
         OrICmeQSnq/3Iqw2qeX/RKN+ZNuUAmYIwESG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QwvWVEQbb5l+QeR7ou4F4tycJerTZv4zQvE+I2aax+g=;
        b=KtD/ByzEd68dKAMGmQtcvkE7v8A52n8t6IfPkvFInXgqaIyl3dGBAVfM7JygOgirJD
         Wsim/DANL5kcqP7QIV/aQ7VEKOFtWqZdOCnosj91nt0x18U3IIaQ0ya5i5+jWgB5MlRi
         nUv3volEQDhdEaGHWc1SluFW9oKluApg7Tqh6XP9xUOmTJYD/GVIlQp2lnWmysa9RM6x
         RcpLyQqkvXonNsBKmYVOod6EXSMWZYpR0rRwBG609nuKbG38ZAJvfjKrJ2QNGW0Z+Gk8
         c56yo5UYhmRI6Z4zdZZ77ygqcm31CzMIsWLHH6pchSLD4hsII5qLvlYuFRC4g4J4PEMq
         pk2Q==
X-Gm-Message-State: AOAM532R794m9SOeHYmqVSkmu078GgADJjAhaZ/t5eaS+paXpqua/qsM
        H4V+M8b6agFWb9EfOOZEPmulje10yIyRVoAO
X-Google-Smtp-Source: ABdhPJzE2WMRu/wxQI6I8+Slq9ju2/A0AbMz1NjwOZB2sBFMhOijlTerhjQ57Hg+msvr4NX3CBDDAg==
X-Received: by 2002:a1c:d8:: with SMTP id 207mr247738wma.81.1595433091207;
        Wed, 22 Jul 2020 08:51:31 -0700 (PDT)
Received: from [10.136.8.242] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id g14sm366658wrw.83.2020.07.22.08.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 08:51:30 -0700 (PDT)
Subject: Re: [PATCH] i2c: iproc: fix race between client unreg and isr
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Dhananjay Phadke <dphadke@linux.microsoft.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com
References: <1595115599-100054-1-git-send-email-dphadke@linux.microsoft.com>
 <116ac90c-8b49-ca89-90a4-9a28f43a7c50@broadcom.com>
 <20200722104128.GK1030@ninjato>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <5048cf44-e2c2-ee31-a9fb-b823f16c2c7d@broadcom.com>
Date:   Wed, 22 Jul 2020 08:51:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722104128.GK1030@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/22/2020 3:41 AM, Wolfram Sang wrote:
> 
>>> +	synchronize_irq(iproc_i2c->irq);
>>
>> If one takes a look at the I2C slave ISR routine, there are places where
>> IRQ can be re-enabled in the ISR itself. What happens after we mask all
>> slave interrupt and when 'synchronize_irq' is called, which I suppose is
>> meant to wait for inflight interrupt to finish where there's a chance
>> the interrupt can be re-enable again? How is one supposed to deal with that?
> 
> I encountered the same problem with the i2c-rcar driver before I left
> for my holidays.
> 

I think the following sequence needs to be implemented to make this
safe, i.e., after 'synchronize_irq', no further slave interrupt will be
fired.

In 'bcm_iproc_i2c_unreg_slave':

1. Set an atomic variable 'unreg_slave' (I'm bad in names so please come
up with a better name than this)

2. Disable all slave interrupts

3. synchronize_irq

4. Set slave to NULL

5. Erase slave addresses

In the ISR routine, it should always check against 'unreg_slave' before
enabling any slave interrupt. If 'unreg_slave' is set, no slave
interrupt should be re-enabled from within the ISR.

I think the above sequence can ensure no further slave interrupt after
'synchronize_irq'. I suggested using an atomic variable instead of
variable + spinlock due to the way how sync irq works, i.e., "If you use
this function while holding a resource the IRQ handler may need you will
deadlock.".

Thanks,

Ray

>>> +	iproc_i2c->slave = NULL;
>>> +
>>>  	/* Erase the slave address programmed */
>>>  	tmp = iproc_i2c_rd_reg(iproc_i2c, S_CFG_SMBUS_ADDR_OFFSET);
>>>  	tmp &= ~BIT(S_CFG_EN_NIC_SMB_ADDR3_SHIFT);
>>>
