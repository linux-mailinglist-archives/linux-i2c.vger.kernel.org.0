Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0AC147D293
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Dec 2021 14:01:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245145AbhLVNBB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Dec 2021 08:01:01 -0500
Received: from mail-ua1-f43.google.com ([209.85.222.43]:33544 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245117AbhLVNBB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Dec 2021 08:01:01 -0500
Received: by mail-ua1-f43.google.com with SMTP id a14so4336572uak.0;
        Wed, 22 Dec 2021 05:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yxte1rmkLG8Gm4NdhjyMtfcy7DGtqwrDwC8ez4uL4ug=;
        b=7aexI+22OuVkLdZeWSxCPzvWM9o48o4yUTmU8QjcyHW5hICJSXWaqqIYXRXN0B33MT
         c7mQIOLPQDLPzU5493ZJo7+/YkBoAEyjg8reCwcbxzjoQi62TASVIC+9OeTSQ1vaA2A1
         Vk9AIb6kdCIoQ/6g1Wm9gaTfFwoCtkpVz6CZ12BE58jiLbQvIEhr3AqW3RnmaDJ4a8Jf
         1m4iT3DXQETQfdqQXu6z4XMswdcvpGW46/BMqLM1XE803IqUdHKIs95M4CIT7DNKCjd5
         7x1w6/0IhOMBGM1C6UubsmBK1dDOiZj9JkpsWpzBSGk4ZkYudLehfLG3o9mxVg25xNG2
         TgiA==
X-Gm-Message-State: AOAM531bXCST4l0bOV/x434y5txFEEfBKS+ZUHe0RXiJfNYcJBmYFbru
        DfM+geAWbAKcRtt7gNxyEYYhA8juUlMy1Q==
X-Google-Smtp-Source: ABdhPJxv37cvs2r4zsJg2ebG9OgCzjGonPx8m71eAcn0O3DfWWsNnb5//UdHj4scngwnsn13jQHMqA==
X-Received: by 2002:ab0:70ce:: with SMTP id r14mr892472ual.76.1640178060090;
        Wed, 22 Dec 2021 05:01:00 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id bc2sm369283vkb.53.2021.12.22.05.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Dec 2021 05:00:59 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id m185so1263688vkm.5;
        Wed, 22 Dec 2021 05:00:59 -0800 (PST)
X-Received: by 2002:a1f:2196:: with SMTP id h144mr984968vkh.7.1640178059508;
 Wed, 22 Dec 2021 05:00:59 -0800 (PST)
MIME-Version: 1.0
References: <20211221175322.7096-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211221175322.7096-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211221175322.7096-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 22 Dec 2021 14:00:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVc-t_7-HRiM=nubmBHGRUvC+ihRa1M287LMdD3RD2dnw@mail.gmail.com>
Message-ID: <CAMuHMdVc-t_7-HRiM=nubmBHGRUvC+ihRa1M287LMdD3RD2dnw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] i2c: riic: Use platform_get_irq() to get the interrupt
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakarprabhakar.csengg@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 21, 2021 at 7:25 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
>
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
