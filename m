Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C738705128
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 16:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233488AbjEPOpi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 10:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233444AbjEPOph (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 10:45:37 -0400
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF9FC7EDC
        for <linux-i2c@vger.kernel.org>; Tue, 16 May 2023 07:45:31 -0700 (PDT)
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-77d049b9040so3938272241.1
        for <linux-i2c@vger.kernel.org>; Tue, 16 May 2023 07:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684248331; x=1686840331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgs1T+D3BnF9rZPvYtr/6djf/K6Fti2h/uEggWBDOQ8=;
        b=Ao3ee+hO+FQ/lXtOVQhIqKzbCJ+HwLYtVgALF4JWBCWHsS3WnL2fjmjkgKYSs6gcGb
         3L8SobB2/kujgBt6bQOVY07F47JbMU2pzlqYiQ2XFw24q/PigIki8gOM3O4nAmjtNLXk
         7ae3Xsn9eYkoR175qcRTb+rZ1PmXlwNA/jhdbsioE80zD7wzTh4Pb+VlRwr5ykvwxs2X
         +wexPTgtLXN9ohq0+/3VVq5WXvXpURKXPgL9G6aTGc0Vjk60QDt8Yznuic2RCotMTTnq
         JhafM6N4F+jrC9C0bnIq8nMoWaOfd/IfVOsOWWFfLS6T5fCeAmGK9phqkuPR5utJ1M1G
         VFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684248331; x=1686840331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgs1T+D3BnF9rZPvYtr/6djf/K6Fti2h/uEggWBDOQ8=;
        b=P+/vMIwQuF1ef6QBFaCH1ENfiQiCbsUhe9ppCz3jDtyLf/y77I1TpF2zCjkhAECcVB
         NOs++umEoc9fdI/hTVh0k+EF+UM1clMLH7ctpvKgclfQEbSld7QkQ5runRNjFr2qkX8B
         uvesLkUyzLn1nvbJPTxGpF5fsuWxR377FRVnB9DKGzjChVrXgIvfawLkUCv07QewUFV4
         nySw3hQ2NC0S9Lf5TRNT03Y9Y8NPOra1h48Aojci4W9K3Czc7YobWB6X5x7CpwoDMJHn
         r/AAQ3mJ1CS+5uRAu/kzOemhACDtyckhnsYJrLQc1a/GKf6WteBXlp9YS91wsz36SxfH
         KdEg==
X-Gm-Message-State: AC+VfDzWgvbT5JJaJHv0DmSOU1eBDIkntvplNTa2yyBpNLtGgYozeToA
        4pTW5vNz07w5UmhsIZ4EIDlJvvn5zggexyVCRXUVBqBjH4IV+pbB
X-Google-Smtp-Source: ACHHUZ7UvB3gGkR/gXbTH+tV0SF/LTDo36CC79S91T6F0Bvv86zcSFQDACSeKk6C0uNZ/nO+t7oxtTUTGCRD0TE4baY=
X-Received: by 2002:a05:6102:3ec1:b0:430:13cb:8156 with SMTP id
 n1-20020a0561023ec100b0043013cb8156mr16365539vsv.13.1684248331119; Tue, 16
 May 2023 07:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230515175042.495377-1-afd@ti.com> <20230515175042.495377-2-afd@ti.com>
In-Reply-To: <20230515175042.495377-2-afd@ti.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 16 May 2023 16:45:20 +0200
Message-ID: <CAMRc=McpFw+4=Vb2aL98Fba1x=bvtxX=VOjNCC5puhxkh+MF5g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: davinci: Use struct name not type with devm_kzalloc()
To:     Andrew Davis <afd@ti.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Mon, May 15, 2023 at 7:50=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:
>
> This reduces chance of error if the type of "dev" changes. While here
> remove extra error print out, this is not usually done for memory
> allocation failures.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  drivers/i2c/busses/i2c-davinci.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-da=
vinci.c
> index c55bd937def7..135f76593e6f 100644
> --- a/drivers/i2c/busses/i2c-davinci.c
> +++ b/drivers/i2c/busses/i2c-davinci.c
> @@ -767,12 +767,9 @@ static int davinci_i2c_probe(struct platform_device =
*pdev)
>         if (irq < 0)
>                 return dev_err_probe(&pdev->dev, irq, "can't get irq reso=
urce\n");
>
> -       dev =3D devm_kzalloc(&pdev->dev, sizeof(struct davinci_i2c_dev),
> -                       GFP_KERNEL);
> -       if (!dev) {
> -               dev_err(&pdev->dev, "Memory allocation failed\n");
> +       dev =3D devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +       if (!dev)
>                 return -ENOMEM;
> -       }
>
>         init_completion(&dev->cmd_complete);
>
> --
> 2.39.2
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
