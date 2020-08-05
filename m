Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C169623C89D
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 11:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgHEJGQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 05:06:16 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36616 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgHEJGK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Aug 2020 05:06:10 -0400
Received: by mail-oi1-f195.google.com with SMTP id l204so10202536oib.3;
        Wed, 05 Aug 2020 02:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D07PzLwIuFejcUZp+bYFZxntk7CBayvGPwvJsW9xBn4=;
        b=L7106/Lr7REd9y04sPvcAzK1RzPAbPheJTiDwpqUmZvWwNlJzblUIuHLUUbcUGknM5
         IqefdJdZnBsWiYCfM8Pv10JnK9ZxW9NAG5kDeUYyz/dupPbQFGNZfwGur5XYBxq9gID7
         AWBT6EwQ6ED0k4XmYtJvruq9Ye9x9n/7H+FoDGwi9vVJ2RgHhpic8UP1hwLciCQ3ls5z
         tJGP54hySjSZn3YEpCJTI1Wv3pAtos62rb0Hpb2lD/NGKTOglS6fwUjMFep7kav0foZV
         4NOQ9OSGUuoWtjll01X2sNy7gn+Fv1nrst3cdJaxobZ3VjtwDg4JFmkpqcpa1aJx8cUH
         o/sQ==
X-Gm-Message-State: AOAM532mEh058UDJYYGE8x28mbmR0sj9w3SyUSbEwNoSkW/yYcbdJzpS
        8IMP+2MXsMChGKv0xrDkA55UBmaU3MSAuQkhpTY=
X-Google-Smtp-Source: ABdhPJzz2NPen+t9h7xbgmWFxKtxUGXZqxyqaY54ABg+DdffRiydd+UVAEPN4Grk6agAIWY5npdm1cM/UkLjxYDZp8Q=
X-Received: by 2002:aca:adc4:: with SMTP id w187mr1824467oie.153.1596618368307;
 Wed, 05 Aug 2020 02:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-15-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-15-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 11:05:57 +0200
Message-ID: <CAMuHMdWobsLUQ_Oa7i3zOMKw8XOWeVsOTrg8GF9iFaqKZQW_nw@mail.gmail.com>
Subject: Re: [PATCH 14/20] dt-bindings: sound: renesas,rsnd: Document r8a774e1 bindings
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

On Thu, Jul 16, 2020 at 7:20 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Document SoC specific bindings for RZ/G2H (r8a774e1) SoC.
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
