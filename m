Return-Path: <linux-i2c+bounces-10220-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D462A80ECD
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 16:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 676C61B86E5E
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 14:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0563225779;
	Tue,  8 Apr 2025 14:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="TLs5lB9Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BEF1C5D61;
	Tue,  8 Apr 2025 14:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123543; cv=none; b=COryo1jWpcVmTaM390ngMOR/tWoLC4ug+m8/SDRtcoNg+e67JAUoXjNZa41eNOH8d5nVolrWGOygN6lmOshp85nxcImsKOQNOuUbB4BTJWcfeRYOu5poiIDjtUPq+LLPGvcgWdA7k7T2WZ9xDMeX5ojD0ugSS1mSY3pkAtHMlU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123543; c=relaxed/simple;
	bh=7T4CpB6DGc+gXmXeKE+QAVK5wOG1xBkOti6BP2/W8Ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLZgpcM71DsPuNZsDIc5qsB8tdQ0KoOMnQ7FyDzsFY1tRuSol9rHPYKyikFqRoTAJfTLmaQJHAJFMOi7dPWgOcFNCWrnrQC3rZvYQKvw0dR9a/aAyCdTmAkDtZACmyrQPzmX0ibMp3u8iXTf93y0C+1XFB2a9Bd6gzP+Jahh8zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=TLs5lB9Q; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZU8AgxcMgNb7+V6IhjT3po2+emT09ZzOnp6Z/8jLn6c=; b=TLs5lB9Q6k6NOM0ejAiZKSUmbw
	Dj+iAfTAAhm+Ug5dOAXdaCUR0ebD73P/pVGjYFtKaTG8ZV+/atjxB8tqHRg7WBYsJwW5Vwwr7EF9c
	EXg2eTLofm8UMCn7fjXC4Ewz5LuW28/Ib8u6LPJzVd95vL9xcZUe0UdgFLyk1LVTAELk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2ACU-008PSe-Gy; Tue, 08 Apr 2025 16:45:18 +0200
Date: Tue, 8 Apr 2025 16:45:18 +0200
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
Subject: Re: [PATCH 15/16] misc: lan966x_pci: Add dtso nodes in order to
 support SFPs
Message-ID: <e370fcd3-bd58-47d1-bc0c-c0abeebbefdc@lunn.ch>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-16-herve.codina@bootlin.com>
 <19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
 <20250408162603.02d6c3a1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408162603.02d6c3a1@bootlin.com>

On Tue, Apr 08, 2025 at 04:26:03PM +0200, Herve Codina wrote:
> Hi Andrew,
> 
> On Mon, 7 Apr 2025 22:05:31 +0200
> Andrew Lunn <andrew@lunn.ch> wrote:
> 
> > On Mon, Apr 07, 2025 at 04:55:44PM +0200, Herve Codina wrote:
> > > Add device-tree nodes needed to support SFPs.
> > > Those nodes are:
> > >  - the clock controller
> > >  - the i2c controller
> > >  - the i2c mux
> > >  - the SFPs themselves and their related ports in the switch
> > > 
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > ---
> > >  drivers/misc/lan966x_pci.dtso | 111 ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 111 insertions(+)
> > > 
> > > diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
> > > index 94a967b384f3..a2015b46cd44 100644
> > > --- a/drivers/misc/lan966x_pci.dtso
> > > +++ b/drivers/misc/lan966x_pci.dtso  
> > 
> > What exactly does this DTSO file represent?
> 
> The dsto represents de board connected to the PCI slot and identified
> by its PCI vendor/device IDs.

Then i think the name lan966x_pci.dtso is too generic. It should be
named after whatever microchip calls the RDK.

> We can move the PCI chip in a dtsi included by this dtso but in the
> end this leads to the exact same representation. Further more, moving
> out the PCI chip description in its own dtsi out of this dtso can be
> done in a second step when an other dtso uses the same chip.

And what would you call this pulled out dtsi file? lan966x_pci.dtsi?
That is going to be confusing.

Naming is hard, but we should assume this PCIe device is going to be
successful, and a number of OEMs will build cards around it, so there
needs to be space within the naming scheme for them.

	Andrew

