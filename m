Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A16B167A5C
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2020 11:14:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728486AbgBUKOA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Feb 2020 05:14:00 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38911 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727150AbgBUKOA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Feb 2020 05:14:00 -0500
Received: by mail-oi1-f196.google.com with SMTP id r137so1078645oie.5;
        Fri, 21 Feb 2020 02:13:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IZocKraqIUJZ35HEbFK9lQ7GF0tGKhiv0gssLBu8UR0=;
        b=f0k3A63MKX/hki582NVNwPguuS2v7MpC3FCzOcSLgfoMib+o125m+oqmZ8luRMi8wj
         qWQAIIeJvSa1AD3ifJ6wyZv7bhei3nAenf3eia1YLIEL8zz9ABGuSnZVUgrS4pG1flN8
         oNtrT2L6V5GEoybEaJEjewyDun+1O8LmHvrJVk0dj5uZuNqCHcwYnzi6GTLbAXkRxjIg
         TrWZnHSKqP5ApK6+ui0GKKZTiG+CmLrv8ooQIhEZiDLgg991FFUIbiCsuM8lA6rWhu89
         hNwnJih1b1XC+5bPU6yS2ls1Gu+9A3H2hIFcjpW+4q0u2e0u0SpxC3mqiDgDVCN+maYG
         qWqw==
X-Gm-Message-State: APjAAAU034Fpx1GadIVJRFVnst7WGBObHsCJ+S7UTUTv4G7u8vpQDapz
        o2Gdc40l2WyUVy4Gk9LTos8OIWU4u6hJceXn7JxOg8o/
X-Google-Smtp-Source: APXvYqy8ctrMdeADSQHxwR9cRnUsbwVavhFTJOapRHb2udJuBdEfDAXWSOiRn1HggkpBEl/pTw91mKIAc1cco0Xe+B8=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr1284059oia.148.1582280039481;
 Fri, 21 Feb 2020 02:13:59 -0800 (PST)
MIME-Version: 1.0
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com> <20200220172403.26062-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200220172403.26062-8-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Feb 2020 11:13:48 +0100
Message-ID: <CAMuHMdV-dfjukuSKiFg4vb4Ntn+XWU0XwHPxyoaWs1vtQVg4cw@mail.gmail.com>
Subject: Re: [RFC PATCH 7/7] i2c: core: hand over reserved devices when
 requesting ancillary addresses
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Thu, Feb 20, 2020 at 6:26 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> With i2c_new_ancillary_address, we can check if the intended driver is
> requesting a reserved address. Update the function to do these checks.
> If the check passes, the "reserved" device will become a regular "dummy"
> device.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -975,6 +975,8 @@ struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
>                                                 u16 default_addr)
>  {
>         struct device_node *np = client->dev.of_node;
> +       struct device *reserved_dev, *adapter_dev = &client->adapter->dev;
> +       struct i2c_client *reserved_client;
>         u32 addr = default_addr;
>         int i;
>
> @@ -984,7 +986,21 @@ struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
>                         of_property_read_u32_index(np, "reg", i, &addr);
>         }
>
> -       dev_dbg(&client->adapter->dev, "Address for %s : 0x%x\n", name, addr);
> +       dev_info(adapter_dev, "Address for %s : 0x%x\n", name, addr);
> +
> +       /* No need to scan muxes, siblings must sit on the same adapter */
> +       reserved_dev = device_find_child(adapter_dev, &addr, __i2c_check_addr_busy);
> +       reserved_client = i2c_verify_client(reserved_dev);
> +
> +       if (reserved_client) {
> +               if (reserved_client->dev.of_node != np ||
> +                   strcmp(reserved_client->name, I2C_RESERVED_DRV_NAME) != 0)
> +                       return ERR_PTR(-EBUSY);

Missing put_device(reserved_dev).

> +
> +               strlcpy(reserved_client->name, I2C_DUMMY_DRV_NAME, sizeof(client->name));
> +               return reserved_client;
> +       }

else put_device(reserved_dev)

(perhaps i2c_verify_client() checking dev was not such a great idea, as
 callers need to act on dev && !verified anyway?)

> +
>         return i2c_new_dummy_device(client->adapter, addr);
>  }
>  EXPORT_SYMBOL_GPL(i2c_new_ancillary_device);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
