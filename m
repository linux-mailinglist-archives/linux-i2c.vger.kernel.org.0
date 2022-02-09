Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83DD24AF613
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 17:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236573AbiBIQI1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 11:08:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231704AbiBIQIW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 11:08:22 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DFDBC0613C9;
        Wed,  9 Feb 2022 08:08:25 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id k10so1121850ljq.2;
        Wed, 09 Feb 2022 08:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3LjZkfsnvFgUjcgFV9sB8nTwuBZrwGSMIL1VSbtAcMs=;
        b=YyOQ+mqZzIkGZSYXQT5D4k2YHmoQkHau7yq2V43cGra3NFxDvDz0T+383EQ3fNTsm4
         l+R03EqeEp4P7ZVu2utZxiyp6P0lGX6FE9GqsAnP/B9wEOudXOJGZSolz9hbLIHPKICZ
         HXRECwP6WDfkaTEj4Dbudg9ZfcSf+OKFGkdOX4LTAU/esjpRm96mGuMgBnGu7qF8zemz
         lXghhWestDkhs+kgAhDJ618gf2lBKcmNe2ip381kq7JRdjPF/1mUIKpw+l/XMAPJlqSS
         57V5KYOSjTIvPUl/bg06ZaVpr+q0AW6ZWQwXyAkwjT1DnCc7eAAnz56BBBCcLs+BEPpw
         Br4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3LjZkfsnvFgUjcgFV9sB8nTwuBZrwGSMIL1VSbtAcMs=;
        b=X5dBDClwqLJeQQBSuquXZVb113XlgIfOPeY3BcHV1hppFiZUexgUeTPzOZv8/mZIgW
         qcceTP33f+PrkH0aZ/elyEqiEfFJTbTDrxlMISMEMzrJKsizd28Y79XH+sJp/0/ouMlP
         +cjtjBti1z1YPWyaRrFP8KtpXdsQktjoefZ5n5MsGZ1hS6ZI3M1afAoLIGGOIOGY5YGV
         Jy9k2nUrpNhANJmyXZVKjXnykFtevP+LwQdBVJ6oOEyL1UWN7JUQ4vnpv2r21oKi2dtd
         OO42+h8iNlwT7CpeczT4Fnf03x3lSfHLZxrGi3BtwfGX428kdpy2D9Z5kioOCdy9Iidh
         Zf3w==
X-Gm-Message-State: AOAM5309YEjhwZPa92v2N8iF3mnxMsIzux+OOlA96Ky7yHnOZav5j9xM
        AVGqSW5FGH1A9AwC87+j99eLyY8wxsdnDQ==
X-Google-Smtp-Source: ABdhPJwJWSHIOJjXRlxqiBv7Mp09gR3VoqOHH7ZwVhTUHB69AxeeU/vDtYmpDFh3c4iLVL2uIGUU2A==
X-Received: by 2002:a2e:93c9:: with SMTP id p9mr2009723ljh.397.1644422902208;
        Wed, 09 Feb 2022 08:08:22 -0800 (PST)
Received: from [192.168.1.103] ([178.176.73.27])
        by smtp.gmail.com with ESMTPSA id s13sm2421825lfs.223.2022.02.09.08.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 08:08:21 -0800 (PST)
Subject: Re: [PATCH 2/3] i2c: sh_mobile: Use platform_get_irq_optional() to
 get the interrupt
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
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
 <CAK8P3a0gf6TeK2vZ+u3NZ2VrrvrGUohAPz5WiZ4Mbk5QQg9FFg@mail.gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <9a07be5a-914b-cec9-f6bc-8c1b0ecef766@gmail.com>
Date:   Wed, 9 Feb 2022 19:08:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0gf6TeK2vZ+u3NZ2VrrvrGUohAPz5WiZ4Mbk5QQg9FFg@mail.gmail.com>
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

On 2/9/22 7:02 PM, Arnd Bergmann wrote:

>>>>> since 2009 after 1e1030dccb10 ("sh: nmi_debug support."). On a
>>>>
>>>>    Mhm... this commit changes the SH3 code while SH778x are SH4A, no?
>>>
>>> This code is shared between both:
>>>
>>> arch/sh/kernel/cpu/sh4/Makefile:common-y        += $(addprefix
>>> ../sh3/, entry.o ex.o)
>>
>>    Ah, quite convoluted! :-)
>>    So you mean thet broke the delivery of EVT 0x200 when mucking with NMI?
> 
> Yes, exactly: If I read this right, the added code:
> 
> +       shlr2   r4
> +       shlr    r4
> +       mov     r4, r0          ! save vector->jmp table offset for later
> +
> +       shlr2   r4              ! vector to IRQ# conversion
> +       add     #-0x10, r4
> +
> +       cmp/pz  r4              ! is it a valid IRQ?
> +       bt      10f
> 
> gets the vector (0x200 for this device), shifts it five bits to 0x10,
> and subtracts 0x10,
> then branches to do_IRQ if the interrupt number is non-zero, otherwise it goes
> through the exception_handling_table.

   The SH4 manual I found on my disk (have it from MontaVista times) tells me cmp/pz
sets T if Rn is >= 0, then bt branches if T = 1. So I do think the code is correct.
   One more thing: the board code for those boards was added in 2011, we can assume
it was working back then, right? :-_

>          Arnd

MBR, Sergey
