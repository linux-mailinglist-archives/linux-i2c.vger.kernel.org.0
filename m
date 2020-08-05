Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E89623CAF8
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 15:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbgHEN1z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 09:27:55 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46206 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbgHEMfj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Aug 2020 08:35:39 -0400
Received: by mail-ot1-f65.google.com with SMTP id v6so22388522ota.13;
        Wed, 05 Aug 2020 05:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GhwGBb3og4FBqTm6+fj02zyv7weIuiKRDAujBvepcdQ=;
        b=AkCTLgRFlBR2CmRvGoQAVvX/lV7KyfhK79jyxszzJlYZan2QoNuQL4Plkk855FBko4
         lsDPi5BQimZIkERi0758l8NgsKzJVWjMDWGDgtEE0yDCsC5dWIxJdBacmwjnC5+/WFoP
         UzlqHjUEidFs1jkxmbEHjY+06PwJuuPTtity+3gNNtackjE8jXoo5l15LGlmJibksAU3
         2ccjfnjkUqU08hN7HzKYQzouN3CaaaNxKSY+KFBCJ0TWwqrgO1NcicezI1dseM3llfOh
         8s2jd78BNi4SjgLk8kaOegRrXhk8K0gtBJDiFJvK8AqURBpZqxa01GlW9u5t+KrG3s3L
         rX/A==
X-Gm-Message-State: AOAM532s5CWbSZ1Ul2MpUJyCG45r7V7yGxAwCJktwF0kwdI9kGW3ncQv
        YzOBX2dDcPcfesL/Gj34bor/c2EHIzGAuyTdhwqlXQir
X-Google-Smtp-Source: ABdhPJy6Few2JSpX34d8UWs2mHs62Jj4zoFqif/HtRZNiG9fgu0Yy1ArYH3I3/SVye0G2Oxi4tcy3VslWxu2yq+qpJs=
X-Received: by 2002:a05:6830:1b79:: with SMTP id d25mr2025587ote.107.1596625767021;
 Wed, 05 Aug 2020 04:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 13:09:14 +0200
Message-ID: <CAMuHMdVTBWuDVueW4OJff5kC+=PF+Q5OnKAo5-M4+7g9WB-adA@mail.gmail.com>
Subject: Re: [PATCH 04/20] arm64: dts: renesas: r8a774e1: Add SATA controller node
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-ide@vger.kernel.org,
        dmaengine <dmaengine@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jul 16, 2020 at 7:19 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add the SATA controller node to the RZ/G2H SoC specific dtsi.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
