Return-Path: <linux-i2c+bounces-14298-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EC9C8C9A7
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 02:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 392ED3B4897
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 01:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3BA2356C9;
	Thu, 27 Nov 2025 01:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3Oy2PuI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8C942050
	for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 01:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764208487; cv=none; b=h4vgLlbBEnuzd2Dhm933zAAFZWS390Bs/CrrlT8LfvnD9kgdMJ4Cb/9a4UoU/rrUOq4EVRYYzUTptw9tQF3wgjqEdKdLwEa6cwwPgUH+doJTTzwILa5hYdFL4+q1B95MWDSEMG0eXvyhk1sPZB2qkneB7UKBWj54UL+kFcp+MpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764208487; c=relaxed/simple;
	bh=f0EdgUznNZO54LZecInfA4y5+ELOv8o96l9SDsv2F0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uocZ5L3VRbbeiYTgxpgL4nP3FfArnDnMT7+EvYGbCh6sJROul3ns2OEmAoSjw+TSyVXAkq1gzQEiosfn/Ruhdp0d8DadGWD0Lq/aGwsEej57Wh0LUuHxJeVf2SYRcy3jqjzkotPvVK+5aWKeHTR2AaSuwBJH2qSosP6GiIvr18g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e3Oy2PuI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AB4C116C6
	for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 01:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764208486;
	bh=f0EdgUznNZO54LZecInfA4y5+ELOv8o96l9SDsv2F0k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e3Oy2PuIRVyYpX9jNitvWPFzXas2PMbyATpc2928NtxLJraxbQwSUdIwnW6wG2wao
	 muCzWNAzr3gs7gh9NhR3L5m30waMtP6zV+5ml4QlYDe1LvsJVGugH3q3MPepKnOBhN
	 sqBEX9h2jiicZUil2xgm/E43ZekOqTPu6Ksi+0Kbl8xIvG8siN1gZLyAu0DZgRMhpq
	 xJ0qFDhXSiGr8LcYluXXH2sNbDB7xofFj34H8BnvxKE6T93lBlwukgVHVpdQxtiYrC
	 0o5ReshKqWaf+Ch5mkV059dZn1R+0ls7+OlqVxg+oM50dIpXci6fcrdTLwLXog8+XN
	 rwrVAU8azfpmg==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6417313bddaso648987a12.3
        for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 17:54:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUR/jUFWx9yg/XOrXCHDsy0o/Iup/mdnyHDB73jp6Z6FKYC1vT366ZVT/YIFVf3TnXgBkY8XDAIq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdykjC0BMAdfq+cK2PXVPhFZFi+NNeWbQlWr1MD8qJvMbnIEw1
	azvjO6lJNIN0ekBJycjhfx5Cg4EJjvovylVQpSUBuh1Mw7CXwIkZU0dU0F/YczyztgZxosuoWFs
	l2L4ayV79otkfQlhmxnTRiCEq7qSt5Q==
X-Google-Smtp-Source: AGHT+IEKWFjQTeH/gw4l8j+96xvyDrFErJSXFFFwjwYJm2zw06q8mwVDlJH1+0djMgauaqAXyS9qMnoqGjEF33qExow=
X-Received: by 2002:a05:6402:2803:b0:634:ce70:7c5 with SMTP id
 4fb4d7f45d1cf-645eb2b8003mr8895933a12.17.1764208485058; Wed, 26 Nov 2025
 17:54:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
 <20251015071420.1173068-2-herve.codina@bootlin.com> <f74ab0a2-b74b-4b96-8469-a716c850e230@gmail.com>
 <CAL_JsqJDOYuzutMHMeFAogd5a_OX6Hwi8Gwz1Vy7HpXgNeYKsg@mail.gmail.com>
 <5cf2a12a-7c66-4622-b4a9-14896c6df005@gmail.com> <CAL_JsqJjm12LxpDg6LmpY=Ro_keHwnrWiYMLVnG=s_pSP4X2WQ@mail.gmail.com>
 <072dde7c-a53c-4525-83ac-57ea38edc0b5@gmail.com>
In-Reply-To: <072dde7c-a53c-4525-83ac-57ea38edc0b5@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 26 Nov 2025 19:54:33 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKyG98pXGKpL=gxSc92izpzN7YCdq62ZJByhE6aFYs1fw@mail.gmail.com>
X-Gm-Features: AWmQ_bmOuLhKUl5W5zrcj5AQOjs5kC_X5Om5_otgYtq0JTdMygrEymDVT57WU48
Message-ID: <CAL_JsqKyG98pXGKpL=gxSc92izpzN7YCdq62ZJByhE6aFYs1fw@mail.gmail.com>
Subject: Re: [PATCH v4 01/29] Revert "treewide: Fix probing of devices in DT overlays"
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Kalle Niemi <kaleposti@gmail.com>, Herve Codina <herve.codina@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

