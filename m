Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2305523DFDF
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Aug 2020 19:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbgHFQaK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Aug 2020 12:30:10 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41904 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgHFQ3Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Aug 2020 12:29:25 -0400
Received: by mail-ot1-f68.google.com with SMTP id a65so27461392otc.8;
        Thu, 06 Aug 2020 09:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GfRNKclYJY9TFgLDludWTlpzguMceCfSaUZal/qDN6s=;
        b=mucsV4XvZdLPQxIuifzETBesBUCVGlX5wh10vA6hs7DMJcqfZEeJRoYFy0Qstdp26z
         dWDzFflwqajIGQk9ckIz++zQujOWL7HagizIRPK2zskVRYX9S8qqvgysDqX0acWwFpjP
         hM/jzjBXUwNTLWPdPzBJTJ6l7lQL7hNVZ3Fbtf5AfmuPebkufn5i5pHbj0bdfsf9hFEC
         zOg5SGURrR9Are5To1UFdHcB8modghHZmbkHjTIYClw4lhRXBgk22yR6A4lfHpkDMElN
         FVmBpqqNdfcDvQiSH/rARb8NlhDS96slJgFrXwuPOVYHJF5QBkHNGAcqETd2PunleUAf
         X+Fg==
X-Gm-Message-State: AOAM533oCfizdYpwXQIXOZH0VxdJFyWGAcA1wczlg6qDS29Nn2k77/DE
        7yWF52kGbJXnYuU+mOG4a/gvI3L46lf74I7tARo8Euib
X-Google-Smtp-Source: ABdhPJxsjDZTTqPo+9e6awj5yV1LG1Imzyw5Civ8gt7ap18JuUVGKty3JozPE/qiMGjuARTMT9EOZFY2swizOMfqf1E=
X-Received: by 2002:a05:6830:1b79:: with SMTP id d25mr6431613ote.107.1596714489705;
 Thu, 06 Aug 2020 04:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-21-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVriWnPK8-=w=0mq8yj9+1jbsg9yH8aV=ygyHsQ0f-CQQ@mail.gmail.com> <CA+V-a8vXjhV-EeQb=bBhoRmuVA=0GSuFiV33N9nkhi39VNN6oA@mail.gmail.com>
In-Reply-To: <CA+V-a8vXjhV-EeQb=bBhoRmuVA=0GSuFiV33N9nkhi39VNN6oA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 6 Aug 2020 13:47:58 +0200
Message-ID: <CAMuHMdXie+GfKBO22mFrn4oG_y7YUxU9ekQdWnp1hn-6z2mLuQ@mail.gmail.com>
Subject: Re: [PATCH 20/20] arm64: dts: renesas: r8a774e1: Add VIN and CSI-2 nodes
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Mark Brown <broonie@kernel.org>,
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
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Prabhakar,

On Thu, Aug 6, 2020 at 1:17 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Wed, Aug 5, 2020 at 12:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Jul 16, 2020 at 7:20 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > Add VIN and CSI-2 nodes to RZ/G2H (R8A774E1) SoC dtsi.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > However, before I queue this in renesas-devel for v5.10, I'd like to
> > have some clarification about the issue below.
> >
> > > --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> >
> > > +               vin4: video@e6ef4000 {
> > > +                       compatible = "renesas,vin-r8a774e1";
> > > +                       reg = <0 0xe6ef4000 0 0x1000>;
> > > +                       interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > > +                       clocks = <&cpg CPG_MOD 807>;
> > > +                       power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
> > > +                       resets = <&cpg 807>;
> > > +                       renesas,id = <4>;
> > > +                       status = "disabled";
> > > +
> > > +                       ports {
> > > +                               #address-cells = <1>;
> > > +                               #size-cells = <0>;
> > > +
> > > +                               port@1 {
> > > +                                       #address-cells = <1>;
> > > +                                       #size-cells = <0>;
> >
> > "make dtbs W=1" says:
> >
> >     arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1562.12-1572.7: Warning
> > (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node
> > has single child node 'endpoint@0', #address-cells/#size-cells are not
> > necessary
> >
> > (same for vin5-7 below)
> >
> Referring to commit 5e53dbf4edb4d ("arm64: dts: renesas: r8a77990: Fix
> VIN endpoint numbering") we definitely need endpoint numbering.
> Probably the driver needs to be fixed to handle such cases.

> > > +
> > > +                                       reg = <1>;
> > > +
> > > +                                       vin4csi20: endpoint@0 {
> > > +                                               reg = <0>;
> > > +                                               remote-endpoint = <&csi20vin4>;

On R-Car E3, the single endpoint is at address 2, so "make dtbs W=1"doesn't
complain. Here it is at address 0.

Niklas?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
