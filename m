Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4642147A90B
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Dec 2021 12:53:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbhLTLxi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Dec 2021 06:53:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbhLTLxh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Dec 2021 06:53:37 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E22CC061574;
        Mon, 20 Dec 2021 03:53:37 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id l22so21028731lfg.7;
        Mon, 20 Dec 2021 03:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=26xwnj5Rc4PxUxWQ0D4wRedOgH4U0TnIyB5Pyr5ElXM=;
        b=puS2aGCNbSMFjhnD38Y8XSMXeVjdv5GML2E0GBnEjRppvkzbEgR0Tro45eqcyQJrhu
         BHBH1cfwa/nWE/fuxBIWrmlkMvXBdrAmQtxCdsNWDWC42WdDQ5HY1+LZc4jM4RVcL1pv
         HS64ocU6jjBlRGziB8kzJUbU0zBPlsw1jHxSFFgiBCm+oImX1h8Vt5DxZXmF/DkbTxao
         m4k2dFmai2Yf1o9nL8etwhFpEXaKr02wR8BXo9PW3WrfAWROklN6BUaPNno/S1EjQ1EI
         i+ICSCKkbCB3/TuES4c0o4zrQHaa+G91qzCErZ0KzWl6O9OxQbx7BNMaUU+CsL9u5f0Z
         B5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=26xwnj5Rc4PxUxWQ0D4wRedOgH4U0TnIyB5Pyr5ElXM=;
        b=cxWgMoCb49XwyEb94LAvYATbAk8hYvhtWaFAB9G3NE2DRcys2u/QLJGRHbed6D71Iv
         v3dX6laaZ9rq/8GVuYkN/uYOrBfKM1bln6umMgIrkEcJ3rSpZP+lrYPVnWRLL7ZUT7IT
         RK1W6w+uA4CABgjG2u+miV/cAndzGp8W7v6YWmOyz0Z3R5OM+Pi/DTJhFFsisj++nc/2
         kbXGGRZp8tpXnwVdYD8vcaq8RJpz62g5N/wvQgmUGq7w/I/F6ErXEsFtFbVpBqYqwWWq
         UQrDwh73qZEHQsgBhd/fnNRr0s9+O4fnnlovENB56v6UVbTdRXMgkOOKVx4QOT6HkYNm
         diiA==
X-Gm-Message-State: AOAM5319QDluMW2I0vLDXLvpeJQ0KkXa/JMwU+HL1EjGXIrD2r9L5Zkg
        S9azo1KBCD9N/yUdX7/10JQ=
X-Google-Smtp-Source: ABdhPJzvCk2woxK/Bccuz0lcve5nuC7UjZgBk2V0xbwweezLib7eEYvCugQEhe0cBGr2KRpO6gA+QA==
X-Received: by 2002:a05:6512:ea2:: with SMTP id bi34mr15866909lfb.12.1640001215406;
        Mon, 20 Dec 2021 03:53:35 -0800 (PST)
Received: from [192.168.1.100] ([31.173.82.33])
        by smtp.gmail.com with ESMTPSA id g26sm945488lfb.158.2021.12.20.03.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 03:53:34 -0800 (PST)
Message-ID: <042a2183-3f04-088c-1861-656de870337d@gmail.com>
Date:   Mon, 20 Dec 2021 14:53:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/3] i2c: sh_mobile: Use platform_get_irq_optional() to
 get the interrupt
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Linux-sh list <linux-sh@vger.kernel.org>
References: <20211218165258.16716-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211218165258.16716-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUg3=q7gyaVHP0XcYUOo3PQUUv8Hc8wp5faVQ+bTBpg4A@mail.gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
In-Reply-To: <CAMuHMdUg3=q7gyaVHP0XcYUOo3PQUUv8Hc8wp5faVQ+bTBpg4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20.12.2021 13:17, Geert Uytterhoeven wrote:

