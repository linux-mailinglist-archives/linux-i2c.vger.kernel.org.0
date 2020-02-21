Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD5D1679AB
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2020 10:46:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbgBUJqJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Feb 2020 04:46:09 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40007 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728080AbgBUJqJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Feb 2020 04:46:09 -0500
Received: by mail-ot1-f68.google.com with SMTP id i6so1454151otr.7;
        Fri, 21 Feb 2020 01:46:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q+uBU7L8RtfoD9SLjOzf0Rj4Gw7Zsw7mjIUjKd/bLlA=;
        b=eEtP4yfJN9tAMzt4hNdO7woE20WkXq5gQ2E7ttq3s4VtpHzo5mFyYSi3HY6whbt+rm
         oOYNdwPyXpJ+hGASyof4DhdRP687Dbvld3VcUWS0RLschBpk87DE5CwLQnkRTL5btsje
         2mpnzVhIPrXCngouk1o/Eyh2AkfBBSsuLa3sPFmgns/x6G+tJyE4/O1eVD85CMRpDp+0
         RHXcS0Fejv/H4xDTfqcleGPezJawUqipVhq14BEYobQIQuQVlmX3oIkRfUkdA2w8kG3d
         hj8Qyvu7RISZWLytnOWI+YM+QrZqc/m21hzDaddoHME/1AmOhhCn4SwPXpAtDUzBxNPU
         SuYg==
X-Gm-Message-State: APjAAAX+aoFwd7cEdbA6hqbcGRT+yzkVg89CQCqpDrhJ9br5y31okBa8
        9ZOlin72KsoFACIhlH6yKNwcikiZJpa11CMTqalpVg==
X-Google-Smtp-Source: APXvYqzHAA/ed2jeLWXuh4z7co4qvtSPYestcYmLDnJ4+FLkiCB9VRH2RECFnS6fJXo92EVQSWytPJR5zyzfcKJeHHo=
X-Received: by 2002:a9d:7602:: with SMTP id k2mr27652055otl.39.1582278368260;
 Fri, 21 Feb 2020 01:46:08 -0800 (PST)
MIME-Version: 1.0
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com> <20200220172403.26062-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200220172403.26062-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Feb 2020 10:45:57 +0100
Message-ID: <CAMuHMdWaPfc050dZiRr+gAFzsdjSo9Vo70ztWgrMGPJxLUqupw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/7] i2c: allow DT nodes without 'compatible'
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
> Sometimes, we have unknown devices in a system and still want to block
> their address. For that, we allow DT nodes with only a 'reg' property.
> These devices will be bound to the "dummy" driver but with the name
> "reserved". That way, we can distinguish them and even hand them over to
> the "dummy" driver later when they are really requested using
> i2c_new_ancillary_device().
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
but one question below.

> --- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> @@ -50,7 +50,6 @@ Examples:
>                 reg-io-width = <1>;     /* 8 bit read/write */
>
>                 dummy@60 {
> -                       compatible = "dummy";
>                         reg = <0x60>;
>                 };
>         };

There's a second instance to remove 18 lines below.

> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -27,17 +27,15 @@ int of_i2c_get_board_info(struct device *dev, struct device_node *node,
>
>         memset(info, 0, sizeof(*info));
>
> -       if (of_modalias_node(node, info->type, sizeof(info->type)) < 0) {
> -               dev_err(dev, "of_i2c: modalias failure on %pOF\n", node);
> -               return -EINVAL;
> -       }
> -
>         ret = of_property_read_u32(node, "reg", &addr);
>         if (ret) {
>                 dev_err(dev, "of_i2c: invalid reg on %pOF\n", node);
>                 return ret;
>         }
>
> +       if (of_modalias_node(node, info->type, sizeof(info->type)) < 0)
> +               strlcpy(info->type, I2C_RESERVED_DRV_NAME, sizeof(I2C_RESERVED_DRV_NAME));

Could this cause a regression, e.g. if people already have such dummy
nodes in their DTS, and use sysfs new_device from userspace to
instantiate the device later?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