On Tue, Nov 25, 2025 at 12:43=E2=80=AFAM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:
>
> On 24/11/2025 19:01, Rob Herring wrote:
> > On Mon, Nov 24, 2025 at 10:44=E2=80=AFAM Kalle Niemi <kaleposti@gmail.c=
om> wrote:
> >>
> >>
> >> On 11/24/25 16:53, Rob Herring wrote:
> >>> On Mon, Nov 24, 2025 at 8:48=E2=80=AFAM Kalle Niemi <kaleposti@gmail.=
com> wrote:
> >>>> On 10/15/25 10:13, Herve Codina wrote:
> >>>>> From: Saravana Kannan <saravanak@google.com>
> >>>>>
> >>>>> This reverts commit 1a50d9403fb90cbe4dea0ec9fd0351d2ecbd8924.
> >>>>>
> >>>>> While the commit fixed fw_devlink overlay handling for one case, it
> >>>>> broke it for another case. So revert it and redo the fix in a separ=
ate
> >>>>> patch.
> >>>>>
> >>>>> Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT overla=
ys")
> >>>>> Reported-by: Herve Codina <herve.codina@bootlin.com>
> >>>>> Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_=
rJgyo8x6=3D9F9rZ+-KzjOg@mail.gmail.com/
> >>>>> Closes: https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin=
.com/
> >>>>> Closes: https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootli=
n.com/
> >>>>> Signed-off-by: Saravana Kannan <saravanak@google.com>
> >>>>> Link: https://lore.kernel.org/lkml/20240411235623.1260061-2-saravan=
ak@google.com/
> >>>>> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> >>>>> Acked-by: Mark Brown <broonie@kernel.org>
> >>>>> ---
> >>>>>     drivers/bus/imx-weim.c    | 6 ------
> >>>>>     drivers/i2c/i2c-core-of.c | 5 -----
> >>>>>     drivers/of/dynamic.c      | 1 -
> >>>>>     drivers/of/platform.c     | 5 -----
> >>>>>     drivers/spi/spi.c         | 5 -----
> >>>>>     5 files changed, 22 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
> >>>>> index 83d623d97f5f..87070155b057 100644
> >>>>> --- a/drivers/bus/imx-weim.c
> >>>>> +++ b/drivers/bus/imx-weim.c
> >>>>> @@ -327,12 +327,6 @@ static int of_weim_notify(struct notifier_bloc=
k *nb, unsigned long action,
> >>>>>                                  "Failed to setup timing for '%pOF'=
\n", rd->dn);
> >>>>>
> >>>>>                 if (!of_node_check_flag(rd->dn, OF_POPULATED)) {
> >>>>> -                     /*
> >>>>> -                      * Clear the flag before adding the device so=
 that
> >>>>> -                      * fw_devlink doesn't skip adding consumers t=
o this
> >>>>> -                      * device.
> >>>>> -                      */
> >>>>> -                     rd->dn->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DE=
VICE;
> >>>>>                         if (!of_platform_device_create(rd->dn, NULL=
, &pdev->dev)) {
> >>>>>                                 dev_err(&pdev->dev,
> >>>>>                                         "Failed to create child dev=
ice '%pOF'\n",
> >>>>> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> >>>>> index eb7fb202355f..30b48a428c0b 100644
> >>>>> --- a/drivers/i2c/i2c-core-of.c
> >>>>> +++ b/drivers/i2c/i2c-core-of.c
> >>>>> @@ -176,11 +176,6 @@ static int of_i2c_notify(struct notifier_block=
 *nb, unsigned long action,
> >>>>>                         return NOTIFY_OK;
> >>>>>                 }
> >>>>>
> >>>>> -             /*
> >>>>> -              * Clear the flag before adding the device so that fw=
_devlink
> >>>>> -              * doesn't skip adding consumers to this device.
> >>>>> -              */
> >>>>> -             rd->dn->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DEVICE;
> >>>>>                 client =3D of_i2c_register_device(adap, rd->dn);
> >>>>>                 if (IS_ERR(client)) {
> >>>>>                         dev_err(&adap->dev, "failed to create clien=
t for '%pOF'\n",
> >>>>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> >>>>> index 2eaaddcb0ec4..b5be7484fb36 100644
> >>>>> --- a/drivers/of/dynamic.c
> >>>>> +++ b/drivers/of/dynamic.c
> >>>>> @@ -225,7 +225,6 @@ static void __of_attach_node(struct device_node=
 *np)
> >>>>>         np->sibling =3D np->parent->child;
> >>>>>         np->parent->child =3D np;
> >>>>>         of_node_clear_flag(np, OF_DETACHED);
> >>>>> -     np->fwnode.flags |=3D FWNODE_FLAG_NOT_DEVICE;
> >>>>>
> >>>>>         raw_spin_unlock_irqrestore(&devtree_lock, flags);
> >>>>>
> >>>>> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> >>>>> index f77cb19973a5..ef9445ba168b 100644
> >>>>> --- a/drivers/of/platform.c
> >>>>> +++ b/drivers/of/platform.c
> >>>>> @@ -739,11 +739,6 @@ static int of_platform_notify(struct notifier_=
block *nb,
> >>>>>                 if (of_node_check_flag(rd->dn, OF_POPULATED))
> >>>>>                         return NOTIFY_OK;
> >>>>>
> >>>>> -             /*
> >>>>> -              * Clear the flag before adding the device so that fw=
_devlink
> >>>>> -              * doesn't skip adding consumers to this device.
> >>>>> -              */
> >>>>> -             rd->dn->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DEVICE;
> >>>>>                 /* pdev_parent may be NULL when no bus platform dev=
ice */
> >>>>>                 pdev_parent =3D of_find_device_by_node(parent);
> >>>>>                 pdev =3D of_platform_device_create(rd->dn, NULL,
> >>>>> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> >>>>> index 2e0647a06890..b22944a207c9 100644
> >>>>> --- a/drivers/spi/spi.c
> >>>>> +++ b/drivers/spi/spi.c
> >>>>> @@ -4791,11 +4791,6 @@ static int of_spi_notify(struct notifier_blo=
ck *nb, unsigned long action,
> >>>>>                         return NOTIFY_OK;
> >>>>>                 }
> >>>>>
> >>>>> -             /*
> >>>>> -              * Clear the flag before adding the device so that fw=
_devlink
> >>>>> -              * doesn't skip adding consumers to this device.
> >>>>> -              */
> >>>>> -             rd->dn->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DEVICE;
> >>>>>                 spi =3D of_register_spi_device(ctlr, rd->dn);
> >>>>>                 put_device(&ctlr->dev);
> >>>>>
> >>>> Sorry, some of you will receive this message now for second time. Fi=
rst
> >>>> message was sent to older series of patches.
> >>>> -
> >>>>
> >>>> Hello,
> >>>>
> >>>> Test system testing drivers for ROHM ICs bisected this commit to cau=
se
> >>>> BD71847 drivers probe to not be called.
> >>> This driver (and overlay support) is in linux-next or something out o=
f
> >>> tree on top of linux-next?
> >>>
> >>> Rob
> >>
> >> Yes the driver is in mainline linux: /drivers/mfd/rohm-bd718x7.c
> >
> > I don't see any support to apply overlays in that driver.
>
> Ah. Sorry for the confusion peeps. I asked Kalle to report this without
> proper consideration. 100% my bad.
>
> While the bd718x7 drive indeed is mainline (and tested), the actual
> 'glue-code' doing the overlay is part of the downstream test
> infrastructure. So yes, this is not a bug in upstream kernel - this
> falls in the category of an upstream change causing downstream things to
> break. So, feel free to say: "Go fix your code" :)
>
> Now that this is sorted, if someone is still interested in helping us to
> get our upstream drivers tested - the downstream piece is just taking
> the compiled device-tree overlay at runtime (via bin-attribute file),
> and applying it using the of_overlay_fdt_apply(). The approach is
> working for our testing purposes when the device is added to I2C/SPI
> node which is already enabled. However, in case where we have the I2C
> disabled, and enable it in the same overlay where we add the new device
> - then the new device does not get probed.
>
> I would be really grateful if someone had a pointer for us.

Seems to be fw_devlink related. I suppose if you turn it off it works?
There's info about the dependencies in sysfs or maybe debugfs. I don't
remember the details, but that should help to tell you why things
aren't probing.

I've dropped the changes for 6.18 for now. No one really seems to be
in need of them yet AFAICT.

Rob

