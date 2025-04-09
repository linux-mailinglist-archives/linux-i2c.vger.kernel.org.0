Return-Path: <linux-i2c+bounces-10243-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9682FA829BE
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 17:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 496D35016BD
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 15:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5A726FA66;
	Wed,  9 Apr 2025 15:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="EDb9t9ug"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C0526F475;
	Wed,  9 Apr 2025 15:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744211053; cv=none; b=G7pqSl4qf0ktcTp7bQenkhWXwL8Azk583hpf51iIHuD+jFCUVhLRHSLNxf6rufYB5wxsV8dXRHT1Pp10QkQnWNL7svucaO4ryzvcc5bQezSkXlYJMOiq7DVxdgTVNdPELQO0t0/iypSJEiEa9orNZgPjwhqhjjNCczUh/Z7Jjh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744211053; c=relaxed/simple;
	bh=VPw47VFikKf8fTolInwOS7M/6m1lsw75MF8AshQmubI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLAi5NvwImkGZFwf1+UFOfdzlvndREMJQeshi7Oe0FgtxlzmidXjT3edRI8cIq5+589lHFoUHxvQ4WtiBbindclhD4s5V0oP8wtQ3tdrT6450utLsfsXqmxz5+MSIkGIcyLuw5zxXwOXgwm3R7yibFrZ53JrWvyDEQdACB0jCXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=EDb9t9ug; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Lhtq1pefqTUVYOAkJzIOHqWiVsfsbUWsRek0JSSJoaM=; b=EDb9t9ug3VAuhsP2v5wV6dRtb9
	iS7Wnq8zgIJ18meTszE5HNwkmgb/DJWG2rzHMpIlo2YO2DjOhaxa1Afh/x+VSB6uO5Dtr7QEl5l6y
	CTgeIulElJ7lZgvn0u/oTdY7ogOeKQ9FUbXWyrwgM8EocLlJ/LQT6+wOPKMDD0UK5Eds=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2Wxt-008Ymd-Uk; Wed, 09 Apr 2025 17:03:45 +0200
Date: Wed, 9 Apr 2025 17:03:45 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Herve Codina <herve.codina@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 15/16] misc: lan966x_pci: Add dtso nodes in order to
 support SFPs
Message-ID: <c6257afe-36bb-46d8-8c22-da3b85028105@lunn.ch>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-16-herve.codina@bootlin.com>
 <19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
 <20250408162603.02d6c3a1@bootlin.com>
 <D91CSNC07NYM.3KC467K0OZ4GG@bootlin.com>
 <c14dd5c6-2dae-4398-89a9-342e7a25bb30@lunn.ch>
 <D91XV1I4CY37.20T12FMZ5QLQ5@bootlin.com>
 <b1b33000-4c10-43cd-bcf4-d24fc73902b1@lunn.ch>
 <20250409161444.6158d388@windsurf>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409161444.6158d388@windsurf>

On Wed, Apr 09, 2025 at 04:14:44PM +0200, Thomas Petazzoni wrote:
> On Wed, 9 Apr 2025 16:04:51 +0200
> Andrew Lunn <andrew@lunn.ch> wrote:
> 
> > And you need some way to map the PCI ID to the correct .dtso file.
> > Maybe that is just a lookup table in the driver, or maybe you can pack
> > the .dtso file into a kernel module with the correct
> > MODULE_DEVICE_TABLE(pci, ...) so that PCI probing pulls in the
> > specific driver module with the .dtso, which via dependencies pulls in
> > the core driver which can actually make use of the .dtso?
> 
> Well, check the already upstream driver:
> 
>   https://elixir.bootlin.com/linux/v6.13.7/source/drivers/misc/lan966x_pci.c
> 
> It indeed binds on the PCI ID, and the driver bundles the .dtbo.

So it only supports a single .dtbo. In its current form it does not
scale to multiple .dtso files for multiple different boards built
around the PCIe chip.

At the moment, that is not really an issue, but when the second board
comes along, some refactoring will be needed.

      Andrew

