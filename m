Return-Path: <linux-i2c+bounces-14070-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A8703C542F4
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Nov 2025 20:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C04DB4F3CB1
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Nov 2025 19:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDAAE34EF0E;
	Wed, 12 Nov 2025 19:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="szv3xAGH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793C434E75D
	for <linux-i2c@vger.kernel.org>; Wed, 12 Nov 2025 19:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762975764; cv=none; b=e3XRdSqbr/TorSlOwQYo/NV0t4Ar+9ningLmcYnwzU6d3syZ5CKyusnTIc5LOeCYDEoRTYHtK9Eg6VUZytrZVZlBQuIO7argsRaVzfmBcme7jWZsFJwg2VbauwZCZHJRuJNUSv8bgzW5kjxftFjLPtv9g7mIF/1QRnTXoOqzZtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762975764; c=relaxed/simple;
	bh=cBs5VsCM5bkQCwAVcWEWV1HKeCFrZdeAh6gx6vjF0Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ru6qZc81xyYbl7+8QU94jnbivuxnuUGkQsf7ZIItin/YziWaA+5eTkNtBtMF/iSbVyVIs21NrPB+iGRHiFdvM6nSo4SwKSfZV9aeozCszmKbBHDqq8lyGQvPcr7Gy1LOQmwmjp3SzHklBTd6Iv6cmIJ13OIHAA7GLvOUj5WdNIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=szv3xAGH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE3AC2BCB9
	for <linux-i2c@vger.kernel.org>; Wed, 12 Nov 2025 19:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762975764;
	bh=cBs5VsCM5bkQCwAVcWEWV1HKeCFrZdeAh6gx6vjF0Ps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=szv3xAGH5agPEKMl9f7UkYYhRkgqB9AKS9v5496ledDdhmin+wBReWGI/iRlnpyNh
	 HbYV6ylofcN/goxA5r50ITFCx+VPTD/XMpI2F+HTqWiVmXb4Ba/WsGQCub3AicyInu
	 Ow8oG5q2NYNmka0aHseXh9DODZAbXJhxzKQn2f73gxSmsRUPvvLd8anRteQ9sj444E
	 /Mlx1OFvwWRhC3fmxGHHwnyMo6Hor+kqovSGQ/g/qG38H4WqSasIzCVRFPRQ6h+h2M
	 RQDZlilfFhJd8BVjaxhYZ0q9NyXQ9nvv3D3ovq7RmI7DOt7/d/Xw+wRa1dkg9PJaol
	 ZbIunWXzgsM/A==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6419e6dab7fso12907a12.2
        for <linux-i2c@vger.kernel.org>; Wed, 12 Nov 2025 11:29:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUyn7F3saTGmVxayEatRUmRuGpmZnsuOTY8wXRWN3gWgTDyM0a71yLkApOyXeQiO9sOclTQft5bYuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHzNXz5e4Aaav3se2SGiUZdUUnYQPYG4aC+yxHYmaZ82yxfYuH
	CF8OktwGe9WKz/R+CBc+e6h86u3T4/VRtfGV5p+dp4JIUkpkmAUC5gx0rJkcqC7hEC4esuU7Zdn
	eHtzZPNKf6bfkFaK3r0EnG5NOEodAQw==
X-Google-Smtp-Source: AGHT+IHHsq6g1iGPfNpj/BGp5eL9w+14A+MEbPOCADp6BJOBMQBWxT0j5cv1w9FevsaSK63J53W6goPTLfg5SnHB+/k=
X-Received: by 2002:a05:6402:34ce:b0:63b:ef0e:dfa7 with SMTP id
 4fb4d7f45d1cf-6431a4bfc9cmr3902960a12.6.1762975760981; Wed, 12 Nov 2025
 11:29:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
 <20251015071420.1173068-6-herve.codina@bootlin.com> <20251030141448.GA3853761-robh@kernel.org>
 <20251031162004.180d5e3f@bootlin.com> <20251112142632.GA1610836-robh@kernel.org>
