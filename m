Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3F2123CAE3
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 15:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728663AbgHENMx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 09:12:53 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:44959 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728182AbgHEMfk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Aug 2020 08:35:40 -0400
Received: by mail-ua1-f68.google.com with SMTP id x19so7653932uap.11;
        Wed, 05 Aug 2020 05:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TiO7nzmTLhp/HssO4wueBR+pe6NyyJ3Wi4fmHclssB0=;
        b=LBg+QNCOfml/osTc4ClibeS1wZAy99kRrbDkKMLWs58Wr3uooJ6eaifgdM3l6aEkxe
         mZhYMMbPwOBn/XFE++nMivEqdLcBt4aWH+yuHsvnLfRbTIo6s0FKJA3zEIrUPOF5wsKr
         AWAq1Em05wmu4PNN6eMaK0BZZZ1FZOveFsyWPRlsQ5gIWay+Z3h3M/5KC58MYlaoGF1n
         V9OIvBtF/cOKd6+uqDjb9nPWHFYMCaOaytm9HGTdrvJzljN1XN+vWjDCRJ8+B1C68k8x
         sKqKxfWkR3GByGhSkpynGBASAZjerV1kvzjGpzAQP8LsWGvASO0WairA2tnuzRSEyXTy
         /CGg==
X-Gm-Message-State: AOAM530ZpRRFvqSNeDnNV6VcRXm0cMt0KjGy0gjge+N7xZsKgDkjn3O1
        UdaRM4kNkvfhibNFosWztj0vDCVgQnILJ5r5JqyR52Wp
X-Google-Smtp-Source: ABdhPJwK6o7b8lq3G6CAJpeeN/eYVnhyuuPm34lifo/8pWI+ku4U2jyzPQkSzpymHd67QjfIjokNuU68r0XO2FkgnuU=
X-Received: by 2002:a05:6830:1b79:: with SMTP id d25mr2044718ote.107.1596626105327;
 Wed, 05 Aug 2020 04:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-14-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-14-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 13:14:54 +0200
Message-ID: <CAMuHMdWU1UaL8B4EqA3qS3vebOZWL69uHMgkTBwUnoUz=z_p7Q@mail.gmail.com>
Subject: Re: [PATCH 13/20] arm64: dts: renesas: r8a774e1: Add USB-DMAC and
 HSUSB device nodes
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
> Add usb dmac and hsusb device nodes to the RZ/G2H SoC dtsi.
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
