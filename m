Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08FF26D0F6A
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Mar 2023 21:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbjC3TzF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Mar 2023 15:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231315AbjC3TzE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Mar 2023 15:55:04 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C65C10248
        for <linux-i2c@vger.kernel.org>; Thu, 30 Mar 2023 12:54:58 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id d10so12063319pgt.12
        for <linux-i2c@vger.kernel.org>; Thu, 30 Mar 2023 12:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680206098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0C8x1Qfu5NpmV+FfqktLcV4MhMy0ca1jPVOTkp3rFw=;
        b=AZaQzujqtCMFP3dj9NurzoSLTd7YNlA3x4AvbFl6yNXyvTRSrt8hxNQo76+F2XX8b2
         GiyK3MF/+nNhJRwOwEBGYQFoskDRxy+Tz723ASGyytzdZ+oev8f+5Yc3/7Fg830AP+r+
         oKJW/+Aq3gSB6SnmxzdzyfTvtw8sklU+CP3wKXnWh4y1CcCV2YzERiZl+0E8GvcdXFUf
         KJj6XYN/ZiY/xdk34WYL58bZ2XB2cbuQG8LtXKH5yXwqhPivJg7qH1+EWG2q0xJXbEVK
         5+KSa+2TJVgg0I7AfAJYSqxYYWFB0c8msazPYhaaaLVL8i5lXmhzYMS5YqEqzde5c5mc
         6Ydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680206098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G0C8x1Qfu5NpmV+FfqktLcV4MhMy0ca1jPVOTkp3rFw=;
        b=aP+z6JxjCgeGYVt/sMlZWJo0yCr0Wih6lrCIRHyuVCww1UVCRL+Jc0S9YTt3diU/wd
         vXqutGAI7kQdCUnBJrW40d3ap/kj8RmgWTTDsN+Mr5D3z9pk5LPWCJe3dRvYwme249qN
         HF33quDUJUI18cmcx72/Y0IdnadJn1ZKG2Q4gQnIJpHw3r0VeW9eUgKL7M+3sUdCA6+H
         VSksuXkG33xKhcoJJqWhDuWbU0YiEU7Uy+FZ3cGz6F3aIODAbrDSqVW2jh8G85jYzPJ1
         yTYIRpfuU6lYqQBijjpw9j6OQN8Q9HpTQdgkL1ND+JFTJYRrkoFYcBR3vFkG0aepXtQh
         lJ+A==
X-Gm-Message-State: AAQBX9d4F2V5jbVZoMqknO1PJ1pW3zwaR2gIrURZTjGlbVYEn5+FELGH
        KbN1E3fpNNe+WINi/5JPD/tyB5i44DfvxItc39s/B32e06UapWcIReA=
X-Google-Smtp-Source: AKy350ZsSA2zMm7jiilzQo6BWFTqU1m42D9YuSsH/eu33F/LyA8ptMrsw8svd/C6JnFSEz6ZpCMVo8wtDnO9IipeFWc=
X-Received: by 2002:a63:1b61:0:b0:50c:2b1:7a8f with SMTP id
 b33-20020a631b61000000b0050c02b17a8fmr2203806pgm.6.1680206097475; Thu, 30 Mar
 2023 12:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <e1fa546682ea4c8474ff997ab6244c5e11b6f8bc.1680182615.git.geert+renesas@glider.be>
