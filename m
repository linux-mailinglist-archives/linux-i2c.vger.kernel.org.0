Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5E6670F379
	for <lists+linux-i2c@lfdr.de>; Wed, 24 May 2023 11:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbjEXJvx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 May 2023 05:51:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbjEXJvj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 May 2023 05:51:39 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B81BFC
        for <linux-i2c@vger.kernel.org>; Wed, 24 May 2023 02:51:37 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-438a5069d58so239916137.0
        for <linux-i2c@vger.kernel.org>; Wed, 24 May 2023 02:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684921896; x=1687513896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYi/bVc73Ez3SyrfVWjfAXm92DOdQuWrEZpsgHdIRWU=;
        b=Rv1MgPamf7A39k1c3Fr5IRtammaooy9t1aaK1186y8HDlquPaH+6/TSoRb9s0HSEfY
         Bex4D6XPT+tAhSZADPNyVHSGc0/Moup16UvXcgrHRGid3Rdw6WMLviAtI3IM7v9LZaZr
         dvKUv+ZLHFjx2v7dmctmhSiDplzlxSj2j14XXnbLYcI8362eOB5c1LPmfLcb467XXzzY
         asBH5RHhQFUXM6Nu0tT26MLuGiujeaIpwaBQx08fLNm6w++1Q8SY7dCv2a/D6ul6TYoP
         V6COXSLJYxakQ/vJz/8LLKviPQSqLHbIrt+f3FCFxq4AyDleM/PRPosWKidBtZ1gPCSe
         og0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684921896; x=1687513896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYi/bVc73Ez3SyrfVWjfAXm92DOdQuWrEZpsgHdIRWU=;
        b=jymw2SODg+Pk1SMmW99ualzojdAYt7caGIA5Plsv1QgubImoH0bBZN/A/Pn1sT0a/v
         SA/oYQf963HhF4Q6cLQ0unIXNTrhN2Sq8uEYAf0pbhPFvmIaHZwGnI6FMRrXnGqhCUuY
         NzUVWHDTjUpjcvQC/HZWHDyYkp1MwIN1GAMCC+tGvpRn1MveSxun3ZueNsZlj+MY14Mg
         45sHWdggCpvrV4kEVWlouLeFIUhgNFTBXDCX+4ODiPI4tkl5X8wXtaEGb5lvmxhvjCjE
         TlATMihiI7v9AauGAEZq8FkXy6orY4mDD6xkMZLYLcnUdjQP/tuElBZY8+gG5v7M0q+N
         B8wQ==
X-Gm-Message-State: AC+VfDxhmiYB/Sa+e/NzXrgLc0YaJRmuRPKVlKyK8EGo6LFVgFPJpW2a
        UIk5c7qNBKqorE5weohn4MKV7cX1TBAOi+bdClDAJA==
X-Google-Smtp-Source: ACHHUZ6ALzf/4xNWYfGyfROXwxiTU4MyuyEInKEAeJXg6uOe+stx6eRidDpLn7syiCw+m3bbxhsjWs9n61UzBC0WBdU=
X-Received: by 2002:a67:f711:0:b0:432:8d37:f0e4 with SMTP id
 m17-20020a67f711000000b004328d37f0e4mr4757122vso.21.1684921896189; Wed, 24
 May 2023 02:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230517220135.170379-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517220135.170379-1-u.kleine-koenig@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 24 May 2023 11:51:25 +0200
Message-ID: <CAMRc=MfOTQRJSENh=O8iGe9krybyLJnSk_T6SUQxaP4NgYRdig@mail.gmail.com>
Subject: Re: [PATCH] misc: Switch i2c drivers back to use .probe()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jean Delvare <jdelvare@suse.com>,
        Eric Piel <eric.piel@tremplin-utc.net>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Justin Stitt <justinstitt@google.com>,
        Yuan Can <yuancan@huawei.com>,
        Dan Carpenter <error27@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Petr Machata <petrm@nvidia.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
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

