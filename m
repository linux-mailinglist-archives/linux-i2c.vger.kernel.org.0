Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB9A167A2C
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2020 11:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgBUKJf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Feb 2020 05:09:35 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41845 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728080AbgBUKJf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Feb 2020 05:09:35 -0500
Received: by mail-ot1-f68.google.com with SMTP id r27so1501260otc.8;
        Fri, 21 Feb 2020 02:09:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9uswFKJA3UguMUgU3A3OPoWPldnhscfWTGKerHuP5hA=;
        b=RIB9HdvMfhkQRGvc6PtvHYLSMOFgUYv6udd7SscdPTV+yK0mc9vQO1ANLUtv8uhqrJ
         jK1ypQRefO8kuo3RNbiKGOXVmbdV9REtGVxV6mp5Vp1ZDGul7HKmKggso7x3ua82YymY
         NQfo6F2q6ElzeUFP2Qz7vvZ89V1XHR1eVwwrE+iFhz/Vc9cIWBxx2Woxqa7Ujt0G2k6y
         PTVcw5PC+s4IQjjfeFw1SgdxANb2lAzVfuMBmRkiQNiTgQPh89o+pkpuu0H2TJgveNr7
         1CJA/Z0BIm94/maKFZOckrthCbOAcTDco1/mWrLyXynhiVod0J9PyzoWOy6qHblIKI1/
         xMGQ==
X-Gm-Message-State: APjAAAUTZkK9ie4C1UhrYWxQkf2aD/qMO+KZ9CWJYOGBGV2/0mxrrqYV
        PdRvrD6vVJpToSTKr+UC/cxZOtdCCQab7jx8KhI=
X-Google-Smtp-Source: APXvYqx+lR58sJt3zglwXKZApEjdRFMug7P91pMn1BNbGNAivnSC6znljpvev3pzmq+qlYV7M7doYSTCKf1bWzRIf8I=
X-Received: by 2002:a05:6830:1d4:: with SMTP id r20mr12990862ota.107.1582279773101;
 Fri, 21 Feb 2020 02:09:33 -0800 (PST)
MIME-Version: 1.0
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com> <20200220172403.26062-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200220172403.26062-7-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Feb 2020 11:09:21 +0100
Message-ID: <CAMuHMdUvADDozCX6Bd0dDVejpTY-k42naEnB7Q5Z6w7Yg94_Vw@mail.gmail.com>
Subject: Re: [RFC PATCH 6/7] i2c: of: mark a whole array of regs as reserved
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
> Back then, 'reg' properties in I2C DT bindings only contained one
> address and this address was assigned a device and, thus, blocked.
> Meanwhile, chips using multiple addresses are common and the 'reg'
> property can be an array described by 'reg-names'. This code enhances
> I2C DT parsing, so it will reserve all addresses described in an array.
> They will be bound to the 'dummy' driver as 'reserved' iff the first
> address can be assigned successfully. If that is not the case, the array
> is not further considered. If one later address of the array can not be
> assigned, it will be reported but we don't bail out. The driver has to
> decide if that address is critical or not.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

One comment below.

> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -21,20 +21,12 @@
>
>  #include "i2c-core.h"
>
> -int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)
> +static void of_i2c_decode_board_info(struct device_node *node, u32 addr,
> +                                    bool first_addr, struct i2c_board_info *info)
>  {
> -       u32 addr;
> -       int ret;
> -
>         memset(info, 0, sizeof(*info));
>
> -       ret = of_property_read_u32(node, "reg", &addr);
> -       if (ret) {
> -               pr_err("invalid reg on %pOF\n", node);
> -               return ret;
> -       }
> -
> -       if (of_modalias_node(node, info->type, sizeof(info->type)) < 0)
> +       if (!first_addr || of_modalias_node(node, info->type, sizeof(info->type)) < 0)
>                 strlcpy(info->type, I2C_RESERVED_DRV_NAME, sizeof(I2C_RESERVED_DRV_NAME));
>
>         if (addr & I2C_TEN_BIT_ADDRESS) {
> @@ -51,11 +43,27 @@ int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)
>         info->of_node = node;
>         info->fwnode = of_fwnode_handle(node);
>
> -       if (of_property_read_bool(node, "host-notify"))
> -               info->flags |= I2C_CLIENT_HOST_NOTIFY;
> +       if (first_addr) {
> +               if (of_property_read_bool(node, "host-notify"))
> +                       info->flags |= I2C_CLIENT_HOST_NOTIFY;
> +
> +               if (of_get_property(node, "wakeup-source", NULL))
> +                       info->flags |= I2C_CLIENT_WAKE;
> +       }
> +}
> +
> +int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)
> +{
> +       u32 addr;
> +       int ret;
> +
> +       ret = of_property_read_u32(node, "reg", &addr);

Perhaps the time is ripe to start considering #address-cells, instead
of assuming 1, here ...

> +       if (ret) {
> +               pr_err("invalid reg on %pOF\n", node);
> +               return ret;
> +       }
>
> -       if (of_get_property(node, "wakeup-source", NULL))
> -               info->flags |= I2C_CLIENT_WAKE;
> +       of_i2c_decode_board_info(node, addr, true, info);
>
>         return 0;
>  }
> @@ -64,21 +72,33 @@ EXPORT_SYMBOL_GPL(of_i2c_get_board_info);
>  static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
>                                                  struct device_node *node)
>  {
> -       struct i2c_client *client;
> +       struct i2c_client *client, *first_client = ERR_PTR(-ENOENT);
>         struct i2c_board_info info;
> -       int ret;
> +       bool first_reg = true;
> +       struct property *prop;
> +       const __be32 *cur;
> +       u32 reg;
>
>         pr_debug("register %pOF\n", node);
>
> -       ret = of_i2c_get_board_info(node, &info);
> -       if (ret)
> -               return ERR_PTR(ret);
> +       of_property_for_each_u32(node, "reg", prop, cur, reg) {

... and especially here, if this code can ever be reused for i3c, which uses 3.

> +               of_i2c_decode_board_info(node, reg, first_reg, &info);
> +
> +               client = i2c_new_client_device(adap, &info);
> +               if (IS_ERR(client)) {
> +                       pr_err("failure registering addr 0x%02x for %pOF\n",
> +                               reg, node);
> +                       if (first_reg)
> +                               return client;
> +               }
>
> -       client = i2c_new_client_device(adap, &info);
> -       if (IS_ERR(client))
> -               pr_err("failure registering %pOF\n", node);
> +               if (first_reg) {
> +                       first_client = client;
> +                       first_reg = false;
> +               }
> +       }
>
> -       return client;
> +       return first_client;
>  }
>
>  void of_i2c_register_devices(struct i2c_adapter *adap)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
