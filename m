Return-Path: <linux-i2c+bounces-13905-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78719C20469
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 14:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB3961886620
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 13:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE0D25BF18;
	Thu, 30 Oct 2025 13:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aIFeA7NJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128D4242D9B;
	Thu, 30 Oct 2025 13:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761831365; cv=none; b=H48YjjhXceLVh6IfUsjvxQRwo4WfLig8iQeOrGGbM9ybCQz+ODAnJPF03Gcrh2zpxgbLPqU4DbJyHJ7wR+nGdE9l+IDWDMMgk8rGYXjy7RhRiEW27prADr0EoytN6VbRTz6DsliHqS3TootTRofsR7g8jr3jX1tbPZCsYf2OIgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761831365; c=relaxed/simple;
	bh=skDcBwIOHhfQXGcqlGA/LEwUkbZKYplwlozeBad9QOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSEqmRsznyhjzBuwGvrlS7v+TIuCDZu5kHfr8fKIFFuYmFOUo20dMo/pP3bI6k2/N8UMXUEgYMpfIQdzC84ZzO+l6MJDFq/8eFRhFEfGOqMPwaE/I4lrZhWKrl9pRSrOwqcEeynX/PvAXWi5jLfQncJOjevJpZb0Rjtay0cXF/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aIFeA7NJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B435C4CEF1;
	Thu, 30 Oct 2025 13:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761831364;
	bh=skDcBwIOHhfQXGcqlGA/LEwUkbZKYplwlozeBad9QOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aIFeA7NJUJOWrSDA9pGqC8MaKPLKi+lpQRRuXL7ckWZUVsDUHN4irB5QDZoyh9bVq
	 3+WYnAHHUAvSeAtQ2cniycQkp4C8ZE6rJG8H/eeavKFZaMcKjen27K1eD+DBX4qeXA
	 AbnmRO3D/tv3/zzhUqzMU1XXy9C6kD3bblXjaYY6LtT+nyMcjCgmF1NLpd/8ZrrZAi
	 /4rcT5otqRcLDavdndxtpebWbN3OUiQBa8UhLYXDv5UD1/Uuub6fsECRRKnmduHQAi
	 9yoxuYx4CR0Ms16r/IyQ/2t9DlRPJDoNC12vVChYZMb0Cd6eoRZoqQz7YTMv8aNWer
	 Ags2ZLTy+g3vA==
Date: Thu, 30 Oct 2025 14:35:59 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>, 
	Saravana Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	David Rhodes <david.rhodes@cirrus.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Mark Brown <broonie@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Len Brown <lenb@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, Steen Hegelund <steen.hegelund@microchip.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 17/29] i2c: mux: Set adapter physical device
Message-ID: <llu7m5f2qi6o5nzgssxw3qpp4sya6a2qrg4gna7y6atl2y7amk@ld5wow6brflb>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
 <20251015071420.1173068-18-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015071420.1173068-18-herve.codina@bootlin.com>

Hi Herve,

On Wed, Oct 15, 2025 at 09:14:04AM +0200, Herve Codina wrote:
> For i2c muxes, the parent of the mux adapter device is the adapter
> device the mux is connected to.
> 
> This parent is not the physical device related to the mux adapter.
> Indeed, the physical device of the mux adapter is the mux device itself.
> 
> Fill the adap.physdev with the mux device.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

