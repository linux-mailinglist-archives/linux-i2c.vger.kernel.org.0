Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD345215CD
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2019 10:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbfEQI5O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 May 2019 04:57:14 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:40517 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727899AbfEQI5N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 May 2019 04:57:13 -0400
Received: by mail-it1-f195.google.com with SMTP id g71so10774230ita.5
        for <linux-i2c@vger.kernel.org>; Fri, 17 May 2019 01:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5ywaAxGV0oO72/0qY6qvnBMr3xxZNPnvXs0U6qmlwCM=;
        b=Uh4lc/rlRTxnk324XQjGrd3p/CBw/ZwRXhxtb9EEsoP+DpYUJcVgy6m6g7EDAf8EXn
         UnZs+SKZLffWnkOtlrL5gC7W9Fv2YFx7v/tCY86TwRyZdnu1VJltpyLaJruIOsnxdapM
         ffzRbtxetvoXLLU2bblTTo+0R+c2U7wbjOgyZAIMELMkhwPhEHsL6Ge/oRO+NshlfzNj
         jTox2mkE3d0DXTIffrJr5oPvVe7b+qbRW5/Iid2XtlF3a1v64QfGPTcN0VElT84hqvzH
         v/xovyhHep7MOkqxzuAZs+AHhc1nhJ45G1Gq3nQrtDCOnf4QHF4mzKFm1dHrTap8yLqi
         Sd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5ywaAxGV0oO72/0qY6qvnBMr3xxZNPnvXs0U6qmlwCM=;
        b=pz4RnEJHNv6jYsLiL1yGLnlDRuVc7vmQzdkQ4ov2MuyLwSMiuFWiWQ7CIj129cYYfa
         m8CAp2FUeQKFvP9ebl8i4l+9x2RuwV7Z1pYnAqPZm+NlcDnhcj3nSYDwT5MZ8EqFDOaI
         5UTLr9w5+r51tM5uoH33nOVt0/IE+rCsbRauEQoUN2y1DeoNZ15rgsrUelYbBTTEqy4R
         iufFsQdSgXJmXvAOZkW+rLQ7QrH/WpH1IaTrfEXQDg/GxPIrVwB7pBeGic7Shpo/tQNU
         /IAYZC1pgve+UeSWxEWRZy2al9RyLVSCluSr4oCmba7IZvJ96Bl1hoZ5fVZnClGcA/k3
         HZ5A==
X-Gm-Message-State: APjAAAUVOCsBTqoBVVkx/92XmK6CJ8jXQCwrNsG8d8DPPS+0hP5vmHrl
        vpjOP6QQRXqRcUDgif3XX6Osh2RdTdzXz2S0Hb5nTQ==
X-Google-Smtp-Source: APXvYqwrBwjd8qqsp/B6d3YFjUYE7GEALnxHXBoB77k/sPGrR3UkfKBmOmTo+numCmTS9UH1Powb3tR5oSBBqSoWzys=
X-Received: by 2002:a24:e409:: with SMTP id o9mr1903880ith.4.1558083432646;
 Fri, 17 May 2019 01:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190516211310.22277-1-wsa+renesas@sang-engineering.com> <20190516211310.22277-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190516211310.22277-3-wsa+renesas@sang-engineering.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 17 May 2019 10:57:01 +0200
Message-ID: <CAMRc=MeRO3ZWXvgCx5Hi=KBxn4X9FthZ0fg_E=_aWwZ45xHu_A@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] i2c: core: add device-managed version of i2c_new_dummy
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
> i2c_new_dummy is typically called from the probe function of the
> driver for the primary i2c client. It requires calls to
> i2c_unregister_device in the error path of the probe function and
> in the remove function.
> This can be simplified by introducing a device-managed version.
>
> Note the changed error case return value type: i2c_new_dummy returns
> NULL whilst devm_i2c_new_dummy_device returns an ERR_PTR.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> [wsa: rename new functions and fix minor kdoc issues]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/driver-model/devres.txt |  3 ++
>  drivers/i2c/i2c-core-base.c           | 44 +++++++++++++++++++++++++++
>  include/linux/i2c.h                   |  3 ++
>  3 files changed, 50 insertions(+)
>
> diff --git a/Documentation/driver-model/devres.txt b/Documentation/driver=
-model/devres.txt
> index 99994a461359..69c7fa7f616c 100644
> --- a/Documentation/driver-model/devres.txt
> +++ b/Documentation/driver-model/devres.txt
> @@ -271,6 +271,9 @@ GPIO
>    devm_gpio_request_one()
>    devm_gpio_free()
>
> +I2C
> +  devm_i2c_new_dummy_device()
> +
>  IIO
>    devm_iio_device_alloc()
>    devm_iio_device_free()
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 9c38dde73366..d389d4fb0623 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -929,6 +929,50 @@ struct i2c_client *i2c_new_dummy(struct i2c_adapter =
*adapter, u16 address)
>  }
>  EXPORT_SYMBOL_GPL(i2c_new_dummy);
>
> +struct i2c_dummy_devres {
> +       struct i2c_client *client;
> +};
> +
> +static void devm_i2c_release_dummy(struct device *dev, void *res)
> +{
> +       struct i2c_dummy_devres *this =3D res;
> +
> +       i2c_unregister_device(this->client);
> +}
> +
> +/**
> + * devm_i2c_new_dummy_device - return a new i2c device bound to a dummy =
driver
> + * @dev: device the managed resource is bound to
> + * @adapter: the adapter managing the device
> + * @address: seven bit address to be used
> + * Context: can sleep
> + *
> + * This is the device-managed version of @i2c_new_dummy_device. It retur=
ns the
> + * new i2c client or an ERR_PTR in case of an error.
> + */
> +struct i2c_client *devm_i2c_new_dummy_device(struct device *dev,
> +                                            struct i2c_adapter *adapter,
> +                                            u16 address)
> +{
> +       struct i2c_dummy_devres *dr;
> +       struct i2c_client *client;
> +
> +       dr =3D devres_alloc(devm_i2c_release_dummy, sizeof(*dr), GFP_KERN=
EL);
> +       if (!dr)
> +               return ERR_PTR(-ENOMEM);
> +
> +       client =3D i2c_new_dummy_device(adapter, address);
> +       if (IS_ERR(client)) {
> +               devres_free(dr);
> +       } else {
> +               dr->client =3D client;
> +               devres_add(dev, dr);
> +       }
> +
> +       return client;
> +}
> +EXPORT_SYMBOL_GPL(devm_i2c_new_dummy_device);
> +
>  /**
>   * i2c_new_secondary_device - Helper to get the instantiated secondary a=
ddress
>   * and create the associated device
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index be27062f8ed1..6c4db54714f6 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -469,6 +469,9 @@ extern int i2c_probe_func_quick_read(struct i2c_adapt=
er *, unsigned short addr);
>  extern struct i2c_client *
>  i2c_new_dummy(struct i2c_adapter *adap, u16 address);
>
> +extern struct i2c_client *
> +devm_i2c_new_dummy_device(struct device *dev, struct i2c_adapter *adap, =
u16 address);
> +
>  extern struct i2c_client *
>  i2c_new_secondary_device(struct i2c_client *client,
>                                 const char *name,
> --
> 2.19.1
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
