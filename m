Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A21B76FEE48
	for <lists+linux-i2c@lfdr.de>; Thu, 11 May 2023 11:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236989AbjEKJDV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 May 2023 05:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236425AbjEKJDP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 May 2023 05:03:15 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB8A99
        for <linux-i2c@vger.kernel.org>; Thu, 11 May 2023 02:03:14 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-77d049b9040so40134571241.1
        for <linux-i2c@vger.kernel.org>; Thu, 11 May 2023 02:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1683795793; x=1686387793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iq1NHQKcB3uR3ipd+tlwSQnKr1lUqJw/xVONwinDQIo=;
        b=k+IDM5JY+7ITpBiB0BpdVGDcdhYbvFwyyXgZS1o25pd371MbihkxDKEOWiYC6hRzma
         CFh35byoV+vf6J+m153qrwJnavK9DzdyVDJTeD+w+fLTIwIneo/wq3J7q+Wu4NvIry6u
         p8I8WYz16xZXO1XvxyE3P24sf2qE4br+iLkbh6U8DFelsZy4vc20KFDbFXKQ5AXTPrvJ
         ztgcG9AHB2eK78cwqftx61w0J+9abCmzm5OqxjqaJolFPaeUeZQh5f5TdhAeQKudF7xm
         9/5oDhTqYIPAm5gf3OCjGNKzqT9tQNAGhZk+EdA4ikGn2Yv8RyKIHO2vO2Xr1X03gv2F
         VNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683795793; x=1686387793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iq1NHQKcB3uR3ipd+tlwSQnKr1lUqJw/xVONwinDQIo=;
        b=FJp4ILOXcuHV5+qwweih3EGYnhFJquOHLIX9XQIkZuOPNTe6dBPcjT7+NUgU6owL9K
         WGU7eSTmI8qQv3NXhn4R0UymhfoFAAbQ7+Sl+7TlFy23VjuaE93XwR9bYinEwGUlNC24
         Q0KIpqBQowfdJmw6sVM17WxzKXlQS6gtJrV+crtW1Hn+xrgd1P5GyoTci126SH154NCf
         XO+1UgyBICCafXKII+j36LrAT6Dg7uRjxNYI0Clmn2cVon/B0kFiR/0wH/RFmBnJzYBq
         cYGxdwIcXHklfBdINk3m0ltq9L85JhRTRNfgQMhXn7L4WntsAj97TG9oOdcFxuIzWwKv
         9DMg==
X-Gm-Message-State: AC+VfDxSucAxCZ6eXESNaQDkliC1Jr43cixWmwGcyKx8BmtuXdymV17o
        vYDNgmkMSS5rzTeKoYMv1ANLHlKmaz2nHLjDg4xzeF8H8Pmfxv96QPo=
X-Google-Smtp-Source: ACHHUZ5iTTYp/m6BGSuppZvYK8HkgiIfZ82QZkPVDALsUyn1flDRR+S1vNEH07mnQTIzXOA3A38vdGB9l4teCxzZSLk=
X-Received: by 2002:a05:6102:913:b0:434:847e:e57b with SMTP id
 x19-20020a056102091300b00434847ee57bmr5064298vsh.10.1683795793190; Thu, 11
 May 2023 02:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de> <20230508205306.1474415-18-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508205306.1474415-18-u.kleine-koenig@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 11 May 2023 11:03:02 +0200
Message-ID: <CAMRc=McVmwJ8rB=-O1HFwG2OGAy3DvDsy1k8UVtbmV=DB=yYqw@mail.gmail.com>
Subject: Re: [PATCH 17/89] i2c: davinci: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wolfram Sang <wsa@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
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

On Mon, May 8, 2023 at 10:53=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/i2c/busses/i2c-davinci.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-da=
vinci.c
> index 7ba7e6cbcc97..b77f9288c0de 100644
> --- a/drivers/i2c/busses/i2c-davinci.c
> +++ b/drivers/i2c/busses/i2c-davinci.c
> @@ -885,7 +885,7 @@ static int davinci_i2c_probe(struct platform_device *=
pdev)
>         return r;
>  }
>
> -static int davinci_i2c_remove(struct platform_device *pdev)
> +static void davinci_i2c_remove(struct platform_device *pdev)
>  {
>         struct davinci_i2c_dev *dev =3D platform_get_drvdata(pdev);
>         int ret;
> @@ -903,8 +903,6 @@ static int davinci_i2c_remove(struct platform_device =
*pdev)
>         pm_runtime_dont_use_autosuspend(dev->dev);
>         pm_runtime_put_sync(dev->dev);
>         pm_runtime_disable(dev->dev);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM
> @@ -945,7 +943,7 @@ MODULE_ALIAS("platform:i2c_davinci");
>
>  static struct platform_driver davinci_i2c_driver =3D {
>         .probe          =3D davinci_i2c_probe,
> -       .remove         =3D davinci_i2c_remove,
> +       .remove_new     =3D davinci_i2c_remove,
>         .driver         =3D {
>                 .name   =3D "i2c_davinci",
>                 .pm     =3D davinci_i2c_pm_ops,
> --
> 2.39.2
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
