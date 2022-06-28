Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7260255EDA2
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jun 2022 21:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235003AbiF1TJy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jun 2022 15:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236068AbiF1TJu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jun 2022 15:09:50 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AACCC192B2;
        Tue, 28 Jun 2022 12:09:49 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-3176b6ed923so126830847b3.11;
        Tue, 28 Jun 2022 12:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Df+MKXJfNDPG+S9kvWPeYAx6XZpxE7WPz2ahAfIBELQ=;
        b=pm/CU9ccX46GwxUJNxGvRTMDaiONUskg50NFy9k6irBkgRKofkyc6ddePCEDw3hp/D
         YUNclZZG1b0PGUW5ktGHPaluX0gZX3ouDXNnNk17kL7G9DAJaSoKAE/u5aieZ99bpoat
         o9MZCnagpwdR6CJEt+GXTI0/iMSRU7hTqCYCVv0yIB2PkugqcBkmMzdxudzbuXuleZN6
         zyrL31ToCzBXN99LUZqT79PzJOD0+mmhhryKp75gePf38PodiDcoDenGzGyEHCes/zRE
         unNmXiH32sp9QN/g8JaseaG9ef4D+J5vrxXfUthTp7fX8PJw7NwQKNJHjCe9sARr5gg5
         tZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Df+MKXJfNDPG+S9kvWPeYAx6XZpxE7WPz2ahAfIBELQ=;
        b=dEv6zL8U8soL0h0frb3laR38/AMwYPwmJs/jY9A6DRYtIL9zsPxYa2Pml2bghueYCD
         zJ6bCyVdHiynHbwNAFKn+D3K6kHiJlvRVKyaJ+lYsFwgWqk1eQ/ffTWwhyxvLPMCnS31
         DXfvTkxvs5QFdbySms6o68Dw1eqo+kHhgi2vFg0L55lBaKg+/lPX04/hKYqN9oWsKnFD
         MExcjY3w/rjE9/j/WQCTw7B5dhsLNE6hqC+OmvU0qKVs/UdxLg44jx59yxCmC6PuX7GV
         rQ5yHJBOXnW91xtgDvybBpqWh+nmrHvV4LPbQwsYrnYBIbjkg9bPTOO5aC92tR5bP5Xi
         NleQ==
X-Gm-Message-State: AJIora+yT87CmGKj4Xsd1aa8PzYIqvP6RPqyouQtYbMNPejavcoaazFd
        Dha1ZHKN4ViJXNwnqRzWy6tIiZBhmrxUPdoFepo=
X-Google-Smtp-Source: AGRyM1vUp1dBPu4iDpJJOmQhrlwsWm72LE+ItI0NXjClMBY6C43R8UMBqnE261JrKVtOs4rDzv0NkQvPJIUx7WwNpR8=
X-Received: by 2002:a81:5d88:0:b0:318:31c1:56f3 with SMTP id
 r130-20020a815d88000000b0031831c156f3mr23363889ywb.18.1656443388713; Tue, 28
 Jun 2022 12:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de> <20220628140313.74984-6-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220628140313.74984-6-u.kleine-koenig@pengutronix.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 28 Jun 2022 21:09:09 +0200
Message-ID: <CAHp75VeqAxPjL9vhY9nL5U0Np=+Ysq2E-fQEdgUgrd-_6jcHVQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: pca953x: Make platform teardown callback return void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        linux-i2c <linux-i2c@vger.kernel.org>
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

On Tue, Jun 28, 2022 at 4:04 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> All platforms that provide a teardown callback return 0. New users are
> supposed to not make use of platform support, so there is no
> functionality lost.
>
> This patch is a preparation for making i2c remove callbacks return void.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> Forwarded: id:20220502170555.51183-1-u.kleine-koenig@pengutronix.de

What is this tag for? Has it been documented?

(Linus recently was ranting against homegrown custom (read:
non-documented) tags)

For now the code looks good,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

However, I prefer to see dropping those callbacks altogether (find the
way how to use GPIO descriptors / GPIO table / etc instead of ugly
custom callbacks).

