Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 118722555AD
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Aug 2020 09:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728482AbgH1Hwg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Aug 2020 03:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbgH1Hwg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Aug 2020 03:52:36 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D0AC061264;
        Fri, 28 Aug 2020 00:52:35 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id e14so52432ybf.4;
        Fri, 28 Aug 2020 00:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=03SA6QLBtK3IQ4zuCDRLpEPFR1JjLUS7ypF2jRpTUus=;
        b=Ce1e8K/caM4JvW4I6IlYWAdAdDrcDJjdidgiSSw3u1U2l7HQ3a2kOmczvvbkYGVOq4
         erB9J73UZGJvV7XHy/RkrrCUhQw7V1lydp0AdbQo+pNvzOBgNLswc2RgdPqsMF58aheA
         9Lrv0ex7Uj91QMqENp5Yv4cuToIFPSGWs2lkiKSxnpsSTe7Eq5ZlVjBnVhNFGFh4cIr2
         jpoD9oU/YgAXieicPCZprdmCdMY/V0jc1YbWHaplTsQgOGXc03HEMZkGKzhEBMjjUyat
         1huT8whAgyVZhNrXbK4bevxXwjsD6gaR28Big84Mi8vP/bi7JfPYO85puDNU0UBxCGih
         WPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=03SA6QLBtK3IQ4zuCDRLpEPFR1JjLUS7ypF2jRpTUus=;
        b=EX4UI+f/S84rGP2WHMLxM04koDaErZ9EPWQ5qOUoJclQtR2QI0O5Q//jDGUd6nqcnS
         V1gJGij/1W0ILzC8lwwYZvKQhxBrSpHG5TOdXb93Aeo8RnLenRphVgVQQ/iDAnS4Q7dO
         ZyQW+qCWl/n1l7r5/83xDdn4HYF83xAh/gVkTesWaaLP3xo97H+otrQIZn8BI3f3pvZD
         8WI16IcR7knuyNBT2YKoVqdqYOOGiEr9ZChfkbTlkJmK0FUvja2mmmz42rVhoJ+IIuZp
         5XlCvQx6Q7eZt57nk6hhy7wtYPGRQF4qmRa2qfJlIKw601eF+mF7vCslyMPe8sq59XA3
         i1rw==
X-Gm-Message-State: AOAM533xsc1R/mFDOL702DqBJ59U3h2gmJkARR833VqNC7Wifg1I9O3H
        BmrOAtYSEtPpa/igou+OzMr0YIavOypV8x70Ios=
X-Google-Smtp-Source: ABdhPJxKaH3Rnxdft6nzQd34AAzAxueOyLTpZiz6Sebv+w7rBi0ECVdDr/vmwjJ5qeTeRA2GnUZW3Taq1UeJFdtPzj4=
X-Received: by 2002:a25:2f4d:: with SMTP id v74mr720966ybv.401.1598601154899;
 Fri, 28 Aug 2020 00:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8t-HHWeo4zwnTuyZHnhc8u_aXqt_KZHr1trnXQB15Jj6A@mail.gmail.com> <TY2PR01MB36923A0548AAE7E0249042AFD8520@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36923A0548AAE7E0249042AFD8520@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 28 Aug 2020 08:52:08 +0100
Message-ID: <CA+V-a8v5sFVGVxNKDXvg8w=FeZnGdyV8q9deBuAaVMsx0bDcwg@mail.gmail.com>
Subject: Re: [PATCH 08/20] dt-bindings: usb: usb-xhci: Document r8a774e1 support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
        dmaengine <dmaengine@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        alsa-devel <alsa-devel@alsa-project.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Shimoda-san

On Fri, Aug 28, 2020 at 2:11 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> Hi Lad-san,
>
> > From: Lad, Prabhakar, Sent: Friday, August 28, 2020 2:15 AM
> >
> > Hi Greg,
> >
> > On Thu, Jul 16, 2020 at 6:19 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > >
> > > Document r8a774e1 xhci support. The driver will use the fallback
> > > compatible string "renesas,rcar-gen3-xhci", therefore no driver
> > > change is needed.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > > ---
> > >  Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > Gentle ping.
>
> Thank you for the ping. However, since the latest kernel has renesas,usb-xhci.yaml,
> would you fix the patch?
>
Thank you for pointing out, I have now posted a v2 [1] now. (I missed
out Geert's comment earlier for this patch)

[1] https://patchwork.kernel.org/patch/11742289/

Cheers,
Prabhakar
