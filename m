Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D81823DA0F
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Aug 2020 13:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728044AbgHFLl4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Aug 2020 07:41:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgHFLSd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Aug 2020 07:18:33 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B16F0C0617A4;
        Thu,  6 Aug 2020 04:17:31 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id v89so11271403ybi.8;
        Thu, 06 Aug 2020 04:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IkZFSPvcY5I31SF4ovGBrfHT1rxg0M171V/0SMIVx2k=;
        b=W1T7PMyTGM7VIbxN0FUlHyTKpaK0nw8VbeY8YI4ksk9CWWKzLOGNJsuFVpAeVzqEDQ
         l5jy7ReADQ2WPptC19aMYCiHXKqdoGibvICjZi24Fx59vEVwEvfL4yZTHGzKYmCRL03U
         RVTRjFq4TV8+2/gTNJkJ/Htgj1Fhq5P1qcxe/eQL/FoLz9bwZG6KJsHhvjn7+xr/6u/A
         ZwyurJY9E7i7o/VwJb0vYHsxFh1fqfcI6q3MWsQ7MjEBH949S7NP+IoE180+3rUUw9UI
         +/+wKAisrtczBHnl7YHt8MqtQz67j1T9EoVK3At6moXH+T7btd80HOMRDedl6B5O04Fc
         C4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IkZFSPvcY5I31SF4ovGBrfHT1rxg0M171V/0SMIVx2k=;
        b=g67kPD/j95qTl+nSE82sBYDekoxbS1PiK2Tg09FZoroG9kInTPi/m/ggaM4nk9P9CC
         iSnd0fPe+8394pPmMrq6GNs8+scxrtN8VyiLjMNFXulPSXoe5KORzJ3zGp3cpIuUiXEC
         zepQ0ZkznvpuUvLmULR0+Bv5rSUSUejjz6SwMWuA2DKS7B96KlGvchGWcM6HPf+qZIvn
         AlNWx1iUxAQp1s6JmbdIEFXXwUi2p3RDKrqzNbyW18TGybaFfbuVWz2pabsraTzrSrek
         nMok3hQbEk44a9wlxHprIzAZvGHtNt3pWgqGwo95Ftofql4Wo6agwTLMeR256HhTh4Tm
         0WRQ==
X-Gm-Message-State: AOAM532SNiuhML1IP3RP2/AkmTWejLC4WI6F7qE3KRIy7Cs+sP9H+6rA
        JYtYPHOnlsV3ojMSpRKIcVpsFUnL7aqd/hl33yA=
X-Google-Smtp-Source: ABdhPJxC1QZwDQjfBbSfcHd9+nWr/d1KIV+hOzv93X+1QoDGFFoAz1yykeKI4ZMC4cs50cyA5iK5Orky9ZbUh/KQlXM=
X-Received: by 2002:a25:c743:: with SMTP id w64mr11132228ybe.127.1596712641618;
 Thu, 06 Aug 2020 04:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-21-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVriWnPK8-=w=0mq8yj9+1jbsg9yH8aV=ygyHsQ0f-CQQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVriWnPK8-=w=0mq8yj9+1jbsg9yH8aV=ygyHsQ0f-CQQ@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 6 Aug 2020 12:16:55 +0100
Message-ID: <CA+V-a8vXjhV-EeQb=bBhoRmuVA=0GSuFiV33N9nkhi39VNN6oA@mail.gmail.com>
Subject: Re: [PATCH 20/20] arm64: dts: renesas: r8a774e1: Add VIN and CSI-2 nodes
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
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
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Geert,

Thank you for the review.

On Wed, Aug 5, 2020 at 12:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Jul 16, 2020 at 7:20 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add VIN and CSI-2 nodes to RZ/G2H (R8A774E1) SoC dtsi.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> However, before I queue this in renesas-devel for v5.10, I'd like to
> have some clarification about the issue below.
>
> > --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
>
> > +               vin4: video@e6ef4000 {
> > +                       compatible = "renesas,vin-r8a774e1";
> > +                       reg = <0 0xe6ef4000 0 0x1000>;
> > +                       interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 807>;
> > +                       power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
> > +                       resets = <&cpg 807>;
> > +                       renesas,id = <4>;
> > +                       status = "disabled";
> > +
> > +                       ports {
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +
> > +                               port@1 {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
>
> "make dtbs W=1" says:
>
>     arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1562.12-1572.7: Warning
> (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node
> has single child node 'endpoint@0', #address-cells/#size-cells are not
> necessary
>
> (same for vin5-7 below)
>
Referring to commit 5e53dbf4edb4d ("arm64: dts: renesas: r8a77990: Fix
VIN endpoint numbering") we definitely need endpoint numbering.
Probably the driver needs to be fixed to handle such cases.

Cheers,
Prabhakar

> > +
> > +                                       reg = <1>;
> > +
> > +                                       vin4csi20: endpoint@0 {
> > +                                               reg = <0>;
> > +                                               remote-endpoint = <&csi20vin4>;
> > +                                       };
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
