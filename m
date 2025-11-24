Return-Path: <linux-i2c+bounces-14243-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3D1C812DF
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Nov 2025 15:56:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A89A04E87CB
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Nov 2025 14:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C5F31327A;
	Mon, 24 Nov 2025 14:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMb6m25O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E343126A3
	for <linux-i2c@vger.kernel.org>; Mon, 24 Nov 2025 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763996018; cv=none; b=FLJkCHrnfeyxG/HNkDBkTYzz+QJcqGGRrRUea9YkzavVpZg89o+j5Uo9mPEsplOaYAE4GzPAHXy0gCyow0F3AZqd/w7L6oYLmA1kmRn3G49hf5CiI67lzD/jMbzGVbwfvDof5izuUr9xAicVSGYukYu+fd9SBPJRfnyXWNxKwJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763996018; c=relaxed/simple;
	bh=pqB+fORk4m1HommlyJq2ylzh3yrOPYjttsDy21RyYgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RWPfQ/BVaL7KJ7SM55uY3NFTIkWoOUqoZTOb6PDNMZVHr33sb0dZgBtBL0ptFqmN/nYMWakzGkJR31bQjtQmviRkWPHgxigXJXI1ZbZAFmHVZ6f0/mRg9EsHjrbWNtG8OBphiCelZkgonDemal0CY9QaVYo8eZdCi2kDLBpzBa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMb6m25O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C99C2BCB1
	for <linux-i2c@vger.kernel.org>; Mon, 24 Nov 2025 14:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763996018;
	bh=pqB+fORk4m1HommlyJq2ylzh3yrOPYjttsDy21RyYgU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nMb6m25OZAmG9HoIT2tbcmIEu13l7KCo7qOUGpyGEKCNQcoXyatztdhBRNLniFe9H
	 iUdVditSVkqyQiMezr7SYacU6Fuh69mx8tZ6HDosgigcJ7TNS8ewvckx1mRHr6NlZt
	 RWM8icBK1O8jQhaM4gp0YkOJQgjXWAyI8xiPVEYlJ3DkjIoq77cbsLvgsZRPjeajw5
	 8sEh+NULl+wAlgsYj5XrTH8jDP5jIfl3lXYc/9MC+OwkZ77Z0TrZEH9HA6zGsIGsV0
	 bCBliNvETdNSesdMuPYmG5wowk+JVHFxuQ5LpJR277mGaalzkxvAyPK9bCT6wAmjCe
	 fm54dLY0Qsw/w==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-645a13e2b17so2581704a12.2
        for <linux-i2c@vger.kernel.org>; Mon, 24 Nov 2025 06:53:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJqgg2iQDOpERxjlPGYu6EonASEapFbFdktKxbZz2tN+tTfRu2ZCWVRo+6UKpRphEtfEzLuuBjcG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBTYKVzmDPTxRC5vCGKHtISX9kAraOUDR9jNBA8NqZ3yHA6lGO
	qolMx4n8IdKg+ARsguTT8bh4lgfTY073A1q2uKHOlFbxyXfukHbL4tj33LNDP9o1bYnDRCvVvj9
	ypjkxwSPQ8gtR92qpa6huWFcqUKs+qA==
X-Google-Smtp-Source: AGHT+IFMnKpbOKpALlRbon6njvQlHioDFBZ6ps4Ha77/hkzyeDp8YHGtY6SBZLINsmH8f54C5ek7l5d85xk5VAIwd4A=
X-Received: by 2002:a05:6402:26c3:b0:639:f7b5:9c2d with SMTP id
 4fb4d7f45d1cf-6455444987cmr9474492a12.9.1763996016204; Mon, 24 Nov 2025
 06:53:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
 <20251015071420.1173068-2-herve.codina@bootlin.com> <f74ab0a2-b74b-4b96-8469-a716c850e230@gmail.com>
