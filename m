Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC60B75FA41
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 16:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbjGXOzy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 24 Jul 2023 10:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbjGXOzw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 10:55:52 -0400
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFDFD10C0;
        Mon, 24 Jul 2023 07:55:51 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-c2cf4e61bc6so5085401276.3;
        Mon, 24 Jul 2023 07:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690210551; x=1690815351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOViBXqySSHEIUfdu6dzaaz9/Pltt8shU33LsAmteog=;
        b=AryuoKstnlMRfL3f+j3QBbAEHKFMnyOPLM0HgwstaSKZnQpqXZiUHVvcZkOfWjU62G
         WL3ruQS0JxcA44v0cSjMfpXneBJoZHvvrdeVKEmonXnJ8bPaAjZ6PuvQsnxXHVZULu9O
         JeAzlgAb48ah23gKIGq/txa5Q7ZIJc93JRqcYGWrWv6dgyU6IR9bT1wYNRuAyLeg6yFu
         3cuTHL/I96qi/5s4/wRm/aAaR5+4GnSFb0w00+8YtYlBuLI1OmjOiRhMKLKMld6W/sYA
         4YwEj0kCTEJCFeNMJvUQ0C0m+B6rp9mYsqhaOrQLeaqOgx/jUpbbuUzrhGqBMt+QOLtk
         L2GA==
X-Gm-Message-State: ABy/qLZJiH8/pkBFtiRh8C42I87xltbB+IUG0YGHq5UEOWEulesHEzNY
        IT0Zo2ySYwf+SSMWYDCLIOGSlxDdG/h7fw==
X-Google-Smtp-Source: APBJJlEsWPzD4MZq79CbbPYmygH90NWkfLxuxlYIXkCAGIG6LjtytKpi8jYvEIj/WEB4HYlVvlj0BA==
X-Received: by 2002:a5b:741:0:b0:d0c:110b:2f1a with SMTP id s1-20020a5b0741000000b00d0c110b2f1amr5332633ybq.54.1690210550895;
        Mon, 24 Jul 2023 07:55:50 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id t7-20020a255f07000000b00cfe41f8f987sm2277911ybb.51.2023.07.24.07.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 07:55:50 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-583f036d50bso15438847b3.3;
        Mon, 24 Jul 2023 07:55:50 -0700 (PDT)
X-Received: by 2002:a25:d751:0:b0:ca6:4832:8825 with SMTP id
 o78-20020a25d751000000b00ca648328825mr10278360ybg.53.1690210550489; Mon, 24
 Jul 2023 07:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230723083721.35384-1-biju.das.jz@bp.renesas.com> <20230723083721.35384-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230723083721.35384-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 Jul 2023 16:55:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWThYuw+fwoz8xwHRyDDgTQUkW_c_ANkjzuMggqZCm3zg@mail.gmail.com>
Message-ID: <CAMuHMdWThYuw+fwoz8xwHRyDDgTQUkW_c_ANkjzuMggqZCm3zg@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data() callback
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
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

On Sun, Jul 23, 2023 at 10:37 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add i2c_device_get_match_data() callback to struct bus_type().
>
> While at it, introduced i2c_get_match_data_helper() to avoid code
> duplication with i2c_get_match_data().
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -114,20 +114,41 @@ const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
>  }
>  EXPORT_SYMBOL_GPL(i2c_match_id);
>
> +static void *i2c_get_match_data_helper(struct i2c_driver *driver,

static const void *

> +                                      const struct i2c_client *client)
> +{
> +       const struct i2c_device_id *match;
> +
> +       match = i2c_match_id(driver->id_table, client);
> +       if (!match)
> +               return NULL;
> +
> +       return (const void *)match->driver_data;

I guess your compiler didn't complain about the const/non-const
conversion when returning because it inlined the function?

> +}
> +
> +static const void *i2c_device_get_match_data(const struct device *dev)
> +{
> +       const struct i2c_client *client = to_i2c_client(dev);
> +       const struct i2c_driver *driver;
> +
> +       if (!dev->driver)
> +               return NULL;
> +
> +       driver = to_i2c_driver(dev->driver);
> +       if (!driver)
> +               return NULL;

"driver" can never be NULL here.

> +
> +       return i2c_get_match_data_helper(driver, client);
> +}
> +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
