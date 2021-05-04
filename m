Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C930F372FAB
	for <lists+linux-i2c@lfdr.de>; Tue,  4 May 2021 20:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbhEDSYc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 May 2021 14:24:32 -0400
Received: from mail-ua1-f49.google.com ([209.85.222.49]:36698 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbhEDSYc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 May 2021 14:24:32 -0400
Received: by mail-ua1-f49.google.com with SMTP id x9so3359982uao.3;
        Tue, 04 May 2021 11:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3kCi7il0d+3nsw+AljeEXtKK4PHHIL4TmkvDsGM75V8=;
        b=m3UoJErGmT/WfUem4W9fKOcEafzekWHr14EPx7yMhPIVJO29jstGRpWTn3U1wXPAoh
         VJaSZj6mbtBcEmRJ2R4F7Oh+L1Tel0NwX4a5qdHX9hp9YODUGAkkltYsE8zI0A6DTab/
         8DGT5S8Fb9+e0lIv/W16UNZzkSNO+d2a3+AQcS/d8C7Y07v1ajpuVtloDrgf2pYPzD6g
         hXGkV2AVcXOusHayiFBBmaRRahsYjuLY04G3v2rXCqNBSTaaFAThiP1EzCt7lbq0MQHV
         t23kIOPQa9dTVqD3vHub9aDG7s4ckc6b1O4aZcASxHsa8KyQwjcceTTSxhbuCZU994Ob
         8DzA==
X-Gm-Message-State: AOAM531jRwhCfXOUazgiD91DED6TNvdYg0ArSrMMMwZ/+oQIsLQ+ybIa
        Gez/ijeQ1hYDYL73+SKDZhEnJp0zNV0fZZI9i1JjRTxA3Hk=
X-Google-Smtp-Source: ABdhPJxjaTqOrV8Avg7BlIVuRVuRcJHODKU3sgjJMcMCnRvgpJMa5S9kVu60npCdeiW2KFrbJCxRplfsKC5hHxB6yM4=
X-Received: by 2002:ab0:3157:: with SMTP id e23mr21500212uam.106.1620152616701;
 Tue, 04 May 2021 11:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620139307.git.geert+renesas@glider.be>
In-Reply-To: <cover.1620139307.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 4 May 2021 20:23:25 +0200
Message-ID: <CAMuHMdWJ40hcw9L=MAKH0dTByjW_a8NbLxZ6GDV81MiH+gAk3Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] ARM: dts: r8a7745,r8a7794: Remove generic compatible
 strings from iic blocks
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 4, 2021 at 4:49 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This patch series fixes the first issues discovered by[1], and removes
> the generic compatible strings from the IIC blocks on the R-Car E2 and
> RZ/G1E SoCs, as they do not have the automatic transmission registers.
> More follow-up patches are expected, when IIC will have dislosed all of
> its secrets...
>
> Thanks for your comments!
>
> [1] "[PATCH/RFC 4/6] dt-bindings: i2c: renesas,iic: Convert to json-schema"
>     lore.kernel.org/r/ecfaf6be5e8c285db2bcc823bb1dd89931fa5c29.1620138454.git.geert+renesas@glider.be
>
> Geert Uytterhoeven (2):
>   ARM: dts: r8a7745: Remove generic compatible strings from iic blocks
>   ARM: dts: r8a7794: Remove generic compatible strings from iic blocks
>
>  arch/arm/boot/dts/r8a7745.dtsi | 8 ++------
>  arch/arm/boot/dts/r8a7794.dtsi | 8 ++------

While drivers/i2c/busses/i2c-sh_mobile.c already has a match entry for
"renesas,iic-r8a7794", it does not have one for "renesas,iic-r8a7745"
yet.  Hence patch 2/2 depends on a to-be-sent patch to update the
driver.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
