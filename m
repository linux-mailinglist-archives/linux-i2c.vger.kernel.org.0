Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5574670BBCB
	for <lists+linux-i2c@lfdr.de>; Mon, 22 May 2023 13:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232479AbjEVL3Q convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 22 May 2023 07:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232985AbjEVL3E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 May 2023 07:29:04 -0400
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40FC610D;
        Mon, 22 May 2023 04:29:03 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-ba8cf3cb34fso5071946276.1;
        Mon, 22 May 2023 04:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684754942; x=1687346942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/j6lymyIZ4DhoFPpU34laBPBGrUO7Pk5hyYSR1fMuo=;
        b=aMIJw2Pxs8iSOshGIWxk1+BCV23Kfy5s83fHzQVGRh45DWKZdpXBD7OXg2u6b3P9EM
         Ra4CB95acQwwyCJviA+QHSQDv9dexzUzNBSh5Wm8QuiQyjVoVKaFNAslTCzpBz3JfgNm
         yojrOAoFNJoBJL1eBMDpmVbaSSviLubKwxxhrwhiLsflzfRZBF4RO5a4+X4K1l2fR9G/
         +xhpEjJW0dXEfcRpoMCU5bfYXraWbU8oQCNxto7gk/TBLJzRvsBuYo42Ohv/IbvlJ+nL
         rLe6HvTgtLlxmgrGd/iXRSR0uPSJM9XacTAL+bF6I6W05pC0Z8lb75Ew+GFE/x06RT/U
         DVnA==
X-Gm-Message-State: AC+VfDzEEl+RmxE5x6Yc6i3aPnfXjMbI105sRE8OUWWkTSZ/bXHGAWWs
        AI3fIiO+fFXFiw/ynb6Bzz3uPo9M5eC5KQ==
X-Google-Smtp-Source: ACHHUZ5I0Bvj1y5+FFSmSfDaKVGxIo8K5uK1IjtIp+L69zInk1M1BOcJTDU6M0IX4HHUHYW8xtYkXA==
X-Received: by 2002:a25:2f56:0:b0:b9a:6a19:8153 with SMTP id v83-20020a252f56000000b00b9a6a198153mr9650238ybv.5.1684754941910;
        Mon, 22 May 2023 04:29:01 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id v39-20020a25abaa000000b00b9b1d09ed18sm1445163ybi.33.2023.05.22.04.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 04:29:01 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-56190515833so52090067b3.0;
        Mon, 22 May 2023 04:29:01 -0700 (PDT)
X-Received: by 2002:a81:a84:0:b0:561:b770:1063 with SMTP id
 126-20020a810a84000000b00561b7701063mr11129387ywk.0.1684754940755; Mon, 22
 May 2023 04:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230522104157.333217-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230522104157.333217-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 May 2023 13:28:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWPF8SvJ=OyPBFSwTD65ic+KB-um0zYWVL6imO-ddgC6g@mail.gmail.com>
Message-ID: <CAMuHMdWPF8SvJ=OyPBFSwTD65ic+KB-um0zYWVL6imO-ddgC6g@mail.gmail.com>
Subject: Re: [PATCH] i2c: Add i2c_get_match_data()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Biju,

On Mon, May 22, 2023 at 12:42 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add i2c_get_match_data() similar to of_device_get_match_data(),
> so that we can optimize the driver code that uses both I2C and
> DT-based matching.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -99,8 +99,8 @@ const char *i2c_freq_mode_string(u32 bus_freq_hz)
>  }
>  EXPORT_SYMBOL_GPL(i2c_freq_mode_string);
>
> -const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
> -                                               const struct i2c_client *client)
> +static const struct i2c_device_id *i2c_match_device_id(const struct i2c_device_id *id,
> +                                                      const struct i2c_client *client)
>  {
>         if (!(id && client))
>                 return NULL;
> @@ -110,10 +110,30 @@ const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
>                         return id;
>                 id++;
>         }
> +
>         return NULL;
>  }
> +
> +const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
> +                                        const struct i2c_client *client)
> +{
> +       return i2c_match_device_id(id, client);
> +}
>  EXPORT_SYMBOL_GPL(i2c_match_id);

Is there any reason why you're adding a new intermediate?

>
> +const void *i2c_get_match_data(const struct i2c_device_id *id,
> +                              const struct i2c_client *client)

I think this should take the id table from the i2c_driver, as pointed to
by client->dev.driver, instead of from an explicitly passed parameter.

> +{
> +       const struct i2c_device_id *match;
> +
> +       match = i2c_match_device_id(id, client);
> +       if (!match)
> +               return NULL;
> +
> +       return (const void *)match->driver_data;

One can discuss about the returned type: personally, I won't mind
"const void *" for consistency with other subsystems (e.g. DT), but
as i2c_device_id.driver_data has type "kernel_ulong_t", other people
might prefer the latter.

> +}
> +EXPORT_SYMBOL(i2c_get_match_data);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
