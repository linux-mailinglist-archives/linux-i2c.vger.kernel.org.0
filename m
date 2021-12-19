Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D188E47A1BF
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Dec 2021 19:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236313AbhLSSVg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Dec 2021 13:21:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbhLSSVf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 19 Dec 2021 13:21:35 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985ADC061574;
        Sun, 19 Dec 2021 10:21:35 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id d11so7383053pgl.1;
        Sun, 19 Dec 2021 10:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EZHxJaMWMqX23r2o3MMCrXFx8mIGPMNeherD/8EdFIk=;
        b=lKM0+20/SsF3WNCsyNIE5NBMzoEVurIjwDmPMlnErJUu3zuQcBrn3JM1Ty+/ChyijM
         z4cKfd9eUroNC2Odz/AkMi6pzxutR3BSvsidjgUU+UiYIFoo8l03fuWkCpjmiqA9dAla
         VDD4MC5s8iB+m+f+szpdtKrMudktgznM7Jb/RypvJm6fqEMMEjQ8TlzTsCg7G5XEUvaO
         8LmrEG9zV6vBo6q05d2I9UgdLw2I5BAZYz9IVlhG//zyHdhkBrIuVGWCpHg/FjC2Qk5L
         PpxfxRVdI2uzhSOcX9PwmHttszExuu8tWxHRgJgtEaPBBwQB/H1p8j47XMOAKPARBph2
         v/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EZHxJaMWMqX23r2o3MMCrXFx8mIGPMNeherD/8EdFIk=;
        b=AcdqqRjcjgUurk2yDsZbgUDt9ppicvFvi6vcN8Os/Ln1LCd8rVnmPxhypUR55LKLqY
         PviGXfpHEIMYdrpAEJ/dpwNjpwgapv29jlrujcGZlsPMVwxneEV9fbJNHyiNw3KWo9ul
         QnVKXvsEFGkqXtIsqUAxq5Az4RHVOAILbQl3VAL7xq+Wk9CaQ0HsO9E/XxYzSlxGZ3Fp
         UER4GnLc3ra3VHxxZpdJ3CjUcBKubo11Q4FM2JJuXRLICexbRniByWxJ2N5tHRAFWK5S
         jVHNhhlYIgNwz3y+ua8kTZgRtyfj5mkGVXjBZgxZ9VhItggV+JmrkkU6mV9NyKG/rr81
         IlFg==
X-Gm-Message-State: AOAM5310FO0QcpZnKr7RFlkNM4W/eo13Zgos/mbKKO6s0UtJh/wRhqQn
        O3pI1ZIH2jKUaBwWrTh6zUUfgLwCsaI=
X-Google-Smtp-Source: ABdhPJx2a0IgmxESThZswhvQAQAC2BOq1oRCWx1w6AQenCD/oe0oWBxbrxntzpVXTMGy88lHHYs12g==
X-Received: by 2002:a65:498e:: with SMTP id r14mr11780905pgs.47.1639938095127;
        Sun, 19 Dec 2021 10:21:35 -0800 (PST)
Received: from [10.1.10.177] (c-71-198-249-153.hsd1.ca.comcast.net. [71.198.249.153])
        by smtp.gmail.com with ESMTPSA id g17sm14330420pgh.46.2021.12.19.10.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Dec 2021 10:21:34 -0800 (PST)
Message-ID: <247b7421-e195-2e7c-b210-3165e8ea83a7@gmail.com>
Date:   Sun, 19 Dec 2021 10:21:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/3] i2c: bcm2835: Use platform_get_irq() to get the
 interrupt
Content-Language: en-US
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-rpi-kernel@lists.infradead.org,
        LAK <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20211218165258.16716-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211218165258.16716-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <a02d76dc-52cc-3ecc-5ef7-825c3167431a@gmail.com>
 <CA+V-a8ug-7i7H=pc4j+WtL8ARC6UVhxaeJ1Db23s_yEFTSu8pw@mail.gmail.com>
 <CA+V-a8v8RLCEphjyNxCn+BRaqudwoLxJibjp1ZG5GEv4htNK9g@mail.gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <CA+V-a8v8RLCEphjyNxCn+BRaqudwoLxJibjp1ZG5GEv4htNK9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 12/19/2021 1:52 AM, Lad, Prabhakar wrote:
> Hi Florian,
> 
> On Sat, Dec 18, 2021 at 10:44 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
>>
>> Hi Florian,
>>
>> Thank you for the review.
>>
>> On Sat, Dec 18, 2021 at 9:17 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>>
>>>
>>>
>>> On 12/18/2021 8:52 AM, Lad Prabhakar wrote:
>>>> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
>>>> allocation of IRQ resources in DT core code, this causes an issue
>>>> when using hierarchical interrupt domains using "interrupts" property
>>>> in the node as this bypasses the hierarchical setup and messes up the
>>>> irq chaining.
>>>>
>>>> In preparation for removal of static setup of IRQ resource from DT core
>>>> code use platform_get_irq().
>>>>
>>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>
>>> Just one nit below:
>>>> ---
>>>>    drivers/i2c/busses/i2c-bcm2835.c | 11 ++++-------
>>>>    1 file changed, 4 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
>>>> index 37443edbf754..d63dec5f3cb1 100644
>>>> --- a/drivers/i2c/busses/i2c-bcm2835.c
>>>> +++ b/drivers/i2c/busses/i2c-bcm2835.c
>>>> @@ -402,7 +402,7 @@ static const struct i2c_adapter_quirks bcm2835_i2c_quirks = {
>>>>    static int bcm2835_i2c_probe(struct platform_device *pdev)
>>>>    {
>>>>        struct bcm2835_i2c_dev *i2c_dev;
>>>> -     struct resource *mem, *irq;
>>>> +     struct resource *mem;
>>>>        int ret;
>>>>        struct i2c_adapter *adap;
>>>>        struct clk *mclk;
>>>> @@ -452,12 +452,9 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
>>>>                return ret;
>>>>        }
>>>>
>>>> -     irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>>>> -     if (!irq) {
>>>> -             dev_err(&pdev->dev, "No IRQ resource\n");
>>>> -             return -ENODEV;
>>>> -     }
>>>> -     i2c_dev->irq = irq->start;
>>>> +     i2c_dev->irq = platform_get_irq(pdev, 0);
>>>> +     if (i2c_dev->irq <= 0)
>>>> +             return i2c_dev->irq ? i2c_dev->irq : -ENXIO;
>>>
>>> Why not just check for a negative return code and propagate it as is?
>>>
>> platform_get_irq() may return 0 said that we do get a splat in this
>> case and further request_irq() will fail so instead check it here.
>>
> My bad, just the negative check should suffice.

Think so too, looking forward to v2, thanks!
-- 
Florian
