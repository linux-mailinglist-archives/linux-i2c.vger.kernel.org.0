Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0186C6C705D
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 19:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbjCWSkW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 14:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjCWSkV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 14:40:21 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C761A19F12
        for <linux-i2c@vger.kernel.org>; Thu, 23 Mar 2023 11:40:19 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id f6-20020a17090ac28600b0023b9bf9eb63so2964837pjt.5
        for <linux-i2c@vger.kernel.org>; Thu, 23 Mar 2023 11:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679596819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dc8t5la/S7SGwbqv/1OxMvtkFBHHlif98Df3jcSZzQk=;
        b=OB2JolwMzeoHAbSUZXKopfoWmwARaGq4piT0qielQgnlD99zuyJuuartOvZ1bQy6bk
         26wiVoB0tComv/4PXE3fRSXpRYvSAK8LOXXwrDpOOiNt+upjl0ZlMJdkljKdtJdMo8p8
         Ooj+ZrUfhbh/4O/PnAZOdqW6pvM2sg4ZBquFJ9aLpYOoysNGCi0pc2kX82iDUy383VNV
         ePXzDSYzgTzAAebznckJHy6HdzF8F7sn2VztbCnqwvm/p+r9jLKH36IiYJwHgn9dOX7J
         PNUqfhDg6c7egkJ2YtFwimU71WiEgVUvXfvOxbpbo86Qh+uUO/E1bGQt6utCxnw+uL02
         hDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679596819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dc8t5la/S7SGwbqv/1OxMvtkFBHHlif98Df3jcSZzQk=;
        b=B5lwRdVmZ0+w9Eo3s3SKeRBTvcD+X3W/vrNf+19qkgj6XEBpbmKcpm/kUd4MTTTLl+
         NgApD4L8Cc0HuR0iKZVlLrjS4/vCbgzRK5fGhC4YjoVVpezkysSe1iPehIR3UCNdKaLM
         lsHc5KqSGuGoZsw6COO/7iywID8j0tqLd6qQK1Il2cWG/8GwOeOyEQ/8ycwzmXVGNTWq
         vHRo/OlrcsKj2no11CBMrDhvs0HyggP96pM6xYYaJm0ELbyWKzH9XluI36U3cDTxaWOc
         GCBxEi02eqPxuL3E9EZdM+H54iUldYEbwNiVcRj0+s3QEUT1ubavyCmdZSN4COgSu1nt
         uK9A==
X-Gm-Message-State: AO0yUKUCOhZgmXevmBVJhQ8BWTptqcAotSk9EJCw+mUAA/pF3SP1qRTe
        xpqMITKY+roPy8tRhhXRh1JHQzquyLTssfn7M0u64Q==
X-Google-Smtp-Source: AK7set8GTpjYj8eDq8ynIFChjo3qsZvvDfnt1sgQBbe8GDAGmFUzkI3oJLZHCiNHHCqkTN3OP5x4od1Wm1tFnHeRTf4=
X-Received: by 2002:a17:902:a607:b0:1a0:763d:6c2a with SMTP id
 u7-20020a170902a60700b001a0763d6c2amr2826208plq.10.1679596819029; Thu, 23 Mar
 2023 11:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <328e557aaee9d3f5f1bcaf2b8ac2de0e04c4fbb8.1679049188.git.geert+renesas@glider.be>
 <CAGETcx_oYrhjo0C3zJ57gt7HGuiY_=9xEq+TvQU8R5zW6OiQCw@mail.gmail.com>
In-Reply-To: <CAGETcx_oYrhjo0C3zJ57gt7HGuiY_=9xEq+TvQU8R5zW6OiQCw@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 23 Mar 2023 11:39:42 -0700
Message-ID: <CAGETcx9=LENzJUVorEKpoeMChFZHO-=M2jHBQmOo+x1ez9=b5A@mail.gmail.com>
Subject: Re: [PATCH/RFC] treewide: Fix instantiation of devices in DT overlay
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
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Android Kernel Team <kernel-team@android.com>
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

On Fri, Mar 17, 2023 at 5:36=E2=80=AFPM Saravana Kannan <saravanak@google.c=
om> wrote:
>
> On Fri, Mar 17, 2023 at 3:33=E2=80=AFAM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> >
> > When loading a DT overlay that creates a device, the device is not
> > instantiated, unless the DT overlay is unloaded and reloaded again.
> >
> > Saravana explains:
> >   Basically for all overlays (I hope the function is only used for
> >   overlays) we assume all nodes are NOT devices until they actually
> >   get added as a device. Don't review the code, it's not meant to be :)
> >
> > Based on a hacky patch by Saravana Kannan, which covered only platform
> > and spi devices.
> >
> > Fixes: 4a032827daa89350 ("of: property: Simplify of_link_to_phandle()")
> > Link: https://lore.kernel.org/all/CAGETcx_+rhHvaC_HJXGrr5_WAd2+k5f=3DrW=
YnkCZ6z5bGX-wj4w@mail.gmail.com
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Marked RFC as Saravana said this is an ugly hack.
> > Still, this is a regression in v6.3-rc1 that should be fixed.
>
> Thanks for making sure this isn't forgotten.
>
> I thought about this a bit more and I've decided what I gave earlier
> isn't really too much of a hack. The other option is to handle the
> clearing of the flag at the driver core level, but we incur these
> additional instructions for all devices instead of just the overlay
> case. But the benefit is that if more busses add overlay support in
> the future, they won't need to remember to clear the flag in those
> instances too. But they'll probably start off by looking at the
> existing platform bus case, so they'll get it right.
>
> I'll continue the pondering next week and maybe test it on my device
> to make sure it's not doing anything weird for non-overlay cases.
>

