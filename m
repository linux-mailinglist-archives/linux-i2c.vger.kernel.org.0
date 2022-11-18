Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 813706302DB
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 00:19:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235451AbiKRXTm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 18:19:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235260AbiKRXTM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 18:19:12 -0500
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5A5EA658D
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 15:05:17 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id z15so3241311ilp.4
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 15:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcv0U9RA+vDA9upkxZULEoF7+i0Z2qrHrSP2q1DX1uI=;
        b=LuEDXjvc1rXUwB/TcXOpzaSlq39VeCfivycJtdw1qlQ+WAFGXHsF0nzPH1DRR7PNAX
         +STQXR06f0MswwMsEKbhOUfS/GECgPZsaFICtRi+Jihm/UoOiUiPnxyemNh+7mhEilXE
         +/9SzqQwsDbWKFp9EDtm/y1RRS++r8Cr9E2N4GzJ7lmu48xb62ERPDuOkM84K5kB+KjF
         o4OfMtgLTcyAMJFNrRmHqp+VbYGOAUXU/GctRZPY/HJcroOqp/LRMSDCIji91f6NLCnW
         dFWHAKBDtq9tii/Pto4ONi/ngPZigKxcUAjUKSzeO1/ICXqE9CT2f7dvbQNue1NT9UZ3
         k9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hcv0U9RA+vDA9upkxZULEoF7+i0Z2qrHrSP2q1DX1uI=;
        b=iGIAmg7c8sZgOYL5uX0grjhVD3/IPmlvcGhvaTHzOjoR2OntGRjpRefqzWKT2EILis
         QnSsl19+Ge6VsYviK2ccRoyuWoP9nozSvCLoK6n5mZq5m5t42K9CKLWkQwxB5APf/d+T
         epcbyJEXu3gEtAtTcugpRJDc7oexcJFWSwXj70hVbynFjwFVGBygi2zsneCGD7rr0Tj3
         YNhJwnx2QaF0ZL1KHl82OwtOMWfz0GwVKJskwv6hsw/OGwdHobynUMS8RZIASYdmwkiE
         ilIEMInV3wZbYBVx1EOAekDWx4AocC+K5cAyiOb0yB/jo/8dw8ilE9FEyXDVKXcUx7CB
         SWMg==
X-Gm-Message-State: ANoB5pnJso9oR70s76CAbHa9xm+9PPb4u+lhR7tUNP24uWcp/88KPLFC
        QmfhHmXI+wRDepnW0gFIsE3VScUGCP6kQXlcyXUvPw==
X-Google-Smtp-Source: AA0mqf6TXGmJtrR7jE/2JWQrw8ENhk/Vqgy9Fu67/k4HDhw2vCGjMC52XYvwjVEIYLddVV45ejM4juQqtL1ETmoYzeA=
X-Received: by 2002:a92:d7c3:0:b0:300:e7a1:1404 with SMTP id
 g3-20020a92d7c3000000b00300e7a11404mr4147037ilq.281.1668812717232; Fri, 18
 Nov 2022 15:05:17 -0800 (PST)
MIME-Version: 1.0
References: <20221118224540.619276-1-uwe@kleine-koenig.org> <20221118224540.619276-187-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-187-uwe@kleine-koenig.org>
From:   Crt Mori <cmo@melexis.com>
Date:   Sat, 19 Nov 2022 00:04:41 +0100
Message-ID: <CAKv63uvVsLhbt9y0fWxPWp005rnWzCn6Vm0UmOnW08B87fkCzw@mail.gmail.com>
Subject: Re: [PATCH 186/606] iio: temperature: mlx90632: Convert to i2c's .probe_new()
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
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

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
>  drivers/iio/temperature/mlx90632.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/iio/temperature/mlx90632.c b/drivers/iio/temperature=
/mlx90632.c
> index f1f5ebc145b1..19e30cfca8a7 100644
> --- a/drivers/iio/temperature/mlx90632.c
> +++ b/drivers/iio/temperature/mlx90632.c
> @@ -1168,9 +1168,9 @@ static int mlx90632_enable_regulator(struct mlx9063=
2_data *data)
>         return ret;
>  }
>
> -static int mlx90632_probe(struct i2c_client *client,
> -                         const struct i2c_device_id *id)
> +static int mlx90632_probe(struct i2c_client *client)
>  {
> +       const struct i2c_device_id *id =3D i2c_client_get_device_id(clien=
t);
>         struct mlx90632_data *mlx90632;
>         struct iio_dev *indio_dev;
>         struct regmap *regmap;
> @@ -1337,7 +1337,15 @@ static struct i2c_driver mlx90632_driver =3D {
>                 .of_match_table =3D mlx90632_of_match,
>                 .pm     =3D pm_ptr(&mlx90632_pm_ops),
>         },
> +<<<<<<< ours

Maybe some of the merge artifacts left (also below)?

>         .probe =3D mlx90632_probe,
> +||||||| base
> +       .probe =3D mlx90632_probe,
> +       .remove =3D mlx90632_remove,
> +=3D=3D=3D=3D=3D=3D=3D
> +       .probe_new =3D mlx90632_probe,
> +       .remove =3D mlx90632_remove,
> +>>>>>>> theirs
>         .id_table =3D mlx90632_id,
>  };
>  module_i2c_driver(mlx90632_driver);
> --
> 2.38.1
>
