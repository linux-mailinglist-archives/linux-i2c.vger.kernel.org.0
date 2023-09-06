Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54207793697
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 09:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233145AbjIFH46 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 6 Sep 2023 03:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbjIFH45 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 03:56:57 -0400
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1ED9CF;
        Wed,  6 Sep 2023 00:56:51 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7a505727e7eso1248580241.0;
        Wed, 06 Sep 2023 00:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693987011; x=1694591811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eC4TeOgj5AZE66ZqrYtCV0soUn6GpHNH9WYMorYVd28=;
        b=LnFSfWiOKXg3FzopLBOBwSGWlKp8Q4yCIIE+5/vHvNYJSHnqs5G8wm7V2z0gIH6m/c
         lp08CuPjIe8Is3x0hC38oWb1O+Jai9Ku8FZu/NoYScKCJXhEPlzA/PGLQ0p13brKdCOP
         FvTV8dWUhlHzBFY83bcCTRi3S75COmwJrbwosvklJSpTJGBCFfnlS5BBd/YOTweHMLSm
         BHpZRGpVgxBcqURUS2ugsOEmAAKixwIsvvLCV5msVpxEdoBmnEqb17qgODqREyWcuji/
         cX8Bm9acApsGTgGHy3hJFmj3Yb5eAwa834h5sW7HxKA9hQkwrbyhRGQpYOGy6GuHQKz4
         fmig==
X-Gm-Message-State: AOJu0YzT7x4Vrnqw+VBq4W42SX28mkbpqvvwv7OFUYf9I4tstYRilrVo
        bbcRw8No4eDMXUwkRIRo2xy2TOX9HKvjdA==
X-Google-Smtp-Source: AGHT+IGibwRn4E2d46HNX70RZyJ0mqAkCh/NA175oYi4Bf5wh0aKcCcehszS4TqrwYiWDhjLKUvu6g==
X-Received: by 2002:a1f:ed47:0:b0:490:a0eb:1b9f with SMTP id l68-20020a1fed47000000b00490a0eb1b9fmr2291319vkh.10.1693987010718;
        Wed, 06 Sep 2023 00:56:50 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id t84-20020a1f2d57000000b004936903f3b3sm241778vkt.13.2023.09.06.00.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 00:56:50 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7a505727e7eso1248564241.0;
        Wed, 06 Sep 2023 00:56:50 -0700 (PDT)
X-Received: by 2002:a67:fd9a:0:b0:44d:547d:7e84 with SMTP id
 k26-20020a67fd9a000000b0044d547d7e84mr2339913vsq.28.1693987009748; Wed, 06
 Sep 2023 00:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230904135852.12146-1-wsa+renesas@sang-engineering.com> <20230904135852.12146-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230904135852.12146-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Sep 2023 09:56:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUJnKeLJu4-CuDEFty8oW0p9M-D5mcuDv+fFxo-fHvvaQ@mail.gmail.com>
Message-ID: <CAMuHMdUJnKeLJu4-CuDEFty8oW0p9M-D5mcuDv+fFxo-fHvvaQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: rcar: introduce Gen4 devices
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Mon, Sep 4, 2023 at 3:59 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> So far, we treated Gen4 as Gen3. But we are soon adding FM+ as a Gen4
> specific feature, so prepare the code for the new devtype.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c

> @@ -218,7 +219,7 @@ static void rcar_i2c_init(struct rcar_i2c_priv *priv)
>         /* start clock */
>         rcar_i2c_write(priv, ICCCR, priv->icccr);
>
> -       if (priv->devtype == I2C_RCAR_GEN3)
> +       if (priv->devtype >= I2C_RCAR_GEN3)
>                 rcar_i2c_write(priv, ICFBSCR, TCYC17);

Note that R-Car Gen4 (incl. R-Car S4) has ICFBSCR bits related to
Slave Clock Stretch Select (which is not yet supported by the driver).

> @@ -1031,10 +1021,12 @@ static const struct of_device_id rcar_i2c_dt_ids[] = {
>         { .compatible = "renesas,i2c-r8a7794", .data = (void *)I2C_RCAR_GEN2 },
>         { .compatible = "renesas,i2c-r8a7795", .data = (void *)I2C_RCAR_GEN3 },
>         { .compatible = "renesas,i2c-r8a7796", .data = (void *)I2C_RCAR_GEN3 },
> +       /* S4 has no FM+ bit */
> +       { .compatible = "renesas,i2c-r8a779f0", .data = (void *)I2C_RCAR_GEN3 },
>         { .compatible = "renesas,rcar-gen1-i2c", .data = (void *)I2C_RCAR_GEN1 },
>         { .compatible = "renesas,rcar-gen2-i2c", .data = (void *)I2C_RCAR_GEN2 },
>         { .compatible = "renesas,rcar-gen3-i2c", .data = (void *)I2C_RCAR_GEN3 },
> -       { .compatible = "renesas,rcar-gen4-i2c", .data = (void *)I2C_RCAR_GEN3 },
> +       { .compatible = "renesas,rcar-gen4-i2c", .data = (void *)I2C_RCAR_GEN4 },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, rcar_i2c_dt_ids);
> @@ -1101,6 +1093,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>                 irqhandler = rcar_i2c_gen2_irq;
>         }
>
> +       /* Gen3 needs reset for RXDMA */
>         if (priv->devtype == I2C_RCAR_GEN3) {

According to the Programming Examples in the docs for R-Car Gen3,
R-Car V3U, S4-8, and V4H, I2C must be reset "at the beginning of
transmission and reception procedure", so not only for DMA.

>                 priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
>                 if (!IS_ERR(priv->rstc)) {

Also, you didn't the touch the checks in rcar_i2c_cleanup_dma():

    /* Gen3 can only do one RXDMA per transfer and we just completed it */
    if (priv->devtype == I2C_RCAR_GEN3 && ...) ...

and rcar_i2c_master_xfer():

    /* Gen3 needs a reset before allowing RXDMA once */
    if (priv->devtype == I2C_RCAR_GEN3) {
            ...
    }

Don't these apply to R-Car Gen4? I can't easily find where this quirk
is documented (perhaps just as a commit in the BSP?), but at least the
"Usage note for DMA mode of Receive Operation" looks identical for
R-Car Gen3 and for the various R-Car Gen4 variants.

So either:
  1. These checks must be updated, too, or
  2. The commit description must explain why this is not needed, as
     switching to I2C_RCAR_GEN4 changes behavior for R-Car Gen4 SoCs
     using the family-specific fallback.

BTW, depending on the answers to my questions above, you may want to
replace the rcar_i2c_type enum by a feature mask...

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
