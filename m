Return-Path: <linux-i2c+bounces-10881-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37699AAEE9D
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 00:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DEBD3A6D9D
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 22:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC3D929114F;
	Wed,  7 May 2025 22:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="U/Toc8P1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A946290DAD;
	Wed,  7 May 2025 22:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746656112; cv=none; b=FReJGvYOEtg0N/YfTNx1rhiZsGjy/qYanzxEVBNe7A/KMuWQnG0xz4d+vHWA6BcuiwQZEkhIvtA5ZIGncFlCdPc0sdF5huj5u5xDeAha6tLSEv+/INuaX3u1fkWSD1dcj6Acqs2OfReubHRPsVSAl0F69ivuv88+1RFJLTNbOjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746656112; c=relaxed/simple;
	bh=qGouDji2QH0Uc7Ws9dxYQpLQ7LU1sAfC1XRs3EeIi7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHUXfIHthmEBFIBBHSPWYh3l9bKOTjSu+AGo8/+Nytgqj6YxsThnELxd2Exyl45w1kS5nIqnSyimCfq08qJogK/pgOOwgtZfzk6xLykFgDt93777F1UUyvrqha2J/qesrfPwXAX1ec9I4cwGeBSARIQzM3Xb0kzql4POnH3HPc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=U/Toc8P1; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CPkQ9CydGnG5tF/EHT21gmnn1PO6zhIZzOrZPNx4PgA=; b=U/Toc8P1QESr/ikkBlUdgnkPeZ
	wtmk8RevqEbmM0rvr1ojqNGeRhJe76CZ7XVDMiDnBlPvJTpsGybkWEQPVN4jDWkTmMPCzd2Kg2zVe
	DRcNXD0c3AlEyc50C97JLBRg6L0r/ubgs5FUC4kGnUvDYE7ZMVesEit9HWwG5OgMYRGg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uCn2W-00BwA0-Op; Thu, 08 May 2025 00:14:56 +0200
Date: Thu, 8 May 2025 00:14:56 +0200
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
Subject: Re: [PATCH v2 22/26] misc: lan966x_pci: Rename lan966x_pci.dtso to
 lan966x_evb_lan9662_nic.dtso
Message-ID: <0c3028dd-8c98-4816-bb52-7383391e5a94@lunn.ch>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-23-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-23-herve.codina@bootlin.com>

On Wed, May 07, 2025 at 09:13:04AM +0200, Herve Codina wrote:
> The lan966x_pci.dtso describes the Microchip EVB-LAN9662-NIC board [0]
> 
> This PCI board embeds a LAN9962 PCI device chip, part of the LAN966x
> family.
> 
> Rename the lan966x_pci.dtso accordingly.
> 
> Link: https://www.microchip.com/en-us/development-tool/EV53U25A [0]
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

