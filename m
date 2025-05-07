Return-Path: <linux-i2c+bounces-10882-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2946DAAEEB6
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 00:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 850FA4C523A
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 22:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497BC29115A;
	Wed,  7 May 2025 22:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="H3AhQNzf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF07290DA4;
	Wed,  7 May 2025 22:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746656661; cv=none; b=il771HPd3xstg3MlZHOVB9S0LnGntdpA8zhYLpWdjcOduQLDSUi66Ii7/vrJiL2T0sJX9v5YF8vEw/qJredljO0qsWoYwrwRM5mGqEhKHCgVGGe8a1n1kl+6gBU+8G0X/n9f5ryO2641dB+HJYmzudxv6zElzebMT+PS/GC8AIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746656661; c=relaxed/simple;
	bh=AzuzgfE6GFKxTRRxcmQmVIVwtjphxNohFQ1mkjj32Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gS/FwG0VxdZkL1MG94ysJ+xODHnHe7ETZCYV8mD7/ytD2yF7snK/4AuJ0K4bMhHR7etar/4UOYwo/mJq0QpGzdsoIbGMOMRaONp306SJJBMgzj3XrqPgpWOrHFPYCLLPCIrHLwPPDvqxzeFMbs/qI/KZAdOM//SYh4JEQeJwCEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=H3AhQNzf; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PzMdG6ucufIYiDDg070rOIAisSRRkIriDyNiBBXVH3U=; b=H3AhQNzfKur7H3echOL82K5wSj
	UWauEM7K0xtUngTkTiumFckVqkxTSQmxx04ybKUuXMGDwQxdg9v4LTVktEbeK1wYbAEG7wA2phbCJ
	WOEUl0ZmHpOetacgwgUET9KPOR85GwrqWO+zoimHuICTlzt/azYqhg8fHIiVUKBeUXS8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uCnBL-00BwDo-6P; Thu, 08 May 2025 00:24:03 +0200
Date: Thu, 8 May 2025 00:24:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 23/26] misc: lan966x_pci: Introduce board specific data
Message-ID: <8b97e095-dbed-438c-9c6d-d3c2c5929fc0@lunn.ch>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-24-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-24-herve.codina@bootlin.com>

On Wed, May 07, 2025 at 09:13:05AM +0200, Herve Codina wrote:
> Only one device-tree overlay (lan966x_evb_lan9662_nic.dtbo) is handled
> and this overlay is directly referenced in lan966x_pci_load_overlay().
> 
> This avoid to use the code for an other board.
> 
> In order to be more generic and to allow support for other boards (PCI
> Vendor/Device IDs), introduce the lan966x_pci_info structure and attach
> it to PCI Vendor/Device IDs handled by the driver.
> 
> This structure contains information related to the PCI board such as
> information related to the dtbo describing the board we have to load.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

How big is the dtbo ?

This is going in the right direction. I'm just wondering if each dtbo
should be wrapped in its own very slim PCI driver, which simply
registers its lan966x_pci_info structure to a core driver. Only the
needed dtbo will then be loaded into memory as a module, not them all.

Pretty much all the pieces are here, so it can be done later.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

