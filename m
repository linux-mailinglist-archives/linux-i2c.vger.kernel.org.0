Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCD2223F7F7
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Aug 2020 16:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgHHOr1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Aug 2020 10:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726238AbgHHOr0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Aug 2020 10:47:26 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC27C061756;
        Sat,  8 Aug 2020 07:47:25 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id o22so3487616qtt.13;
        Sat, 08 Aug 2020 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oy7Ecf/dRDd49hyOLVsUhynlyl/pEIRUC0Q/sOTmdy8=;
        b=et9y6iE6T9Ye/ujITgPqkg245uIQDUk1gUMIJcB+Z6dqRSqWMSwi7CVYW44eyMMIrt
         ojguruz/WoTisG+SFgE1ORejrFYfm8406T63I/Sm1pjVEMkMly/B/brMfuWtV/BNzN0K
         Ks5fdu/85V/KmIHZL9lttfjpXOkUY9xBsa0TfSgj7GsUT++gcMXu0cWaldnkxWhAw37k
         ISlP3H6iVdmsYzO9A3o1qZaTJkFdknmkhL3mt7EOSqEijoJtn5VtsozTgTvAwpPGHUeV
         ss0NVQp8NcFjpsedsFWhol28itwpGnSZKEATax+bzYPYmIvTZyZMDL3qNxV8NU2AYuuy
         n/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oy7Ecf/dRDd49hyOLVsUhynlyl/pEIRUC0Q/sOTmdy8=;
        b=uj2ktZm7ZqljdpoBi4BnjozEPWY9TQDJdCegnFBkPGQwLxLgMT+5DXUYhbmQqAdG51
         s1BPQT1tyv+MrW3Y6EzLpj2Exy0opmzIFy/svqFLkR3mR0zprLOoKqkPbhzskJI3GGWY
         +27IavPi0eKhucUz4zbs7HwTk3CMYE+tUD0297gYbnycJI/ODncR6LxraHyKsxw1Vc3Y
         bafiRWUcmRJhKzxwDwXJjGk3NLlnSSLBaFFVY1T2ntGKE2oQY0DU+ItJJBTyTr9Mo+hr
         GvEpNNq2NuATzgtSdgEtuSxW8sxCpIMyJd9FAYb2yNNllo+N5oNo2RTAVqqbRoB0GNqv
         ZS4w==
X-Gm-Message-State: AOAM530mSiI17hHzGeVmWMs4lzjmC2TPfhYpo2y7dSCf1V4nUH6fMWIa
        X4YlbrAQirwQRfaawiMtJ1E=
X-Google-Smtp-Source: ABdhPJy650xffuUDuio1syG4MlCMzzqUk689ijemjrQ1QqkFinKFcC2nctwhoOEab/Y47Xq1Zi4ynA==
X-Received: by 2002:ac8:7454:: with SMTP id h20mr18843593qtr.84.1596898041978;
        Sat, 08 Aug 2020 07:47:21 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id t8sm11100627qtc.50.2020.08.08.07.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Aug 2020 07:47:21 -0700 (PDT)
Subject: Re: [PATCH v2] i2c: iproc: fix race between client unreg and isr
To:     Dhananjay Phadke <dphadke@linux.microsoft.com>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, rayagonda.kokatanur@broadcom.com,
        rjui@broadcom.com, wsa@kernel.org
References: <00a30ca7-d533-94ba-994a-9a133fadb045@gmail.com>
 <1596858925-45763-1-git-send-email-dphadke@linux.microsoft.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <0f7063f5-8ca7-f469-574b-82382d49e266@gmail.com>
Date:   Sat, 8 Aug 2020 07:47:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596858925-45763-1-git-send-email-dphadke@linux.microsoft.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 8/7/2020 8:55 PM, Dhananjay Phadke wrote:
> On 8/7/2020, Florian Fainelli wrote:
>>> When i2c client unregisters, synchronize irq before setting
>>> iproc_i2c->slave to NULL.
>>>
>>> (1) disable_irq()
>>> (2) Mask event enable bits in control reg
>>> (3) Erase slave address (avoid further writes to rx fifo)
>>> (4) Flush tx and rx FIFOs
>>> (5) Clear pending event (interrupt) bits in status reg
>>> (6) enable_irq()
>>> (7) Set client pointer to NULL
>>>
>>
>>> @@ -1091,6 +1091,17 @@ static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave)
>>>  	tmp &= ~BIT(S_CFG_EN_NIC_SMB_ADDR3_SHIFT);
>>>  	iproc_i2c_wr_reg(iproc_i2c, S_CFG_SMBUS_ADDR_OFFSET, tmp);
>>>  
>>> +	/* flush TX/RX FIFOs */
>>> +	tmp = (BIT(S_FIFO_RX_FLUSH_SHIFT) | BIT(S_FIFO_TX_FLUSH_SHIFT));
>>> +	iproc_i2c_wr_reg(iproc_i2c, S_FIFO_CTRL_OFFSET, tmp);
>>> +
>>> +	/* clear all pending slave interrupts */
>>> +	iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET, ISR_MASK_SLAVE);
>>> +
>>> +	enable_irq(iproc_i2c->irq);
>>> +
>>> +	iproc_i2c->slave = NULL;
>>
>> There is nothing that checks on iproc_i2c->slave being valid within the
>> interrupt handler, we assume that the pointer is valid which is fin,
>> however non functional it may be, it may feel more natural to move the
>> assignment before the enable_irq()?
> 
> As far as the teardown sequence ensures no more interrupts arrive after
> enable_irq() and they are enabled only after setting pointer during
> client register(); checking for NULL in ISR isn't necessary. 

Agreed.

> 
> If The teardown sequence doesn't guarantee quiescing of interrupts,
> setting NULL before or after enable_irq() is equally vulnerable.

The teardown sequence is sort of a critical section if we may say, so
ensuring that everything happens within it and that enable_irq() is the
last operation would seem more natural to me at least. Thanks
-- 
Florian
