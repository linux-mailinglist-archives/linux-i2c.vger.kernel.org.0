Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14BB07188AD
	for <lists+linux-i2c@lfdr.de>; Wed, 31 May 2023 19:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbjEaRmy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 May 2023 13:42:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjEaRmx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 May 2023 13:42:53 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D9811D;
        Wed, 31 May 2023 10:42:52 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6261367d2f1so88006d6.3;
        Wed, 31 May 2023 10:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685554972; x=1688146972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3pm500vXOc/RVSNbRJPtEDoR0bC3zLx8XjEklhpJIM=;
        b=GvKFXHiiI0VML1xozWOFbLjSZHBTIkt+pQbZljLn8juUa9lfym1T4iHj1TH1BleVt8
         9wSEREc1Tf478uu/UiVQI99ingpNqIMoXL09Unk+NWSYEVQ/KGMMi8k7OseLGXJdZXl6
         TKlXs5Es7Ko1KQIBucXz25iiA4u9tAIaovGNaACEKWZd9ujPa+I2Mp6DN4JvbZc9nOSX
         mZtImByLUqZC/rC5TAwXWOA+D/bSu9ulDrR0GWHMOOEE7KxDmaCGYvk6DAQ+ue3PSI+w
         p3NzUhHUsGWJf7u7AUQRm9wrMjgaCfenRLLjvLRz+PqBpwKsW2PyU0jjIubvQyeY8ccx
         xyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685554972; x=1688146972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3pm500vXOc/RVSNbRJPtEDoR0bC3zLx8XjEklhpJIM=;
        b=OaW/Jyfb9oMRI4eFr7BuObqbSMUK4Hg4B36jyyt96X4BQlbum2/gYCnWGSQAs3TDhZ
         AVIvQ7x7k+GLibtFGe0EDsVcdYbUQGAvEw6YbiwcKbBMq0iLiEzu6mQfh/9bDbNCHxGc
         2xR2zgbFJhdoj6PVTJgaWI90HVuGLqMBEl9CfLw2GuN99lsuFFptUFnUWTBEcIOXP7z6
         09sk0vguzmN3YkyYMo/psm5OE8wd4nwOzquBkhgMSHvXnScULxyyZ3nZC9SlLy/U+B62
         zjPwyWibOHE2ccd02XZS6yrRS2TkNqRwuSvKG5JdD6r9IjdOIhHKTAHJmgrKN42NtS3R
         fQ5Q==
X-Gm-Message-State: AC+VfDx8xF1xuFWwjidEXx8WKCXpRCPTUh1tHkZzy9zHaq2crB3+1+52
        u6g6Rz8T4710wAIiY535nKUcpIqVldDGa9MzwQw=
X-Google-Smtp-Source: ACHHUZ6hjHVilVHtAFbvEfNmRWFevxD9R0sP6qLPjKXupnqVNaSJO1qVmd/UsvT8uYZM18Zl+xDT2Q3Sg3X2UF4sHzU=
X-Received: by 2002:a05:6214:c61:b0:625:aa48:fb6c with SMTP id
 t1-20020a0562140c6100b00625aa48fb6cmr5384849qvj.54.1685554971911; Wed, 31 May
 2023 10:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230531100600.13543-1-Jonathan.Cameron@huawei.com> <20230531100600.13543-5-Jonathan.Cameron@huawei.com>
In-Reply-To: <20230531100600.13543-5-Jonathan.Cameron@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 May 2023 20:42:15 +0300
Message-ID: <CAHp75Ve2mpPPoRG6SQ3nT1uE-y35+-sMDMPQSu97i9_5SDCYZQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/7] i2c: aspeed: use a function pointer type def
 for clk_reg_val callback
To:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Niyas Sait <niyas.sait@linaro.org>,
        Klaus Jensen <its@irrelevant.dk>,
        Andy Shevchenko <andy@kernel.org>, linux-acpi@vger.kernel.org,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        Matt Johnston <matt@codeconstruct.com.au>,
        Shesha Bhushan Sreenivasamurthy <sheshas@marvell.com>,
        linux-cxl@vger.kernel.org, linuxarm@huawei.com,
        "Viacheslav A . Dubeyko" <viacheslav.dubeyko@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 31, 2023 at 1:08=E2=80=AFPM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> Rather than having to define the parameter types of this function
> in multiple places, use a single typedef.

Suggested-by then?

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> ---
> v3: New patch to switch to a function pointer as suggested by Andy.
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-asp=
eed.c
> index 4363bfe06f9b..be93de56f7e4 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -137,6 +137,8 @@ enum aspeed_i2c_slave_state {
>         ASPEED_I2C_SLAVE_STOP,
>  };
>
> +typedef u32 (*aspeed_get_clk_reg_val_cb)(struct device *dev, u32 divisor=
);
> +
>  struct aspeed_i2c_bus {
>         struct i2c_adapter              adap;
>         struct device                   *dev;
> @@ -145,8 +147,7 @@ struct aspeed_i2c_bus {
>         /* Synchronizes I/O mem access to base. */
>         spinlock_t                      lock;
>         struct completion               cmd_complete;
> -       u32                             (*get_clk_reg_val)(struct device =
*dev,
> -                                                          u32 divisor);
> +       aspeed_get_clk_reg_val_cb       get_clk_reg_val;
>         unsigned long                   parent_clk_frequency;
>         u32                             bus_frequency;
>         /* Transaction state. */
> @@ -1011,8 +1012,7 @@ static int aspeed_i2c_probe_bus(struct platform_dev=
ice *pdev)
>         if (!match)
>                 bus->get_clk_reg_val =3D aspeed_i2c_24xx_get_clk_reg_val;
>         else
> -               bus->get_clk_reg_val =3D (u32 (*)(struct device *, u32))
> -                               match->data;
> +               bus->get_clk_reg_val =3D (aspeed_get_clk_reg_val_cb)(matc=
h->data);
>
>         /* Initialize the I2C adapter */
>         spin_lock_init(&bus->lock);
> --
> 2.39.2
>


--=20
With Best Regards,
Andy Shevchenko