In-Reply-To: <f74ab0a2-b74b-4b96-8469-a716c850e230@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 24 Nov 2025 08:53:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJDOYuzutMHMeFAogd5a_OX6Hwi8Gwz1Vy7HpXgNeYKsg@mail.gmail.com>
X-Gm-Features: AWmQ_bmYzp1pjz08UuT7I12fxIYXbO1yVvjH9IMl7-quEF7iTRxZTROtz2B7mnw
Message-ID: <CAL_JsqJDOYuzutMHMeFAogd5a_OX6Hwi8Gwz1Vy7HpXgNeYKsg@mail.gmail.com>
Subject: Re: [PATCH v4 01/29] Revert "treewide: Fix probing of devices in DT overlays"
To: Kalle Niemi <kaleposti@gmail.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mark Brown <broonie@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 8:48=E2=80=AFAM Kalle Niemi <kaleposti@gmail.com> w=
rote:
>
> On 10/15/25 10:13, Herve Codina wrote:
> > From: Saravana Kannan <saravanak@google.com>
> >
> > This reverts commit 1a50d9403fb90cbe4dea0ec9fd0351d2ecbd8924.
> >
> > While the commit fixed fw_devlink overlay handling for one case, it
> > broke it for another case. So revert it and redo the fix in a separate
> > patch.
> >
> > Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT overlays")
> > Reported-by: Herve Codina <herve.codina@bootlin.com>
> > Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgy=
o8x6=3D9F9rZ+-KzjOg@mail.gmail.com/
> > Closes: https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com=
/
> > Closes: https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.co=
m/
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > Link: https://lore.kernel.org/lkml/20240411235623.1260061-2-saravanak@g=
oogle.com/
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Acked-by: Mark Brown <broonie@kernel.org>
> > ---
> >   drivers/bus/imx-weim.c    | 6 ------
> >   drivers/i2c/i2c-core-of.c | 5 -----
> >   drivers/of/dynamic.c      | 1 -
> >   drivers/of/platform.c     | 5 -----
> >   drivers/spi/spi.c         | 5 -----
> >   5 files changed, 22 deletions(-)
> >
> > diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
> > index 83d623d97f5f..87070155b057 100644
> > --- a/drivers/bus/imx-weim.c
> > +++ b/drivers/bus/imx-weim.c
> > @@ -327,12 +327,6 @@ static int of_weim_notify(struct notifier_block *n=
b, unsigned long action,
> >                                "Failed to setup timing for '%pOF'\n", r=
d->dn);
> >
> >               if (!of_node_check_flag(rd->dn, OF_POPULATED)) {
> > -                     /*
> > -                      * Clear the flag before adding the device so tha=
t
> > -                      * fw_devlink doesn't skip adding consumers to th=
is
> > -                      * device.
> > -                      */
> > -                     rd->dn->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DEVICE=
;
> >                       if (!of_platform_device_create(rd->dn, NULL, &pde=
v->dev)) {
> >                               dev_err(&pdev->dev,
> >                                       "Failed to create child device '%=
pOF'\n",
> > diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> > index eb7fb202355f..30b48a428c0b 100644
> > --- a/drivers/i2c/i2c-core-of.c
> > +++ b/drivers/i2c/i2c-core-of.c
> > @@ -176,11 +176,6 @@ static int of_i2c_notify(struct notifier_block *nb=
, unsigned long action,
> >                       return NOTIFY_OK;
> >               }
> >
> > -             /*
> > -              * Clear the flag before adding the device so that fw_dev=
link
> > -              * doesn't skip adding consumers to this device.
> > -              */
> > -             rd->dn->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DEVICE;
> >               client =3D of_i2c_register_device(adap, rd->dn);
> >               if (IS_ERR(client)) {
> >                       dev_err(&adap->dev, "failed to create client for =
'%pOF'\n",
> > diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> > index 2eaaddcb0ec4..b5be7484fb36 100644
> > --- a/drivers/of/dynamic.c
> > +++ b/drivers/of/dynamic.c
> > @@ -225,7 +225,6 @@ static void __of_attach_node(struct device_node *np=
)
> >       np->sibling =3D np->parent->child;
> >       np->parent->child =3D np;
> >       of_node_clear_flag(np, OF_DETACHED);
> > -     np->fwnode.flags |=3D FWNODE_FLAG_NOT_DEVICE;
> >
> >       raw_spin_unlock_irqrestore(&devtree_lock, flags);
> >
> > diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> > index f77cb19973a5..ef9445ba168b 100644
> > --- a/drivers/of/platform.c
> > +++ b/drivers/of/platform.c
> > @@ -739,11 +739,6 @@ static int of_platform_notify(struct notifier_bloc=
k *nb,
> >               if (of_node_check_flag(rd->dn, OF_POPULATED))
> >                       return NOTIFY_OK;
> >
> > -             /*
> > -              * Clear the flag before adding the device so that fw_dev=
link
> > -              * doesn't skip adding consumers to this device.
> > -              */
> > -             rd->dn->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DEVICE;
> >               /* pdev_parent may be NULL when no bus platform device */
> >               pdev_parent =3D of_find_device_by_node(parent);
> >               pdev =3D of_platform_device_create(rd->dn, NULL,
> > diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> > index 2e0647a06890..b22944a207c9 100644
> > --- a/drivers/spi/spi.c
> > +++ b/drivers/spi/spi.c
> > @@ -4791,11 +4791,6 @@ static int of_spi_notify(struct notifier_block *=
nb, unsigned long action,
> >                       return NOTIFY_OK;
> >               }
> >
> > -             /*
> > -              * Clear the flag before adding the device so that fw_dev=
link
> > -              * doesn't skip adding consumers to this device.
> > -              */
> > -             rd->dn->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DEVICE;
> >               spi =3D of_register_spi_device(ctlr, rd->dn);
> >               put_device(&ctlr->dev);
> >
> Sorry, some of you will receive this message now for second time. First
> message was sent to older series of patches.
> -
>
> Hello,
>
> Test system testing drivers for ROHM ICs bisected this commit to cause
> BD71847 drivers probe to not be called.

This driver (and overlay support) is in linux-next or something out of
tree on top of linux-next?

Rob

