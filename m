Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 222AF7A6822
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 17:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232459AbjISPbs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 19 Sep 2023 11:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbjISPbr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 11:31:47 -0400
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB299C;
        Tue, 19 Sep 2023 08:31:40 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-59c0b9ad491so42293367b3.1;
        Tue, 19 Sep 2023 08:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695137499; x=1695742299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rffCigIkI5AiVQLkPT4sQ4Al9mwiZE2bdJGvxnik3DE=;
        b=uJQg19mmFgG8xIFA3eBZCyGxS+4xGv1taqclMIqmGfHlavhh2qbZmvdDiA1wxuXNQL
         cOQRourMAI2dNPfS7oISnqs0X4kDokVjiWGwRGFBYtLwt0s3P6E10R1NDFOytuIaAWjo
         XkUq3HGOC1A+gu8hnNu/1Q2qOSazD6c6ddoXFJTbbR3XpjzvWf7ewkGZfhlk2qU/gllR
         tU7WX3uqG6CLx+HGgqeRLOWVv6Y99Ocxqk7pK10sWsM4DoBVG9ZJdbHnDBY4Jx2xp75j
         Q+8EmGjwE+JR54qYjp8wmIKQ3UakVVm21X4oBr6cyMcpEMttEh963/Xwt8tBN0nHupqN
         TV+g==
X-Gm-Message-State: AOJu0YzSncL6WJxoT41eOF6XjY/27Ak7UaZoCwTpnEAxgPLt+QCM5H66
        aPvMpSr0iLSgIGXgMUnQb/gTBXhSoTIqOw==
X-Google-Smtp-Source: AGHT+IExazNjtvq72TFwZMN20Dfxs0j7rmTW+kjpJKfb8x6HLSDA79YqqCaofWvEqCNOHlRY0QQLPQ==
X-Received: by 2002:a0d:ef84:0:b0:57a:75b8:b790 with SMTP id y126-20020a0def84000000b0057a75b8b790mr13355836ywe.29.1695137499590;
        Tue, 19 Sep 2023 08:31:39 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id m131-20020a817189000000b00589dbcf16cbsm3261505ywc.35.2023.09.19.08.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 08:31:39 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-59bbdb435bfso57631357b3.3;
        Tue, 19 Sep 2023 08:31:39 -0700 (PDT)
X-Received: by 2002:a0d:dd13:0:b0:595:e1b:b978 with SMTP id
 g19-20020a0ddd13000000b005950e1bb978mr13349905ywe.21.1695137499219; Tue, 19
 Sep 2023 08:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230919151948.21564-1-wsa+renesas@sang-engineering.com> <20230919151948.21564-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230919151948.21564-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Sep 2023 17:31:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVKfwGotCoxwiTku7GkjY=NajPtYdFhJNKqE2KW_7J-Xg@mail.gmail.com>
Message-ID: <CAMuHMdVKfwGotCoxwiTku7GkjY=NajPtYdFhJNKqE2KW_7J-Xg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] i2c: rcar: reset controller is mandatory for Gen3+
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

On Tue, Sep 19, 2023 at 5:23 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Initially, we only needed a reset controller to make sure RXDMA works at
> least once per transfer. Meanwhile, documentation has been updated. It
> now says that a reset has to be performed prior every transaction, even
> if it is non-DMA. So, make the reset controller a requirement instead of
> being optional. And bail out if resetting fails.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Change since v1:
> * bail out when resetting fails (Thanks, Geert!)

Thanks for the update!

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
> +                       return ret;

goto out

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

pm_runtime_put(dev);
goto out_pm_disable;

Sorry for not noticing before.
(I'm sooo happy you didn't retain my Rb-tag ;-)

> +
> +               ret = reset_control_status(priv->rstc);
> +               if (ret < 0)
> +                       return ret;

Likewise

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
