Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0344A23C887
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 11:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgHEJCk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 05:02:40 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44630 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgHEJCj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Aug 2020 05:02:39 -0400
Received: by mail-ot1-f65.google.com with SMTP id h22so3537765otq.11;
        Wed, 05 Aug 2020 02:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0C2QPNz+RkDu9YLa9Z+rHGCS+ZeukaWrCXpvcs7hr4E=;
        b=V6tD1pq+01zQPzX22gPL0RUM1IjgWAXVYcjsaWxfwKOTUqvFmcsgcWo9BsEfmeFucO
         Fg/v0ZcfoRsZuhpw4qHHA4fJuOjffm+CSW+nK5HTgHU945z0aAmCM0d4DtJA3rUL0+ZE
         JjMe9s1+dp8sp50L0AfAa9f6wjQCq0pBzh/ydiv2mpc1gh52erdig7VdWcA5OfBu0SoY
         /MhTQwv3EpIgOk0x6pJywkJqu99+7XpmCU7AlVlb7+lpBkOi4Q7mMvFqAlhy8AVJJoX6
         6/xwpqR2SwXC2Wi8vyUSGYBKcVIp58U8k/FKadWyaQA0MJBa8qzWkUp9FYDkSGApqD8v
         bCKA==
X-Gm-Message-State: AOAM533htB14A8P33Pe5ofQdtYz7Chx20WRIAstvY2EQObhJXoEaA+1N
        ZZUFLv/NYb/I23ok0N0oMNQ0eVRLUvjwc7mCavU=
X-Google-Smtp-Source: ABdhPJzLFPGC49nbV3E5J5bc2nSN9jnX538w//bCVHKf+NDOTFNWQUf8Z/dSpOmgIp5oMdnUH41JKQzesAiHuyibfJI=
X-Received: by 2002:a05:6830:1b79:: with SMTP id d25mr1666389ote.107.1596618158734;
 Wed, 05 Aug 2020 02:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-12-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-12-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 11:02:27 +0200
Message-ID: <CAMuHMdVZQuD8v=t1+bV=K4aqVd=_J9OVzWLmo4rQfxjJxW9GCQ@mail.gmail.com>
Subject: Re: [PATCH 11/20] dt-bindings: usb: renesas,usbhs: Add r8a774e1 support
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
> Document RZ/G2H (R8A774E1) SoC bindings.
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
