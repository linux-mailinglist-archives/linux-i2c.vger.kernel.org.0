Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7052A59309C
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Aug 2022 16:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232757AbiHOOVg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Aug 2022 10:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231349AbiHOOVf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Aug 2022 10:21:35 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80C4C11454
        for <linux-i2c@vger.kernel.org>; Mon, 15 Aug 2022 07:21:34 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id t5so9750046edc.11
        for <linux-i2c@vger.kernel.org>; Mon, 15 Aug 2022 07:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=R2g90LsSWo7YgMpEt3fCZ83lcU9+V9bUyL4qSaMfOPs=;
        b=VYX0CZL1qpUVWM3ibL1ZsypvPZcTDJ0I0wh6ZBVOQCRqb3dbjrdbNfxTicO+g9AyVC
         8lJwdXhpvBaDWixMPQUZFVst4OKNAKWzyh7qe4uJngrmBPcXmGyANaci8qUts7HEAF/D
         odtIghutjILt23aKT0bnCjMqylG4nB5q6BPUCRaGdrNHZVjsBrrE/4XkRjnBiwVW1yd+
         EzUQ0rU98+j4GKIrMryAMYfWjbmFPGLiEsUSq0PfieoOmAXBuNuzbAr5GuJj7Wocwmpm
         HBxyiA3vpYM0ubzFFbiHkb4OaA5rLwuGGJYmmmeaoTigj3Kcvy7/EKZRWxxaZSzBw1wB
         Qf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=R2g90LsSWo7YgMpEt3fCZ83lcU9+V9bUyL4qSaMfOPs=;
        b=6uBe3L1ht4NN47ve1UB/OLEso8aSYNxxvxRIpQmHDGzwq0M+ixJtvQyti6N23z7mNl
         Q/Vy5a4lnkgicWUqgEnbB1eDzVH8Q9qSbGaAi+uuCG1QJn8m46cMvP4twi76bhvuld3Z
         pCSqgBvw/+GKdKeG4VuRVrc4PmItoNxclTlfn8vmAYsWyxwgOd0TAPDRs/lYjlSFMKIY
         ysukdJcxRXL1r57VQyLMss0jnnKRS9WZ3tmKgluaLZBXCcVN0L3MPNockpAHU6VSih4h
         nJMo+bUidU9YIVbnWUras+UYVLnu5RvEkygYRjgJvXs+PLJgrEh0fao8TEc3j+A121LM
         qHSA==
X-Gm-Message-State: ACgBeo3Z6/yo81bMjFdoJV1YVIPwtMFwrGgEeqjJpn0PFJhHXypVXHdj
        ynYSffqBxMWA11gBf6NBiAHTd6Yegar2f+LFMyjINw==
X-Google-Smtp-Source: AA6agR43GNnbHcL80+Dq7X+1mds0wLjwcVofIT5dK6WWwPURGArjUyaXvNcRyyJYLuxcg8g9F4CFLlyiq/ECBhr+xvY=
X-Received: by 2002:a05:6402:4301:b0:43e:4d31:6ec0 with SMTP id
 m1-20020a056402430100b0043e4d316ec0mr15149339edc.69.1660573293034; Mon, 15
 Aug 2022 07:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220815080230.37408-1-u.kleine-koenig@pengutronix.de> <20220815080230.37408-6-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220815080230.37408-6-u.kleine-koenig@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 15 Aug 2022 16:21:22 +0200
Message-ID: <CAMRc=McHM-1p8LxNeYqiHsd+5xg_99C9dT95t0biHc4RswU5Dw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] gpio: pca953x: Make platform teardown callback
 return void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wolfram Sang <wsa@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Sekhar Nori <nsekhar@ti.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 15, 2022 at 10:02 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> All platforms that provide a teardown callback return 0. New users are
> supposed to not make use of platform support, so there is no
> functionality lost.
>
> This patch is a preparation for making i2c remove callbacks return void.
>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  arch/arm/mach-davinci/board-da850-evm.c | 12 ++++--------
>  drivers/gpio/gpio-pca953x.c             | 11 +++--------
>  include/linux/platform_data/pca953x.h   |  2 +-
>  3 files changed, 8 insertions(+), 17 deletions(-)
>
> diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davi=
nci/board-da850-evm.c
> index 92d74bc71967..d752ee2b30ff 100644
> --- a/arch/arm/mach-davinci/board-da850-evm.c
> +++ b/arch/arm/mach-davinci/board-da850-evm.c
> @@ -516,8 +516,8 @@ static int da850_evm_ui_expander_setup(struct i2c_cli=
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
> @@ -529,8 +529,6 @@ static int da850_evm_ui_expander_teardown(struct i2c_=
client *client,
>         gpio_free(gpio + DA850_EVM_UI_EXP_SEL_C);
>         gpio_free(gpio + DA850_EVM_UI_EXP_SEL_B);
>         gpio_free(gpio + DA850_EVM_UI_EXP_SEL_A);
> -
> -       return 0;
>  }
>
>  /* assign the baseboard expander's GPIOs after the UI board's */
> @@ -697,13 +695,11 @@ static int da850_evm_bb_expander_setup(struct i2c_c=
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
> index ecd7d169470b..1860e566eb94 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -1105,20 +1105,15 @@ static int pca953x_remove(struct i2c_client *clie=
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

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
