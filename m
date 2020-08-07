Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDC3923EC76
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 13:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728352AbgHGL2B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 07:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728160AbgHGL17 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Aug 2020 07:27:59 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E3FC061757
        for <linux-i2c@vger.kernel.org>; Fri,  7 Aug 2020 04:27:57 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id h8so806833lfp.9
        for <linux-i2c@vger.kernel.org>; Fri, 07 Aug 2020 04:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=waBAoJFTdIUQI4uoUSEB4jJ4XRcoXOI3bWeWwLSuxFA=;
        b=VdjUzCI1JVslBT6YIgbNvZlRRj0n8K0nUjiErwNLA+vBqbUVtSln1LX2D/MV+FJRlv
         Koo0ZaqBc+UpbEeXrAnA8YJFugat/G61imnH2skG2tU2mnfaP+cfe5bqidryRXBACEtV
         ikYv5maKGLTvFDigGNJW2SWUqOdSZCvYgFykxd2hxz60ERr6RPOeC9E+haVBSCBVDbEY
         TNzo2R9B4srw40ZgGwUM82TPT1YiY9zjlW0FGOTIligzcMKspB+4T45k/+hkr5cLZva3
         QqZGp3tGn4NhYLza4Q/eLBi6QRnxNvA11IIWismsrd95KYL0lUan5/m5/uGtOzrP0BHv
         EKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=waBAoJFTdIUQI4uoUSEB4jJ4XRcoXOI3bWeWwLSuxFA=;
        b=QkCEOBaiKitSy4383kWyrlMAOTQ6xqsYI9ZugNIPZL3gOkfJftGorfzPVecOw0fIbK
         KUX6ax4/vrpjRMYWsQ/kWTTPD2PQ5abMMh9vu4g221d7jMgZ4S8hu+YOsHXEiOP9wwj9
         hJprQ2kAqCeG5aECxWsdWXslmwou8n4gbNxILxEIaY/BzaY5XIvKTsk3AlkBdZ+FwQe8
         Xiav/J/oTbrMVZ0+zMA+KBp/49lpPhhBX0OesmXqAOVOTx9dMc9wGu51qnRZhWeMA65x
         fyvxJGktaZ9+lTC79/uGEpwsM78jmb4B6qpNzK1K3mLcJLKPhbcPk/WYn2jpqYl1yZ71
         YRGg==
X-Gm-Message-State: AOAM530GR//EDj8KfB+tgy/emi/0ClsOTNk+tO/nzy208068aM8zhRqJ
        c0+HlD9CY3+i1hMUTxhmJpD6OQ==
X-Google-Smtp-Source: ABdhPJwOJR3f3YaUusCA8jfqHy76KQg5OKskX5dD7VLanBgHxd2/UwGDiHUSIfTpUkeoHS+3mTivJg==
X-Received: by 2002:a19:d14:: with SMTP id 20mr6088083lfn.27.1596799675688;
        Fri, 07 Aug 2020 04:27:55 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id q29sm4124842lfb.94.2020.08.07.04.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 04:27:54 -0700 (PDT)
Date:   Fri, 7 Aug 2020 13:27:54 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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
Subject: Re: [PATCH 20/20] arm64: dts: renesas: r8a774e1: Add VIN and CSI-2
 nodes
Message-ID: <20200807112754.GC3387836@oden.dyn.berto.se>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-21-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVriWnPK8-=w=0mq8yj9+1jbsg9yH8aV=ygyHsQ0f-CQQ@mail.gmail.com>
 <CA+V-a8vXjhV-EeQb=bBhoRmuVA=0GSuFiV33N9nkhi39VNN6oA@mail.gmail.com>
 <CAMuHMdXie+GfKBO22mFrn4oG_y7YUxU9ekQdWnp1hn-6z2mLuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXie+GfKBO22mFrn4oG_y7YUxU9ekQdWnp1hn-6z2mLuQ@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Geert, Lad,

On 2020-08-06 13:47:58 +0200, Geert Uytterhoeven wrote:
> Hi Prabhakar,
> 
> On Thu, Aug 6, 2020 at 1:17 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Wed, Aug 5, 2020 at 12:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Thu, Jul 16, 2020 at 7:20 PM Lad Prabhakar
> > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > Add VIN and CSI-2 nodes to RZ/G2H (R8A774E1) SoC dtsi.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > However, before I queue this in renesas-devel for v5.10, I'd like to
> > > have some clarification about the issue below.
> > >
> > > > --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> > >
> > > > +               vin4: video@e6ef4000 {
> > > > +                       compatible = "renesas,vin-r8a774e1";
> > > > +                       reg = <0 0xe6ef4000 0 0x1000>;
> > > > +                       interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > > > +                       clocks = <&cpg CPG_MOD 807>;
> > > > +                       power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
> > > > +                       resets = <&cpg 807>;
> > > > +                       renesas,id = <4>;
> > > > +                       status = "disabled";
> > > > +
> > > > +                       ports {
> > > > +                               #address-cells = <1>;
> > > > +                               #size-cells = <0>;
> > > > +
> > > > +                               port@1 {
> > > > +                                       #address-cells = <1>;
> > > > +                                       #size-cells = <0>;
> > >
> > > "make dtbs W=1" says:
> > >
> > >     arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1562.12-1572.7: Warning
> > > (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node
> > > has single child node 'endpoint@0', #address-cells/#size-cells are not
> > > necessary
> > >
> > > (same for vin5-7 below)
> > >
> > Referring to commit 5e53dbf4edb4d ("arm64: dts: renesas: r8a77990: Fix
> > VIN endpoint numbering") we definitely need endpoint numbering.
> > Probably the driver needs to be fixed to handle such cases.
> 
> > > > +
> > > > +                                       reg = <1>;
> > > > +
> > > > +                                       vin4csi20: endpoint@0 {
> > > > +                                               reg = <0>;
> > > > +                                               remote-endpoint = <&csi20vin4>;
> 
> On R-Car E3, the single endpoint is at address 2, so "make dtbs W=1"doesn't
> complain. Here it is at address 0.
> 
> Niklas?

First the R-Car VIN driver makes decisions based on which endpoint is 
described, each endpoint 0-3 represents a different CSI-2 block on the 
other end (0: CSI20, 1: CSI21, 2: CSI40 and 3: CSI41).

Then how to handle the warning I'm not sure. I can only really see 2 
options.

1. Ignore the warning.
2. Remove #address-cells, #size-cells and reg properties from port@ if 
   the only endpoint described is endpoint@0.

I would prefers option 2. that is what we do in other cases (for example 
on Gen2 boards that only have a single parallel sensor in some early DTS 
files we don't have the ports node and just describe a single port with 
the same reasoning.

We are not at risk at someone describing a second CSI-2 bock as an 
overlay so I see no real harm in option 2. What are your thoughts Geert?  
You know more about DT then me.

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

-- 
Regards,
Niklas Söderlund
