Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65C09705131
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 16:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233572AbjEPOqw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 10:46:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233325AbjEPOqv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 10:46:51 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4299710EC
        for <linux-i2c@vger.kernel.org>; Tue, 16 May 2023 07:46:50 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-43604f20944so7104879137.2
        for <linux-i2c@vger.kernel.org>; Tue, 16 May 2023 07:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684248409; x=1686840409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOhmwZfKJQlJRGzere4rhYjpul5gFst5eFskc2CxCHI=;
        b=jDHNlDwrYTXxID7x+2TVi7DdflqOASVTWysEmnf2zCJMvpnBqux5xOnUVcjzBS7zwE
         lrM7dg4qxLxEc2XlNPkELa+vxwsaVxOhx51xGK0a+WqH5dQ+Dvfbb+5PbCw6rwx4yj/S
         cUBnPfXJc/DRDwA3UeYUq826fNgCbiXRN3dS5skX5Cut6B/dxoctwm1NuSxkBbSGU8M5
         0OqfGNPUVRN4ZQuF4vjrH7dQkSMuRAfveHxO+szROC0WdXNh4wklUkIV3LPhoBMJLwW2
         xTmWGY4TIeJ4aYhCbfwANBEhmoxnD8LV3wJCXdMgB9VIQd5Fbj2eJ8iybxjuLSp0vtHG
         qlxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684248409; x=1686840409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOhmwZfKJQlJRGzere4rhYjpul5gFst5eFskc2CxCHI=;
        b=VwCdvxdrlCi35Z+m2z+aw1HXRL4Iql+9UhtHsGXpIYrVUvDNyb6Ftxs/A6iCxcGs2M
         53jS2DHCAnXLE8mC8dEUL7A4bDvmc59HYI+nc77q3YSFHxdu8XDnNtvd64awoqVAWQq5
         xGkaS1QixjLkhhntWG4PVmBJjKlI1eH9pXmXvaj8j6a82gk6JicVqSlmivB75JKL8WRT
         2soO0xz+PF0Pg6uzouWCv9j4rzRnG3pOX1zhsRrCuK/y/mu2aWR7hD1M8fNUzy1KF4yB
         hN0Vw+BuakGl793oFArIsDy+2gEFkOhtd+EyAx7VYFOFyf3YhKH7gDAFq9pVb95g0kOx
         hbeg==
X-Gm-Message-State: AC+VfDyolDtkpv3Z77wRCx3Fv9qugc8xQ4WAfMVjxhLX9w/CTfnCbCY/
        QrN4/KsszHbEd6h5nKJnhcln99DnfmtWylDJbedfAw==
X-Google-Smtp-Source: ACHHUZ5KoHDWDTbdMQnJ0Jto8kIPps/K7bOZNuPP95SVIURLaOQHRvbDyVf2dn4RaDOzY7eKSaOEV65Me19DslJq4DI=
X-Received: by 2002:a67:de14:0:b0:434:9021:30c1 with SMTP id
 q20-20020a67de14000000b00434902130c1mr14963256vsk.14.1684248409391; Tue, 16
 May 2023 07:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230515175042.495377-1-afd@ti.com>
In-Reply-To: <20230515175042.495377-1-afd@ti.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 16 May 2023 16:46:38 +0200
Message-ID: <CAMRc=MfqJSYbrbS9cuQFdOB4EW-RaYt0qGN_HZEL17hbvWAK_A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] i2c: davinci: Use platform table macro over module_alias
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
> Generates the same platform module alias. More standard usage.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  drivers/i2c/busses/i2c-davinci.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-da=
vinci.c
> index 9750310f2c96..c55bd937def7 100644
> --- a/drivers/i2c/busses/i2c-davinci.c
> +++ b/drivers/i2c/busses/i2c-davinci.c
> @@ -940,12 +940,16 @@ static const struct dev_pm_ops davinci_i2c_pm =3D {
>  #define davinci_i2c_pm_ops NULL
>  #endif
>
> -/* work with hotplug and coldplug */
> -MODULE_ALIAS("platform:i2c_davinci");
> +static const struct platform_device_id davinci_i2c_driver_ids[] =3D {
> +       { .name =3D "i2c_davinci", },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(platform, davinci_i2c_driver_ids);
>
>  static struct platform_driver davinci_i2c_driver =3D {
>         .probe          =3D davinci_i2c_probe,
>         .remove         =3D davinci_i2c_remove,
> +       .id_table       =3D davinci_i2c_driver_ids,
>         .driver         =3D {
>                 .name   =3D "i2c_davinci",
>                 .pm     =3D davinci_i2c_pm_ops,
> --
> 2.39.2
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
