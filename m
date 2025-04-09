Return-Path: <linux-i2c+bounces-10241-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F45A82711
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 16:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C1BC7B0B19
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 14:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D967265602;
	Wed,  9 Apr 2025 14:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="yBepZVg6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF9125EFBD;
	Wed,  9 Apr 2025 14:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744207515; cv=none; b=SOPdIssmktLoEVTrprROpBdNBVG394JyFV6q+Yrzxnp/LEuIC0JqcJhtmBRt7s7WLBO7F96eAEmRx1VO+pKbICSu6j1Nl494BW8/eGe5r07xyZwAAGNhVj5wJqmOYR2AqtKLFoE6CwrtYwwTLCS5FVavzuTzzko68cKRtOZgS6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744207515; c=relaxed/simple;
	bh=1zxJ8FlpEDWTpG1LhWvZ8iky5X8X0noSUVYhOcaGa5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HD6zbrxbQs1HsNkK9X6RfPJT479XOkU9x3hp92atrZXc2CpUbcwy+gHzxHaIOppq/KQWoyRHdBbS0CBLJrsJHeKqxQ9WWoCaMh70QppiLz+28qnP+Mnlbyn89IrdB0y7IQRo+uhAxU/nHIpE9YTIH2B3TUEJCwExt9YUUepV1rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=yBepZVg6; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=q7xRr3QSSwnlul0m9c8hFHt5n9S9DhzWdZMloEm5X+g=; b=yBepZVg63xLWBP9suUlELw0jRh
	dzTENsuehAIPX9k9rcYdtfrwvLaBkEKMUO4zbNrKeNMvn4gEtXLDky0ZwL+2WPQxHnqrPCs84/tkm
	1swrTD+AUn+64uY5OQJp1X+y1Tfns9TyAELEhS3cRLtIsFLevGcm9mRjcK1rpq3AOGkU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2W2t-008Y8t-JI; Wed, 09 Apr 2025 16:04:51 +0200
Date: Wed, 9 Apr 2025 16:04:51 +0200
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
Message-ID: <b1b33000-4c10-43cd-bcf4-d24fc73902b1@lunn.ch>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-16-herve.codina@bootlin.com>
 <19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
 <20250408162603.02d6c3a1@bootlin.com>
 <D91CSNC07NYM.3KC467K0OZ4GG@bootlin.com>
 <c14dd5c6-2dae-4398-89a9-342e7a25bb30@lunn.ch>
 <D91XV1I4CY37.20T12FMZ5QLQ5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D91XV1I4CY37.20T12FMZ5QLQ5@bootlin.com>

On Wed, Apr 09, 2025 at 09:44:25AM +0200, Thomas Petazzoni wrote:
> On Tue Apr 8, 2025 at 5:38 PM CEST, Andrew Lunn wrote:
> 
> > "HW blocks inside an SoC." That would be the SoC .dtsi file. Anything
> > outside of the SoC is in the .dts file. OEM vendors take the SoC,
> > build a board around it, and name there .dts file after the board,
> > describing how the board components are connected to the SoC.
> >
> > So..
> >
> > So by PCI endpoint, you mean the PCIe chip? So it sounds like there
> > should be a .dtsi file describing the chip.
> >
> > Everything outside of the chip, like the SFP cages, are up to the
> > vendor building the board. I would say that should be described in a
> > .dtso file, which describes how the board components are connected to
> > the PCIe chip? And that .dtso file should be named after the board,
> > since there are going to many of them, from different OEM vendors.
> 
> Indeed, that makes sense. So if I get correctly your suggestion,
> instead of having a .dtso that describes everything, it should be
> split between:
> 
>  - A .dtsi that describes what's inside the LAN996x when used in PCI
>    endpoint mode
> 
>  - A .dtso that includes the above .dtsi, and that describes what on
>    the PCI board around the LAN966x.
> 
> Correct?

Yes.

And you need some way to map the PCI ID to the correct .dtso file.
Maybe that is just a lookup table in the driver, or maybe you can pack
the .dtso file into a kernel module with the correct
MODULE_DEVICE_TABLE(pci, ...) so that PCI probing pulls in the
specific driver module with the .dtso, which via dependencies pulls in
the core driver which can actually make use of the .dtso?

    Andrew

