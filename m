Return-Path: <linux-i2c+bounces-11676-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EC0AEBE98
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 19:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A84E81C61C39
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 17:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303762EA742;
	Fri, 27 Jun 2025 17:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDaBKqc7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38311F09A5;
	Fri, 27 Jun 2025 17:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751046589; cv=none; b=mrtoOWlqW8Dh8KD+cyxOX9Ujyaev9nbykkS7MyIp5FHp3Zgyg7ZIVoi15vwG9GEBBAPzhoFY13wHobAm9soatPvvFg3OGw0eu84ZE8JVj3cwwmCIEd8ZzjJTy+GTWQy8ruQ6AcxTW2R0t0shzNGaIl1RI/ZksXyv1owND1sSddg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751046589; c=relaxed/simple;
	bh=fENVGkGcV01nrx8rwyk5yc++tYlpmC/4in3yTWfI+BU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bbMFCZQLINv8QjrLvBc/yfPykhqqF9Cjo00k07ZXilnMn4yDazQ7C/SvMyecXvCsF8WMGL9IFdw7fpWMb9tmE5phn7r/d/9EVwcsZ5TjFU2WKkPgW5Y7hJ9aXuPPnbhW/sEMY7UJVc5IfhyclqB6xT5VSfbNh8BXO7B8Z0lXDdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QDaBKqc7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C83C4CEFB;
	Fri, 27 Jun 2025 17:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751046589;
	bh=fENVGkGcV01nrx8rwyk5yc++tYlpmC/4in3yTWfI+BU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QDaBKqc73OAck/HvM0EVd5wtKUjUN7GPsOvpdjQ9yxQfT7gPphE3WJUX18LD5I3cV
	 3I0DsaAXNiZrzbAjgH5RmUIHzuGV+il3/DAWKdEl1GqN7pgoGcBq/ue07wIRoUWsUt
	 DTpXWcdsABzLOk1esyLFQ6+vPQhDQTQrIl2/oW859p+ENQfTmHeQIpUI/tNrE7f6Jx
	 0HaPtNPil8h6RVpt0LhQKj8TbFYuz1YRJsqIZTzOr7g9NNuWwvAtNNz3sRmHxoyX4R
	 hw1JP/ra1GDPoCgdErvqrQrL0xl6DZHuw+Uqxk597rbpThcBDon2oxslqivu081ygM
	 1Gw7oJVnPaDng==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ade5a0442dfso452627066b.1;
        Fri, 27 Jun 2025 10:49:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFcL3o8K4XcNCCwr/1Hn0poOddvQhQrl+98rz+OBpFX0ptmAaBjOFw2icmYhyPxanLDzt3Bs9Dsyz0@vger.kernel.org, AJvYcCV85OlD2kqLMH+Ja/mtvbCkla+glBX8wqNUUJe/yG2gHde+uYriYhSDOkr7yXOZpsmD6xnF8lws+cCI9g==@vger.kernel.org, AJvYcCVR33dTuoHXsGzVCTB+FMM8EMK9TJJo7JifLED2McI1RRmgmyuqnfMG7VQFSvbYyiojIpq/mrIRLMOINlny@vger.kernel.org, AJvYcCWnhdWYwqlaZEF2RE2uYpmQ//qLwa151J0iS4Vc8EJLhuZIxCl4pwBgYqcb+LIfH5uwVLFzvbLiBax7@vger.kernel.org, AJvYcCWrHIQdkFKqtu3aTQe3Rth8wTXCPpm4S9x5flUxxc26wlhd32JcGCxnhS/5ODR1wgyqwBYj/osYKFVE@vger.kernel.org, AJvYcCWympIu3XRPp0mybc36H/IdWUAq6GKlRTipRzrnuDEVdVT8/2HOhpdqq3/Mv597Gfh22MM2szwKsm7D@vger.kernel.org, AJvYcCXj269BJATXYJKaiwemrLrVPs3JuriT1yFOyGMIRecNlIeyCDGPUqOuYgRCRfP/dpshlW+Q0PgCADAZ@vger.kernel.org, AJvYcCXzOxcNMxXblyIensO8v/yRIGHlv0jZgNvVzCw8BGJKBIKV5e3X3ZJb0mhP+ST5jENabLIVP50ZB1mF@vger.kernel.org