> ---
>  arch/arm/mach-davinci/board-da850-evm.c | 12 ++++--------
>  drivers/gpio/gpio-pca953x.c             | 11 +++--------
>  include/linux/platform_data/pca953x.h   |  2 +-
>  3 files changed, 8 insertions(+), 17 deletions(-)
>
> diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davi=
nci/board-da850-evm.c
> index efc26b472ef8..09253e70d0dc 100644
> --- a/arch/arm/mach-davinci/board-da850-evm.c
> +++ b/arch/arm/mach-davinci/board-da850-evm.c
> @@ -518,8 +518,8 @@ static int da850_evm_ui_expander_setup(struct i2c_cli=
ent *client, unsigned gpio,
>         return ret;
>  }
>
> -static int da850_evm_ui_expander_teardown(struct i2c_client *client,
> -                                       unsigned gpio, unsigned ngpio, vo=
id *c)
> +static void da850_evm_ui_expander_teardown(struct i2c_client *client,
> +                                          unsigned gpio, unsigned ngpio,=
 void *c)
>  {
>         platform_device_unregister(&da850_evm_ui_keys_device);
>
> @@ -531,8 +531,6 @@ static int da850_evm_ui_expander_teardown(struct i2c_=
client *client,
>         gpio_free(gpio + DA850_EVM_UI_EXP_SEL_C);
>         gpio_free(gpio + DA850_EVM_UI_EXP_SEL_B);
>         gpio_free(gpio + DA850_EVM_UI_EXP_SEL_A);
> -
> -       return 0;
>  }
>
>  /* assign the baseboard expander's GPIOs after the UI board's */
> @@ -699,13 +697,11 @@ static int da850_evm_bb_expander_setup(struct i2c_c=
lient *client,
>         return ret;
>  }
>
> -static int da850_evm_bb_expander_teardown(struct i2c_client *client,
> -                                       unsigned gpio, unsigned ngpio, vo=
id *c)
> +static void da850_evm_bb_expander_teardown(struct i2c_client *client,
> +                                          unsigned gpio, unsigned ngpio,=
 void *c)
>  {
>         platform_device_unregister(&da850_evm_bb_leds_device);
>         platform_device_unregister(&da850_evm_bb_keys_device);
> -
> -       return 0;
>  }
>
>  static struct pca953x_platform_data da850_evm_ui_expander_info =3D {
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 08bc52c3cdcb..3eedeac9ec8d 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -1099,20 +1099,15 @@ static int pca953x_remove(struct i2c_client *clie=
nt)
>  {
>         struct pca953x_platform_data *pdata =3D dev_get_platdata(&client-=
>dev);
>         struct pca953x_chip *chip =3D i2c_get_clientdata(client);
> -       int ret;
>
>         if (pdata && pdata->teardown) {
> -               ret =3D pdata->teardown(client, chip->gpio_chip.base,
> -                                     chip->gpio_chip.ngpio, pdata->conte=
xt);
> -               if (ret < 0)
> -                       dev_err(&client->dev, "teardown failed, %d\n", re=
t);
> -       } else {
> -               ret =3D 0;
> +               pdata->teardown(client, chip->gpio_chip.base,
> +                               chip->gpio_chip.ngpio, pdata->context);
>         }
>
>         regulator_disable(chip->regulator);
>
> -       return ret;
> +       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/include/linux/platform_data/pca953x.h b/include/linux/platfo=
rm_data/pca953x.h
> index 4eb53e023997..96c1a14ab365 100644
> --- a/include/linux/platform_data/pca953x.h
> +++ b/include/linux/platform_data/pca953x.h
> @@ -22,7 +22,7 @@ struct pca953x_platform_data {
>         int             (*setup)(struct i2c_client *client,
>                                 unsigned gpio, unsigned ngpio,
>                                 void *context);
> -       int             (*teardown)(struct i2c_client *client,
> +       void            (*teardown)(struct i2c_client *client,
>                                 unsigned gpio, unsigned ngpio,
>                                 void *context);
>         const char      *const *names;
> --
> 2.36.1
>


--=20
With Best Regards,
Andy Shevchenko
