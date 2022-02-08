Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBFA4AD2CD
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 09:08:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348895AbiBHIIl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 03:08:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347933AbiBHIIk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 03:08:40 -0500
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9041AC0401EF;
        Tue,  8 Feb 2022 00:08:39 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id x13so2494123vsl.10;
        Tue, 08 Feb 2022 00:08:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w2gt74e2o6IF0CBqyJuBpslLP8hBo9R3/CaxMnl2yLA=;
        b=1/766XWycRAQJISsY1afYXjJkGR+4sQhOe1PjyvTfi4c92fy6aYsesa8LD1KFkF6HO
         wH0PpdizMSDHh6/AKfqLcm1zwIl8UPZ7+yDAZSjKD34eqj6ctx/c3rJUPFd6MDmLuCwB
         jtSaxPYYXrmwMPtTVIAes+afrZb9qiJKrJC6ByjKsmhgAIn8Oi2CDtgdlzi/9NW5xzsT
         tnW8UWWAi/nKij/f1yaT1lkiy1r0PTwsX+r+0yktdN7dU+2oNMiBYYIUgDdGb+RmdW22
         7PmKxX+pFAoYDCHyraHwVAgtjNFCFi+k8krsgmOQL1LqfIXRpXSVTpatA193aa9K6AaV
         hj5g==
X-Gm-Message-State: AOAM533I1j2ULKGml5mu9g2cqywX/sia8IJT3Yx133yGq+KMnGZ/Zq7c
        F4ioixDsAWmkEJLIdbXqlqZ2v7LJfrqkaw==
X-Google-Smtp-Source: ABdhPJy4tumz3aJxxeVcOb9n7A8Sfaj/lUArjC+5rkJTiyE7AgqkqMb/blaYvjvfbvIaoZX9tGkpmw==
X-Received: by 2002:a67:f8c4:: with SMTP id c4mr1156606vsp.79.1644307718523;
        Tue, 08 Feb 2022 00:08:38 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id u9sm85819vsn.1.2022.02.08.00.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Feb 2022 00:08:38 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id g15so10332578uap.11;
        Tue, 08 Feb 2022 00:08:38 -0800 (PST)
X-Received: by 2002:ab0:6f0d:: with SMTP id r13mr1447040uah.114.1644307717921;
 Tue, 08 Feb 2022 00:08:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1643898531.git.geert+renesas@glider.be> <127a63594229deca2f63c7393b9bdf17b572163a.1643898531.git.geert+renesas@glider.be>
In-Reply-To: <127a63594229deca2f63c7393b9bdf17b572163a.1643898531.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Feb 2022 09:08:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVVN2Jc0sYpsc=V6gfQRGXk44Uh4r=2JWhM28gF4ePASg@mail.gmail.com>
Message-ID: <CAMuHMdVVN2Jc0sYpsc=V6gfQRGXk44Uh4r=2JWhM28gF4ePASg@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: rcar: Add R-Car Gen4 support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Feb 3, 2022 at 3:33 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Add support for the I2C Bus Interface on R-Car Gen4 SoCs (e.g. R-Car
> S4-8) by matching on a family-specific compatible value.
>
> While I2C on R-Car Gen4 does support some extra features (Slave Clock
> Stretch Select, Fast-mode Plus), for now it is treated the same as I2C

Correction: R-Car S4 does not support Fast-mode Plus, so there will be
a v2 of this patch, eventually.

> on R-Car Gen3.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
