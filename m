Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E9C23CDAD
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 19:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728906AbgHERlk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 13:41:40 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43119 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728707AbgHERdc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Aug 2020 13:33:32 -0400
Received: by mail-ot1-f68.google.com with SMTP id r21so23438915ota.10;
        Wed, 05 Aug 2020 10:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nGe/Je8IarDkuCxG/u56QffSTYctpnR0YPw4MQUjy6A=;
        b=rST3AuFgwVSXUW3gEpFnjQUuP+b9s0ZTn6PGbKOKO0OK/j1Bz2VXk0llZOWxlZuVO0
         9oIMGAghTHl7Je5+n5+2DXDu/GznsnJ4YNQOMq5PtIygh1yiaj8pArkwAmdJGmw8t7vV
         y8yVoeNhoS3DYIqAsy4Gt6Y1yh5ITWzLCzU1shD/pXIGj70jEE7glN6xEDbz2IORtivs
         WWjD+NIisqKh2drx89yWWNp/pgChSLiBCf9nJaimJgGRP2okuj6v03kDhH2XQucahukI
         6ZDcExgwrTEUAt5FKxmlIh2ncsblVHaIKbyGltSkjVye87qelLo/EG/OHkS4skdvIjpS
         +5RQ==
X-Gm-Message-State: AOAM530uffkeniOlIrjfH8CawBS6dbRM7pQSfv6ViYuOMMS6DLOMtgfK
        /66F6f4Ls6S2Wp3IhNdRu6md7VSYEPbJdtBJFCPm8E5j
X-Google-Smtp-Source: ABdhPJy6BJnijQ4U9574JZCK6kDHqx7/zV93wpejrM8Eh19/YBjLybIlzjjbGdFEBSswTARB1GJ4M2QmhRRIOA+7jHM=
X-Received: by 2002:a9d:1b0d:: with SMTP id l13mr2076468otl.145.1596625795521;
 Wed, 05 Aug 2020 04:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 13:09:43 +0200
Message-ID: <CAMuHMdWhmQS56j4vkZhK94qQVkVhCA1eceZRNW1XipX-Sr6+8A@mail.gmail.com>
Subject: Re: [PATCH 06/20] arm64: dts: renesas: r8a774e1: Add USB2.0 phy and
 host (EHCI/OHCI) device nodes
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
> Add USB2.0 phy and host (EHCI/OHCI) device nodes on RZ/G2H SoC dtsi.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
