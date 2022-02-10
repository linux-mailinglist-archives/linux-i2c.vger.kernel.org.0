Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67C4F4B098C
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 10:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238542AbiBJJcp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 04:32:45 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238627AbiBJJco (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 04:32:44 -0500
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF75192;
        Thu, 10 Feb 2022 01:32:46 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 5so2693414vkq.9;
        Thu, 10 Feb 2022 01:32:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3h7Fq6t1CyQhpx3fmaUEIuNQ6eeRZ0EVonG+Q/4aZ/M=;
        b=FsunnLYWRGbn0GhiAu+ZzrMwXf3sS2D5zshBpwZ5rDZHjXfKOCuM/KZTJFZdDxSzla
         5TxEG3sj1lZdkK0weIcNfwKgzPvvlOEEWz5Z1kEA0QUXXZKWMa32kbnOTr73ETYQc1RS
         QsQ5UDUKX9ED2rDrJMeOCT+93W812AMU3nn+peWK4DV14B/fu/DakQaL25t9Nxzv/KJ1
         9ClJ3bIkG4Ehz5IMcMab6dVjKEg42HUhq6oNHWeqRUx12oR4b8ZQZ3L5JIJUOTCYJ9s2
         3TCojaD/qvylfT8rmtwGcHW1sElKTU9jx37vjEITmb7Jt6BonLa+OvvmaCNwSRw1pVac
         zQyQ==
X-Gm-Message-State: AOAM530ROjKsGyJ1kqPy2of2iGU9BvL8If27AFV79N+Rch7ZkOFdP7M6
        2jj92O50MF+E5jtmgmR83DLUmfYTpgfG8g==
X-Google-Smtp-Source: ABdhPJyeWmkzVty1o3HEXd1SUVHSE51cTI1/sE8s709QKYS53JxTJljNv0d3KgTc73dEH6p9wavEKw==
X-Received: by 2002:a05:6122:a0a:: with SMTP id 10mr2266925vkn.17.1644485565262;
        Thu, 10 Feb 2022 01:32:45 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id p186sm3256151vke.52.2022.02.10.01.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 01:32:45 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id 60so2710018uae.1;
        Thu, 10 Feb 2022 01:32:44 -0800 (PST)
X-Received: by 2002:a9f:2c0a:: with SMTP id r10mr2200791uaj.89.1644485564714;
 Thu, 10 Feb 2022 01:32:44 -0800 (PST)
MIME-Version: 1.0
References: <20211218165258.16716-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211218165258.16716-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUg3=q7gyaVHP0XcYUOo3PQUUv8Hc8wp5faVQ+bTBpg4A@mail.gmail.com>
 <042a2183-3f04-088c-1861-656de870337d@gmail.com> <CAK8P3a3owi7YWmq-tckD-C7NK5HaX+swGNW-QBkWQuQgVsVWrA@mail.gmail.com>
 <d74ab454-9337-d168-9b21-842569431b4a@gmail.com> <CAK8P3a20mwJXN4Mb063zQG+HAevj_Odpj58EzPHkX-p6pbtnGA@mail.gmail.com>
 <7c47ce67-88ee-9cba-3356-a530b0d3e657@gmail.com>
In-Reply-To: <7c47ce67-88ee-9cba-3356-a530b0d3e657@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Feb 2022 10:32:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXEXjsea1DmebALTNwAQnJeJt4qV_0xkQ-5_OWx7ziF1g@mail.gmail.com>
Message-ID: <CAMuHMdXEXjsea1DmebALTNwAQnJeJt4qV_0xkQ-5_OWx7ziF1g@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: sh_mobile: Use platform_get_irq_optional() to
 get the interrupt
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sergei,

On Wed, Feb 9, 2022 at 4:48 PM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
> On 2/9/22 6:18 PM, Arnd Bergmann wrote:
> >>> I had another look at this after you asked about it on IRC. I don't
> >>> know much SH assembly, but I suspect IRQ 0 has not been delivered
>
>    Neither do I, sigh...
>    I do know the instuctions are 16-bit and so there are no immediate
> opperands... :-)

There is byte immediate data (TIL).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
