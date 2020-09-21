Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3FD271BC6
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 09:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbgIUH3x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 03:29:53 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34007 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgIUH3t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 03:29:49 -0400
Received: by mail-oi1-f196.google.com with SMTP id n2so15912143oij.1;
        Mon, 21 Sep 2020 00:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=90EhcBzbpe2vvxa0ohP9B+Dh75rNdKfJSEph9k8z+pM=;
        b=oDxmAMrxklOt/M1PIBJ5wlCKOryJNHL6AbIYPH+ts2Lf+weJo36Jgt+bVQOExMcli/
         jiWAN8cEm7riKMtO6toa0Hx0xWPSloclKNkFI9FKjLVvO3WYBCq+Fcx0aWltBb3wyf4H
         q6fmmWF6uwQUuaRw08Wqxk3LY9f4yFJav2NhRK7RyUo6Ic4yedLOXAI2TmnJUuVe7UGW
         JR1pV6KTHJoP4l89nLJ28eCmiR0RmeCgM97DWOGh6phfp22P1Ya9VGn7X2FsSWz5i4Zi
         6UxOnQK+nUVQd1gOcf4ZD8LZ3drWt9JzHGpzSqVlbYYaLUUKhm4QeSNWwx6BuumBUZ58
         sXjg==
X-Gm-Message-State: AOAM532QkC0NnNgDqUqt5rxvuMWnDVian6HtUJnXijdAfqkSTVlv4aVN
        IHydqKWornGVvoiZsvST52amKfF+RKojBPiJ3Ao=
X-Google-Smtp-Source: ABdhPJyf/sKRes03lyRebHMYTTNhwUI3iObyZWkgpxFfbC1QJaXNYOyLYBpf0EYemOiZ0DhKCpWF7uMdeYorWHg/2u4=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr16832418oib.54.1600673388389;
 Mon, 21 Sep 2020 00:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-12-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8vuR-7vqxNnrqQ5Ysf3Xjvhp3xRZ33i8+6nEGFLJciT3A@mail.gmail.com> <20200920140846.GB2915460@kroah.com>
In-Reply-To: <20200920140846.GB2915460@kroah.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Sep 2020 09:29:36 +0200
Message-ID: <CAMuHMdUNvODmaJDaLi45Q8wpCaZaTA4HnmW_Y0BLwkXw8UxgEQ@mail.gmail.com>
Subject: Re: [PATCH 11/20] dt-bindings: usb: renesas,usbhs: Add r8a774e1 support
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
> On Sat, Sep 19, 2020 at 11:54:05AM +0100, Lad, Prabhakar wrote:
> > On Thu, Jul 16, 2020 at 6:19 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > >
> > > Document RZ/G2H (R8A774E1) SoC bindings.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > > ---
> > >  Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > Could you please pick this patch.
>
> Same here, doesn't a DT maintainer have to ack this?

And so *he did:
https://lore.kernel.org/r/20200721033544.GA3505976@bogus

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