X-Gm-Message-State: AOJu0YztsrCYPhCat9rSiG0ZJpXcwuYjAABZTfK3HEg+1YoO9IEcQB6U
	6JMZVZ7qUx6Vj1mNIyivWMcUXoAXi2TaGRiXtHa0r8CM5UIQwJPg1t8nyXWRj+7v6n7rJr7Gv6w
	agkHDNUDKa82cwRcNh3KZXbHHACzjlg==
X-Google-Smtp-Source: AGHT+IHT5hz4lr0pRGvdH2rjBfGZM81PcOoFrAQguTcQw3WkJwjxgHpGim6dbfGwqFeg5PpW/uAYH3Ohif/f2EVITXw=
X-Received: by 2002:a17:907:cb86:b0:ae3:55bd:7724 with SMTP id
 a640c23a62f3a-ae355bd77f6mr319698366b.37.1751046587752; Fri, 27 Jun 2025
 10:49:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-19-herve.codina@bootlin.com> <20250627162245.GA3513535-robh@kernel.org>
 <aF7H4-toeb7Ouz3d@smile.fi.intel.com>
In-Reply-To: <aF7H4-toeb7Ouz3d@smile.fi.intel.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 27 Jun 2025 12:49:36 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJCuevzu69bx3yWm3ZR9wZ+UsWuNXscig5KMm2WH4WxOw@mail.gmail.com>
X-Gm-Features: Ac12FXz-QVHJXTEek87UkxSujkajQAR7GpuL-shCkOttrl-AQQGXN_bA70yoM5c
Message-ID: <CAL_JsqJCuevzu69bx3yWm3ZR9wZ+UsWuNXscig5KMm2WH4WxOw@mail.gmail.com>
Subject: Re: [PATCH v3 18/28] of: property: Allow fw_devlink device-tree on
 x86 when PCI device-tree node creation is enabled
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Davidlohr Bueso <dave@stgolabs.net>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 11:33=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jun 27, 2025 at 11:22:45AM -0500, Rob Herring wrote:
> > On Fri, Jun 13, 2025 at 03:47:58PM +0200, Herve Codina wrote:
>
> ...
>
> > > -   if (IS_ENABLED(CONFIG_X86))
> > > +   if (IS_ENABLED(CONFIG_X86) && !IS_ENABLED(CONFIG_PCI_DYNAMIC_OF_N=
ODES))
> >
> > I really want CONFIG_PCI_DYNAMIC_OF_NODES to go away at some point, not
> > add more users.
> >
> > I think this should instead check for specific platforms not with
> > kconfig symbols but DT properties. For ce4100, you can just check the
> > root compatible string. For OLPC, there isn't a root compatible (in the
> > DT I have). You could check for /architecture =3D=3D OLPC instead. Ther=
e's
> > some virtualization guests using DT now too. I would think their DT's
> > are simple enough to avoid any fw_devlink issues.
>
> I don't think this is good approach. The above check is more reliable in =
my
> opinion.

I'm fine with any solution that doesn't add a
CONFIG_PCI_DYNAMIC_OF_NODES which we can't remove. Adding it was a
kick the can down the road to merge the support worry the mixed
usecase (on ACPI systems) later. It's now later.

> > Alternatively, we could perhaps make x86 fw_devlink default off
>
> For my (little) knowledge I believe this is not feasible anymore.
> Some x86 code (drivers) relies on fw_devlink nowadays. But take
> this with grain of salt, I may be way mistaken.

Doesn't the CONFIG_X86 check disable it?

Rob

