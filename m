Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27EE04AF4D0
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 16:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235568AbiBIPLh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 10:11:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbiBIPLg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 10:11:36 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8879C061355;
        Wed,  9 Feb 2022 07:11:39 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id q22so3840024ljh.7;
        Wed, 09 Feb 2022 07:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L/a44QIFu4GEqu3h1MLP6vM8XWtuYMRwBshrx27WyAY=;
        b=I/c+R0NmgLwawUGu//RsV9iBqj4yNQZ0BJ8ZI+PigPc7n+2It+pspwCEYoovxBqD/r
         UpQfnuqyu6mgVHsA3tp6NIFlFDtqAuMt8LR3RB3T58qriHjgJ2E2S6fVv+Ig7UcDuh2u
         rFY7m+uxoyEhlYcHYzVd+qNAxGNb9R+8c1BHk/niRFdonEBFFT45t4gNqdqJGXSZHcRy
         si1GUeVcayD6MLfDR9bfcJGTeHS78OILzQRakHdPflgWM7i7Q2T/VRB/fl2MQX/N6mp6
         RlrdZ7qdLl/xsH29abHkIgkmsqkiAFuG1vuYJWbVR2nC7QwCSMeE5Mcx85HZPF+8Z+jC
         ASjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L/a44QIFu4GEqu3h1MLP6vM8XWtuYMRwBshrx27WyAY=;
        b=LNs1DxorgF1ZbKcSS5+4fZwzsXRgIASOuAgkdOPdrCX6ZYAboSKQMjz/DJVYb578pP
         TfQ9SjcoZXl7STLzLUipGTQgR+92hTllOKo1mIP5I51kKl4xPyIBOf2s/dI1jfbnjbGE
         8/KlVFtLjqz5iDZ7GhaTCBNlhSje3UG6YHSzJvxOuvLPnQACTqPgwvZIwUN73H8VzkoE
         EXLC/j1rAtyU9JNXd0JHaYsybilQTcwqT/ysEn80JYMrPSuM/muW1K/iAV3uw+A9CSon
         NRMOxTFKCqXcc/WfRP7UHgEIDp3SI7n58TZBYCXOG2urG2Eb+GrYBtKNYuT5Gs/IngOr
         RVIA==
X-Gm-Message-State: AOAM5326MYW93Wmh6oe8Qef6cSo8XCLj/smJ41FjOB/J+Onfh7uajds6
        ZgOalwb+HKSuq4Ihz7xrAOqUlQXM5+g=
X-Google-Smtp-Source: ABdhPJymRUs4E0EHRsGlJwzixf2d554R5n77Y2e17iIb6xpGil6l9mbKxSnYfkGCeXjTlAkBsRDhuQ==
X-Received: by 2002:a05:651c:1542:: with SMTP id y2mr1850490ljp.279.1644419497692;
        Wed, 09 Feb 2022 07:11:37 -0800 (PST)
Received: from [192.168.1.103] ([178.176.73.27])
        by smtp.gmail.com with ESMTPSA id g26sm2409550lfj.176.2022.02.09.07.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 07:11:37 -0800 (PST)
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
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <d74ab454-9337-d168-9b21-842569431b4a@gmail.com>
Date:   Wed, 9 Feb 2022 18:11:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3owi7YWmq-tckD-C7NK5HaX+swGNW-QBkWQuQgVsVWrA@mail.gmail.com>
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

On 2/8/22 3:31 PM, Arnd Bergmann wrote:

[...]
>>> I might have missed something, but it seems the only user of IRQ 0 on
>>> SuperH is smsc911x Ethernet in arch/sh/boards/board-apsh4a3a.c and
>>> arch/sh/boards/board-apsh4ad0a.c, which use evt2irq(0x200).
>>> These should have been seeing the "0 is an invalid IRQ number"
>>> warning splat since it was introduced in commit a85a6c86c25be2d2
>>> ("driver core: platform: Clarify that IRQ 0 is invalid"). Or not:
>>
>>     Warning or no warning, 0 is still returned. :-/
>>     My attempt to put an end to this has stuck waiting a review from the IRQ
>> people...
> 
> I had another look at this after you asked about it on IRC. I don't
> know much SH assembly, but I suspect IRQ 0 has not been delivered
> since 2009 after 1e1030dccb10 ("sh: nmi_debug support."). On a

   Mhm... this commit changes the SH3 code while SH778x are SH4A, no?

[...]

> 
>         Arnd

MBR, Sergey
