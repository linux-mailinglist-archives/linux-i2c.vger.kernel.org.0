Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD480271BD4
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 09:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbgIUHax (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 03:30:53 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:32977 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgIUHaw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 03:30:52 -0400
Received: by mail-oi1-f195.google.com with SMTP id m7so15933045oie.0;
        Mon, 21 Sep 2020 00:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bvT46MVLA1wc77+QBaxqpfVEdVrcHoplawt2ilNveyU=;
        b=A2oe3ANEBZxhfC77GDz2mQA+UsPCo3vJh70NhyUlSkvk1ByTJ/pHVoKHI6l9LFqeSE
         226GU2D0N/qw35k5o1NqLLe7nPo0sq5c+ytPwcYjhEyeVP9BWihv119ayxiSwhyvAYwV
         vPuAt2NcDMNRKGdtCmSaFCcRThQTvFv+wCTBQXYF6tzoEHkqvfUt2uaK+1615I307EAw
         bxHRMwTCJnSZZDmIKQiCTIVJvJnhOR1V3/LY8eADQI5uIf0Pg9gra6gDCuaj27xjgyKY
         BvbYqvs10TA7qM28MboExUslHZ6L30JV1xRJy9M4zBEDc2jgOv08uRk5qIayN9TH+mNN
         ca0w==
X-Gm-Message-State: AOAM531jLjrhEk5N8kaJ9hzZG5qVEVtLmy83vu6FFqD0397B2wstTAz4
        yozaNZ0efL+frQiXhidk1hdj/0vkSA46Rp0E2QM=
X-Google-Smtp-Source: ABdhPJz9xmN9krNVkmFntK1fJCP4SVdiOQdSlUn0glZjdNUu0BDHNFHEgQW2lXttV0KKLloQqhm28dH1yGE42S/hfkE=
X-Received: by 2002:aca:4441:: with SMTP id r62mr15852660oia.153.1600673451338;
 Mon, 21 Sep 2020 00:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8vJ2n3KEL8P+XmVob2zjoWaX+s4a6c1TV_WoPFkwdkZmA@mail.gmail.com> <20200920140824.GA2915460@kroah.com>
In-Reply-To: <20200920140824.GA2915460@kroah.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Sep 2020 09:30:39 +0200
Message-ID: <CAMuHMdUyXMfZcVKkqaZHJ8tJf-3Kotqg+S2NHMZT0VFO0ZJJww@mail.gmail.com>
Subject: Re: [PATCH 07/20] dt-bindings: usb: renesas,usb3-peri: Document
 r8a774e1 support
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
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
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-ide@vger.kernel.org,
        dmaengine <dmaengine@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        alsa-devel <alsa-devel@alsa-project.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Greg,

On Sun, Sep 20, 2020 at 4:08 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Sat, Sep 19, 2020 at 11:50:07AM +0100, Lad, Prabhakar wrote:
> > On Thu, Jul 16, 2020 at 6:19 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > >
> > > Document RZ/G2H (R8A774E1) SoC bindings.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > > ---
> > >  Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > Could you please pick this patch.
>
> Don't DT patches have to be acked by a DT maintainer first?

https://lore.kernel.org/r/20200721033508.GA3504365@bogus

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
