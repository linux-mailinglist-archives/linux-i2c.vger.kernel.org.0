Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D395D725A67
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jun 2023 11:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239458AbjFGJ2q convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 7 Jun 2023 05:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235626AbjFGJ2p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 05:28:45 -0400
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7261BAA;
        Wed,  7 Jun 2023 02:28:44 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-566586b180fso79159127b3.0;
        Wed, 07 Jun 2023 02:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686130123; x=1688722123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ck5/ccPepbZREHVBb/oJR6FTLZcZFdnZJX2ti6ySmVk=;
        b=iRP+Ysheytskok3YN4BPgT+WkPKy3CMNAo6VnKr3RY/mqVDr4n7H0MMLcNC+klunAS
         W5xpzPGLwEIXlwC31i51c4KrxSFTi8xZu+83seQhTH9kEdZsrUZitHn+iqpDHSYCzu9W
         Wvh016JkL2VUp0ZVypS1yzniIn2E4287gtT11UZJp4KpvBnjL/nISMptx+xahg5hfkt2
         T7yUYBz0L02aoT6kDUYLx+q4vuFkrB0iUjrgFxMRwOKTh2m+/sW+W0Jj+GyH/wtFeZ+Y
         YnbUYAEsE73IrXJOSsL+ZXaVlUFQLD8Ci8yel9fXRFUSViN8E7jzh53I7NpIbAczbm6M
         7xPw==
X-Gm-Message-State: AC+VfDww7P9qu9/GJBuop1XrPJHNDP21jtGsWa9CaHhtTVVJ4GVvFoqR
        bRek0va+1c0jX97v6t/uGm078Q9UwF2GWQ==
X-Google-Smtp-Source: ACHHUZ6C3s7g5P3TQkq/YBtu0w7nje5OQN/Ko04PhOngM/mJ35kYkg8inuhXANBqMFL0t8i67zMD1A==
X-Received: by 2002:a81:5b87:0:b0:56a:3b3e:bc6 with SMTP id p129-20020a815b87000000b0056a3b3e0bc6mr2920246ywb.14.1686130123328;
        Wed, 07 Jun 2023 02:28:43 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id m197-20020a0dcace000000b0054fbafcfde9sm4680151ywd.7.2023.06.07.02.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 02:28:42 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-bacfc573647so8097360276.1;
        Wed, 07 Jun 2023 02:28:42 -0700 (PDT)
X-Received: by 2002:a25:3305:0:b0:b9a:7cfe:9bed with SMTP id
 z5-20020a253305000000b00b9a7cfe9bedmr5663044ybz.14.1686130122296; Wed, 07 Jun
 2023 02:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230606130519.382304-1-biju.das.jz@bp.renesas.com> <OS0PR01MB592282658E36A14D0A762BBB8653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592282658E36A14D0A762BBB8653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 7 Jun 2023 11:28:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXekgea3biJXXNb3fa-8Fe3iUJ=K51jKnu9ew_+Fq69g@mail.gmail.com>
Message-ID: <CAMuHMdVXekgea3biJXXNb3fa-8Fe3iUJ=K51jKnu9ew_+Fq69g@mail.gmail.com>
Subject: Re: [PATCH v3] i2c: Add i2c_get_match_data()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Marek Vasut <marex@denx.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
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

On Wed, Jun 7, 2023 at 9:21 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Do we need to enhance the logic to use device_get_match_data
> to support OF/ACPI/I2C match like below [1].

Why not?

>
> Or
>
> Are we happy with the current one?

I don't mind.

> +const void *i2c_get_match_data(const struct i2c_client *client) {
> +       struct device_driver *drv = client->dev.driver;
> +       struct i2c_driver *driver = to_i2c_driver(drv);
> +       const struct i2c_device_id *match;
> +       const void *data;
> +
> +       data = device_get_match_data(&client->dev);

    if (data)
            return data;

> +       if (!data) {
> +               match = i2c_match_id(driver->id_table, client);
> +               if (!match)
> +                       return NULL;
> +
> +               data = (const void *)match->driver_data;
> +       }
> +
> > +     return data;
> > +}
> > +EXPORT_SYMBOL(i2c_get_match_data);

> > From: Biju Das <biju.das.jz@bp.renesas.com>

> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -114,6 +114,27 @@ const struct i2c_device_id *i2c_match_id(const
> > struct i2c_device_id *id,  }  EXPORT_SYMBOL_GPL(i2c_match_id);
> >
> > +const void *i2c_get_match_data(const struct i2c_client *client) {
> > +     struct device_driver *drv = client->dev.driver;
> > +     struct i2c_driver *driver = to_i2c_driver(drv);
> > +     const struct i2c_device_id *match;
> > +     const void *data;
> > +
> > +     if (client->dev.of_node) {
> > +             data = of_device_get_match_data(&client->dev);

return of_device_get_match_data(&client->dev);

> > +     } else {
> > +             match = i2c_match_id(driver->id_table, client);
> > +             if (!match)
> > +                     return NULL;
> > +
> > +             data = (const void *)match->driver_data;

return ...

> > +     }
> > +
> > +     return data;
> > +}
> > +EXPORT_SYMBOL(i2c_get_match_data);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
