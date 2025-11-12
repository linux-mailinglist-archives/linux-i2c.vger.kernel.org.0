Return-Path: <linux-i2c+bounces-14068-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9FFC52CBA
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Nov 2025 15:48:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86B075050E8
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Nov 2025 14:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FA331355E;
	Wed, 12 Nov 2025 14:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4iXCp4z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24ED28A701;
	Wed, 12 Nov 2025 14:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762957595; cv=none; b=YyeFQAhQmhtzqfxbtxW7R4RobDeZ3/Lt3aVVoasmI0hxj7pZE1aNpuldL73QA73bUU8RvBw5fm1hHtQyc0OTzYr9xwIngyjqNMAThd29G2grah7kUkSDYQR2PSUXTxuEw7NFeRHma4a6M8vYkpvkFSkS8aUgAeGiIq6YHhJXkn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762957595; c=relaxed/simple;
	bh=bNLqGrg/bxt16UHYQqXWyzLbnJanuTnn/DSzlHMqam8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtqkH8KDJQJjkvIg1VxhtdsslmxVSp+JzGZ1eDETk9gLV+3LtC3LZ3UfqxclgnpUPBMBb8ad4aCUNoASSQGa2qV+3aNDjYGnnGss44naSBPz6mMissH6LIF12GL1+ggN/qHjUppwErkbg/iMjZ2pObPxB6Uq57GyoG6Vy5fG0Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4iXCp4z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02366C19422;
	Wed, 12 Nov 2025 14:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762957594;
	bh=bNLqGrg/bxt16UHYQqXWyzLbnJanuTnn/DSzlHMqam8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m4iXCp4znKZvCzYkjhXZu1JL4COAdGb7yAm9UmEyz0xmhqXKj2K9504lPVGuTy2Jw
	 oIs3gFjFC88Pg6vs33x0Y9J4Rt1LUAOWf+RlfjFyxs91gx9kSFDB51FMvZyE5chPXE
	 aGtArRih0bDKoqGUZ1CFOq9Z1gR5u0u7H+Ia54U4ZgBoOw6F7RHwsyZbtTo73P+YtI
	 MlFexT96E5ZxLwczc2sajdvyTdAl2dfa5pilRItuDN9x8WGEYbXAh10Kg5gBAGhHeA
	 FzJ4mZv2YeFA2oWEIhZbh7ljpXAZyuUSAV7u6Cyu3iLC+0hy5axy54UvXp2gQgfYvb
	 AydcA8t3H0Huw==
Date: Wed, 12 Nov 2025 08:26:32 -0600
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Len Brown <lenb@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 05/29] dt-bindings: bus: Add simple-platform-bus
Message-ID: <20251112142632.GA1610836-robh@kernel.org>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
 <20251015071420.1173068-6-herve.codina@bootlin.com>
 <20251030141448.GA3853761-robh@kernel.org>
 <20251031162004.180d5e3f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031162004.180d5e3f@bootlin.com>

On Fri, Oct 31, 2025 at 04:20:04PM +0100, Herve Codina wrote:
> Hi Rob,
> 
> On Thu, 30 Oct 2025 09:14:48 -0500
> Rob Herring <robh@kernel.org> wrote:
> 
> > On Wed, Oct 15, 2025 at 09:13:52AM +0200, Herve Codina wrote:
> > > A Simple Platform Bus is a transparent bus that doesn't need a specific
> > > driver to perform operations at bus level.
> > > 
> > > Similar to simple-bus, a Simple Platform Bus allows to automatically
> > > instantiate devices connected to this bus.
> > > 
> > > Those devices are instantiated only by the Simple Platform Bus probe
> > > function itself.  
> > 
> > Don't let Greg see this... :)
> > 
> > I can't say I'm a fan either. "Platform bus" is a kernel thing, and the 
> > distinction here between the 2 compatibles is certainly a kernel thing.
> > 
> > I think this needs to be solved within the kernel.
> 
> I fully agree with that.
> 
> > 
> > What I previously said is define a list of compatibles to not 
> > instantiate the child devices. This would essentially be any case having 
> > a specific compatible and having its own driver. So if someone has 
> > 'compatible = "vendor,not-so-simple-bus", "simple-bus"', when and if 
> > they add a driver for "vendor,not-so-simple-bus", then they have to add 
> > the compatible to the list in the simple-pm-bus driver. I wouldn't 
> > expect this to be a large list. There's only a handful of cases where 
> > "simple-bus" has a more specific compatible. And only a few of those 
> > have a driver. A more general and complicated solution would be making 
> > linux handle 2 (or more) drivers matching a node and picking the driver 
> > with most specific match. That gets complicated with built-in vs. 
> > modules. I'm not sure we really need to solve that problem.
> 
> Right. Let discard the "more general and complicated solution" and focus
> on the list of compatible to avoid child devices instantiation.
> 
> Do you mean that, for "simple-bus" compatible we should:
>  - Remove the recursive device instantiation from of_platform_populate().

That may be a problem I hadn't considered. While we've solved most probe 
ordering issues, I think some may remain. Even when of_platform_populate() 
is called affects this. For example, I tried removing various arm32 
of_platform_.*populate() calls which run earlier than the default call, 
but that broke some platforms. (Looking at the list of remaining ones, I 
fixed the at91 pinctrl/gpio drivers, but never tried to remove the 
calls again.)

Maybe this can be restricted to cases which are not recursively created 
from the root node. Not sure how we detect that. Perhaps no OF_POPULATED 
flag on the parent node? Or we could just enable this for OF_DYNAMIC 
nodes? That should be sufficient for your usecase.

I would like to solve this more generally though. So we could try it in 
kernelci and/or linux-next and see what happens.

>  - In simple-bus probe(), check the device we probe against the
>    'no_instantiate_children' list
>       - If it matches, do not instantiate chidren
>       - If it doesn't match instantiate children

Right.

Rob