In-Reply-To: <e1fa546682ea4c8474ff997ab6244c5e11b6f8bc.1680182615.git.geert+renesas@glider.be>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 30 Mar 2023 12:54:21 -0700
Message-ID: <CAGETcx9N_6cpkK=E3-ibtUgw4NaSgyV1a0hE9uGdd+DMWfY78w@mail.gmail.com>
Subject: Re: [PATCH v3] treewide: Fix probing of devices in DT overlays
To:     geert+renesas@glider.be
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Ivan Bornyakov <i.bornyakov@metrotek.ru>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 30, 2023 at 6:26=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> When loading a DT overlay that creates a device, the device is not
> probed, unless the DT overlay is unloaded and reloaded again.
>
> After the recent refactoring to improve fw_devlink, it no longer depends
> on the "compatible" property to identify which device tree nodes will
> become struct devices.   fw_devlink now picks up dangling consumers
> (consumers pointing to descendent device tree nodes of a device that
> aren't converted to child devices) when a device is successfully bound
> to a driver.  See __fw_devlink_pickup_dangling_consumers().
>
> However, during DT overlay, a device's device tree node can have
> sub-nodes added/removed without unbinding/rebinding the driver.  This
> difference in behavior between the normal device instantiation and
> probing flow vs. the DT overlay flow has a bunch of implications that
> are pointed out elsewhere[1].  One of them is that the fw_devlink logic
> to pick up dangling consumers is never exercised.
>
> This patch solves the fw_devlink issue by marking all DT nodes added by
> DT overlays with FWNODE_FLAG_NOT_DEVICE (fwnode that won't become
> device), and by clearing the flag when a struct device is actually
> created for the DT node.  This way, fw_devlink knows not to have
> consumers waiting on these newly added DT nodes, and to propagate the
> dependency to an ancestor DT node that has the corresponding struct
> device.
>
> Based on a patch by Saravana Kannan, which covered only platform and spi
> devices.

Doesn't make sense to give a Reviewed-by to something I partially wrote, so=
:

Acked-by: Saravana Kannan <saravanak@google.com>

Thanks for making sure this is fixed Geert!

-Saravana

>
> [1] https://lore.kernel.org/r/CAGETcx_bkuFaLCiPrAWCPQz+w79ccDp6=3D9e881qm=
K=3Dvx3hBMyg@mail.gmail.com
>
> Fixes: 4a032827daa89350 ("of: property: Simplify of_link_to_phandle()")
> Link: https://lore.kernel.org/r/CAGETcx_+rhHvaC_HJXGrr5_WAd2+k5f=3DrWYnkC=
Z6z5bGX-wj4w@mail.gmail.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C
> ---
> v3:
>   - Add Acked-by,
>   - s/instantiate/probe/,
>   - Improve commit description,
>   - Add comment before clearing FWNODE_FLAG_NOT_DEVICE,
>
> v2:
>   - Add Acked-by,
>   - Drop RFC.
> ---
>  drivers/bus/imx-weim.c    | 6 ++++++
>  drivers/i2c/i2c-core-of.c | 5 +++++
>  drivers/of/dynamic.c      | 1 +
>  drivers/of/platform.c     | 5 +++++
>  drivers/spi/spi.c         | 5 +++++
>  5 files changed, 22 insertions(+)
>
> diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
> index 36d42484142aede2..cf463c1d2102c6fb 100644
> --- a/drivers/bus/imx-weim.c
> +++ b/drivers/bus/imx-weim.c
> @@ -329,6 +329,12 @@ static int of_weim_notify(struct notifier_block *nb,=
 unsigned long action,
>                                  "Failed to setup timing for '%pOF'\n", r=
d->dn);
>
>                 if (!of_node_check_flag(rd->dn, OF_POPULATED)) {
> +                       /*
> +                        * Clear the flag before adding the device so tha=
t
> +                        * fw_devlink doesn't skip adding consumers to th=
is
> +                        * device.
> +                        */
> +                       rd->dn->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DEVICE=
;
>                         if (!of_platform_device_create(rd->dn, NULL, &pde=
v->dev)) {
>                                 dev_err(&pdev->dev,
>                                         "Failed to create child device '%=
pOF'\n",
> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> index aa93467784c29c89..5c137638689799c8 100644
> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -178,6 +178,11 @@ static int of_i2c_notify(struct notifier_block *nb, =
unsigned long action,
>                         return NOTIFY_OK;
>                 }
>
> +               /*
> +                * Clear the flag before adding the device so that fw_dev=
link
> +                * doesn't skip adding consumers to this device.
> +                */
> +               rd->dn->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DEVICE;
>                 client =3D of_i2c_register_device(adap, rd->dn);
>                 if (IS_ERR(client)) {
>                         dev_err(&adap->dev, "failed to create client for =
'%pOF'\n",
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index 07d93753b12f5f4d..e311d406b1705306 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -226,6 +226,7 @@ static void __of_attach_node(struct device_node *np)
>         np->sibling =3D np->parent->child;
>         np->parent->child =3D np;
>         of_node_clear_flag(np, OF_DETACHED);
> +       np->fwnode.flags |=3D FWNODE_FLAG_NOT_DEVICE;
>  }
>
>  /**
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index b2bd2e783445dd78..78ae8418744905c9 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -737,6 +737,11 @@ static int of_platform_notify(struct notifier_block =
*nb,
>                 if (of_node_check_flag(rd->dn, OF_POPULATED))
>                         return NOTIFY_OK;
>
> +               /*
> +                * Clear the flag before adding the device so that fw_dev=
link
> +                * doesn't skip adding consumers to this device.
> +                */
> +               rd->dn->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DEVICE;
>                 /* pdev_parent may be NULL when no bus platform device */
>                 pdev_parent =3D of_find_device_by_node(rd->dn->parent);
>                 pdev =3D of_platform_device_create(rd->dn, NULL,
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 37a7be6c5a44c8f9..a12420e28640bbd4 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -4504,6 +4504,11 @@ static int of_spi_notify(struct notifier_block *nb=
, unsigned long action,
>                         return NOTIFY_OK;
>                 }
>
> +               /*
> +                * Clear the flag before adding the device so that fw_dev=
link
> +                * doesn't skip adding consumers to this device.
> +                */
> +               rd->dn->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DEVICE;
>                 spi =3D of_register_spi_device(ctlr, rd->dn);
>                 put_device(&ctlr->dev);
>
> --
> 2.34.1
>
