Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABCC052FD01
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 15:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233773AbiEUN4q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 09:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbiEUN4p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 09:56:45 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19FD83EAA4;
        Sat, 21 May 2022 06:56:45 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id w3so2854719plp.13;
        Sat, 21 May 2022 06:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=kFTe+XhGcQtsCoxkdaBMhP9gdy39T6uFw4OY1itArqs=;
        b=lf4BRQDe4TQwfCGwiFVP/JssPHosaBGPwsqgMBj4ZWP4Vq5KIPUFkHC3txKh1EI7n5
         Mdc6RCiKccE+hg0QxPUTXIufN2yu1sG39zY7FvBoiNKvRhbPMxWyW1cDR2VWNkMXUCh5
         +UOYrrV0+XMrypDknkx1bP4T1+tFPXSTqM7ZyWExtyp2bYkqm4VvnJqJSYfxnpHRjYPp
         oqqQlOW6VO8GXAodLWFC0Cq0Uq44yvyWbmq6rEu1IK5pNrTphnWqkzVaO6OubxQ6GU/b
         56Fr/OdvvDLfK0FoLkWiSxrDaJGJXmI4xPCZMKEvmaPwKQhE+YW5MBlh0OPsT7RfkGIF
         vIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kFTe+XhGcQtsCoxkdaBMhP9gdy39T6uFw4OY1itArqs=;
        b=JlkhkFdNxWR2Q5jh1x+d76Ia0Z+rIY7yWC8mAzi1CNkFafYCc2E7zc7r6HYqRiuVvg
         2+DlRghTWFcEiIjHrCWmA4fZ0atzTiS7MAg1/rlNgcg3G6I4nFpGp3HNGjxR9lRJaJWk
         CyzxE8u+fL+YV/8j2Z2A/RMDI4KHwGweGk/hwVcG9vQwkH9jkfJfG73CzP9nT4pjIvEV
         XR5fHVEVxhrWgpwsNayerr5Up16iU1UGf4NAhF3UvL3PXc9Ol0620FNb8LXSWdaY31Gm
         9NUr3BDAqlZHN7DXwRY6RCwAtjpPfi43pCyAZ/aLNA0rOagb6kEeixJVlrK1O4sfHR+v
         FbfQ==
X-Gm-Message-State: AOAM532uMazO2lgATp1avdaoW+Lz+5ExwHqKg72gn09bZjlEp/wbMKeO
        lDm6p4oBByt1oR9bE2tk58EGt/v9yMq+ou9e
X-Google-Smtp-Source: ABdhPJy1JKi1c7JDWXFWM58P3YBC8dI7WvgxnvWbgjGMf2zWcYOH0NoWoucyWHrXIRYfzVAxGdFomA==
X-Received: by 2002:a17:902:ccd0:b0:156:7ac2:5600 with SMTP id z16-20020a170902ccd000b001567ac25600mr14348873ple.156.1653141404604;
        Sat, 21 May 2022 06:56:44 -0700 (PDT)
Received: from [172.16.10.243] ([219.142.146.204])
        by smtp.gmail.com with ESMTPSA id e19-20020a170902f1d300b001617541c94fsm1628412plc.60.2022.05.21.06.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 May 2022 06:56:44 -0700 (PDT)
Message-ID: <efacce9b-8fcc-5b57-b112-ea96d1e5a742@gmail.com>
Date:   Sat, 21 May 2022 21:56:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] i2c: bcm2835: Fix error handling in bcm2835_i2c_probe
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Wolfram Sang <wsa@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Eric Anholt <eric@anholt.net>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Annaliese McDermond <nh6z@nh6z.net>, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220403063310.7525-1-linmq006@gmail.com>
 <YojRB2043uYeV0XH@shikoro> <dd299256-2266-4736-e50f-17b417529699@wanadoo.fr>
From:   Miaoqian Lin <linmq006@gmail.com>
In-Reply-To: <dd299256-2266-4736-e50f-17b417529699@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2022/5/21 20:28, Christophe JAILLET wrote:
> Le 21/05/2022 à 13:46, Wolfram Sang a écrit :
>> On Sun, Apr 03, 2022 at 06:33:08AM +0000, Miaoqian Lin wrote:
>>> In the error handling path, the clk_prepare_enable() function
>>> call should be balanced by a corresponding 'clk_disable_unprepare()'
>>> call. And clk_set_rate_exclusive calls clk_rate_exclusive_get(),
>>> it should be balanced with call to clk_rate_exclusive_put().
>>> , as already done in the remove function.
>>>
>>> Fixes: bebff81fb8b9 ("i2c: bcm2835: Model Divider in CCF")
>>> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
>>
>> Looking for a reviewer here, pretty please?
>
> Hi,
>
> on which tree are you working?
> A similar patch is already available in -next since several months. (see [1])
>

Hi,

I mainly work on master, sorry I didn't notice it when submitted.

I may make a mistake with synchronize, thanks for your reply.

> CJ
>
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/i2c/busses/i2c-bcm2835.c?id=b205f5850263632b6897d8f0bfaeeea4955f8663
>>
>>> ---
>>>   drivers/i2c/busses/i2c-bcm2835.c | 21 ++++++++++++++++-----
>>>   1 file changed, 16 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
>>> index 5149454eef4a..d794448866a7 100644
>>> --- a/drivers/i2c/busses/i2c-bcm2835.c
>>> +++ b/drivers/i2c/busses/i2c-bcm2835.c
>>> @@ -454,18 +454,21 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
>>>       ret = clk_prepare_enable(i2c_dev->bus_clk);
>>>       if (ret) {
>>>           dev_err(&pdev->dev, "Couldn't prepare clock");
>>> -        return ret;
>>> +        goto err_put_clk;
>>>       }
>>>         i2c_dev->irq = platform_get_irq(pdev, 0);
>>> -    if (i2c_dev->irq < 0)
>>> -        return i2c_dev->irq;
>>> +    if (i2c_dev->irq < 0) {
>>> +        ret =  i2c_dev->irq;
>>> +        goto err_disable_clk;
>>> +    }
>>>         ret = request_irq(i2c_dev->irq, bcm2835_i2c_isr, IRQF_SHARED,
>>>                 dev_name(&pdev->dev), i2c_dev);
>>>       if (ret) {
>>>           dev_err(&pdev->dev, "Could not request IRQ\n");
>>> -        return -ENODEV;
>>> +        ret = -ENODEV;
>>> +        goto err_disable_clk;
>>>       }
>>>         adap = &i2c_dev->adapter;
>>> @@ -489,8 +492,16 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
>>>         ret = i2c_add_adapter(adap);
>>>       if (ret)
>>> -        free_irq(i2c_dev->irq, i2c_dev);
>>> +        goto err_free_irq;
>>> +
>>> +    return ret;
>>>   +err_free_irq:
>>> +    free_irq(i2c_dev->irq, i2c_dev);
>>> +err_disable_clk:
>>> +    clk_disable_unprepare(i2c_dev->bus_clk);
>>> +err_put_clk:
>>> +    clk_rate_exclusive_put(i2c_dev->bus_clk);
>>>       return ret;
>>>   }
>>>   -- 
>>> 2.17.1
>>>
>
