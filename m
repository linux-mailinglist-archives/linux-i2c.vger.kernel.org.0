Return-Path: <linux-i2c+bounces-10417-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C80A8B852
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 14:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C22D17A530
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 12:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27A223F41E;
	Wed, 16 Apr 2025 12:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Uf1PAeeN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014F12472B9;
	Wed, 16 Apr 2025 12:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805178; cv=none; b=mWjyJwAQRxuOJIppO+/E9QMSkDVOBnm3/tWZgtV1xHIiUp2l1fuSlcQUtwuPtlPoWfNwuUU1YXubC5n2+q5C9ELKzaWzkSRVviscVBmZFNp13KwAiHSqaL5RqVMnCzPNZuiklyvdx7EkL4InLJFYYboQAAo+dZJWGeh6vQfT+IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805178; c=relaxed/simple;
	bh=z+35z4Xm7Qmu1+l6vMV68bBCRCqlu/kIyQ/IweF1fDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsXy/9vTYDK1NS0vCR6xlIRKFdssUBV/iRk8JXmQD85jeocKZ8beV7DbPgq5mYT6prA7ukDONX9++xQjRRdED4CQEtrFGjToJYzTadp6Jf0akMki1hLY+d9lFadDSPVopUIturITfyMhBOMvljPYk5L9taLV6y3Iw8iB6NJVNW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Uf1PAeeN; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=48rObYaeZ/USnSNxnjEIUdReTs2PvkcUzFPZ3od5ozQ=; b=Uf1PAeeNB7mtGRr9XeqT+lWOsk
	tU/VlmKveq7vFIay9Q57fAfy2osB/m5R1soDdnon8DLivpYkDTVTN4JNGXBHfNH521M+lfQLHBuMv
	th6fTqdKgseLY7FfLCKg5Gz/1l1WR3qZm5b53xVUgQD+DFQE2KYw/OzgerrpF0pmvjkQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u51WY-009c9k-0K; Wed, 16 Apr 2025 14:05:50 +0200
Date: Wed, 16 Apr 2025 14:05:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
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
Message-ID: <97cf068f-3770-4df9-a60a-30761ffcb03d@lunn.ch>
References: <19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
 <20250408162603.02d6c3a1@bootlin.com>
 <D91CSNC07NYM.3KC467K0OZ4GG@bootlin.com>
 <c14dd5c6-2dae-4398-89a9-342e7a25bb30@lunn.ch>
 <D91XV1I4CY37.20T12FMZ5QLQ5@bootlin.com>
 <b1b33000-4c10-43cd-bcf4-d24fc73902b1@lunn.ch>
 <20250409161444.6158d388@windsurf>
 <c6257afe-36bb-46d8-8c22-da3b85028105@lunn.ch>
 <20250410084809.1829dc65@windsurf>
 <20250416111819.4fd7b364@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416111819.4fd7b364@bootlin.com>

On Wed, Apr 16, 2025 at 11:18:19AM +0200, Herve Codina wrote:
> Hi Thomas, Andrew,
> 
> On Thu, 10 Apr 2025 08:48:09 +0200
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
> > On Wed, 9 Apr 2025 17:03:45 +0200
> > Andrew Lunn <andrew@lunn.ch> wrote:
> > 
> > > So it only supports a single .dtbo. In its current form it does not
> > > scale to multiple .dtso files for multiple different boards built
> > > around the PCIe chip.
> > > 
> > > At the moment, that is not really an issue, but when the second board
> > > comes along, some refactoring will be needed.  
> > 
> > Indeed, but that's really an implementation detail. It doesn't change
> > anything to the overall approach. The only thing that would have to
> > change is how the driver gets the .dtbo. We could bundle several .dtbos
> > in the driver, we could fall back to request_firmware(), etc.
> > 
> 
> Not sure we need to split right now the existing dtso file nor rename it
> even if it is updated in the series.
> 
> This could be done later when an other user of the LAN996x PCI chip is
> there.
> 
> Doing something right now will probably need other modification when this
> potential other user comes in. Indeed, depending on specificities of this
> future user, what is done now could not match the need of this future user.
> 
> Any opinion?

I agree support for multiple .dtso can be done later.

But i would do the split between the .dtsi file for the PCIe device,
and the .dtso file for the board now. That is a pretty fundamental
concept in Linux DT support.

	Andrew