In-Reply-To: <20251112142632.GA1610836-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 12 Nov 2025 13:29:09 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ89EcUvQnS0xYXOrw6wJ30TT5oFA85eCqHYdu43056cw@mail.gmail.com>
X-Gm-Features: AWmQ_bnvVqS34104BGAfHcYDtcOO0joqpBN-zpybKauFgaXAFRsInCQMBTqH6M4
Message-ID: <CAL_JsqJ89EcUvQnS0xYXOrw6wJ30TT5oFA85eCqHYdu43056cw@mail.gmail.com>
Subject: Re: [PATCH v4 05/29] dt-bindings: bus: Add simple-platform-bus
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
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

On Wed, Nov 12, 2025 at 8:26=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Oct 31, 2025 at 04:20:04PM +0100, Herve Codina wrote:
> > Hi Rob,
> >
> > On Thu, 30 Oct 2025 09:14:48 -0500
> > Rob Herring <robh@kernel.org> wrote:
> >
> > > On Wed, Oct 15, 2025 at 09:13:52AM +0200, Herve Codina wrote:
> > > > A Simple Platform Bus is a transparent bus that doesn't need a spec=
ific
> > > > driver to perform operations at bus level.
> > > >
> > > > Similar to simple-bus, a Simple Platform Bus allows to automaticall=
y
> > > > instantiate devices connected to this bus.
> > > >
> > > > Those devices are instantiated only by the Simple Platform Bus prob=
e
> > > > function itself.
> > >
> > > Don't let Greg see this... :)
> > >
> > > I can't say I'm a fan either. "Platform bus" is a kernel thing, and t=
he
> > > distinction here between the 2 compatibles is certainly a kernel thin=
g.
> > >
> > > I think this needs to be solved within the kernel.
> >
> > I fully agree with that.
> >
> > >
> > > What I previously said is define a list of compatibles to not
> > > instantiate the child devices. This would essentially be any case hav=
ing
> > > a specific compatible and having its own driver. So if someone has
> > > 'compatible =3D "vendor,not-so-simple-bus", "simple-bus"', when and i=
f
> > > they add a driver for "vendor,not-so-simple-bus", then they have to a=
dd
> > > the compatible to the list in the simple-pm-bus driver. I wouldn't
> > > expect this to be a large list. There's only a handful of cases where
> > > "simple-bus" has a more specific compatible. And only a few of those
> > > have a driver. A more general and complicated solution would be makin=
g
> > > linux handle 2 (or more) drivers matching a node and picking the driv=
er
> > > with most specific match. That gets complicated with built-in vs.
> > > modules. I'm not sure we really need to solve that problem.
> >
> > Right. Let discard the "more general and complicated solution" and focu=
s
> > on the list of compatible to avoid child devices instantiation.
> >
> > Do you mean that, for "simple-bus" compatible we should:
> >  - Remove the recursive device instantiation from of_platform_populate(=
).
>
> That may be a problem I hadn't considered. While we've solved most probe
> ordering issues, I think some may remain. Even when of_platform_populate(=
)
> is called affects this. For example, I tried removing various arm32
> of_platform_.*populate() calls which run earlier than the default call,
> but that broke some platforms. (Looking at the list of remaining ones, I
> fixed the at91 pinctrl/gpio drivers, but never tried to remove the
> calls again.)
>
> Maybe this can be restricted to cases which are not recursively created
> from the root node. Not sure how we detect that. Perhaps no OF_POPULATED
> flag on the parent node? Or we could just enable this for OF_DYNAMIC
> nodes? That should be sufficient for your usecase.

Thinking a bit more about this, I think you don't have to do anything.
If child nodes already got populated, calling of_platform_populate() a
second time is essentially a nop. And for cases you care about, that
wouldn't have happened. Of course, I'd still rather there only be 1
path that devices could have been instantiated.

Rob

