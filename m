Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11CA223D20F
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 22:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728849AbgHEUIY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 16:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbgHEQce (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Aug 2020 12:32:34 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC18C008691;
        Wed,  5 Aug 2020 07:33:09 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id x1so6635989oox.6;
        Wed, 05 Aug 2020 07:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tpO2xc5Co4QKfwe/fUkQqUFFAe1WeeGtz1oyCqUMySo=;
        b=LhYz9i6I5AM4ZFtxHd+I9u1ASrO4rAxTxI/t4siugm6WhxTGylbyg693lSH2SkAJZg
         IIGDv8cuq2Atkg6a/memP/3ZxkHNwXGhTlhzGgql3a+l8cb4BSqpY41/FoS2Dey738US
         HNY7oS82tp4qxK0zU5KSG+5wR25XkLh17nddtBS+6isamMTdOSpgHAG7z+Dv3ZLvYKSj
         WGny2c2fiRFPZvJ/1bYdsySXuQgp4q5b00waN4/XfIO6UGXfbhT3GB3aIdI6DdpTqwQf
         PttRBBuebLldZ7pofLVcvbU+u/4I905HPTm1+H9J+KjyGphDBVlO8Qd1DI2oAJ/StVAp
         dTsA==
X-Gm-Message-State: AOAM533LjPC09EQ93J7+rqUEO7o2QGimyEUznlys74pspdXXuJB5yAAR
        UXzpdrWWpUaJ+hWv1tXbOuarwbxyZUyw1hXSS06MMhU6
X-Google-Smtp-Source: ABdhPJxign8Uk2fIcUs7RpIodong0uS1bWU72pwITdrYewzbK7L9StNz09TcvScLc02ZC/yaUnpVr8Fq/+75ppivh0g=
X-Received: by 2002:a4a:9d19:: with SMTP id w25mr2320144ooj.11.1596626166283;
 Wed, 05 Aug 2020 04:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-16-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-16-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 13:15:54 +0200
Message-ID: <CAMuHMdWzwQpjhOeVDkj1b1L7mJuxnLpVMO-3WMMLF3oJMzgAmg@mail.gmail.com>
Subject: Re: [PATCH 15/20] arm64: dts: renesas: r8a774e1: Add audio support
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

On Thu, Jul 16, 2020 at 7:20 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add sound support for the RZ/G2H SoC (a.k.a. R8A774E1).
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
