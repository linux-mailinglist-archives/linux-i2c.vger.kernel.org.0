Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D38F23ECA4
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 13:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgHGLhA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 7 Aug 2020 07:37:00 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:43049 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgHGLg7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Aug 2020 07:36:59 -0400
Received: by mail-oo1-f65.google.com with SMTP id z10so353625ooi.10;
        Fri, 07 Aug 2020 04:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XXMM2VmPbdzScEgaWzC2c7QfQOtrLAuTY8gvz9Vc4VA=;
        b=i2+bmzm6DH1N21mIeZptUZA7++/9Dot11W8Go1vfnZmv6NLxFyMUQ3NYRJuC/9zZy6
         JX/bJkajC04xQ0mBs4txh8Yn7UV9MSBsecOVOhqPddopu6nuxkL6IbMmaXS/xAMW5Mvd
         nv3umyDWILaKzFR7VW4BYeeOlryd9pgvlQ4pUTT9vXozKkZfSdocnpmAfzdm0Y0pWMOv
         F5tLDf8S9Bh/f0zH0WTKncPNiKabeEPgjnv0/Wen5JEKC7M+AKARxSd/pGnNoYX0BaLm
         sXcGmj0gCJQeZz+Z/yXvZrzWEKU6vP40BbDzJy5zcH3lwP7CZr0PjAWEfKMX45B+tbll
         8TSw==
X-Gm-Message-State: AOAM5321t5vfKYT5soHllJlIECFhExrcIHDvk9hNqFzsqTFdqXVR4wMV
        ZLSjKRnGrwCzbJxf3irZSYkIYbyhRdwti3Lbm18=
X-Google-Smtp-Source: ABdhPJzvkXusENrHFbx7Z4UeU5tcAYrWmu2wMgV9PP1LU7MWabSySITzZd9SeQneUYYb9H/JEkRsCIws54cijEZ+u5w=
X-Received: by 2002:a4a:4201:: with SMTP id h1mr12077660ooj.1.1596800217309;
 Fri, 07 Aug 2020 04:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-21-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVriWnPK8-=w=0mq8yj9+1jbsg9yH8aV=ygyHsQ0f-CQQ@mail.gmail.com>
 <CA+V-a8vXjhV-EeQb=bBhoRmuVA=0GSuFiV33N9nkhi39VNN6oA@mail.gmail.com>
 <CAMuHMdXie+GfKBO22mFrn4oG_y7YUxU9ekQdWnp1hn-6z2mLuQ@mail.gmail.com> <20200807112754.GC3387836@oden.dyn.berto.se>
In-Reply-To: <20200807112754.GC3387836@oden.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 7 Aug 2020 13:36:46 +0200
Message-ID: <CAMuHMdW1Ofjouj4P+bdg2VWmYohD73=si8R6ivZ4QiZps6=HAQ@mail.gmail.com>
Subject: Re: [PATCH 20/20] arm64: dts: renesas: r8a774e1: Add VIN and CSI-2 nodes
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
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
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Niklas,

On Fri, Aug 7, 2020 at 1:27 PM Niklas Söderlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2020-08-06 13:47:58 +0200, Geert Uytterhoeven wrote:
> > On Thu, Aug 6, 2020 at 1:17 PM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > On Wed, Aug 5, 2020 at 12:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Thu, Jul 16, 2020 at 7:20 PM Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > > Add VIN and CSI-2 nodes to RZ/G2H (R8A774E1) SoC dtsi.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > > >
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > >
> > > > However, before I queue this in renesas-devel for v5.10, I'd like to
> > > > have some clarification about the issue below.
> > > >
> > > > > --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> > > > > +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> > > >
> > > > > +               vin4: video@e6ef4000 {
> > > > > +                       compatible = "renesas,vin-r8a774e1";
> > > > > +                       reg = <0 0xe6ef4000 0 0x1000>;
> > > > > +                       interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > > > > +                       clocks = <&cpg CPG_MOD 807>;
> > > > > +                       power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
> > > > > +                       resets = <&cpg 807>;
> > > > > +                       renesas,id = <4>;
> > > > > +                       status = "disabled";
> > > > > +
> > > > > +                       ports {
> > > > > +                               #address-cells = <1>;
> > > > > +                               #size-cells = <0>;
> > > > > +
> > > > > +                               port@1 {
> > > > > +                                       #address-cells = <1>;
> > > > > +                                       #size-cells = <0>;
> > > >
> > > > "make dtbs W=1" says:
> > > >
> > > >     arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1562.12-1572.7: Warning
> > > > (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node
> > > > has single child node 'endpoint@0', #address-cells/#size-cells are not
> > > > necessary
> > > >
> > > > (same for vin5-7 below)
> > > >
> > > Referring to commit 5e53dbf4edb4d ("arm64: dts: renesas: r8a77990: Fix
> > > VIN endpoint numbering") we definitely need endpoint numbering.
> > > Probably the driver needs to be fixed to handle such cases.
> >
> > > > > +
> > > > > +                                       reg = <1>;
> > > > > +
> > > > > +                                       vin4csi20: endpoint@0 {
> > > > > +                                               reg = <0>;
> > > > > +                                               remote-endpoint = <&csi20vin4>;
> >
> > On R-Car E3, the single endpoint is at address 2, so "make dtbs W=1"doesn't
> > complain. Here it is at address 0.
> >
> > Niklas?
>
> First the R-Car VIN driver makes decisions based on which endpoint is
> described, each endpoint 0-3 represents a different CSI-2 block on the
> other end (0: CSI20, 1: CSI21, 2: CSI40 and 3: CSI41).

That's my understanding, too.

> Then how to handle the warning I'm not sure. I can only really see 2
> options.
>
> 1. Ignore the warning.
> 2. Remove #address-cells, #size-cells and reg properties from port@ if
>    the only endpoint described is endpoint@0.
>
> I would prefers option 2. that is what we do in other cases (for example
> on Gen2 boards that only have a single parallel sensor in some early DTS
> files we don't have the ports node and just describe a single port with
> the same reasoning.
>
> We are not at risk at someone describing a second CSI-2 bock as an
> overlay so I see no real harm in option 2.

Yeah, no overlay possible for on-SoC wiring ;-)

> What are your thoughts Geert?
> You know more about DT then me.

You have too much faith in me ;-)

AFAIK we don't get this warning for e.g. SPI buses, which can have a
single device at address 0, and #{address,size}-cells is mandatory
there. So endpoints (or SPI?) are treated special?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
