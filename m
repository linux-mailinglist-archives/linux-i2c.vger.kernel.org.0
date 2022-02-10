Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 512844B09D5
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 10:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238955AbiBJJqs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 04:46:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238777AbiBJJqs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 04:46:48 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C191B9;
        Thu, 10 Feb 2022 01:46:44 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id a25so7114240lji.9;
        Thu, 10 Feb 2022 01:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bzXIWUuEbkmSgm24Zd3fx9RlrQU/IKnMPvoFEkNX03M=;
        b=OxYqw+gZKLJQeJz3jFBGsCM1bhqj9nnq4eWKG2MhTkrs849X2MlNousMPwkTVvS398
         12kY9Z2eAnQ4DT7b6poT0X+Y7N1MMYFdCOQ5PlnZXA4xWBIhOUMw3I+iOol58CoDIIP3
         j+Q33e1tx8AbnCQYOtVOHWU8W5kpmUHSJTamY1sLO30dmL4hBaA9fw045CH6OgJMcPoE
         icUYJe2sr+0CR3sqC7WIRn7L3mtMIK14JlAvvI5tNWFDSMGZZZgpyxr75YCSFGX6Hru0
         Q3c5mqT2Vg0Rbf9OtyF+UGq6TDhxBX+YUWDBTzS7OqUDGwUuqxV8rwwRRuslNEYw4uPf
         LcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bzXIWUuEbkmSgm24Zd3fx9RlrQU/IKnMPvoFEkNX03M=;
        b=03p8x4AgOP/1ptWP1ro1xzBKwYMZZoqMWywRAe8ATP05xM+rJkdO51mIxA8tBl77iT
         aAx2uiJuzrIzzqQvMXSbeXty9pWy7ulBO8zmCnVTCm3CPghuFMO1B7mqVBYgQ/b4cIo9
         E8Ho4ceSRlPf7XZWcw6goh6SZYcP6pejhXt+w0tcXwuRemnlkCNKzN6tag34lUx6JCkn
         9jxaHfn0O2ub95HQ9gE+/ml5p3srwEZz764MQfiLHq24q6y58IrqUKOmHbmRaXFw7NKd
         PtE5E/pucp5taylZPTLqkdwLC/3uxvtLsvXYLsYGRHc4UyTQH0/cSOLIlaZ4KkApOtTY
         TY/w==
X-Gm-Message-State: AOAM533qVyHdO3KzZOPNWKipGAghgZG/ef7t1qAdvmbTS+74Fr39XpXg
        LytjMQ4sRZVZSJRM0oG1oNBAS8cGxKMzqw==
X-Google-Smtp-Source: ABdhPJxMqskafQcsNnZ1THj9gslNIOUlvh9+XXDJ4CYcBrRSTLRMZIxqhHO+SAv1yJ3S0bFfEK4QcQ==
X-Received: by 2002:a2e:8756:: with SMTP id q22mr4236837ljj.93.1644486402772;
        Thu, 10 Feb 2022 01:46:42 -0800 (PST)
Received: from [192.168.1.103] ([31.173.82.75])
        by smtp.gmail.com with ESMTPSA id i8sm2744520lfj.226.2022.02.10.01.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 01:46:42 -0800 (PST)
Subject: Re: [PATCH 2/3] i2c: sh_mobile: Use platform_get_irq_optional() to
 get the interrupt
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
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
 <042a2183-3f04-088c-1861-656de870337d@gmail.com>
 <CAK8P3a3owi7YWmq-tckD-C7NK5HaX+swGNW-QBkWQuQgVsVWrA@mail.gmail.com>
 <d74ab454-9337-d168-9b21-842569431b4a@gmail.com>
 <CAK8P3a20mwJXN4Mb063zQG+HAevj_Odpj58EzPHkX-p6pbtnGA@mail.gmail.com>
 <7c47ce67-88ee-9cba-3356-a530b0d3e657@gmail.com>
 <CAMuHMdXEXjsea1DmebALTNwAQnJeJt4qV_0xkQ-5_OWx7ziF1g@mail.gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <aae11858-9a63-c5ad-21c2-910a7f87160f@gmail.com>
Date:   Thu, 10 Feb 2022 12:46:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXEXjsea1DmebALTNwAQnJeJt4qV_0xkQ-5_OWx7ziF1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/10/22 12:32 PM, Geert Uytterhoeven wrote:

[...]

>>>>> I had another look at this after you asked about it on IRC. I don't
>>>>> know much SH assembly, but I suspect IRQ 0 has not been delivered
>>
>>    Neither do I, sigh...
>>    I do know the instuctions are 16-bit and so there are no immediate
>> opperands... :-)
> 
> There is byte immediate data (TIL).

    Yeah, I figured. :-)

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergey
