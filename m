Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5BE6302D6
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 00:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233243AbiKRXTV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 18:19:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233705AbiKRXTE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 18:19:04 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6314A97ED3
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 15:04:26 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id z15so3240595ilp.4
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 15:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjpJ7YUQJY6Hgwjbl7LkJRbvBhSrnKhNjJy14nrac+U=;
        b=QXnrZJlmcrDl8ajS1QaMM5U5XhIP9Q2mC7yAVVRUjiB7zK38w1xgLa8ESg7U8Yt9iI
         VYMRDuhem+WVOLHh8pxPOizrn/1gRSc+Mu+mRZGfopx/rwl7xkEEmlfsRlgi06/G/HTn
         nBr1oCqipzTM3V46kR8iekHIl+/GqlU7XrEStitC9Ts4P4bImBFE0EnExTdfKUJl6rOJ
         rKmDCN13WEyYwm/GNI87PSY0zfrRj8LAb5bR0OaMI91uRSY9z4LBSSJnEjvrjyL0Tiah
         JaEXOnsxQepBnFlPZfXlPH5v0tv5HYG89UUMhuhw+U05mMUUaGWWtOZ7sh4KwNrrM0Ab
         NKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WjpJ7YUQJY6Hgwjbl7LkJRbvBhSrnKhNjJy14nrac+U=;
        b=jq3g92jG216g6SqqRE1GD0uWh2UXyI/EiXf0lMltDb5OnMWT4K7WILWjidVL/Z8w2C
         s48hfVPk/xfIX0bZULr6wnBe97SdaGtj+HZEkzvCyk2lwLNIfD7+nPPeeZviOXdGTlbC
         VopFrM9Gi2EOgT6Yi5ugrDqM5P4644Z0ps9Algw6pIWRUNOQjln6TDjVGMBgE4Pxrxju
         lO1ZJDYbwOrAhvDatouHftpKXoE6/RS3kvGnu+UA3qvgWWnxRBc+ARGxwECwmojk83Wc
         n2LPOrMmcqPkSUcvXufVHNkwr+wqp4W+1VQFif+imzbl0dEbMDxQKMkgZzDgDA8bCaSi
         j5bA==
X-Gm-Message-State: ANoB5pkjahmOr0Gm2jDTQkKGewpxhD9m5kiBqW91sA+60Rry80BvGiOK
        JKlCuK7xw9qPQjJvGomOEHGYvMuacmdcEXYToHBFhA4KZz+xqQ==
X-Google-Smtp-Source: AA0mqf6EPSbZL7sdYYo5fUTE7eiO759F6woaqf3tsefxpBjSBXpqMr9uED2zRYnpYuiPHIRrbFgrLXPbp7EOuYIVplc=
X-Received: by 2002:a92:680d:0:b0:302:dc:bb47 with SMTP id d13-20020a92680d000000b0030200dcbb47mr4114938ilc.81.1668812665683;
 Fri, 18 Nov 2022 15:04:25 -0800 (PST)
MIME-Version: 1.0
References: <20221118224540.619276-1-uwe@kleine-koenig.org> <20221118224540.619276-186-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-186-uwe@kleine-koenig.org>
From:   Crt Mori <cmo@melexis.com>
Date:   Sat, 19 Nov 2022 00:03:49 +0100
Message-ID: <CAKv63uupCo5FjXseSQzk3Ngdce8wtppBib5xxLtCypW4izi9Dw@mail.gmail.com>
Subject: Re: [PATCH 185/606] iio: temperature: mlx90614: Convert to i2c's .probe_new()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Acked-by: Crt Mori<cmo@melexis.com>

Crt Mori

Melexis Technologies NV
Transportstraat 1
3980 Tessenderlo

Mobile: +32 492 46 22 15
E-mail: cmo@melexis.com
Website: www.melexis.com

----------------------------------------------------------
The contents of this e-mail are CONFIDENTIAL AND PROPRIETARY. Please
read our disclaimer at http://www.melexis.com/mailpolicy


On Fri, 18 Nov 2022 at 23:46, Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>=
 wrote:
>
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/iio/temperature/mlx90614.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iio/temperature/mlx90614.c b/drivers/iio/temperature=
/mlx90614.c
> index 8eb0f962ed25..909fadb62349 100644
> --- a/drivers/iio/temperature/mlx90614.c
> +++ b/drivers/iio/temperature/mlx90614.c
> @@ -537,9 +537,9 @@ static int mlx90614_probe_num_ir_sensors(struct i2c_c=
lient *client)
>         return (ret & MLX90614_CONFIG_DUAL_MASK) ? 1 : 0;
>  }
>
> -static int mlx90614_probe(struct i2c_client *client,
> -                        const struct i2c_device_id *id)
> +static int mlx90614_probe(struct i2c_client *client)
>  {
> +       const struct i2c_device_id *id =3D i2c_client_get_device_id(clien=
t);
>         struct iio_dev *indio_dev;
>         struct mlx90614_data *data;
>         int ret;
> @@ -675,7 +675,7 @@ static struct i2c_driver mlx90614_driver =3D {
>                 .of_match_table =3D mlx90614_of_match,
>                 .pm     =3D pm_ptr(&mlx90614_pm_ops),
>         },
> -       .probe =3D mlx90614_probe,
> +       .probe_new =3D mlx90614_probe,
>         .remove =3D mlx90614_remove,
>         .id_table =3D mlx90614_id,
>  };
> --
> 2.38.1
>
