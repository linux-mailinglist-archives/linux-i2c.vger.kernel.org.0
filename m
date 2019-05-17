Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61CBE215CB
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2019 10:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbfEQI4r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 May 2019 04:56:47 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:33470 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727831AbfEQI4q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 May 2019 04:56:46 -0400
Received: by mail-it1-f194.google.com with SMTP id u16so10425597itc.0
        for <linux-i2c@vger.kernel.org>; Fri, 17 May 2019 01:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LaG+iVsA5ay+VjMTwBpI5cni99FqtQ32Izic+fYUFSo=;
        b=yG/Rpl+Iacrsi57pw8tyg65KE49lPPN1YaxaPA9aH9YFchPY7A+0iqaovHuTss/CC9
         V1zUGyXR86b8FXyOlEHTLEP6esxKFSDulpSZJCSXPzpdMDJ4DdNYhJmVCQXIMaKV+qeF
         gwMA3pt+eE6GpTxAYbXhfPazrtMCbdyHuyRqSa6bT2VRNdJEiICJQTPrbyRtcnpeqoVz
         lVtVMabVJu2BgD430Vq5MwvH4Ldv1xcGdPmR+AWNY2VeU4e9h5KNnMC8eEcs5zCAnbDN
         gVey9rpOgyssKoYeW/zL+8HDJTTDfj24zYvDROOSu9rckEQ8ZvNuEqiHXxIDeXNnwXNX
         il1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LaG+iVsA5ay+VjMTwBpI5cni99FqtQ32Izic+fYUFSo=;
        b=fwtU+PodAkJ7/DyckNZqBss6fB9zlATtBGAviN0ZE/YhSOhJWhef0+Icx5JrHq7XDC
         PmzJn3JtUE4bUALv1R8GVuaZ9jiY6Rp/bxyVfXLhIn4BiLVA+R1NU8sExVJm4pdryoR1
         eJ94tIBLHb4BzxST0pAb4o+ARsA21DVlewdiYkc/bBB/uDcubLvZxBYe+pkaCRVJr32y
         YKVz+awC55yjX3QKFGcuuRnOUzNX62cfoGCRm9kzweRGr5kLC5t4DFATuZHGSSkLL+Ob
         rYMNElBDMCq1X7NOgmrWB89abEtm2jmQIv7vb+bx9h17mEZkaT/Zu627NKEjsFDwWQgq
         Aqqw==
X-Gm-Message-State: APjAAAVrlQoYdl47vw8419qwT02DrbBR9GMgiL+cBzlydx5iftqa0ivY
        ScunHlWN4Bd8GjT7m1geklnZtpn7L5myoGoaphqEo13e
X-Google-Smtp-Source: APXvYqy2nsFmtb9NRfQmr/VwLiJ0+q2zaUtcFQ+21kt+IB1za3RDJfoaACqEVSPhnel9KNVoKAKTvJTC0PSOKcrwxM8=
X-Received: by 2002:a05:660c:917:: with SMTP id s23mr1697937itj.166.1558083405913;
 Fri, 17 May 2019 01:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190516211310.22277-1-wsa+renesas@sang-engineering.com> <20190516211310.22277-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190516211310.22277-2-wsa+renesas@sang-engineering.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 17 May 2019 10:56:34 +0200
Message-ID: <CAMRc=Mc2x=A_WDni8WzeHS0+4u5v+=Twtu7mhVXqwbhpewb=bg@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] i2c: core: improve return value handling of
 i2c_new_device and i2c_new_dummy
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

