Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0BF7A5CD6
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 10:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbjISIqX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 19 Sep 2023 04:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbjISIqU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 04:46:20 -0400
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ADDA12C;
        Tue, 19 Sep 2023 01:46:14 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-59be9a09c23so54054057b3.1;
        Tue, 19 Sep 2023 01:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695113173; x=1695717973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9gDLlTbkTy+GJtIonlGZoKgcN5Rc/QMrBSOswFOmJU=;
        b=XtIiEBbNKhdQ5ePIcmksgm90zXGg0r/8ACyUAIPL/zLYEbOHALIjicOpBAp4VHp3+1
         gqjxROTVFeHPhfEd9XtggB05hc8EfSddAnMp0hRFsveR4h0iJFHziaWDVBjPxZUQo08c
         NyUxIs+lZwXQHftun1HQFdUVLHTtv0tK4l4FbafJ47EQc2behF2qG9vmRxX+TCI0SyKt
         cJWr+6cmfu6Lv7FL/Ve8Mxups28lyEzu0yWnxEHor2YwE6Yf2FqpLzvmH1sZTiVtoG0i
         m2GSJZzIAfQvj0oTSOKvIq/H1a55y89wgfTIPsvCeY54w5UcKlKIamTC5Js64FLme2cd
         w6Lw==
X-Gm-Message-State: AOJu0Yzb9xvO7r7RrQGNzTNtEusJQ/JDgmx0wa/+9HcUuNgQna5QIveD
        xFu+3khACLjfVFxPGgXhZeqQVjTQsYpQNg==
X-Google-Smtp-Source: AGHT+IFHw9C+Hc2uB35nJw64YBBhY+Pn+Qggfd1kl2yeSZge063uQlCQ9XDe+RLzSxgpXdKjY+Mbqw==
X-Received: by 2002:a0d:df09:0:b0:55a:3ce9:dc3d with SMTP id i9-20020a0ddf09000000b0055a3ce9dc3dmr11625643ywe.13.1695113173002;
        Tue, 19 Sep 2023 01:46:13 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id z185-20020a8189c2000000b0059af9f2ee68sm3058131ywf.66.2023.09.19.01.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 01:46:12 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d7b79a4899bso4930129276.2;
        Tue, 19 Sep 2023 01:46:12 -0700 (PDT)
X-Received: by 2002:a5b:70b:0:b0:d0c:110b:2f17 with SMTP id
 g11-20020a5b070b000000b00d0c110b2f17mr10594697ybq.53.1695113172381; Tue, 19
 Sep 2023 01:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230913062950.4968-1-wsa+renesas@sang-engineering.com> <20230913062950.4968-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230913062950.4968-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Sep 2023 10:46:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8Ug6sQX97_CyFbpAN1Emp7d891wJAWg8pLpnM3q+ysQ@mail.gmail.com>
Message-ID: <CAMuHMdX8Ug6sQX97_CyFbpAN1Emp7d891wJAWg8pLpnM3q+ysQ@mail.gmail.com>
Subject: Re: [PATCH RFT 1/2] i2c: rcar: reset controller is mandatory for Gen3+
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
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

Thanks for your patch!
On Wed, Sep 13, 2023 at 8:41 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Initially, we only needed a reset controller to make sure RXDMA works at
> least once per transfer. Meanwhile, documentation has been updated. It
> now says that a reset has to be performed prior every transaction, also
> if it is non-DMA. So, make the reset controller a requirement instead of
> being optional.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -838,12 +838,10 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
>
>         /* Gen3 needs a reset before allowing RXDMA once */
>         if (priv->devtype == I2C_RCAR_GEN3) {
> -               priv->flags |= ID_P_NO_RXDMA;
> -               if (!IS_ERR(priv->rstc)) {
> -                       ret = rcar_i2c_do_reset(priv);
> -                       if (ret == 0)
> -                               priv->flags &= ~ID_P_NO_RXDMA;
> -               }
> +               priv->flags &= ~ID_P_NO_RXDMA;
> +               ret = rcar_i2c_do_reset(priv);
> +               if (ret)
> +                       priv->flags |= ID_P_NO_RXDMA;

This is pre-existing, but if rcar_i2c_do_reset() returns an error,
that means the I2C block couldn't get out of reset.  Are we sure we
can still do PIO transfers in that case, or should this be considered
a fatal error?

>         }
>
>         rcar_i2c_init(priv);
> @@ -1096,11 +1094,13 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>
>         if (priv->devtype == I2C_RCAR_GEN3) {
>                 priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> -               if (!IS_ERR(priv->rstc)) {
> -                       ret = reset_control_status(priv->rstc);
> -                       if (ret < 0)
> -                               priv->rstc = ERR_PTR(-ENOTSUPP);
> -               }
> +               if (IS_ERR(priv->rstc))
> +                       return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
> +                                            "couldn't get reset");
> +
> +               ret = reset_control_status(priv->rstc);
> +               if (ret < 0)
> +                       return ret;

This is a pre-existing check, but do you really need it?
This condition will be true if the reset is still asserted, which
could happen due to some glitch, or force-booting into a new kernel
using kexec.  And AFAIUI, that should be resolved by the call to
rcar_i2c_do_reset() above.

>         }
>
>         /* Stay always active when multi-master to keep arbitration working */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
