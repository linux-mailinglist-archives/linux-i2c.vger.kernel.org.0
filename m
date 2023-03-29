Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81ED76CF39B
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Mar 2023 21:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbjC2Ttg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Mar 2023 15:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjC2Ttf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Mar 2023 15:49:35 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 096BE65A7
        for <linux-i2c@vger.kernel.org>; Wed, 29 Mar 2023 12:49:03 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id fb38so11050410pfb.7
        for <linux-i2c@vger.kernel.org>; Wed, 29 Mar 2023 12:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680119288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JkwwcSBRqgS30KhR49UM83c3a69MioP60clbUh2HjpA=;
        b=Vjb3xT/s1/m7g9V+3JodYQd0vQRs0RZgGOezedG8oJudOay6pylk3yYQ2+36Ew/UIb
         juTMRwfNvT2SCrUDOGBXYX2WfGtnySA1/ElIFRA6/PZ1aW8c0mBQPLG/1HbonvmAuKVG
         nuqXcKmGBfCFd+ChSg3orAS1fWQva0XBc7rql8PaZSQWvOxbKW2mCTGOVJBfhPPDs4I+
         oDs22vkzvITKKvdb66iqt7sHk2sh/Dw5IjGWFsr13+Z6j/cSH1OFYWDYq/a+0eDGiSi1
         bs/aib9lMbj++PKL/Ym1cxuKbiGmWO+xSCPycd19WBQwnO/pZd6zU6iI9pOdvNqn/YaR
         Bowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680119288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkwwcSBRqgS30KhR49UM83c3a69MioP60clbUh2HjpA=;
        b=UcVZbY4ZmYzveZqMP5wNB7iOnYSAnttA4s+EXjIqE1FoBrWQsxzYO2meZhpQj6atbk
         8EXeot4dHuyjrtq61Q/ByrZiL+jcTqJqf4vnEvc195DKwAURSj0eUDC4ApXo/giSRq2X
         AqX0tyy1fRPQ4lR3mzW46YftM4/t1xqO5hTe8AuQUuvWBvrx7QTUjp05tZZkrfx+ACyN
         hoKuJiGD6Q/xeQaX37ttDwBRWl2CF6SPWb0ekaJQAam5Z6TROXi2eK07ZL4CDVxxyF6G
         aiO6FlGYA7IxriiNHxMkaLLyLsBsqbkB9ShHYjjkfBTYOhRI86Nbjh2xY0qGQ/r5xUzU
         P8zA==
X-Gm-Message-State: AAQBX9dPnHIMJeomiFLobXH6chUYgD18EB9T4J6GdEbX2o1oxjEak/w4
        dN0DkkqsiZvvfOkMERfFedK5JNZFWQ8HYNsWk/Xwqw==
X-Google-Smtp-Source: AKy350bTWid512og1XEyH8yXn2SeGT0F4JFf7EpVQQuzB+KNlUFsnJWFBZzX5Pz0KWEq5gW8zQNmpFjZE0Q/yTnojJg=
X-Received: by 2002:a63:5a47:0:b0:513:2523:1b5f with SMTP id
 k7-20020a635a47000000b0051325231b5fmr5501254pgm.3.1680119287530; Wed, 29 Mar
 2023 12:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <240155f20aae47e9f7461e2b7416120ba6238886.1679650087.git.geert+renesas@glider.be>
In-Reply-To: <240155f20aae47e9f7461e2b7416120ba6238886.1679650087.git.geert+renesas@glider.be>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 29 Mar 2023 12:47:31 -0700
Message-ID: <CAGETcx-5a3ZKRiG1MbZaYiJUPVSPH1O18+E-HoTRnAUz0mc07A@mail.gmail.com>
Subject: Re: [PATCH v2] treewide: Fix instantiation of devices in DT overlays
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

On Fri, Mar 24, 2023 at 2:30=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>

I saw all the other replies. Let me give more details on the commit
text and inline comments so it's clearer and not a "he said he said"

> When loading a DT overlay that creates a device, the device is not
> instantiated,

IIRC I think the devices are instantiated, but not probed.

> unless the DT overlay is unloaded and reloaded again.
>
> Saravana explains:
>   Basically for all overlays (I hope the function is only used for
>   overlays) we assume all nodes are NOT devices until they actually
>   get added as a device.

This comment was about what the patch is doing. I think a better
commit text would be something like below. Feel free to reword as you
see fit.

