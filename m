Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7D9923CFD0
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 21:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728881AbgHETZK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 15:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728577AbgHERZG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Aug 2020 13:25:06 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA5BC0086A6;
        Wed,  5 Aug 2020 07:46:41 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id v13so23174659oiv.13;
        Wed, 05 Aug 2020 07:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a747GTvzdj8BhTC99m/ltqffKPbWLknrH4UGCy7e+04=;
        b=rx4G6ali42qaP1XHM/3dxNM9N32RXYC90XDH13dCFvCuQE5nEC2SKndrWA1Ie0QM7S
         ezkvzSM2i8lafkAgtm1zUyLUZf3GeD4Vd0ts1FW+G6aOiCuLMKVX9g3yrcVAaWb25Q1/
         UuEbBKFc18FoVVCVauRntkumg7dcVHp+khSrm6YNG+h44L31cZ/P4g8/iFP0WY7iWNEP
         tSORMkowazJHMGpHn7YGoId8llCJWyuVhcjSSGiKJMQJW6fqBUxIWdgWJGQfLtkwsGdU
         cJDqr9WWtb64EhtmBX9uAw0gm8IsXtKmLeVhSZheEL8nKT7dqasoc7/lWyTq54nXtgNY
         hOOw==
X-Gm-Message-State: AOAM530bfeRays6JRYcl9Jh6UofxignYBe8JLo4m2ms3N+Db/oZU/M6V
        Lb/RFB32tjmPRPwFHpoYvaPE/S9lp36FDTsWnBY0Qg==
X-Google-Smtp-Source: ABdhPJxOLh0H5vKRdwT+SgNB4/VJFY79xxN/fk4jyCR22Pxw8fbAj3AqGa5onUuCO90I+Y+bzEmqLPTLGI8ksjYr6g8=
X-Received: by 2002:aca:b742:: with SMTP id h63mr2149267oif.148.1596625738500;
 Wed, 05 Aug 2020 04:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 13:08:47 +0200
Message-ID: <CAMuHMdVNrbi2twUoJ1wB4DY++M+VgsLVQXxS_NTK9YtExF8BBg@mail.gmail.com>
Subject: Re: [PATCH 02/20] arm64: dts: renesas: r8a774e1: Add PCIe device nodes
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

On Thu, Jul 16, 2020 at 7:18 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add PCIe{0,1} device nodes for R8A774E1 SoC.
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