czw., 16 maj 2019 o 23:13 Wolfram Sang
<wsa+renesas@sang-engineering.com> napisa=C5=82(a):
>
> From: Heiner Kallweit <hkallweit1@gmail.com>
>
> Currently i2c_new_device and i2c_new_dummy return just NULL in error
> case although they have more error details internally. Therefore move
> the functionality into new functions returning detailed errors and
> add wrappers for compatibility with the current API.
>
> This allows to use these functions with detailed error codes within
> the i2c core or for API extensions.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> [wsa: rename new functions and fix minor kdoc issues]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-base.c | 74 ++++++++++++++++++++++++++++++-------
>  1 file changed, 61 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 9732a81bb7dd..9c38dde73366 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -714,7 +714,7 @@ static int i2c_dev_irq_from_resources(const struct re=
source *resources,
>  }
>
>  /**
> - * i2c_new_device - instantiate an i2c device
> + * i2c_new_client_device - instantiate an i2c device
>   * @adap: the adapter managing the device
>   * @info: describes one I2C device; bus_num is ignored
>   * Context: can sleep
> @@ -727,17 +727,17 @@ static int i2c_dev_irq_from_resources(const struct =
resource *resources,
>   * before any i2c_adapter could exist.
>   *
>   * This returns the new i2c client, which may be saved for later use wit=
h
> - * i2c_unregister_device(); or NULL to indicate an error.
> + * i2c_unregister_device(); or an ERR_PTR to describe the error.
>   */
> -struct i2c_client *
> -i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *in=
fo)
> +static struct i2c_client *
> +i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info co=
nst *info)
>  {
>         struct i2c_client       *client;
>         int                     status;
>
>         client =3D kzalloc(sizeof *client, GFP_KERNEL);
>         if (!client)
> -               return NULL;
> +               return ERR_PTR(-ENOMEM);
>
>         client->adapter =3D adap;
>
> @@ -803,7 +803,31 @@ i2c_new_device(struct i2c_adapter *adap, struct i2c_=
board_info const *info)
>                 client->name, client->addr, status);
>  out_err_silent:
>         kfree(client);
> -       return NULL;
> +       return ERR_PTR(status);
> +}
> +EXPORT_SYMBOL_GPL(i2c_new_client_device);
> +
> +/**
> + * i2c_new_device - instantiate an i2c device
> + * @adap: the adapter managing the device
> + * @info: describes one I2C device; bus_num is ignored
> + * Context: can sleep
> + *
> + * This deprecated function has the same functionality as
> + * @i2c_new_client_device, it just returns NULL instead of an ERR_PTR in=
 case of
> + * an error for compatibility with current I2C API. It will be removed o=
nce all
> + * users are converted.
> + *
> + * This returns the new i2c client, which may be saved for later use wit=
h
> + * i2c_unregister_device(); or NULL to indicate an error.
> + */
> +struct i2c_client *
> +i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *in=
fo)
> +{
> +       struct i2c_client *ret;
> +
> +       ret =3D i2c_new_client_device(adap, info);
> +       return IS_ERR(ret) ? NULL : ret;
>  }
>  EXPORT_SYMBOL_GPL(i2c_new_device);
>
> @@ -854,7 +878,7 @@ static struct i2c_driver dummy_driver =3D {
>  };
>
>  /**
> - * i2c_new_dummy - return a new i2c device bound to a dummy driver
> + * i2c_new_dummy_device - return a new i2c device bound to a dummy drive=
r
>   * @adapter: the adapter managing the device
>   * @address: seven bit address to be used
>   * Context: can sleep
> @@ -869,15 +893,39 @@ static struct i2c_driver dummy_driver =3D {
>   * different driver.
>   *
>   * This returns the new i2c client, which should be saved for later use =
with
> - * i2c_unregister_device(); or NULL to indicate an error.
> + * i2c_unregister_device(); or an ERR_PTR to describe the error.
>   */
> -struct i2c_client *i2c_new_dummy(struct i2c_adapter *adapter, u16 addres=
s)
> +static struct i2c_client *
> +i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address)
>  {
>         struct i2c_board_info info =3D {
>                 I2C_BOARD_INFO("dummy", address),
>         };
>
> -       return i2c_new_device(adapter, &info);
> +       return i2c_new_client_device(adapter, &info);
> +}
> +EXPORT_SYMBOL_GPL(i2c_new_dummy_device);
> +
> +/**
> + * i2c_new_dummy - return a new i2c device bound to a dummy driver
> + * @adapter: the adapter managing the device
> + * @address: seven bit address to be used
> + * Context: can sleep
> + *
> + * This deprecated function has the same functionality as @i2c_new_dummy=
_device,
> + * it just returns NULL instead of an ERR_PTR in case of an error for
> + * compatibility with current I2C API. It will be removed once all users=
 are
> + * converted.
> + *
> + * This returns the new i2c client, which should be saved for later use =
with
> + * i2c_unregister_device(); or NULL to indicate an error.
> + */
> +struct i2c_client *i2c_new_dummy(struct i2c_adapter *adapter, u16 addres=
s)
> +{
> +       struct i2c_client *ret;
> +
> +       ret =3D i2c_new_dummy_device(adapter, address);
> +       return IS_ERR(ret) ? NULL : ret;
>  }
>  EXPORT_SYMBOL_GPL(i2c_new_dummy);
>
> @@ -1000,9 +1048,9 @@ i2c_sysfs_new_device(struct device *dev, struct dev=
ice_attribute *attr,
>                 info.flags |=3D I2C_CLIENT_SLAVE;
>         }
>
> -       client =3D i2c_new_device(adap, &info);
> -       if (!client)
> -               return -EINVAL;
> +       client =3D i2c_new_client_device(adap, &info);
> +       if (IS_ERR(client))
> +               return PTR_ERR(client);
>
>         /* Keep track of the added device */
>         mutex_lock(&adap->userspace_clients_lock);
> --
> 2.19.1
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
