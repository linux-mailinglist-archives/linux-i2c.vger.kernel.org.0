Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9494AF5B8
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 16:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232995AbiBIPs2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 10:48:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236279AbiBIPsZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 10:48:25 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E28B1C05CB82;
        Wed,  9 Feb 2022 07:48:28 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id i34so5057964lfv.2;
        Wed, 09 Feb 2022 07:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=82DwdajpDNDBqVPVvon+Lp7fZFYchqTwnP7OnaqMXhA=;
        b=ZOkWhnlTBnzqrCpWvyLu4YD7jOCU7hGFKGq6WCfRVdhxmTbBTYIQG8rMNK93Kuf10u
         1ZzuxSt8qLrH/DHbop68m20FsgNUQBBJZQet7nDoNej3g7GDVjLaXArFIRy3Xp3dZ8PI
         oGVVrR1548ktVnF4a8IZK+6mgLS+8KpaGogK3XwYJoReaZ9N4gWaDOIz4aGP91gGUeaC
         rGeO3HC/i3L0oV6fDRw0dKedzCghrlk5X6d/cqD8ncs4Munz7zBKtlQtSEGVgdBkfg5r
         mjYm4Yr95o6wCrb8+Vf4nqQO8QkOOcI1viia+oVy6pXgCSEusij2UzqN4/CUFUpXA7YT
         E6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=82DwdajpDNDBqVPVvon+Lp7fZFYchqTwnP7OnaqMXhA=;
        b=HVCvqzSENLWpifCYGS47JwZNpEyQ4wZaRZ8D8MP2Pf8AlaBWWcTMtuZP8sZLuZP5Oq
         qbZD5vDsGqw3fUUx9qrAfKf/oJVljxDPHcNZsCuRvB0qEIY6KFZuJuQH0P7m+Kq0NSFy
         p/HCDB6nmSgY1Deo3mNJ4W7/z8RwXZ9aUZcHU7FkStqsfyhL6IR3K0dqNYFBBTo/x9t1
         Y083afP9KUTsH5cyjFUH9jzTdEskCpGB3g7fWnu9CilDwHWHH1TJoTtfO5hIUZw0RSHC
         hNMe+2lDSsHE9/497y4sYHHCxfcbzqHXdhr9yGMTbpYlaFn3HP34xAnASLWjj4PgDsRe
         cT7Q==
X-Gm-Message-State: AOAM531+LND9D78pfPQzipNeFGsOMjw+dNM5o0VAcGIxaUB0z8cOupPB
        hcqo7mPWqpY8A8hxm4HHmCguwzK+CWJaqg==
X-Google-Smtp-Source: ABdhPJzOm978Gkpt9GdyeIqflw6RUzXCclEoSV+vfQH7V5jKfnEkSPwqXRFfDJFIqi8RsajP0cS8Ug==
X-Received: by 2002:a05:6512:33ce:: with SMTP id d14mr2058147lfg.264.1644421706987;
        Wed, 09 Feb 2022 07:48:26 -0800 (PST)
Received: from [192.168.1.103] ([178.176.73.27])
        by smtp.gmail.com with ESMTPSA id d20sm2521958ljl.25.2022.02.09.07.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 07:48:26 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
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
Message-ID: <7c47ce67-88ee-9cba-3356-a530b0d3e657@gmail.com>
Date:   Wed, 9 Feb 2022 18:48:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a20mwJXN4Mb063zQG+HAevj_Odpj58EzPHkX-p6pbtnGA@mail.gmail.com>
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

On 2/9/22 6:18 PM, Arnd Bergmann wrote:
> On Wed, Feb 9, 2022 at 4:11 PM Sergei Shtylyov
> <sergei.shtylyov@gmail.com> wrote:
>>
>> On 2/8/22 3:31 PM, Arnd Bergmann wrote:
>>
>> [...]
>>>>> I might have missed something, but it seems the only user of IRQ 0 on
>>>>> SuperH is smsc911x Ethernet in arch/sh/boards/board-apsh4a3a.c and
>>>>> arch/sh/boards/board-apsh4ad0a.c, which use evt2irq(0x200).
>>>>> These should have been seeing the "0 is an invalid IRQ number"
>>>>> warning splat since it was introduced in commit a85a6c86c25be2d2
>>>>> ("driver core: platform: Clarify that IRQ 0 is invalid"). Or not:
>>>>
>>>>     Warning or no warning, 0 is still returned. :-/
>>>>     My attempt to put an end to this has stuck waiting a review from the IRQ
>>>> people...
>>>
>>> I had another look at this after you asked about it on IRC. I don't
>>> know much SH assembly, but I suspect IRQ 0 has not been delivered

   Neither do I, sigh...
   I do know the instuctions are 16-bit and so there are no immediate
opperands... :-)

>>> since 2009 after 1e1030dccb10 ("sh: nmi_debug support."). On a
>>
>>    Mhm... this commit changes the SH3 code while SH778x are SH4A, no?
> 
> This code is shared between both:
> 
> arch/sh/kernel/cpu/sh4/Makefile:common-y        += $(addprefix
> ../sh3/, entry.o ex.o)

   Ah, quite convoluted! :-)
   So you mean thet broke the delivery of EVT 0x200 when mucking with NMI?

>        Arnd

MBR, Sergey