[...]
>> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
>> allocation of IRQ resources in DT core code, this causes an issue
>> when using hierarchical interrupt domains using "interrupts" property
>> in the node as this bypasses the hierarchical setup and messes up the
>> irq chaining.
> 
> Thanks for your patch!
> 
>> In preparation for removal of static setup of IRQ resource from DT core
>> code use platform_get_irq_optional() for DT users only.
> 
> Why only for DT users?
> Plenty of driver code shared by Renesas ARM (DT-based) on SuperH
> (non-DT) SoCs already uses platform_get_irq_optional(), so I expect
> that to work for both.
> 
>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
>> --- a/drivers/i2c/busses/i2c-sh_mobile.c
>> +++ b/drivers/i2c/busses/i2c-sh_mobile.c
>> @@ -830,20 +830,41 @@ static void sh_mobile_i2c_release_dma(struct sh_mobile_i2c_data *pd)
>>
>>   static int sh_mobile_i2c_hook_irqs(struct platform_device *dev, struct sh_mobile_i2c_data *pd)
>>   {
>> -       struct resource *res;
>> -       resource_size_t n;
>> +       struct device_node *np = dev_of_node(&dev->dev);
>>          int k = 0, ret;
>>
>> -       while ((res = platform_get_resource(dev, IORESOURCE_IRQ, k))) {
>> -               for (n = res->start; n <= res->end; n++) {
>> -                       ret = devm_request_irq(&dev->dev, n, sh_mobile_i2c_isr,
>> -                                         0, dev_name(&dev->dev), pd);
>> +       if (!np) {
>> +               struct resource *res;
>> +               resource_size_t n;
>> +
>> +               while ((res = platform_get_resource(dev, IORESOURCE_IRQ, k))) {
>> +                       for (n = res->start; n <= res->end; n++) {
>> +                               ret = devm_request_irq(&dev->dev, n, sh_mobile_i2c_isr,
>> +                                                      0, dev_name(&dev->dev), pd);
>> +                               if (ret) {
>> +                                       dev_err(&dev->dev, "cannot request IRQ %pa\n", &n);
>> +                                       return ret;
>> +                               }
>> +                       }
>> +                       k++;
>> +               }
>> +       } else {
>> +               int irq;
>> +
>> +               do {
>> +                       irq = platform_get_irq_optional(dev, k);
> 
> Check for irq == -ENXIO first, to simplify the checks below?
> 
>> +                       if (irq <= 0 && irq != -ENXIO)
>> +                               return irq ? irq : -ENXIO;
> 
> Can irq == 0 really happen?

    Doesn't matter much in this case -- devm_request_irq() happily takes IRQ0. :-)

> All SuperH users of the "i2c-sh_mobile" platform device use an
> evt2irq() value that is non-zero.
> 
> I might have missed something, but it seems the only user of IRQ 0 on
> SuperH is smsc911x Ethernet in arch/sh/boards/board-apsh4a3a.c and
> arch/sh/boards/board-apsh4ad0a.c, which use evt2irq(0x200).
> These should have been seeing the "0 is an invalid IRQ number"
> warning splat since it was introduced in commit a85a6c86c25be2d2
> ("driver core: platform: Clarify that IRQ 0 is invalid"). Or not:

    Warning or no warning, 0 is still returned. :-/
    My attempt to put an end to this has stuck waiting a review from the IRQ 
people...

> the rare users may not have upgraded their kernels beyond v5.8 yet...
> 
>> +                       if (irq == -ENXIO)
>> +                               break;
>> +                       ret = devm_request_irq(&dev->dev, irq, sh_mobile_i2c_isr,
>> +                                              0, dev_name(&dev->dev), pd);
>>                          if (ret) {
>> -                               dev_err(&dev->dev, "cannot request IRQ %pa\n", &n);
>> +                               dev_err(&dev->dev, "cannot request IRQ %d\n", irq);
>>                                  return ret;
>>                          }
>> -               }
>> -               k++;
>> +                       k++;
>> +               } while (irq);
>>          }
>>
>>          return k > 0 ? 0 : -ENOENT;
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds

