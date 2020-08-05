Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E00B323C88A
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 11:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgHEJDz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 05:03:55 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41589 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbgHEJDw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Aug 2020 05:03:52 -0400
Received: by mail-ot1-f68.google.com with SMTP id a65so23605701otc.8;
        Wed, 05 Aug 2020 02:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+U8+4Hl6vkW6q5H3Mn8yh7PKkJ8AzP5y5V/lYaSvu1o=;
        b=onr85kyPK9LarnT3RFyOX85WdbN46Vg1iYZr2LLlQhrc7B+ZKvUVsbSIre7E3gunKs
         VBH0NQ81AFBFmnO6ymZ/4VxzLfYvaNvPOFHWKmhvNY58dD6Dj7V6Te8meBRIvIebvDcC
         HPJpiZVKSrHTLyycAoxdSBCyU1fcxxCn/LWoNptDBrSVKtee+lJrOOTU73L7+bL3aaa/
         RQIBv57TBXGmw1AV1XLvDsoJi8JYOQZee5CAa1u4u9Zmm96m31kyZJFZ4K/sBE4a1B0G
         YBniXCTSHcX4QXLN0pPnlMOESt1Rd1yfElTK5jhlHWqMu9ap9Sz9IJweuDLLIbNTPfi0
         NkmA==
X-Gm-Message-State: AOAM533aZA29AmCtFnFzMm3gYSioU4kRt+JeR8ST0JtyzBpzIYtSkBKL
        NMZIwfnFUHd3e4fE8y5QMICrj1LeN+MQJumyb5U=
X-Google-Smtp-Source: ABdhPJxfFB1hHoa5BXIYGVzYY67VoOT3jTLbs48GTCpZQYZnuP5JqIwGmhxVtRFSbWsP+vfLaRmRzFfm+5MdaHUY6CM=
X-Received: by 2002:a05:6830:1b79:: with SMTP id d25mr1670667ote.107.1596618231704;
 Wed, 05 Aug 2020 02:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-13-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-13-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 11:03:40 +0200
Message-ID: <CAMuHMdV1A3SZSukFcO9YHGveJGXkUHm4VG2wBgThh+xV939Wew@mail.gmail.com>
Subject: Re: [PATCH 12/20] dt-bindings: dma: renesas,usb-dmac: Add binding for r8a774e1
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
> Add binding for R8A774E1 SoC (RZ/G2H).
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
