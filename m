Return-Path: <linux-i2c+bounces-11995-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B72AB0DD00
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Jul 2025 16:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90D37188730C
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Jul 2025 14:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0792EA16C;
	Tue, 22 Jul 2025 14:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sWkFl8nC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FBEA32;
	Tue, 22 Jul 2025 14:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753193076; cv=none; b=QYrH8yv541/qVHtMGvrrYe/YyEh42wfzY78zv6JTRHRe3uOlfq7IpW5vgMjWoxdhu2iigHs7U1UTEow8YNVu7y9H68UN53PGUzGGPIMFmEr9uVQQUmtWkAzSxGWvY2XygNSGqqFD9SG5phLD/l8TPg1x9O6jI5+KHtExv4xvkbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753193076; c=relaxed/simple;
	bh=uPFuamjn8JgXag9RFI74J/C90ZWWlQSjqj7GpBmomJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSq1lqGBOzEvEGRxi7yvn7WM/M3aVugrrA2k4LBHar+XQvJ+b8q0AO9DSkWUcuxj+/nb9kB6TDW4fa+RoigRZj5YaLXCW9CwV27i6sosh77R3uWXY4ikEMbBZuOGyvAKb57Ws8iV/rNyuP4UeDGotz5oOMH77XS28jSqBsdEyEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sWkFl8nC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85268C4CEF1;
	Tue, 22 Jul 2025 14:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753193075;
	bh=uPFuamjn8JgXag9RFI74J/C90ZWWlQSjqj7GpBmomJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sWkFl8nCPLNDlOJMG6Ch0dE8liwQT/TjEDMiX0lMwJnuLusjuKrCzLod80NRSELUo
	 u8NHIk9I5drvAO5b8cWaslWSSVtrI12ORXbU6cnC3czmox0Gpc/eBFVmQbv7WsXDHP
	 7XI0tTvIdC3OANtPZeGtvVmL87/AUfVlow3h8BPE2czQ//X9ztlbTiQMaD2B0vzKbf
	 q9hGEfFkRTSDPXvxHMcUnuRjST9bZDk/bPZV2PYpDIsFdoH6g089xiau1VqsOdWm+K
	 5yrtXZWYlUbYU8EfrX/vfKb1ZfK13RF2n1xAXnRVjHWsiZpxmDlx7rVQTbvJetcEdK
	 Bwqfe2NYx+UOw==
Date: Tue, 22 Jul 2025 16:04:31 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Peter Rosin <peda@axentia.se>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Wolfram Sang <wsa@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, Steen Hegelund <steen.hegelund@microchip.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 15/28] i2c: core: Introduce i2c_get_adapter_physdev()
Message-ID: <sk6dwbont52x7zt3woqghurkkkms72f3zxubbadi2gp2yj3sbw@wdstymdtzouc>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-16-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134817.681832-16-herve.codina@bootlin.com>

Hi Herve,

On Fri, Jun 13, 2025 at 03:47:55PM +0200, Herve Codina wrote:
> The physical device providing an I2C adapter is the device that calls
> i2c_add_adapter() or variants and i2c_del_adapter().
> 
> Most of the time this physical device is the parent of the adapter
> device.
> 
> Exceptions exist with i2c muxes. Indeed, in case of i2c muxes, the
> parent of the mux adapter device points to the adapter device the mux is
> connected to instead of the physical of this mux adapter.
> 
> Introduce i2c_get_adapter_physdev() and a new physdev field in the
> adapter structure in order to ease the adapter physical device
> retrieval.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Makes sense to me,

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

