Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD4B923CD53
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 19:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728727AbgHERXn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 13:23:43 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:45990 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728524AbgHERQJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Aug 2020 13:16:09 -0400
Received: by mail-ua1-f66.google.com with SMTP id p27so9758806uaa.12;
        Wed, 05 Aug 2020 10:16:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AXKpgsbLcw7z2C6ljXHBYtvVN+NDPtHizk0roOICInI=;
        b=HDxvQeBHBH6wHy2UhDpdh7Ye5pVuATgudTrV0WGoTKTtsB3KmrmihTUKbNbD0yrdDO
         dHVa3LL4WMOVGQA52EuDPmV6DSLYnCHQHie11WNUCa523R2vtlAY3QCvzd1MkEHJTrkv
         2DunOy3wZpxELNXhwogS+tMhpNgkznSi4FYNuP01t5INSR+nrzI9ay6aahOW4VN0mTVi
         xIGVm1agQrl0VdPuKd6SccG/1OGT4MdFbbztZmJqeVsYnSLpoul3oRmY7TQi8C8ltqFo
         DKn2AxAOyG37mcw1iV3mNalzmTa22t/ipLkSLfpcNlnJOuXqWN8UBPGVutfCUMcQ3VnE
         YJPg==
X-Gm-Message-State: AOAM530DutCgMwXmD0tg9LxU/xBiukDGat3oRtPSkCwIz6TjfKhV20Pm
        QzJrAvBOTfTj+UvCIbucaEXV4vKNPPV4ixWH7bPld1gx
X-Google-Smtp-Source: ABdhPJwV3n8tOAcfpMHynj9j+mQfpTpf9DYt0YtMCyg/CBd6L07ZVwpSWSi6SSwkA6/AmBSX9QS/9q9S3w/0cDUPDdY=
X-Received: by 2002:a05:6830:1b79:: with SMTP id d25mr2057730ote.107.1596626350552;
 Wed, 05 Aug 2020 04:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-21-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-21-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 13:18:59 +0200
Message-ID: <CAMuHMdVriWnPK8-=w=0mq8yj9+1jbsg9yH8aV=ygyHsQ0f-CQQ@mail.gmail.com>
Subject: Re: [PATCH 20/20] arm64: dts: renesas: r8a774e1: Add VIN and CSI-2 nodes
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

Hi Prabhakar,

On Thu, Jul 16, 2020 at 7:20 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add VIN and CSI-2 nodes to RZ/G2H (R8A774E1) SoC dtsi.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

However, before I queue this in renesas-devel for v5.10, I'd like to
have some clarification about the issue below.

> --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi

> +               vin4: video@e6ef4000 {
> +                       compatible = "renesas,vin-r8a774e1";
> +                       reg = <0 0xe6ef4000 0 0x1000>;
> +                       interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 807>;
> +                       power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
> +                       resets = <&cpg 807>;
> +                       renesas,id = <4>;
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;

"make dtbs W=1" says:

    arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1562.12-1572.7: Warning
(graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node
has single child node 'endpoint@0', #address-cells/#size-cells are not
necessary

(same for vin5-7 below)

> +
> +                                       reg = <1>;
> +
> +                                       vin4csi20: endpoint@0 {
> +                                               reg = <0>;
> +                                               remote-endpoint = <&csi20vin4>;
> +                                       };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
