Return-Path: <linux-i2c+bounces-10225-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBBEA81060
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 17:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5707416B0DC
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 15:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE9522ACE7;
	Tue,  8 Apr 2025 15:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="axRaKRvM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442F61862BB;
	Tue,  8 Apr 2025 15:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126720; cv=none; b=uGeTMt6Qu1eWt/ttSzX5bIDcCZAlxQCPZpe/gdWeDztaoXdHRg5+3H/iCypTnDBBv7cEvO5NrzyoaFtLXwoi8bnvK0vYeI1cfX9bmdHAk5q3DytfC3+xftBVbITb1FMrsH4QzhmSUEPcb25Ke3CKKG4c+stzgkZg1WWZSfVP8X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126720; c=relaxed/simple;
	bh=ZFOFE/Iq5703lNvYzWC6MljENWk+R9HDSLK4Uz7noEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZ6uZ7KmyJ6g+XfpEavtkV+fX6rupqmTO6Msx4PsbA+eZutYe8b4WOSy+fMxjq7bwqMScKTf82PSBgW9NY+hn4nAWurM4BVLjSyMhuOwipKbQhu6MeTZywXPguBHE1CVRTWOn4AGmbG9CCwXPE+/c2eT5lSDJ2QRnEr+3wFtz/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=axRaKRvM; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=0AxXXCyGehUeIEBMKM+/UdgR6pywaI6NfyB/Hg4NGkk=; b=ax
	RaKRvMxLNy1nBRskzmrWJqy7SKbGNVN5ztU5caLqrvQKZZPlHkHy104KGZfqfMnbtPn6mJ2MdUynW
	bSlFnNxpbCZGbL9L+rBQrRBde2BHYdR68UaRU610uhMDkZyCerFWvPcuXpriSsBVfUt5PPjdGGus8
	+qhrEZY1NPDNudE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2B1l-008PrO-KZ; Tue, 08 Apr 2025 17:38:17 +0200
Date: Tue, 8 Apr 2025 17:38:17 +0200
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
Message-ID: <c14dd5c6-2dae-4398-89a9-342e7a25bb30@lunn.ch>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-16-herve.codina@bootlin.com>
 <19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
 <20250408162603.02d6c3a1@bootlin.com>
 <D91CSNC07NYM.3KC467K0OZ4GG@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D91CSNC07NYM.3KC467K0OZ4GG@bootlin.com>

On Tue, Apr 08, 2025 at 05:13:54PM +0200, Thomas Petazzoni wrote:
> Andrew, Hervé,
> 
> On Tue Apr 8, 2025 at 4:26 PM CEST, Herve Codina wrote:
> 
> >> What exactly does this DTSO file represent?
> >
> > The dsto represents de board connected to the PCI slot and identified
> > by its PCI vendor/device IDs.
> 
> If I may extend on that by providing what I believe is a more
> accurate/precise definition.
> 
> The DTSO doesn't represent the board, rather it describes the HW
> topology of the devices inside the PCI endpoint. Indeed, the PCI
> endpoint is a full-blown SoC with lots of different HW blocks that
> already have drivers in the kernel (because the same chip can be used
> with Linux running on an ARM core embedded in the SoC, rather than
> access as a PCI endpoint). So the DTSO describes the full topology of
> the HW blocks inside this complex PCI endpoint, just like the DTS
> describes the full topology of the HW blocks inside an SoC.

"HW blocks inside an SoC." That would be the SoC .dtsi file. Anything
outside of the SoC is in the .dts file. OEM vendors take the SoC,
build a board around it, and name there .dts file after the board,
describing how the board components are connected to the SoC.

So..

So by PCI endpoint, you mean the PCIe chip? So it sounds like there
should be a .dtsi file describing the chip.

Everything outside of the chip, like the SFP cages, are up to the
vendor building the board. I would say that should be described in a
.dtso file, which describes how the board components are connected to
the PCIe chip? And that .dtso file should be named after the board,
since there are going to many of them, from different OEM vendors.

	Andrew

