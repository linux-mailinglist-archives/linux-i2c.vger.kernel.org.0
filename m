Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DEEE755F0D
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jul 2023 11:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbjGQJQ6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 17 Jul 2023 05:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjGQJQ6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jul 2023 05:16:58 -0400
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10836BF;
        Mon, 17 Jul 2023 02:16:57 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4812e36d989so1246569e0c.0;
        Mon, 17 Jul 2023 02:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689585416; x=1692177416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nR0NNkRHQMImNSlPZe0+LpHYgBtzrVjpsMNsBClDx0o=;
        b=fsbz2S2YugShXE7g/2SSaTZ43dw4LI+nvOr8wfDo2LVrpe+L9OFu1OpLBY7tFDMN4K
         wq7Me7u9/mxyu58XPAC1HNzitj15BR9wA50kkhzNk3Ty+wF9RVwMm8cbFLsWtp+Zku+H
         XUZIVBa8RNtocGaVgMQlCQCqaxEWnyuBA0jOZOaPYLpkOQ2WQ/6A551logLB4WdEM2rX
         9RTcnYnKAlL7kGYj/vjG9/Rox40gi8ii+B6Tg5tpsLPXIAMvSOrldWCxppinUT55QMQw
         i+2qNe7Kh0ogSWM88l5KA2jKGhdounxyR7MGaSazqW0MxI0Mu4EjD1ltAp7b9BMlveL9
         odtQ==
X-Gm-Message-State: ABy/qLY6XLmmIlXKqc8KQ4K9nxMxohe/jhQswUoveuVpjvfoPHjEt4N4
        OdaUTLgVYLjnGQAmxp4jFSMMoHyo3DOZcg==
X-Google-Smtp-Source: APBJJlF6vCHOcBFVn2MExqIyd5YK618wFe9KeAs9d3YM2SzL0avSUU8xs+PtozjJCYlbfsrT3Czm6g==
X-Received: by 2002:a1f:5f55:0:b0:44f:e6ff:f30e with SMTP id t82-20020a1f5f55000000b0044fe6fff30emr5507428vkb.10.1689585415895;
        Mon, 17 Jul 2023 02:16:55 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id g1-20020ac5c5c1000000b004814091d81fsm1528668vkl.31.2023.07.17.02.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 02:16:55 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-44096f01658so1406495137.0;
        Mon, 17 Jul 2023 02:16:55 -0700 (PDT)
X-Received: by 2002:a67:ed84:0:b0:443:6cb3:ea61 with SMTP id
 d4-20020a67ed84000000b004436cb3ea61mr4430457vsp.18.1689585415081; Mon, 17 Jul
 2023 02:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230716185108.283447-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230716185108.283447-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Jul 2023 11:16:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX2NuqFVW5LBV4xY9ecU1z5oAVwAj=tebiuu+377EBaig@mail.gmail.com>
Message-ID: <CAMuHMdX2NuqFVW5LBV4xY9ecU1z5oAVwAj=tebiuu+377EBaig@mail.gmail.com>
Subject: Re: [PATCH] i2c: mux: ltc4306: Simplify probe()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Peter Rosin <peda@axentia.se>,
        Michael Hennerich <michael.hennerich@analog.com>,
        linux-i2c@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Biju,

On Sun, Jul 16, 2023 at 8:51 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The ltc4306_id[].driver_data could store a pointer to the chips,
> like for DT-based matching, making I2C and DT-based matching
> more similar.
>
> After that, we can simplify the probe() by replacing of_device_get_
> match_data() and i2c_match_id() by i2c_get_match_data() as we have
> similar I2C and DT-based matching table.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

A suggestion for improvement (which can be a separate patch, as it would
touch ltc4306_of_match[] too) below.

> --- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
> +++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
> @@ -192,8 +192,8 @@ static int ltc4306_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
>  }
>
>  static const struct i2c_device_id ltc4306_id[] = {
> -       { "ltc4305", ltc_4305 },
> -       { "ltc4306", ltc_4306 },
> +       { "ltc4305", .driver_data = (kernel_ulong_t)&chips[ltc_4305] },
> +       { "ltc4306", .driver_data = (kernel_ulong_t)&chips[ltc_4306] },

As after this the ltc_type enum values are used only for hardcoded
indexing inside the chips array, you can get rid of them by splitting
the array in individual variables, shortening the lines above
(and in ltc4306_of_match[] below) in the process.

>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, ltc4306_id);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
