Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 299D97A77E4
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Sep 2023 11:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234133AbjITJrf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 20 Sep 2023 05:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234129AbjITJre (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Sep 2023 05:47:34 -0400
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD23AB;
        Wed, 20 Sep 2023 02:47:27 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-59c268676a9so43973047b3.0;
        Wed, 20 Sep 2023 02:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695203246; x=1695808046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEXcFTx8NBhUQLoak79jfYmt6kaIk047FnPy9WrHfn8=;
        b=m4ljMYcgx74MDf0swHR7CVFbC9hp8Ms1jmsnlFd90C1Ok/pmt+YyKrn86LmvGFxLpg
         DVJNogc0waSrAem55XVbqu/rIX3YiRfSVkTp+HMj0+dJ/wwA8i7Kld7poDKqGcLDVNPH
         4gjQeLL7msbRmPgn1j+3YSuvJGY3BJtvdWJ7Fr22AVQE9ea3rk5GH9RWgB9pzOthsUC7
         rkUz4Ozy9yyhO2wzqxW4pp5FwczHtm7UAqEG0JShf3xOkTkqjJqa4IAQwBvvNzwOexVS
         vrImcSyw7LfbuuclaFXuYuoFUYKxPqdKfVFJLxKdt3pW69GfTDlIcby2FDzCoeMT/I2L
         GeIA==
X-Gm-Message-State: AOJu0YyDHy+TpM4qAU8zU1H5tFYFdVz06WINIut7Tzo+FKgAjgZKDLvK
        dKzHn6GUmi5fWhRwzzVuSs09UQWdW9eDKg==
X-Google-Smtp-Source: AGHT+IH4uFa4mW7y+CcQ0SfdscXUoyE+vyyNTYmsgkqVedyKoArnSFkskGE1v25T6Im/qL1VmhrQHw==
X-Received: by 2002:a0d:df4e:0:b0:592:85ec:df15 with SMTP id i75-20020a0ddf4e000000b0059285ecdf15mr1828658ywe.11.1695203246252;
        Wed, 20 Sep 2023 02:47:26 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id e184-20020a8169c1000000b0057042405e2csm3710221ywc.71.2023.09.20.02.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 02:47:26 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-59bc956b029so64237477b3.2;
        Wed, 20 Sep 2023 02:47:25 -0700 (PDT)
X-Received: by 2002:a81:4e95:0:b0:59b:c847:bce0 with SMTP id
 c143-20020a814e95000000b0059bc847bce0mr1982086ywb.42.1695203245405; Wed, 20
 Sep 2023 02:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230919151948.21564-1-wsa+renesas@sang-engineering.com> <20230919151948.21564-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230919151948.21564-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Sep 2023 11:47:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX=95RZFwWBPMEtNTn2FFUr5VzDmDotEnmcip_0j+A-RQ@mail.gmail.com>
Message-ID: <CAMuHMdX=95RZFwWBPMEtNTn2FFUr5VzDmDotEnmcip_0j+A-RQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: rcar: improve accuracy for R-Car Gen3+
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Tue, Sep 19, 2023 at 8:45 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> With some new registers, SCL can be calculated to be closer to the
> desired rate. Apply the new formula for R-Car Gen3 device types.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v1:
> * fixed two whitespace issues
> * use dedicated variables for scld and schd
> * explicitly say "2 * smd" in the comment explaining the new formula
> * use correct division 'clkp/SCL' in the same comment
> * updated debug printout to use the new variables

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

But given you have to respin 1/2 anyway, what about...

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c

> @@ -128,6 +146,8 @@ struct rcar_i2c_priv {
>
>         int pos;
>         u32 icccr;
> +       u16 scld;
> +       u16 schd;

... changing the order, to match alphabetical and register offset order.

> +
> +               priv->icccr = cdf;
> +               priv->scld = RCAR_SCLD_RATIO * x;
> +               priv->schd = RCAR_SCHD_RATIO * x;

Likewise.

> +
> +               dev_dbg(dev, "clk %u/%u(%lu), round %u, CDF: %u SCLD %u SCHD %u\n",
> +                       scl, t.bus_freq_hz, rate, round, cdf, priv->scld, priv->schd);
> +       }
>
>         return 0;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
