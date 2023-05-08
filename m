Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 219616FBAB0
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 00:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234488AbjEHWAk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 18:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234494AbjEHWA0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 18:00:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B5183C0
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 15:00:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1669362091
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 22:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71891C433D2
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 22:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683583217;
        bh=Gs8d1OgETR5vgvXPysUobuWCafUSteJwNAsW4o5j24I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IvLll+9of5mID+aB9rFxbEIiDpvWESmRk8Nm/8dtFqu9cg5nwMO8wrjG/YDv2qJfF
         UQkTEb4M/QYZCrDjPWVsfxSbtmwdR9K7OqnTv+6QQ0Zzv0Wf/kgvtayHg8xVbO2V1/
         KlT/UwXqqvSSdC9gH44y8OJO97A1JJXfwR0zLi10R+aXgRoRP1U98XWRr4szpr9mlz
         h2ygwvwPjGmHFB88ldP8L1YLDtYZcN/qkPSMgauyt9aMfowJRSltLoKPFzRs6690D9
         z/l+erBOmygE1XCYN6LpQ9XBQmTiQkeFwp5krQi07ri3uiJKtx5lu4iQoJhCRKNtK8
         1tBP2IpbHObjg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4f00d41df22so31414672e87.1
        for <linux-i2c@vger.kernel.org>; Mon, 08 May 2023 15:00:17 -0700 (PDT)
X-Gm-Message-State: AC+VfDzwU7vne1WY/gCTky8WlWFVtGibYa+b0eIzN7txx0nOftak1Miw
        YIJ+NxM7eI+2rR92dWsZDxD0mdIvQX5laX0iNJ4=
X-Google-Smtp-Source: ACHHUZ5mGqyNLyxRdoYdqnNaFLWtRL0O6WZI/VTfjzCHt9WMIY7s1RAt5/HyTRf7KgM4f/C1ztJivyEJG1NaDMua5ec=
X-Received: by 2002:a05:651c:1255:b0:2ad:80a0:9391 with SMTP id
 h21-20020a05651c125500b002ad80a09391mr84907ljh.23.1683583215418; Mon, 08 May
 2023 15:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de> <20230508205306.1474415-73-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508205306.1474415-73-u.kleine-koenig@pengutronix.de>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 9 May 2023 00:00:03 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEUj-a8mn=QRvP2TmMMTFvTzH9VkBbogmyRqHRYkps5GA@mail.gmail.com>
Message-ID: <CAMj1kXEUj-a8mn=QRvP2TmMMTFvTzH9VkBbogmyRqHRYkps5GA@mail.gmail.com>
Subject: Re: [PATCH 72/89] i2c: synquacer: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 8 May 2023 at 22:53, Uwe Kleine-K=C3=B6nig
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

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  drivers/i2c/busses/i2c-synquacer.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-=
synquacer.c
> index 50d19cf99a03..4cc196ca8f6d 100644
> --- a/drivers/i2c/busses/i2c-synquacer.c
> +++ b/drivers/i2c/busses/i2c-synquacer.c
> @@ -618,15 +618,13 @@ static int synquacer_i2c_probe(struct platform_devi=
ce *pdev)
>         return 0;
>  }
>
> -static int synquacer_i2c_remove(struct platform_device *pdev)
> +static void synquacer_i2c_remove(struct platform_device *pdev)
>  {
>         struct synquacer_i2c *i2c =3D platform_get_drvdata(pdev);
>
>         i2c_del_adapter(&i2c->adapter);
>         if (!IS_ERR(i2c->pclk))
>                 clk_disable_unprepare(i2c->pclk);
> -
> -       return 0;
>  };
>
>  static const struct of_device_id synquacer_i2c_dt_ids[] __maybe_unused =
=3D {
> @@ -645,7 +643,7 @@ MODULE_DEVICE_TABLE(acpi, synquacer_i2c_acpi_ids);
>
>  static struct platform_driver synquacer_i2c_driver =3D {
>         .probe  =3D synquacer_i2c_probe,
> -       .remove =3D synquacer_i2c_remove,
> +       .remove_new =3D synquacer_i2c_remove,
>         .driver =3D {
>                 .name =3D "synquacer_i2c",
>                 .of_match_table =3D of_match_ptr(synquacer_i2c_dt_ids),
> --
> 2.39.2
>
