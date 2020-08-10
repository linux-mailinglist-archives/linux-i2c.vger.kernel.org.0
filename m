Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3E224122E
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Aug 2020 23:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgHJVRS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Aug 2020 17:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726547AbgHJVRR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Aug 2020 17:17:17 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B3E6C061756
        for <linux-i2c@vger.kernel.org>; Mon, 10 Aug 2020 14:17:17 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k8so891650wma.2
        for <linux-i2c@vger.kernel.org>; Mon, 10 Aug 2020 14:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Fj2es0dCEPOQUTQgxshXQADi10l+RVsAVXH1AGZUZrE=;
        b=e049/iE5zjU3fuIZOmYEgRgRB8FElNKBQdO1T9yZ3dwFurZ/cVpoFb9P4ECfLn05Lh
         CnbpAUYssYvu6J8zWlzF9f6z4HCdfPzEnoJDcwANUr75zB4tOR961Gt3VQ2wEJ3vqcHs
         84jIaz953mb7RCN0Xhza3wxmNmSeVDjTc5nus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fj2es0dCEPOQUTQgxshXQADi10l+RVsAVXH1AGZUZrE=;
        b=swyp8GorGc+0M8DGrbP1WN+cLlqc9mnAIx9vEELkA+jamMFXlcF/wOcTcDluOz1yBQ
         5FK6ZNDEWCQr/z5p7dyOzBXRJbUWjqIjVpHK+o54MzEnSdYmAPLiJuEtsZw7EVWspaof
         GUqkrKwu1Rv+hVA7iosJLBJY7hYoC9+DvUg+qvk0uFJD01gGHphcyMyMzgrOVC+wlLk9
         Z///EBjLgPTMoKaDr4d4XzQRJdqwesdP2/riiDCahlSPORyk/oH81nrzeFhfERfKI4Pd
         xtXR4CsmpoCT4l47sg4zfR++4iEUOrx7T1NTZmlGIYoheOgaPi3uOCPcTUZanvTtZUAC
         GiKw==
X-Gm-Message-State: AOAM530R7t+HHSYATymfM2WPfRuEWd8VP4Mxi1iKVoUJuFXMk8r0tHZh
        EqsLeqZPhSjFH0iYOs/M7J50Wg==
X-Google-Smtp-Source: ABdhPJxgf/jaiJBGUk2+J0Qe9jP7a+xe9d6Dd3Fiaxg86dtAjIMdS9jRQM0f3OPzMV3XcLuAfSYusw==
X-Received: by 2002:a05:600c:258e:: with SMTP id 14mr929987wmh.141.1597094235871;
        Mon, 10 Aug 2020 14:17:15 -0700 (PDT)
Received: from [10.230.0.249] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id f63sm1372299wmf.9.2020.08.10.14.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2020 14:17:15 -0700 (PDT)
Subject: Re: [PATCH v2] i2c: iproc: fix race between client unreg and isr
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Dhananjay Phadke <dphadke@linux.microsoft.com>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, rayagonda.kokatanur@broadcom.com,
        rjui@broadcom.com, wsa@kernel.org
References: <00a30ca7-d533-94ba-994a-9a133fadb045@gmail.com>
 <1596858925-45763-1-git-send-email-dphadke@linux.microsoft.com>
 <0f7063f5-8ca7-f469-574b-82382d49e266@gmail.com>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <18cf439a-8fde-02b0-31b6-9ac42f7e972c@broadcom.com>
Date:   Mon, 10 Aug 2020 14:17:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <0f7063f5-8ca7-f469-574b-82382d49e266@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 8/8/2020 7:47 AM, Florian Fainelli wrote:
> 
> 
> On 8/7/2020 8:55 PM, Dhananjay Phadke wrote:
>> On 8/7/2020, Florian Fainelli wrote:
>>>> When i2c client unregisters, synchronize irq before setting
>>>> iproc_i2c->slave to NULL.
>>>>
>>>> (1) disable_irq()
>>>> (2) Mask event enable bits in control reg
>>>> (3) Erase slave address (avoid further writes to rx fifo)
>>>> (4) Flush tx and rx FIFOs
>>>> (5) Clear pending event (interrupt) bits in status reg
>>>> (6) enable_irq()
>>>> (7) Set client pointer to NULL
>>>>
>>>
>>>> @@ -1091,6 +1091,17 @@ static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave)
>>>>  	tmp &= ~BIT(S_CFG_EN_NIC_SMB_ADDR3_SHIFT);
>>>>  	iproc_i2c_wr_reg(iproc_i2c, S_CFG_SMBUS_ADDR_OFFSET, tmp);
>>>>  
>>>> +	/* flush TX/RX FIFOs */
>>>> +	tmp = (BIT(S_FIFO_RX_FLUSH_SHIFT) | BIT(S_FIFO_TX_FLUSH_SHIFT));
>>>> +	iproc_i2c_wr_reg(iproc_i2c, S_FIFO_CTRL_OFFSET, tmp);
>>>> +
>>>> +	/* clear all pending slave interrupts */
>>>> +	iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET, ISR_MASK_SLAVE);
>>>> +
>>>> +	enable_irq(iproc_i2c->irq);
>>>> +
>>>> +	iproc_i2c->slave = NULL;
>>>
>>> There is nothing that checks on iproc_i2c->slave being valid within the
>>> interrupt handler, we assume that the pointer is valid which is fin,
>>> however non functional it may be, it may feel more natural to move the
>>> assignment before the enable_irq()?
>>
>> As far as the teardown sequence ensures no more interrupts arrive after
>> enable_irq() and they are enabled only after setting pointer during
>> client register(); checking for NULL in ISR isn't necessary. 
> 
> Agreed.
> 

Okay I think we all agree that this teardown sequence will guarantee
that no further "slave" interrupts will be fired after it.

>>
>> If The teardown sequence doesn't guarantee quiescing of interrupts,
>> setting NULL before or after enable_irq() is equally vulnerable.
> 
> The teardown sequence is sort of a critical section if we may say, so
> ensuring that everything happens within it and that enable_irq() is the
> last operation would seem more natural to me at least. Thanks
> 

I tend to agree with Florian here.

1. Enable/Disable IRQ is done on the interrupt line for both master and
slave (or even other peripherals that share the same interrupt line,
although that is not the case here since this interrupt is dedicated to
I2C in all iProc based SoCs).

2. The tear down sequence here wrapped by disable/enable_irq is slave
specific

The effect of 1. is temporary, and the purpose of it is to ensure slave
interrupts are quiesced properly at the end of the sequence.

If we consider both 1. and 2., I agree with Florian that while the end
result is the same, it is indeed more natural to wrap the entire slave
tear down sequence within disable/enable irq.

Thanks,

Ray
