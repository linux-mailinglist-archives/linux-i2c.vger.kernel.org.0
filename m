Return-Path: <linux-i2c+bounces-11005-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEDCABA3B3
	for <lists+linux-i2c@lfdr.de>; Fri, 16 May 2025 21:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADC9D7B8FE5
	for <lists+linux-i2c@lfdr.de>; Fri, 16 May 2025 19:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AAA27FD78;
	Fri, 16 May 2025 19:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgyYe8qW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82743272E63;
	Fri, 16 May 2025 19:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747423352; cv=none; b=rA8bC/UOAOm//dRIbv7YhiTz61K2FqnLuokIQMR4D6VD9OA/h55gKd/cfhM24M3glzUbOMONzZVW7QHtIcqMsWV4naNBE/WdeJPOelMRrhsGsq3gegcGKpkTx+bifS3/Po0rLgIybEgNjpceOCm3w0PSfgdsgwjzR8s+sUN6IuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747423352; c=relaxed/simple;
	bh=Ek77gpLsXz/q8aiOBEfN+u6gnh5zOQSz5ZZsCaFKCqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3HZ7OH2ll2DXWbXgqCo0djHV1lQtHJvpFhSWrxJICaecEmnBuAxBEjyoXYnA9MuPvPCB0eS/hc5l8NGlix+WbKx8tNIoPHEotS/QTbnzc7HHuqIyJ4JCuSyYotGmezTNaYVHvic8KQfbgfN5K4B/lyB28ivooCfhtFT/uVbmIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UgyYe8qW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02949C4CEFB;
	Fri, 16 May 2025 19:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747423352;
	bh=Ek77gpLsXz/q8aiOBEfN+u6gnh5zOQSz5ZZsCaFKCqc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UgyYe8qWv8jACWqJlHcosSTse6jWsZHzFaz87voEx0CrsIm4cdhQylJ9nrvzj/U4I
	 LlUX3BMhSxPY+i9tZZr1CvqvhX2jsKF5PXdUJ3Otga8Swz4zA/EE+HdIL8MDFMrHSU
	 dyv/LRXTo9vQNWviPLi8fWhS/JHMnixXD1K3HFm/qgWwDl170tMK9Eh/R6e0fKwp3h
	 xQDVtZU+w2FfBW9YFfU6OPDrtEywqpZpoVJtUcptG8ok/EVDAs/IPIRTM2tW29aQ1P
	 jS3bC3GDVNXYZjMnPzmLQ+aSH/jr/PG1zd+3Y9Z7zQBwQBfgwzG07DcUjYyRdKjgSb
	 OSirgm+ZjvvSg==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2d071fcd89bso252653fac.3;
        Fri, 16 May 2025 12:22:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUg2GpoNCyE3DbwvwB88MfWPukyq2k4FIQ0l+OcPKs/xtWOY66Bnpuh4cjXQ4dcEcweEfgX687rIWs2@vger.kernel.org, AJvYcCV4EpIr2tNEBV+OOpvE2DOVaBAmPorU5Fa0/5Dcvzl7bqhieQ1aG4Ve1P6cNO/7pDNUXticYZQnSgEH2qbX@vger.kernel.org, AJvYcCVnCpoIQy8wmdrTDQWGR8lhQsEYPEaohshkv4/0Y8m/ZI3aRjqYnPOqAs1A7Jhpqa/3lYdsAKB5Ubrr@vger.kernel.org, AJvYcCWDRBJhVdxK/qVdKZSoWJ9PqGsGRZIZzazCq+CyfEF9H7VuFQeaDHYNr9Kb2sRbqSAGUvr4rvNhmskW@vger.kernel.org, AJvYcCX9HSXXbmXBQsnm8K8h9+YDL/RsH1SWNC/Hdl+zh1mG9cG/P4xVndgkxOF6tLapfjpI+a/T5uhCGQlb@vger.kernel.org, AJvYcCXeCISqGEdTCyxTrxcDP4UNuUdYENQxgfjfTms9P0GehiiMONbldvPpm59S6leEXEZ/4eJGvgIL9QvK@vger.kernel.org, AJvYcCXwmkRwvGbobMGcijpZRTX71h1ucYUp46kDLdHk70MHM6k3VmXgBPEqKnNH+suh41fA+FSRCMG66AjhMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHdrBHQhqi6v4/tJhmkRujL280S9n9BCgnqKZEJBggpXR8dPNF
	fZ0AB50/MqCYBAkLSdTa/fCym5ojpLEFXWskS0i98rQUCmONMnhj7GwHAByPXuz/WxchCNmAU3o
	/BodwVqACje/KkJ2o6tH0bub6H+8PwEo=
X-Google-Smtp-Source: AGHT+IGl/Xh2m5Yioj8nj711hLigDhrXfyaCMYocztPRG3qWM9ptNmcZPxoSwPv1HnQirxUyGT+7+NI2qwMqctosLrA=
X-Received: by 2002:a05:6870:2484:b0:2d5:a360:7df9 with SMTP id
 586e51a60fabf-2e3c1b67803mr2961587fac.5.1747423351159; Fri, 16 May 2025
 12:22:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507071315.394857-1-herve.codina@bootlin.com> <20250507071315.394857-6-herve.codina@bootlin.com>