On Thu, May 18, 2023 at 12:01=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() fro=
m
> struct i2c_driver.
>
> While touching these drivers, fix alignment in apds990x.c and bh1770glc.c=
.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> I used v6.4-rc1 as base for this patch, but it also fits on top of
> today's next master. If there are some conflicts when you apply it, feel
> free to just drop all conflicting hunks, I'll care about the fallout
> later.
>
> I chose to do this in a single patch for all drivers below drivers/misc
> If you want me to split it, just tell me.
>
> Best regards
> Uwe
>
>  drivers/misc/ad525x_dpot-i2c.c         | 2 +-
>  drivers/misc/apds9802als.c             | 2 +-
>  drivers/misc/apds990x.c                | 4 ++--
>  drivers/misc/bh1770glc.c               | 4 ++--
>  drivers/misc/ds1682.c                  | 2 +-
>  drivers/misc/eeprom/at24.c             | 2 +-

I have a separate tree for at24 and some patches queued for this
release cycle. Any chance you could send me a separate patch?

Thanks,
Bartosz

>  drivers/misc/eeprom/ee1004.c           | 2 +-
>  drivers/misc/eeprom/eeprom.c           | 2 +-
>  drivers/misc/eeprom/idt_89hpesx.c      | 2 +-
>  drivers/misc/eeprom/max6875.c          | 2 +-
>  drivers/misc/hmc6352.c                 | 2 +-
>  drivers/misc/ics932s401.c              | 2 +-
>  drivers/misc/isl29003.c                | 2 +-
>  drivers/misc/isl29020.c                | 2 +-
>  drivers/misc/lis3lv02d/lis3lv02d_i2c.c | 2 +-
>  drivers/misc/tsl2550.c                 | 2 +-
>  16 files changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/misc/ad525x_dpot-i2c.c b/drivers/misc/ad525x_dpot-i2=
c.c
> index 3856d5c04c5f..469478f7a1d3 100644
> --- a/drivers/misc/ad525x_dpot-i2c.c
> +++ b/drivers/misc/ad525x_dpot-i2c.c
> @@ -106,7 +106,7 @@ static struct i2c_driver ad_dpot_i2c_driver =3D {
>         .driver =3D {
>                 .name   =3D "ad_dpot",
>         },
> -       .probe_new      =3D ad_dpot_i2c_probe,
> +       .probe          =3D ad_dpot_i2c_probe,
>         .remove         =3D ad_dpot_i2c_remove,
>         .id_table       =3D ad_dpot_id,
>  };
> diff --git a/drivers/misc/apds9802als.c b/drivers/misc/apds9802als.c
> index 0526c55d5cd5..693f0e539f37 100644
> --- a/drivers/misc/apds9802als.c
> +++ b/drivers/misc/apds9802als.c
> @@ -296,7 +296,7 @@ static struct i2c_driver apds9802als_driver =3D {
>                 .name =3D DRIVER_NAME,
>                 .pm =3D APDS9802ALS_PM_OPS,
>         },
> -       .probe_new =3D apds9802als_probe,
> +       .probe =3D apds9802als_probe,
>         .remove =3D apds9802als_remove,
>         .id_table =3D apds9802als_id,
>  };
> diff --git a/drivers/misc/apds990x.c b/drivers/misc/apds990x.c
> index 0024503ea6db..92b92be91d60 100644
> --- a/drivers/misc/apds990x.c
> +++ b/drivers/misc/apds990x.c
> @@ -1267,11 +1267,11 @@ static const struct dev_pm_ops apds990x_pm_ops =
=3D {
>  };
>
>  static struct i2c_driver apds990x_driver =3D {
> -       .driver  =3D {
> +       .driver   =3D {
>                 .name   =3D "apds990x",
>                 .pm     =3D &apds990x_pm_ops,
>         },
> -       .probe_new =3D apds990x_probe,
> +       .probe    =3D apds990x_probe,
>         .remove   =3D apds990x_remove,
>         .id_table =3D apds990x_id,
>  };
> diff --git a/drivers/misc/bh1770glc.c b/drivers/misc/bh1770glc.c
> index bedbe0efb330..1629b62fd052 100644
> --- a/drivers/misc/bh1770glc.c
> +++ b/drivers/misc/bh1770glc.c
> @@ -1374,11 +1374,11 @@ static const struct dev_pm_ops bh1770_pm_ops =3D =
{
>  };
>
>  static struct i2c_driver bh1770_driver =3D {
> -       .driver  =3D {
> +       .driver   =3D {
>                 .name   =3D "bh1770glc",
>                 .pm     =3D &bh1770_pm_ops,
>         },
> -       .probe_new =3D bh1770_probe,
> +       .probe    =3D bh1770_probe,
>         .remove   =3D bh1770_remove,
>         .id_table =3D bh1770_id,
>  };
> diff --git a/drivers/misc/ds1682.c b/drivers/misc/ds1682.c
> index d517eed32971..21fc5bc85c5c 100644
> --- a/drivers/misc/ds1682.c
> +++ b/drivers/misc/ds1682.c
> @@ -250,7 +250,7 @@ static struct i2c_driver ds1682_driver =3D {
>                 .name =3D "ds1682",
>                 .of_match_table =3D ds1682_of_match,
>         },
> -       .probe_new =3D ds1682_probe,
> +       .probe =3D ds1682_probe,
>         .remove =3D ds1682_remove,
>         .id_table =3D ds1682_id,
>  };
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 938c4f41b98c..d93fbb1cb43e 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -832,7 +832,7 @@ static struct i2c_driver at24_driver =3D {
>                 .of_match_table =3D at24_of_match,
>                 .acpi_match_table =3D ACPI_PTR(at24_acpi_ids),
>         },
> -       .probe_new =3D at24_probe,
> +       .probe =3D at24_probe,
>         .remove =3D at24_remove,
>         .id_table =3D at24_ids,
>         .flags =3D I2C_DRV_ACPI_WAIVE_D0_PROBE,
> diff --git a/drivers/misc/eeprom/ee1004.c b/drivers/misc/eeprom/ee1004.c
> index c8c6deb7ed89..a1acd77130f2 100644
> --- a/drivers/misc/eeprom/ee1004.c
> +++ b/drivers/misc/eeprom/ee1004.c
> @@ -234,7 +234,7 @@ static struct i2c_driver ee1004_driver =3D {
>                 .name =3D "ee1004",
>                 .dev_groups =3D ee1004_groups,
>         },
> -       .probe_new =3D ee1004_probe,
> +       .probe =3D ee1004_probe,
>         .remove =3D ee1004_remove,
>         .id_table =3D ee1004_ids,
>  };
> diff --git a/drivers/misc/eeprom/eeprom.c b/drivers/misc/eeprom/eeprom.c
> index 32611100d5cd..ccb7c2f7ee2f 100644
> --- a/drivers/misc/eeprom/eeprom.c
> +++ b/drivers/misc/eeprom/eeprom.c
> @@ -196,7 +196,7 @@ static struct i2c_driver eeprom_driver =3D {
>         .driver =3D {
>                 .name   =3D "eeprom",
>         },
> -       .probe_new      =3D eeprom_probe,
> +       .probe          =3D eeprom_probe,
>         .remove         =3D eeprom_remove,
>         .id_table       =3D eeprom_id,
>
> diff --git a/drivers/misc/eeprom/idt_89hpesx.c b/drivers/misc/eeprom/idt_=
89hpesx.c
> index 7075d0b37881..740c06382b83 100644
> --- a/drivers/misc/eeprom/idt_89hpesx.c
> +++ b/drivers/misc/eeprom/idt_89hpesx.c
> @@ -1556,7 +1556,7 @@ static struct i2c_driver idt_driver =3D {
>                 .name =3D IDT_NAME,
>                 .of_match_table =3D idt_of_match,
>         },
> -       .probe_new =3D idt_probe,
> +       .probe =3D idt_probe,
>         .remove =3D idt_remove,
>         .id_table =3D idt_ids,
>  };
> diff --git a/drivers/misc/eeprom/max6875.c b/drivers/misc/eeprom/max6875.=
c
> index 79cf8afcef2e..cb6b1efeafe0 100644
> --- a/drivers/misc/eeprom/max6875.c
> +++ b/drivers/misc/eeprom/max6875.c
> @@ -192,7 +192,7 @@ static struct i2c_driver max6875_driver =3D {
>         .driver =3D {
>                 .name   =3D "max6875",
>         },
> -       .probe_new      =3D max6875_probe,
> +       .probe          =3D max6875_probe,
>         .remove         =3D max6875_remove,
>         .id_table       =3D max6875_id,
>  };
> diff --git a/drivers/misc/hmc6352.c b/drivers/misc/hmc6352.c
> index 8967940ecd1e..759eaeb64307 100644
> --- a/drivers/misc/hmc6352.c
> +++ b/drivers/misc/hmc6352.c
> @@ -131,7 +131,7 @@ static struct i2c_driver hmc6352_driver =3D {
>         .driver =3D {
>                 .name =3D "hmc6352",
>         },
> -       .probe_new =3D hmc6352_probe,
> +       .probe =3D hmc6352_probe,
>         .remove =3D hmc6352_remove,
>         .id_table =3D hmc6352_id,
>  };
> diff --git a/drivers/misc/ics932s401.c b/drivers/misc/ics932s401.c
> index 12108a7b9b40..ee6296b98078 100644
> --- a/drivers/misc/ics932s401.c
> +++ b/drivers/misc/ics932s401.c
> @@ -105,7 +105,7 @@ static struct i2c_driver ics932s401_driver =3D {
>         .driver =3D {
>                 .name   =3D "ics932s401",
>         },
> -       .probe_new      =3D ics932s401_probe,
> +       .probe          =3D ics932s401_probe,
>         .remove         =3D ics932s401_remove,
>         .id_table       =3D ics932s401_id,
>         .detect         =3D ics932s401_detect,
> diff --git a/drivers/misc/isl29003.c b/drivers/misc/isl29003.c
> index 147b58f7968d..ebf0635aee64 100644
> --- a/drivers/misc/isl29003.c
> +++ b/drivers/misc/isl29003.c
> @@ -459,7 +459,7 @@ static struct i2c_driver isl29003_driver =3D {
>                 .name   =3D ISL29003_DRV_NAME,
>                 .pm     =3D ISL29003_PM_OPS,
>         },
> -       .probe_new =3D isl29003_probe,
> +       .probe =3D isl29003_probe,
>         .remove =3D isl29003_remove,
>         .id_table =3D isl29003_id,
>  };
> diff --git a/drivers/misc/isl29020.c b/drivers/misc/isl29020.c
> index 3be02093368c..c5976fa8c825 100644
> --- a/drivers/misc/isl29020.c
> +++ b/drivers/misc/isl29020.c
> @@ -214,7 +214,7 @@ static struct i2c_driver isl29020_driver =3D {
>                 .name =3D "isl29020",
>                 .pm =3D ISL29020_PM_OPS,
>         },
> -       .probe_new =3D isl29020_probe,
> +       .probe =3D isl29020_probe,
>         .remove =3D isl29020_remove,
>         .id_table =3D isl29020_id,
>  };
> diff --git a/drivers/misc/lis3lv02d/lis3lv02d_i2c.c b/drivers/misc/lis3lv=
02d/lis3lv02d_i2c.c
> index 7071412d6bf6..3882e97e96a7 100644
> --- a/drivers/misc/lis3lv02d/lis3lv02d_i2c.c
> +++ b/drivers/misc/lis3lv02d/lis3lv02d_i2c.c
> @@ -262,7 +262,7 @@ static struct i2c_driver lis3lv02d_i2c_driver =3D {
>                 .pm     =3D &lis3_pm_ops,
>                 .of_match_table =3D of_match_ptr(lis3lv02d_i2c_dt_ids),
>         },
> -       .probe_new =3D lis3lv02d_i2c_probe,
> +       .probe =3D lis3lv02d_i2c_probe,
>         .remove =3D lis3lv02d_i2c_remove,
>         .id_table =3D lis3lv02d_id,
>  };
> diff --git a/drivers/misc/tsl2550.c b/drivers/misc/tsl2550.c
> index 6c62b94e0acd..a3bc2823143e 100644
> --- a/drivers/misc/tsl2550.c
> +++ b/drivers/misc/tsl2550.c
> @@ -437,7 +437,7 @@ static struct i2c_driver tsl2550_driver =3D {
>                 .of_match_table =3D tsl2550_of_match,
>                 .pm     =3D TSL2550_PM_OPS,
>         },
> -       .probe_new =3D tsl2550_probe,
> +       .probe =3D tsl2550_probe,
>         .remove =3D tsl2550_remove,
>         .id_table =3D tsl2550_id,
>  };
>
> base-commit: ac9a78681b921877518763ba0e89202254349d1b
> --
> 2.39.2
>
