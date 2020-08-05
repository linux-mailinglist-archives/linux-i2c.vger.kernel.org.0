Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB2F23C86E
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 10:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgHEI7F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 04:59:05 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39699 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgHEI7E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Aug 2020 04:59:04 -0400
Received: by mail-oi1-f196.google.com with SMTP id a24so18422635oia.6;
        Wed, 05 Aug 2020 01:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3PEPkOHX4GNS8S5Rg4NoX/0Kkpu8DKvfoDJJeWRfc+c=;
        b=YUs9VLzGfUAL2yXtWfaLcB1DJm1d7fkMhXY64A9pZQLAG6sY378iMT4zJG93rPo6Zb
         32wbnHZdLdS/XfWjTQi+57kXu9VWLwej97FLYLm4wibKghgOZ8M2400xgm+Sfv7ITHFS
         nWHLS2ptEFwth7uhPv/MZ90DKsB0MJ8R7G+vLyD0ym/lLwdfFNQb0KyO4r63wE3TMoN6
         /CeuIvG3P4KruAqz48JJ6vVynXvJ0GcVX2d595mWd9jjDcigCk2f89FyESUH1skIuxGX
         7RcT7oj80UDs2Gpq0FI0bV+SM/H6QnDW51+lopQcBEcUvTcgYoqb6jpXz6tLrTsocEBU
         KLHA==
X-Gm-Message-State: AOAM532BeLtsHUBmgPMAJZFHfbCgyNDbjqOAJMrJXWxCQYomZz7mQ0NO
        QV0Y7cgQQO/Rr/wYgKLg4bTziUrewhinGZm9Rfg=
X-Google-Smtp-Source: ABdhPJxOPpR3dk7VDSXYx6KKvjnoJv5/4tMZbEd2TqXt4CKHnoMUzx0WD2+9YVb/X64OZIidpkxnwCi/O01k1qJCr/c=
X-Received: by 2002:aca:b742:: with SMTP id h63mr1809112oif.148.1596617943136;
 Wed, 05 Aug 2020 01:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 10:58:51 +0200
Message-ID: <CAMuHMdVzVGmc=2d5B4AZ4-G--gvkF4H3D-PVxhj6o5mq875fig@mail.gmail.com>
Subject: Re: [PATCH 08/20] dt-bindings: usb: usb-xhci: Document r8a774e1 support
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
> Document r8a774e1 xhci support. The driver will use the fallback
> compatible string "renesas,rcar-gen3-xhci", therefore no driver
> change is needed.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +

In the mean time, this file has been converted to dt-schema in Rob's
tree: Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml

> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -13,6 +13,7 @@ Required properties:
>      - "renesas,xhci-r8a774a1" for r8a774a1 SoC
>      - "renesas,xhci-r8a774b1" for r8a774b1 SoC
>      - "renesas,xhci-r8a774c0" for r8a774c0 SoC
> +    - "renesas,xhci-r8a774e1" for r8a774e1 SoC
>      - "renesas,xhci-r8a7790" for r8a7790 SoC
>      - "renesas,xhci-r8a7791" for r8a7791 SoC
>      - "renesas,xhci-r8a7793" for r8a7793 SoC

For the logical change:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
