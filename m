Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1ECD45D5F
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 15:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbfFNNCa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 09:02:30 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33450 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbfFNNC3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jun 2019 09:02:29 -0400
Received: by mail-lf1-f68.google.com with SMTP id y17so1709848lfe.0;
        Fri, 14 Jun 2019 06:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pRP7qyOkDFtVUVsLDhfDaqQj/BTUTCxxtpJ3rjbJ4gI=;
        b=YPo2ruTox4SlsGl1IjghGXdBC0uUqlmcRpaKkG31j06io3XMIThlhH3uiY3fLJwb4T
         65uGl/tIgF0nWit/WY1kWqaAGaqJsaOdlgc6QGih659sfwzGvAux6nYrZi1pv8QVC3Ca
         m5rRSgxQT5ehHMYNggHl8rf6uOde73KauwWSyD/qfavQb/7wXp61Yr7H4Dd7kSYiwyJV
         /woRvyYYkNx9DyE0QM2+iyFEiipJ98y6ts8e6/rcd47OwEhmc4dnbqF1e5MzbKbcAg33
         Rd/Jwd7tyHAYx54EyYqMbz6C41PXk5QhAxt4F0qqqmW9LYVVEaBw/N6INJkrb2pxmKEF
         cP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pRP7qyOkDFtVUVsLDhfDaqQj/BTUTCxxtpJ3rjbJ4gI=;
        b=Xd8JJAuh788qcMJhXIZY8/jEofLY4gWVmX10sdtnY142QHxLFulqoMTuvWxOI5lOQy
         CfFFHYVx71Uh3PglMS0mjh0xSjO/g5Oym2sRAiq+N1VZgfjtD+5/yXdBGHDhP6yjK7jS
         FCcWtFVOPLm+8l+jtz7RQi2euUzL4Qby3TiGxCs5xKDhNzXAgXdg9QwNGZ8qqXUIvex1
         b4FL5OYWKvrut2u8EnCZ3u0RxbPQzcBCCriIqxHuFlHxghPrhBCbWqpxxIBqJWq9mosQ
         OMbI++C/E70jwrPcC0AZSyUUxrd3GnrfaDTiHGyNMv1O1KAZGaEQcy7zP7Q9rXSV0Ui5
         u0zA==
X-Gm-Message-State: APjAAAX6iXALVsFPOZD4cFgajRZDoLLJJs/rAiHCI1vJKpYNUIOmGiD9
        lFNrp9FKNqwtTgVDi/HqFdaRVuSR
X-Google-Smtp-Source: APXvYqxQYD8gAVrptvWPCVyszEwO3Y573I51sTNfYV1C6xkSIzv1jts7i8RQZD1N7ozD3+c8eci+wQ==
X-Received: by 2002:a19:bec9:: with SMTP id o192mr26311169lff.78.1560517346711;
        Fri, 14 Jun 2019 06:02:26 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id j25sm483692lfh.6.2019.06.14.06.02.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 06:02:26 -0700 (PDT)
Subject: Re: [PATCH V5 6/7] i2c: tegra: fix PIO rx/tx residual transfer check
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
 <1560250274-18499-6-git-send-email-bbiswas@nvidia.com>
 <42ce2523-dab9-0cdf-e8ff-42631dd161b7@gmail.com>
 <78140337-dca0-e340-a501-9e37eca6cc87@nvidia.com>
 <9cb7123a-1ebd-3a93-60dc-c8f57f60270b@gmail.com>
 <e795ddcf-dd11-4e39-2a94-b663e5ecb35b@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d2c97291-6392-d614-5cd9-1490a816548c@gmail.com>
Date:   Fri, 14 Jun 2019 16:02:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e795ddcf-dd11-4e39-2a94-b663e5ecb35b@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

14.06.2019 12:50, Bitan Biswas пишет:
> 
> 
> On 6/13/19 5:28 AM, Dmitry Osipenko wrote:
>> 13.06.2019 14:30, Bitan Biswas пишет:
>>>
>>>
>>> On 6/12/19 7:30 AM, Dmitry Osipenko wrote:
>>>> 11.06.2019 13:51, Bitan Biswas пишет:
>>>>> Fix expression for residual bytes(less than word) transfer
>>>>> in I2C PIO mode RX/TX.
>>>>>
>>>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>>>> ---
>>>>
>>>> [snip]
>>>>
>>>>>            /*
>>>>> -         * Update state before writing to FIFO.  If this casues us
>>>>> +         * Update state before writing to FIFO.  If this causes us
>>>>>             * to finish writing all bytes (AKA buf_remaining goes to
>>>>> 0) we
>>>>>             * have a potential for an interrupt (PACKET_XFER_COMPLETE is
>>>>> -         * not maskable).  We need to make sure that the isr sees
>>>>> -         * buf_remaining as 0 and doesn't call us back re-entrantly.
>>>>> +         * not maskable).
>>>>>             */
>>>>>            buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;
>>>>
>>>> Looks like the comment could be removed altogether because it doesn't
>>>> make sense since interrupt handler is under xfer_lock which is kept
>>>> locked during of tegra_i2c_xfer_msg().
>>> I would push a separate patch to remove this comment because of
>>> xfer_lock in ISR now.
>>>
>>>>
>>>> Moreover the comment says that "PACKET_XFER_COMPLETE is not maskable",
>>>> but then what I2C_INT_PACKET_XFER_COMPLETE masking does?
>>>>
>>> I2C_INT_PACKET_XFER_COMPLETE masking support available in Tegra chips
>>> newer than Tegra30 allows one to not see interrupt after Packet transfer
>>> complete. With the xfer_lock in ISR the scenario discussed in comment
>>> can be ignored.
>>
>> Also note that xfer_lock could be removed and replaced with a just
>> irq_enable/disable() calls in tegra_i2c_xfer_msg() because we only care
>> about IRQ not firing during of the preparation process.
> This should need sufficient testing hence let us do it in a different series.

I don't think that there is much to test here since obviously it should work.

>>
>> It also looks like tegra_i2c_[un]nmask_irq isn't really needed and all
>> IRQ's could be simply unmasked during the driver's probe, in that case
>> it may worth to add a kind of "in-progress" flag to catch erroneous
>> interrupts.
>>
> TX interrupt needs special handling if this change is done. Hence I think it should be
> taken up after sufficient testing in a separate patch.

This one is indeed a bit more trickier. Probably another alternative could be to keep GIC
interrupt disabled while no transfer is performed, then you'll have to request interrupt
in a disabled state using IRQ_NOAUTOEN flag.

And yes, that all should be a separate changes if you're going to implement them.
