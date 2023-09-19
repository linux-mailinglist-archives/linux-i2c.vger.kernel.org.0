Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D795F7A5EA1
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 11:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbjISJwV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 19 Sep 2023 05:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbjISJwT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 05:52:19 -0400
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F257100;
        Tue, 19 Sep 2023 02:52:13 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3add37de892so1166957b6e.1;
        Tue, 19 Sep 2023 02:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695117132; x=1695721932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qayjheRLHKR7GVcadhU2v14TOfXbeuxwhPweaZcyTI=;
        b=Nc8tVnegW0ZnRw6AXihmZhlPLdXL2WkcMyUzKa6gyKjM7c0py2/6bX38huMJCIEXLo
         elr/tPsqbs0g9wA3IXqcbOAnFr4SvaFFp9ndmleRv07JlFXOwkDHG2mhzELibdOc4ZEB
         CoCjIRcqQyQyZ3Vtcdu8phYI1h+DvNq/zNry96nNLPREc9WcUgIUaGFVyHlF/nVJZA2t
         iIAB0OncDmdcsEHf4MAT3i3wuP7BwlsXXyYKQuZ1r2J7V0XgUguBQvkfV1As2IBxInWQ
         1xIEDhx3OvqWGVeHT48/mukfagS3JYtq+2qLlYbEAJiMyfPttttg+D6H8wx2EhnGUzrH
         sS4g==
X-Gm-Message-State: AOJu0YzgN0nUrGJqdJh8QPY43XAqEg19QE/j2EM6ovlGZ1Pw7cJrTg7I
        WpvbUYeVe2yasfF6T83h61359NsXrS19lg==
X-Google-Smtp-Source: AGHT+IH0l9gQzz90ANoJ8XSaJt3fT5+xL+oQyRT6aVHy7PiZz0J9QJI2MWAnBITmwB0Myg9qrEu9yw==
X-Received: by 2002:aca:1209:0:b0:3a7:1bd8:4eb6 with SMTP id 9-20020aca1209000000b003a71bd84eb6mr10038088ois.44.1695117131855;
        Tue, 19 Sep 2023 02:52:11 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id df19-20020a05690c0f9300b0057087e7691bsm1926609ywb.56.2023.09.19.02.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 02:52:11 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-59be6bcf408so54135677b3.2;
        Tue, 19 Sep 2023 02:52:11 -0700 (PDT)
X-Received: by 2002:a0d:ee83:0:b0:573:bb84:737c with SMTP id
 x125-20020a0dee83000000b00573bb84737cmr11437079ywe.26.1695117130983; Tue, 19
 Sep 2023 02:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230913203242.31505-1-wsa+renesas@sang-engineering.com> <20230913203242.31505-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230913203242.31505-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Sep 2023 11:51:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWrb2je4tgEO_OmXhHtFiRb8JfUzBJdUp4KFf574GmoVA@mail.gmail.com>
Message-ID: <CAMuHMdWrb2je4tgEO_OmXhHtFiRb8JfUzBJdUp4KFf574GmoVA@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: rcar: add FastMode+ support for Gen4
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
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

On Thu, Sep 14, 2023 at 1:16 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> To support FM+, we mainly need to turn the SMD constant into a parameter
> and set it accordingly. Then, activating the enable bit for FM+ is all
> we need to do. Tested with a Renesas Falcon board using R-Car V3U.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -297,11 +307,18 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
>          * clkp : peripheral_clk
>          * F[]  : integer up-valuation
>          */
> -       rate = clk_get_rate(priv->clk);
> -       cdf = rate / 20000000;
> -       cdf_width = (priv->devtype == I2C_RCAR_GEN1) ? 2 : 3;
> -       if (cdf >= 1U << cdf_width)
> -               goto err_no_val;
> +       if (t.bus_freq_hz > I2C_MAX_FAST_MODE_FREQ && priv->devtype >= I2C_RCAR_GEN4) {
> +               priv->flags |= ID_P_FMPLUS;
> +               /* FM+ needs lower SMD and no filters */
> +               priv->smd /= 2;
> +               cdf = 0;

Is this documented somewhere in the R-Car Gen4 docs?
Assumed this is true, the rest LGTM, modulo the few fixes that should be
moved to "[PATCH RFT 2/2] i2c: rcar: improve accuracy for R-Car Gen3+".

> +       } else {
> +               priv->flags &= ~ID_P_FMPLUS;
> +               cdf = rate / 20000000;
> +               cdf_width = (priv->devtype == I2C_RCAR_GEN1) ? 2 : 3;
> +               if (cdf >= 1U << cdf_width)
> +                       goto err_no_val;
> +       }
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
