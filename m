Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B70D263582A
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Nov 2022 10:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238249AbiKWJv1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Nov 2022 04:51:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235796AbiKWJuq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Nov 2022 04:50:46 -0500
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88AE315719
        for <linux-i2c@vger.kernel.org>; Wed, 23 Nov 2022 01:47:58 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id v128so2385733vsb.13
        for <linux-i2c@vger.kernel.org>; Wed, 23 Nov 2022 01:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JJaR5hJvuf5++j5Vl6eoqqI4BspUUmDXkurZukMxZs=;
        b=xr3ds3O1aP0Cly4A/ysEuxHmVnLvc4eu3PKCZhMWRC/dATnKt6om+vu7ICyQzJJXSI
         OTsl5/BZ34hGUSpmBWGM/P7E6khc954CTJm3tf176irhtTg04zwszZnTfB+iRCK8kef2
         9arPJeHjDlVs9gZSBvERiRp/84pe7iyQAFgOoi4JMsYzh05AZ39TwfUSOyjkqSOAGH61
         EJYN5SG+hFvW0FiBWryiqDHaE+umKTMdQea4Ozb1wKFZCnJ75SOBuQEvjA0eTY13hITr
         p7Gg3tcgdDk5MkdKmiBCsI1MCiDPMAziWHOlPa6mRMBO6qdkYPuyKMY8T5zrZNmuSMg5
         Krgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5JJaR5hJvuf5++j5Vl6eoqqI4BspUUmDXkurZukMxZs=;
        b=vjrCl1iaETqMhaLNR573h1e3IEd0xZHjDgh9cZg7HjJ38yncwILJbzFKmeX6RwhBPx
         yAPRVitNExpYtVMmGYkq+MthXl4JwnFEkectmkm9g1YXDI9+271GzKkqpZid0l3mAa2l
         fCkAy5Eei9Yvqdi7tvGzQkfDCdg6elalBwfQDgq3JNbgeo4bHN4nQAN/N8FQHJBLb8lG
         9XH5DfUZKKPr8THHJ/Mmqw3npnr2iATozGSTYIDZscleKEvZZf0DoVm68oshYdgx7MY1
         wIxXvYVRFMGvL9RTyollCdx4baYdoTuOUB41GKxMMikGeP8tVKQwL7MmiIHvPclXvj4C
         sc8Q==
X-Gm-Message-State: ANoB5pmBYLz+T2jpiEZzqtY5VVt/ojRizWVvs7KDAAEEkr1ynrwMvZh4
        3D4wS81cbguQMCZfJ1B/yy3YS5nP/AUwp7fsONhWXA==
X-Google-Smtp-Source: AA0mqf5015brl+4dkPOsvMU6fDCs5ePpm/2PWrYsJ3/czU+9mnWwri4bgOsPFCCNqPICVl/iwJDAGCKE7acVHAduazA=
X-Received: by 2002:a05:6102:829:b0:3b0:6449:baba with SMTP id
 k9-20020a056102082900b003b06449babamr3543541vsb.61.1669196877951; Wed, 23 Nov
 2022 01:47:57 -0800 (PST)
MIME-Version: 1.0
References: <20221118224540.619276-1-uwe@kleine-koenig.org> <20221118224540.619276-12-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-12-uwe@kleine-koenig.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 23 Nov 2022 10:47:47 +0100
Message-ID: <CAMRc=Mfjcs-BBFhr8O1O956f4jdvAzY9ofZs1fme8+Ki=T60JA@mail.gmail.com>
Subject: Re: [PATCH 011/606] gpio: max732x: Convert to i2c's .probe_new()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:46 PM Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.o=
rg> wrote:
>
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpio/gpio-max732x.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
> index da6972117030..68e982cdee73 100644
> --- a/drivers/gpio/gpio-max732x.c
> +++ b/drivers/gpio/gpio-max732x.c
> @@ -608,9 +608,9 @@ static struct max732x_platform_data *of_gpio_max732x(=
struct device *dev)
>         return pdata;
>  }
>
> -static int max732x_probe(struct i2c_client *client,
> -                                  const struct i2c_device_id *id)
> +static int max732x_probe(struct i2c_client *client)
>  {
> +       const struct i2c_device_id *id =3D i2c_client_get_device_id(clien=
t);
>         struct max732x_platform_data *pdata;
>         struct device_node *node;
>         struct max732x_chip *chip;
> @@ -707,7 +707,7 @@ static struct i2c_driver max732x_driver =3D {
>                 .name           =3D "max732x",
>                 .of_match_table =3D of_match_ptr(max732x_of_table),
>         },
> -       .probe          =3D max732x_probe,
> +       .probe_new      =3D max732x_probe,
>         .id_table       =3D max732x_id,
>  };
>
> --
> 2.38.1
>

Applied, thanks!

Bartosz
