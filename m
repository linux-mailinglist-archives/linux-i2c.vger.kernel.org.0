Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A93D562B514
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Nov 2022 09:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238839AbiKPIZJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Nov 2022 03:25:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiKPIYm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Nov 2022 03:24:42 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12541DDDE;
        Wed, 16 Nov 2022 00:22:58 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id cg5so10242903qtb.12;
        Wed, 16 Nov 2022 00:22:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBnoYcjVURWpX9Daur17Y7+xHtBrI7JK8HkxE9AnM+U=;
        b=4rU39LTDlMP8jTK/kg7CP0l60OfFdea5ORaNwwVrROMp9XoQrCP0KZmCfXDy0wY9dD
         8faB/doU4AlhzTYPykyF00iOpQVpkcdG1zVNKu96Pe3vYXl9V6fxTlMGsnHM9ErDKOrs
         A9j4PTr3jeOBFEeStglHw9hxJeV9KNQlbMRGf1ujlg8AsC52EOJo4+v2qLigWrulQo1u
         G5XY8NXm9KWPUpQtUso5UDK9c6VP3113dtZAo+rrlLMmc/AUNPgS1cpm0mr71Z3O0GyJ
         zVvTPGB/t5TKrAf+7huR2hjwWpxfTdxOVM3ILBadYhxpuKQ4itWh6FyUcW1DPDr8NMnp
         4E1A==
X-Gm-Message-State: ANoB5pkywQ8d8/rMGPISLlsPcrwhBrWZgTRKO1qVi4QiSQo4+WCoLTWD
        jS8HFlEhb/LHaxjE+ksMiJzwdvUSUyL/Mw==
X-Google-Smtp-Source: AA0mqf6YHw+7tHHloEU4iAgb8DTZ/rZ+afDqcfrCJqqokHF1E3HvkdpfB0MAsyM2O2nGjM5MHmSLWg==
X-Received: by 2002:ac8:5f92:0:b0:3a5:7062:b8a0 with SMTP id j18-20020ac85f92000000b003a57062b8a0mr20317105qta.82.1668586977714;
        Wed, 16 Nov 2022 00:22:57 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id u12-20020a05620a084c00b006bc192d277csm9459327qku.10.2022.11.16.00.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 00:22:57 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id s18so20071643ybe.10;
        Wed, 16 Nov 2022 00:22:57 -0800 (PST)
X-Received: by 2002:a25:ad14:0:b0:6ca:e43:d9ff with SMTP id
 y20-20020a25ad14000000b006ca0e43d9ffmr19934559ybi.543.1668586977016; Wed, 16
 Nov 2022 00:22:57 -0800 (PST)
MIME-Version: 1.0
References: <20221115123018.1182324-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221115123018.1182324-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Nov 2022 09:22:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWKHs5zTmJW8viVyxiMJno+Yn_e2CfhkLxSUtHX4TJo3g@mail.gmail.com>
Message-ID: <CAMuHMdWKHs5zTmJW8viVyxiMJno+Yn_e2CfhkLxSUtHX4TJo3g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: renesas,riic: Document RZ/Five SoC
To:     Prabhakar <prabhakar.csengg@gmail.com>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 15, 2022 at 1:31 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RIIC block on the RZ/Five SoC is identical to one found on the RZ/G2UL
> SoC. "renesas,riic-r9a07g043" compatible string will be used on the
> RZ/Five SoC so to make this clear, update the comment to include RZ/Five
> SoC.
>
> No driver changes are required as generic compatible string
> "renesas,riic-rz" will be used as a fallback on RZ/Five SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
