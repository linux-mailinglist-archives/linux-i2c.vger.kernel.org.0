Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8121223C856
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 10:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728198AbgHEI5H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 04:57:07 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42874 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgHEI5G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Aug 2020 04:57:06 -0400
Received: by mail-oi1-f196.google.com with SMTP id j7so22562478oij.9;
        Wed, 05 Aug 2020 01:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0C2QPNz+RkDu9YLa9Z+rHGCS+ZeukaWrCXpvcs7hr4E=;
        b=XZUcQFXSL3nmi4DUvEZApJXZGghp8V92mShWI9oHmZPWvNe2ZBOZqDQwXm795iHfGS
         gOP0yO0IWAAPG50/bnwSzMimOeShBDSI0Qc7QiO3TXfYs8YUBfgFJ8Uru0JQse40mbiG
         XPwRrGVwm4K2jvlbHOICQGuBVypJNAtHRrVS5Ce6S7YzeSJI/b+zow9YAkN3a5Q9VoyU
         1hdRPc3sMJ/22UafK2jXZjx3Yu2YeFym40G+uEgOXa+K0eLS2z8UMz5+ZoFSFxAjmtPp
         30G3qrATDcOqqgKAwO7PFV+cWaQkuPfYn1fmGnBRztGqVduKg0Una0YFbGHpxwdkddQR
         FsFA==
X-Gm-Message-State: AOAM531GjycZo6YPI8bIPZurTr6LQJrjrpo5PNf2G52u7SQ9jDLELunH
        85Ju7eludF8dMEU7SYiXP0tHjirqiJXYTBEMEJ8=
X-Google-Smtp-Source: ABdhPJxig6iQpzRHDmYA2Ws2f12T50P8nQRPHOJgk/4ruGyeAaxQzJ5ap2HuOZ2wGBDZe+u8z4eTqSdXfbOD8P2Z2Ws=
X-Received: by 2002:aca:4b54:: with SMTP id y81mr1895464oia.54.1596617825204;
 Wed, 05 Aug 2020 01:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 10:56:54 +0200
Message-ID: <CAMuHMdXzGQe2Ov3uFUtZ+c+x1ftDWGu0q=YyD3J0QM_560Aw=A@mail.gmail.com>
Subject: Re: [PATCH 07/20] dt-bindings: usb: renesas,usb3-peri: Document
 r8a774e1 support
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
