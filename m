Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5779850E0F7
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Apr 2022 15:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234807AbiDYNEI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Apr 2022 09:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbiDYNEF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Apr 2022 09:04:05 -0400
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2242DFF9;
        Mon, 25 Apr 2022 06:01:01 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d14so10194279qtw.5;
        Mon, 25 Apr 2022 06:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+vnDAvBvlFIQr4wFseqaJb0VYP6iBq0UNmsGT7OX5bE=;
        b=ma0Qzz3/ePuFeqZ4aO68ZPPe+jibwfBfMt0F92aE9nozkvUgHtVZIUzm8nc1qNumdp
         MQyww0hQvGWsfP0wA91+llrk8AWF/7NeNS2fM8edvPj67HWF80XrkDu6nN0ougGTGSnV
         UQOw2EeG3fedWjH8bc2jkZmJMfNNQCU9Vlp2mrEaAlYpFiFiiwaneWQN9cdevJlTwjLD
         N76ZsUdfBXIzUaYrxof18qGffmHDHcHnWj90x6WLzQRNCiW/t+6M7NzqhW6rCdQWLIb/
         LoINUnpgHKG00ZcJODRskIw4T6Uxn7Z/bfaxH+7VxuEEYo5TQXrs16Hv/yRW0saUA8PS
         RzMw==
X-Gm-Message-State: AOAM533ohjxSzafWVHW6blg53ytimbUFV99Vx6BTJcSyiaDE2KxygtbP
        ihemHHQ2aR7b4rqlpACVn836MIxZ0x7+bg==
X-Google-Smtp-Source: ABdhPJzIuMTEjme/di9IjJMr28eBRRce5qzVqU1RkxjZxKVTSJNT9D29Tqvw/yfVxMXcpDzj2a68LQ==
X-Received: by 2002:a05:622a:1cf:b0:2f1:f542:7083 with SMTP id t15-20020a05622a01cf00b002f1f5427083mr11647836qtw.78.1650891660758;
        Mon, 25 Apr 2022 06:01:00 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id l130-20020a37a288000000b0069e8290f28asm4978910qke.97.2022.04.25.06.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 06:01:00 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id f38so26886218ybi.3;
        Mon, 25 Apr 2022 06:01:00 -0700 (PDT)
X-Received: by 2002:a25:8087:0:b0:641:dd06:577d with SMTP id
 n7-20020a258087000000b00641dd06577dmr15632922ybk.207.1650891660240; Mon, 25
 Apr 2022 06:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220423132043.139672-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220423132043.139672-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Apr 2022 15:00:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVu9ha7TYEDpZXjDBWDroEukzA0GwDhkOuohH7godG8dg@mail.gmail.com>
Message-ID: <CAMuHMdVu9ha7TYEDpZXjDBWDroEukzA0GwDhkOuohH7godG8dg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: renesas,riic: Document RZ/G2UL SoC
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Biju,

On Sat, Apr 23, 2022 at 3:20 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document RZ/G2UL I2C bindings. RZ/G2UL I2C is identical to one found on
> the RZ/G2L SoC. No driver changes are required as RZ/G2L compatible
> string "renesas,riic-rz" will be used as a fallback.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> @@ -19,6 +19,7 @@ properties:
>        - enum:
>            - renesas,riic-r7s72100   # RZ/A1H
>            - renesas,riic-r7s9210    # RZ/A2M
> +          - renesas,riic-r9a07g043  # RZ/G2UL
>            - renesas,riic-r9a07g044  # RZ/G2{L,LC}
>            - renesas,riic-r9a07g054  # RZ/V2L
>        - const: renesas,riic-rz      # RZ/A or RZ/G2L

You forgot to make the resets property required on RZ/G2UL.

With that fixes:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
