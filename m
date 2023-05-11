Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D74576FEE44
	for <lists+linux-i2c@lfdr.de>; Thu, 11 May 2023 11:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236865AbjEKJCz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 May 2023 05:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236972AbjEKJCo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 May 2023 05:02:44 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902A24EF6
        for <linux-i2c@vger.kernel.org>; Thu, 11 May 2023 02:02:41 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-44fa6454576so2963919e0c.0
        for <linux-i2c@vger.kernel.org>; Thu, 11 May 2023 02:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1683795760; x=1686387760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsxggKVSQYJV/3IOolh6kyceDYKKgVTx3tgZGL0LmQE=;
        b=ZsN0Y6hoM3XjgwWBTARPluf0i+hzHwUsB3gHFLnCxgC7Xe8gdu/MA/EKASRLaA4UzV
         dGEKYGALkh/JqBOsdJ8QZexa5spx4GLWnmttuanVUUGwRCEQU13M3gA34l0cogT8/9xv
         vG1QP6ll8u0xvZHb/H8gBJx/2dttEtEXL23op4JrF7X751N+TjetsMNIN/82cQ34Y3NG
         InBJG0OSpJNKckYB2tTpdCw/0EXAf5vu2uB3iOjZgqxjJs9X6UU7Mvxqi28Scy1qfXus
         XIGqCA3ipYIE8KAuPYfL9ZlaeYVME6bJW6UxyvMzlv6rUCc7uUt3HTnCT9PCzfvgMZWh
         y6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683795760; x=1686387760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tsxggKVSQYJV/3IOolh6kyceDYKKgVTx3tgZGL0LmQE=;
        b=doi9UsK54ICLZ3LAx6J2xBIr7AbIklW8MdASo+N2Wuw6yiAC+frPshEC7sSCSnd6UK
         V6KhvZ+qU5Zpa3mz1lylR8/WNoWIGllDHu+5BvrJMg5xmiwOEn3Bk5RQT3RBsff3VBR3
         /FjKERSccVCvMP0msYORg7XfmouiveffR69olcsgq/fE0ww4QcxUxoKHmms6O/QgOOtN
         iLndZu0/q5N+VkoOdozKiPY7mGnRZ0SRIk3nQ2pj3pqP7P3XYGcrzixqSPc4+XPIQUms
         eyCQVcFKQrQMmaYJ5Ukw8gZd/2MTFUVFIdMJBHKobculT7XvypS4HAMfl+lEBhGh9SZz
         UcyQ==
X-Gm-Message-State: AC+VfDxldEMQnuoICEtbCV/z+sYzQt4oY83t4V+D+rOctm3kV1LAt1WG
        2JX8UYYC9lhB9XVpRXAZaULC56NAozSN1C8PEkaPsw==
X-Google-Smtp-Source: ACHHUZ4N5hue/VQ/qj/gki0/EwbNu6FtTeY1U+w+xBRgF4xTg6eqgXEA06a6cwGxWLumu3QD0cavCiyZaqt0uVik9Ko=
X-Received: by 2002:a67:f699:0:b0:434:6b27:2705 with SMTP id
 n25-20020a67f699000000b004346b272705mr7193591vso.0.1683795760691; Thu, 11 May
 2023 02:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de> <20230508205306.1474415-17-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508205306.1474415-17-u.kleine-koenig@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 11 May 2023 11:02:29 +0200
Message-ID: <CAMRc=Mdad12vdj96P+Kj3Ac21K0gQmWmn_dBcvXrPxwrCv_eTg@mail.gmail.com>
Subject: Re: [PATCH 16/89] i2c: davinci: Improve error reporting for problems
 during .remove()
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
> If pm_runtime_get() fails in .remove() the driver used to return the
> error to the driver core. The only effect of this (compared to returning
> zero) is a generic warning that the error value is ignored. (The device
> is unbound then anyhow.)
>
> Emit a better warning and return zero to suppress the generic (and
> little helpful) message. Also disable runtime PM in the error case.
>
> This prepares changing platform device remove callbacks to return void.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/i2c/busses/i2c-davinci.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-da=
vinci.c
> index 9750310f2c96..7ba7e6cbcc97 100644
> --- a/drivers/i2c/busses/i2c-davinci.c
> +++ b/drivers/i2c/busses/i2c-davinci.c
> @@ -894,11 +894,11 @@ static int davinci_i2c_remove(struct platform_devic=
e *pdev)
>
>         i2c_del_adapter(&dev->adapter);
>
> -       ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +       ret =3D pm_runtime_get_sync(&pdev->dev);
>         if (ret < 0)
> -               return ret;
> -
> -       davinci_i2c_write_reg(dev, DAVINCI_I2C_MDR_REG, 0);
> +               dev_err(&pdev->dev, "Failed to resume device\n");
> +       else
> +               davinci_i2c_write_reg(dev, DAVINCI_I2C_MDR_REG, 0);
>
>         pm_runtime_dont_use_autosuspend(dev->dev);
>         pm_runtime_put_sync(dev->dev);
> --
> 2.39.2
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