After the recent refactor to improve fw_devlink[1], it no longer depends on
"compatible" property to identify which device tree nodes will
become struct device. fw_devlink now picks up dangling consumers (consumers
pointing to descendent device tree nodes of a device that aren't converted
to child devices) when a device is successfully bound to a driver. See
__fw_devlink_pickup_dangling_consumers().

However, during DT overlay, a device's device tree node can have sub-nodes
added/removed without unbinding/rebinding the driver. This difference in
behavior between the normal device instantiation and probing flow vs the DT
overlay flow has a bunch of implications that are pointed out elsewhere[2].
One of them is that the fw_devlink logic to pick up dangling consumers is
never exercised.

This patch solves the fw_devlink issue by marking all DT nodes added by DT
overlay with FWNODE_FLAG_NOT_DEVICE (fwnode that won't become device) and
then clearing the flag when a struct device is actually created for the DT
node. This way, fw_devlink knows not to have consumers waiting on these
newly added DT nodes and to propagate the dependency to an ancestor DT node
that has corresponding struct device.

[1] - https://lore.kernel.org/lkml/20230207014207.1678715-1-saravanak@googl=
e.com/
[2] - https://lore.kernel.org/lkml/CAGETcx_bkuFaLCiPrAWCPQz+w79ccDp6=3D9e88=
1qmK=3Dvx3hBMyg@mail.gmail.com/#t


> Based on a patch by Saravana Kannan, which covered only platform and spi
> devices.

You can keep this in the commit text.

> Fixes: 4a032827daa89350 ("of: property: Simplify of_link_to_phandle()")
> Link: https://lore.kernel.org/r/CAGETcx_+rhHvaC_HJXGrr5_WAd2+k5f=3DrWYnkC=
Z6z5bGX-wj4w@mail.gmail.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Mark Brown <broonie@kernel.org>
> ---
> v2:
>   - Add Acked-by,
>   - Drop RFC.
> ---
>  drivers/bus/imx-weim.c    | 1 +
>  drivers/i2c/i2c-core-of.c | 1 +
>  drivers/of/dynamic.c      | 1 +
>  drivers/of/platform.c     | 1 +
>  drivers/spi/spi.c         | 1 +
>  5 files changed, 5 insertions(+)
>
> diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
> index 36d42484142aede2..898e23a4231400fa 100644
> --- a/drivers/bus/imx-weim.c
> +++ b/drivers/bus/imx-weim.c
> @@ -329,6 +329,7 @@ static int of_weim_notify(struct notifier_block *nb, =
unsigned long action,
>                                  "Failed to setup timing for '%pOF'\n", r=
d->dn);
>
>                 if (!of_node_check_flag(rd->dn, OF_POPULATED)) {

It's important this flag clearing is done before the device is added.
So, can you please add a comment before all these clear flag lines
that's something like:

/* Clear the flag before adding the device so that fw_devlink doesn't
skip adding consumers to this device. */

Thanks,
Saravana

> +                       rd->dn->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DEVICE=
;
>                         if (!of_platform_device_create(rd->dn, NULL, &pde=
v->dev)) {
>                                 dev_err(&pdev->dev,
>                                         "Failed to create child device '%=
pOF'\n",
> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> index aa93467784c29c89..303f9003562eed3d 100644
> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -178,6 +178,7 @@ static int of_i2c_notify(struct notifier_block *nb, u=
nsigned long action,
>                         return NOTIFY_OK;
>                 }
>
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
> index b2bd2e783445dd78..17c92cbfb62ee3ef 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -737,6 +737,7 @@ static int of_platform_notify(struct notifier_block *=
nb,
>                 if (of_node_check_flag(rd->dn, OF_POPULATED))
>                         return NOTIFY_OK;
>
> +               rd->dn->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DEVICE;
>                 /* pdev_parent may be NULL when no bus platform device */
>                 pdev_parent =3D of_find_device_by_node(rd->dn->parent);
>                 pdev =3D of_platform_device_create(rd->dn, NULL,
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 8e8af148b1dc371e..66ac67580d2a473b 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -4527,6 +4527,7 @@ static int of_spi_notify(struct notifier_block *nb,=
 unsigned long action,
>                         return NOTIFY_OK;
>                 }
>
> +               rd->dn->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DEVICE;
>                 spi =3D of_register_spi_device(ctlr, rd->dn);
>                 put_device(&ctlr->dev);
>
> --
> 2.34.1
>
