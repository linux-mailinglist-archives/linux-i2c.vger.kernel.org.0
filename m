Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4CCA19522B
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 08:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgC0Hie (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 03:38:34 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45890 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbgC0Hie (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 03:38:34 -0400
Received: by mail-pl1-f194.google.com with SMTP id b9so3138453pls.12;
        Fri, 27 Mar 2020 00:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZwyYZHnfmOAxvYE6pXaq6lScZvDjwj92i9ZFKmieB8M=;
        b=kw++e9IE5hkHT6/5L4BDR3e8C6yhy5KhquZMhvQsO69OR/XrISu0lOogY4bfWGLhMj
         hRKBhvEteBMSHdkrw6AMIpRsF+CzXIrESIGpKKKggnoMsMiopc5mM5wsFtD9Ge+yWFaQ
         XtnZ5EZqxF0oMcwCDuEtuF0PsnpcS/57lsN2RJzYko1rJGyWHFNSZXVtgGTDZMh7CFHr
         afMEKClx6sHh65bUR0N9D2G7S4XIVobR/9A0qmqhhHQpV9dSvhKfszdVcryONx9+tJ9A
         hhhlSY25mmQ4H3r892SNXw2PiWRC8s66ijZZ9jU7nm/tzkni686C6JUSRQgqlEd8x9uI
         C+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZwyYZHnfmOAxvYE6pXaq6lScZvDjwj92i9ZFKmieB8M=;
        b=Qhv3AFHJrBr3dJcsiQmqk9MqVNesYH5pzoDdXhIu+WbT6YKELR1LzqRDzz7QsJMapL
         /8jvmCK889ZSwQ3NjqHy5bI7rodFvWtw9mA5AF9cBC0quPlECDQnUPGWsz9WI0Lq9P2I
         2cVyEdR1HGDDv7CYqc6VTHur8tCmxMOOJVIN0fOrl6i6ZCDDrInGWk8rLP7x6YOXrnkK
         iE79dCMasfVQqH02M6bzvs6ajSvqzBErbqWz9+RiKo8ENPFty4x54vyOtv48fB8bEVzb
         zTLKJgdeBpftHp9R48KKQXHY9oS29OL8vw5w+cENMmCOUoe5p/nDsFfCuLUo15yMMIEn
         51Ow==
X-Gm-Message-State: ANhLgQ1GJwzcfYDCszes3L+JhOR5Na70VoEkSjz12VyDCAqEr21VoAOV
        u1jMJ/DZKuoACh6C2wIxoRGu/73HmajEod2w+IIQebXpSKE=
X-Google-Smtp-Source: ADFU+vuyGQ0lBBu2AvG6Nv1q92q8wttvKWY0d/9wEdFtWxSE0Uf/rWOGSPXE6rcdJw6h8MoqrLzUbc/HsRdWFthZWR8=
X-Received: by 2002:a17:902:5acb:: with SMTP id g11mr4666879plm.18.1585294713210;
 Fri, 27 Mar 2020 00:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200326210952.12857-1-wsa+renesas@sang-engineering.com> <20200326210952.12857-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200326210952.12857-3-wsa+renesas@sang-engineering.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 27 Mar 2020 09:38:21 +0200
Message-ID: <CAHp75Vfw4_0ttE2F-WxdULf7hRGsQvqzCLdCNVy7RBaFdEsCGA@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/mellanox: mlxreg-hotplug: convert to use i2c_new_client_device()
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 26, 2020 at 11:10 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Move away from the deprecated API and return the shiny new ERRPTR where
> useful.
>

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/platform/mellanox/mlxreg-hotplug.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
> index 77be37a1fbcf..ed48917af162 100644
> --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> @@ -101,6 +101,7 @@ static int mlxreg_hotplug_device_create(struct mlxreg_hotplug_priv_data *priv,
>                                         struct mlxreg_core_data *data)
>  {
>         struct mlxreg_core_hotplug_platform_data *pdata;
> +       struct i2c_client *client;
>
>         /* Notify user by sending hwmon uevent. */
>         kobject_uevent(&priv->hwmon->kobj, KOBJ_CHANGE);
> @@ -121,18 +122,20 @@ static int mlxreg_hotplug_device_create(struct mlxreg_hotplug_priv_data *priv,
>                 return -EFAULT;
>         }
>
> -       data->hpdev.client = i2c_new_device(data->hpdev.adapter,
> -                                           data->hpdev.brdinfo);
> -       if (!data->hpdev.client) {
> +       client = i2c_new_client_device(data->hpdev.adapter,
> +                                      data->hpdev.brdinfo);
> +       if (IS_ERR(client)) {
>                 dev_err(priv->dev, "Failed to create client %s at bus %d at addr 0x%02x\n",
>                         data->hpdev.brdinfo->type, data->hpdev.nr +
>                         pdata->shift_nr, data->hpdev.brdinfo->addr);
>
>                 i2c_put_adapter(data->hpdev.adapter);
>                 data->hpdev.adapter = NULL;
> -               return -EFAULT;
> +               return PTR_ERR(client);
>         }
>
> +       data->hpdev.client = client;
> +
>         return 0;
>  }
>
> --
> 2.20.1
>


-- 
With Best Regards,
Andy Shevchenko
