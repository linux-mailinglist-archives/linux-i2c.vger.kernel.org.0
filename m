Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5708423C842
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 10:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbgHEIyP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 04:54:15 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33874 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgHEIyO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Aug 2020 04:54:14 -0400
Received: by mail-oi1-f196.google.com with SMTP id z22so8349748oid.1;
        Wed, 05 Aug 2020 01:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o0Tmid+tnSvnAJzyNVALQOzFYE2lj4sH4UY2VIcOcWw=;
        b=evPoqX7eLG1mRt4koFTUvjnzAIFzDLe1bmplBva7C2fYQ7MaTka1iYdpHfkHxQf3WN
         5hJzboRrBjKRWzr+pNki8T0qfoDhghIuR/JUO+xkaqFJtNF0xxpQT4yTXrsqNg1k5FgY
         UK/QTBBTgsKbFKbGr97V7L+1WmC46206kuqMeXDvGLcCYyLID4Gm+poz4IzRrwrdSbIW
         WihGhuAVKNJ9oW8Ly1e+wgPGD8tCUuFr8D0WFppvz4q2C2fixbmm7FVj52oGbbvGhBch
         0OuGalGMCVtZmcNy8av9Yt6kSHtXkPtD0prfipbbdD5DVty0m6YCdwTkgmMHFdt8BCi4
         N4OQ==
X-Gm-Message-State: AOAM533clIkVIDNYM7TamPpI0ofGD6MtboMC55H9LCAGjUKHr7BEwpFl
        qzNAFweShSfyFF7H4RqnKGx8wuabt9PqzgQLlYU=
X-Google-Smtp-Source: ABdhPJyljuIryu/u0UTk9F1+3SAnb1XU9mLUVZAv+khu6lPUjs8xyfZNkmrvKtA0yRGPniH4ZpNEEROFWOcNB2m+oEA=
X-Received: by 2002:aca:adc4:: with SMTP id w187mr1794266oie.153.1596617653246;
 Wed, 05 Aug 2020 01:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 10:54:02 +0200
Message-ID: <CAMuHMdWebnd8yxLccaQtfaz8UJW3vkTr==2n_ZxT_tjYkBMSiA@mail.gmail.com>
Subject: Re: [PATCH 05/20] dt-bindings: phy: renesas,usb2-phy: Add r8a774e1 support
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
> Document SoC specific bindings for RZ/G2H (r8a774e1) SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
