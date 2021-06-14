Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E09A73A66D4
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jun 2021 14:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232967AbhFNMpV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Jun 2021 08:45:21 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:36485 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233072AbhFNMpU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Jun 2021 08:45:20 -0400
Received: by mail-vs1-f49.google.com with SMTP id z7so7699677vso.3;
        Mon, 14 Jun 2021 05:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fP9Imc/qTgy6jspmZ1we2+uLTScwwVRMyXCglp4j/s4=;
        b=g06Y04A86iv3G1tNciMHLyuzfeWtDF/oC2jdjEbY17dIlRRIE4bVirPC4jpQai1KwC
         XdMA57eeDYXElNkv+T8YzTOGukZCAyq/TNCkhMr2elSBewNtwjIlJ4eDe1SpqDcSz4hy
         yygYvfXq9EJPhvlo6DusJ3CPNMa+9i2WWYLD+7GjM3sovWcEE4cD3xnH3fUIuQTQqVMg
         pqDG0fq/o19CdJUmyAWiCQHg3WDdzgY2uw2OnGijP9Wf80LaWQq5TV39tc95LRFcwvSl
         LCWCzgbQpk+U5nUeYyKt/nvH26pxKRCzZHz4Je+PBwUShQFJsoBtfrzhqIJgzzQrxrQK
         1t8A==
X-Gm-Message-State: AOAM532rrMguzw6gidXtg74By/8l2pM07tVYwsPMeLRJ+HTc3FOoBgrJ
        nMlZfIxJNQ/bZ3Jkj7Sw6mYfEYPIz9xH89XQEEI=
X-Google-Smtp-Source: ABdhPJwi/vkaxQ5ra+mPb+0q/hqhucXvZhzsk/FI1ccXgurUI79+L6gL2pOAMQh6tXvzu25TU58n80TzbeeOb8UVPxI=
X-Received: by 2002:a05:6102:c4c:: with SMTP id y12mr17368171vss.18.1623674597228;
 Mon, 14 Jun 2021 05:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210611165624.30749-1-biju.das.jz@bp.renesas.com> <20210611165624.30749-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210611165624.30749-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Jun 2021 14:43:06 +0200
Message-ID: <CAMuHMdXJ_9aOzKgrxEVwmWWfMdgdaZ-O2sicsBYDt34dKtyu4Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: i2c: renesas,riic: Document RZ/G2L I2C controller
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 11, 2021 at 6:56 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document RZ/G2L I2C controller bindings.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
