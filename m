Return-Path: <linux-i2c+bounces-10880-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DEBAAEE96
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 00:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC01F1BC75B3
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 22:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BE1290DBD;
	Wed,  7 May 2025 22:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="si0idtTN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59290242928;
	Wed,  7 May 2025 22:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746656084; cv=none; b=WfgaLYIvwvqrFqvm1JuAxbjOaeHSJtEORZAEs7AaeniofzD9pjF3ddZwfvYQwLUHV/fI5cZ2pTdDM6rpcpZv3r9PugfH4z0zvUHyRBa/0Jeu4DSi+85ATvRzF2+1xg8RoLzEOKSDmS0+r6r2EDgBxqqURnZSWdkYUjBCGRROHhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746656084; c=relaxed/simple;
	bh=dP1z7M47j4PZpEMumZ+QSsZvk9KzxMc0x7CrV24AZHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZGaBaOzG/601iosWf3QNQVol+0Xr9kyrgb6AlSbgYP02nyLYFKbYHjaxxFgdD5LYeG2+l+uMlGHDvYRBAYIKX1mcP7By64dX71+xE3l7CixLRxNRFqVaORBIoX1lELc8pAiAVqq2OAcj0DmNxAOo6i8NfVfOhpfc/y+dyHB4+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=si0idtTN; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QSB///5JCKK7/bkloOaaZL68imP0TbqjyJok4xYN/JE=; b=si0idtTNRfYOtIz1mEtv6mijPs
	sRVeZ9aoK8fQbQS1F3VzoBvYGbhk3NOXlqmUq90rnRtFjJnoxY6Zs415C146bAojm2iBU9Z2o3k93
	fOOKaG6M2UETwcTqm+lSM2SsJyiat11O6aVySDfr0VofmUeMZ5MM8EG2eI6QNmA41/gM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uCn1x-00Bw9R-Dz; Thu, 08 May 2025 00:14:21 +0200
Date: Thu, 8 May 2025 00:14:21 +0200
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
Subject: Re: [PATCH v2 21/26] misc: lan966x_pci: Split dtso in dtsi/dtso
Message-ID: <11b7fd86-99b9-4dbe-997d-8aa948f1f4c0@lunn.ch>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-22-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-22-herve.codina@bootlin.com>

On Wed, May 07, 2025 at 09:13:03AM +0200, Herve Codina wrote:
> The lan966x_pci.dtso file contains descriptions related to both the
> LAN966x PCI device chip and the LAN966x PCI device board where the chip
> is soldered.
> 
> Split the file in order to have:
>   - lan966x_pci.dtsi
>     The description related to the PCI chip.
> 
>   - lan966x_pci.dtso
>     The description of the PCI board.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