In-Reply-To: <20250507071315.394857-6-herve.codina@bootlin.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 16 May 2025 21:22:20 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iL9-JzTzE7pYTJGuB1BbrE6L12K2FKNpQ8dhX9GureJw@mail.gmail.com>
X-Gm-Features: AX0GCFvpCPNT-ZeaAeVtc8DjE00SK05z3r-qk3RyVev5M5-s80SOM3ivZ1irWZU
Message-ID: <CAJZ5v0iL9-JzTzE7pYTJGuB1BbrE6L12K2FKNpQ8dhX9GureJw@mail.gmail.com>
Subject: Re: [PATCH v2 05/26] bus: simple-pm-bus: Populate child nodes at probe
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 9:13=E2=80=AFAM Herve Codina <herve.codina@bootlin.c=
om> wrote:
>
> The simple-pm-bus drivers handles several simple bus. When it is used

s/drivers/driver/ (I think)
s/simple bus/simple busses/

> with busses other than a compatible "simple-pm-bus", it don't populate

s/it don't/it doesn't/

> its child devices during its probe.
>
> This confuses fw_devlink and results in wrong or missing devlinks.

Well, fair enough, but doesn't it do that for a reason?

> Once a driver is bound to a device and the probe() has been called,
> device_links_driver_bound() is called.
>
> This function performs operation based on the following assumption:
>     If a child firmware node of the bound device is not added as a
>     device, it will never be added.
>
> Among operations done on fw_devlinks of those "never be added" devices,
> device_links_driver_bound() changes their supplier.
>
> With devices attached to a simple-bus compatible device, this change
> leads to wrong devlinks where supplier of devices points to the device
> parent (i.e. simple-bus compatible device) instead of the device itself
> (i.e. simple-bus child).
>
> When the device attached to the simple-bus is removed, because devlinks
> are not correct, its consumers are not removed first.
>
> In order to have correct devlinks created, make the simple-pm-bus driver
> compliant with the devlink assumption and create its child devices
> during its probe.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/bus/simple-pm-bus.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> index d8e029e7e53f..93c6ba605d7a 100644
> --- a/drivers/bus/simple-pm-bus.c
> +++ b/drivers/bus/simple-pm-bus.c
> @@ -42,14 +42,14 @@ static int simple_pm_bus_probe(struct platform_device=
 *pdev)
>         match =3D of_match_device(dev->driver->of_match_table, dev);
>         /*
>          * These are transparent bus devices (not simple-pm-bus matches) =
that
> -        * have their child nodes populated automatically.  So, don't nee=
d to
> -        * do anything more. We only match with the device if this driver=
 is
> -        * the most specific match because we don't want to incorrectly b=
ind to
> -        * a device that has a more specific driver.
> +        * have their child nodes populated automatically. So, don't need=
 to
> +        * do anything more except populate child nodes.

The above part of the comment has become hard to grasp after the
change.  In particular, why populate child notes if they are populated
automatically?

> + We only match with the
> +        * device if this driver is the most specific match because we do=
n't
> +        * want to incorrectly bind to a device that has a more specific =
driver.
>          */
>         if (match && match->data) {
>                 if (of_property_match_string(np, "compatible", match->com=
patible) =3D=3D 0)
> -                       return 0;
> +                       goto populate;

Doesn't this interfere with anything, like the automatic population of
child nodes mentioned in the comment?

>                 else
>                         return -ENODEV;
>         }
> @@ -64,13 +64,14 @@ static int simple_pm_bus_probe(struct platform_device=
 *pdev)
>
>         dev_set_drvdata(&pdev->dev, bus);
>
> -       dev_dbg(&pdev->dev, "%s\n", __func__);
> -
>         pm_runtime_enable(&pdev->dev);
>
> +populate:
>         if (np)
>                 of_platform_populate(np, NULL, lookup, &pdev->dev);
>
> +       dev_dbg(&pdev->dev, "%s\n", __func__);

So how to distinguish between devices that only have child nodes
populated and the ones that have drvdata set?

> +
>         return 0;
>  }
>
> @@ -78,12 +79,16 @@ static void simple_pm_bus_remove(struct platform_devi=
ce *pdev)
>  {
>         const void *data =3D of_device_get_match_data(&pdev->dev);
>
> -       if (pdev->driver_override || data)
> +       if (pdev->driver_override)
>                 return;
>
>         dev_dbg(&pdev->dev, "%s\n", __func__);
>
> -       pm_runtime_disable(&pdev->dev);
> +       if (pdev->dev.of_node)
> +               of_platform_depopulate(&pdev->dev);
> +
> +       if (!data)
> +               pm_runtime_disable(&pdev->dev);
>  }
>
>  static int simple_pm_bus_runtime_suspend(struct device *dev)
> --

