Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0CA23C843
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 10:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgHEIzZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 04:55:25 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34012 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgHEIzZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Aug 2020 04:55:25 -0400
Received: by mail-oi1-f193.google.com with SMTP id z22so8352159oid.1;
        Wed, 05 Aug 2020 01:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/eVy5u4NAV6m7SDVec08BEAa0WPHvO35iIGs1gluXZE=;
        b=kLDXcoCqF7WLEX69wQFAZDqckfY2I9J6K8MpluBSyZdd2X9NIOSft7q9NmJCPnkW/P
         fQgxbXWmz4o/bwFdhgeRuBKUlL71U3tzrZzEyFK5XHt6AW1XVF6BNm+bZjWQTtwZ4VUT
         eXeWZNLVQ8Z65NZg8RCv2yiQyzkNcmx3FvYE/WDYsQen/WpibVIYU339PM2OPfSHtITv
         ezC1piXSn09lZRaTIUVzcZaR+eNlJRxcxp42Zk8wn9k0p8YwhDNzxMGs9ZuCUr0GJeWm
         0jLrSDeB1gx3kZiPQC62shbmQGdRCIoL2/peVKLXaXFZhzutdn1u4wpQ869ahv4a0/zS
         VNcw==
X-Gm-Message-State: AOAM533/GljgeS8Hz7EXRIwzLPEmn1KGlD+cA306ccAKXeCDxb3LqSGR
        HEsJA0iA99MnVpeR739JPuUkV52u/8H/iUpuczg=
X-Google-Smtp-Source: ABdhPJw+5y8NBMhF1ur/AzwqullEVwWngB+Qw8Bi13xS3qysZoHfYKnHs/ZOTSfP8kCWlWP4jWsJy1nezNy9iVKjItk=
X-Received: by 2002:aca:b742:: with SMTP id h63mr1802953oif.148.1596617724132;
 Wed, 05 Aug 2020 01:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 10:55:13 +0200
Message-ID: <CAMuHMdVrrw=xQY5Yhp9uebCRVmqJzLLjTHc0MWvp7F3Mf0y92g@mail.gmail.com>
Subject: Re: [PATCH 01/20] dt-bindings: pci: rcar-pci: Add device tree support
 for r8a774e1
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

On Thu, Jul 16, 2020 at 7:18 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add PCIe support for the RZ/G2H (a.k.a. R8A774E1).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