Geert,

I think we should stick with the original style of fix I suggested.
So, basically your patch set. Are you planning on sending a non-RFC or
do you want me to do it?

-Saravana

> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -3611,6 +3611,15 @@ int device_add(struct device *dev)
>          */
>         if (dev->fwnode && !dev->fwnode->dev) {
>                 dev->fwnode->dev =3D dev;
> +               /*
> +                * If a fwnode was initially marked as not a device, but =
we
> +                * clearly have a device added for it that can probe, the=
n clear
> +                * the flag so fw_devlink will continue linking consumers=
 to
> +                * this device. This code path is really expected to run =
only
> +                * for DT overlays.
> +                */
> +               if (dev->bus)
> +                       dev->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DEVICE
>                 fw_devlink_link_device(dev);
>         }
>
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index 07d93753b12f..f715b59d9bf3 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -226,6 +226,11 @@ static void __of_attach_node(struct device_node *np)
>         np->sibling =3D np->parent->child;
>         np->parent->child =3D np;
>         of_node_clear_flag(np, OF_DETACHED);
> +       /*
> +        * Ask fw_devlink to assume any new node is not a device. Driver =
core
> +        * will clear this flag if the assumption turns out to be wrong.
> +        */
> +       np->fwnode.flags |=3D FWNODE_FLAG_NOT_DEVICE;
>  }
>
>
>
>
> > ---
> >  drivers/bus/imx-weim.c    | 1 +
> >  drivers/i2c/i2c-core-of.c | 1 +
> >  drivers/of/dynamic.c      | 1 +
> >  drivers/of/platform.c     | 1 +
> >  drivers/spi/spi.c         | 1 +
> >  5 files changed, 5 insertions(+)
> >
> > diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
> > index 2a6b4f676458612e..71d8807170fa9f29 100644
> > --- a/drivers/bus/imx-weim.c
> > +++ b/drivers/bus/imx-weim.c
> > @@ -329,6 +329,7 @@ static int of_weim_notify(struct notifier_block *nb=
, unsigned long action,
> >                                  "Failed to setup timing for '%pOF'\n",=
 rd->dn);
> >
> >                 if (!of_node_check_flag(rd->dn, OF_POPULATED)) {
> > +                       rd->dn->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DEVI=
CE;
> >                         if (!of_platform_device_create(rd->dn, NULL, &p=
dev->dev)) {
> >                                 dev_err(&pdev->dev,
> >                                         "Failed to create child device =
'%pOF'\n",
> > diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> > index bce6b796e04c2ca0..79a0d47010ba0b20 100644
> > --- a/drivers/i2c/i2c-core-of.c
> > +++ b/drivers/i2c/i2c-core-of.c
> > @@ -178,6 +178,7 @@ static int of_i2c_notify(struct notifier_block *nb,=
 unsigned long action,
> >                         return NOTIFY_OK;
> >                 }
> >
> > +               rd->dn->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DEVICE;
> >                 client =3D of_i2c_register_device(adap, rd->dn);
> >                 if (IS_ERR(client)) {
> >                         dev_err(&adap->dev, "failed to create client fo=
r '%pOF'\n",
> > diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> > index 07d93753b12f5f4d..e311d406b1705306 100644
> > --- a/drivers/of/dynamic.c
> > +++ b/drivers/of/dynamic.c
> > @@ -226,6 +226,7 @@ static void __of_attach_node(struct device_node *np=
)
> >         np->sibling =3D np->parent->child;
> >         np->parent->child =3D np;
> >         of_node_clear_flag(np, OF_DETACHED);
> > +       np->fwnode.flags |=3D FWNODE_FLAG_NOT_DEVICE;
> >  }
> >
> >  /**
> > diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> > index b2bd2e783445dd78..17c92cbfb62ee3ef 100644
> > --- a/drivers/of/platform.c
> > +++ b/drivers/of/platform.c
> > @@ -737,6 +737,7 @@ static int of_platform_notify(struct notifier_block=
 *nb,
> >                 if (of_node_check_flag(rd->dn, OF_POPULATED))
> >                         return NOTIFY_OK;
> >
> > +               rd->dn->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DEVICE;
> >                 /* pdev_parent may be NULL when no bus platform device =
*/
> >                 pdev_parent =3D of_find_device_by_node(rd->dn->parent);
> >                 pdev =3D of_platform_device_create(rd->dn, NULL,
> > diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> > index 1a65f96fe2aff591..7bd053a32fad1a3c 100644
> > --- a/drivers/spi/spi.c
> > +++ b/drivers/spi/spi.c
> > @@ -4480,6 +4480,7 @@ static int of_spi_notify(struct notifier_block *n=
b, unsigned long action,
> >                         return NOTIFY_OK;
> >                 }
> >
> > +               rd->dn->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DEVICE;
> >                 spi =3D of_register_spi_device(ctlr, rd->dn);
> >                 put_device(&ctlr->dev);
> >
> > --
> > 2.34.1
> >
