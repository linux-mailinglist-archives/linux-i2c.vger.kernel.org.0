Return-Path: <linux-i2c+bounces-11547-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 192BFAE2C8E
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Jun 2025 23:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F36D7189A3CF
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Jun 2025 21:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F48D27146D;
	Sat, 21 Jun 2025 21:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ar1XRdtk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC442701C8;
	Sat, 21 Jun 2025 21:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750540102; cv=none; b=hT6FrrHsU5PJWkFMWbxoza3OmpAcv/lqUFAl9JG1UPe5ODGzWGPhl5RV1DbjQwhPufddfUMEXBy44k3+YHNMyOFTfWsjfuOLmi3M+1hCM1GVx4ZAj0AXs8klU9uWOPEPLZuXDb2wgjNDmOAUJcpPIibUPPv93q/8KGjqr81CDCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750540102; c=relaxed/simple;
	bh=2jC+faa0vhHMt058jQXuTWiq9PmawBgRcm0zmjbebN8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=PLNZU8VcRWwqF8uCvgb47B0Nh/Y8ZW0hz3whz7SDYSXJxEABxhuswFjG3Dp7A/nTrJxg52kkO9tO1IzD/rxb9JYayt3qugcGKRs8yBeJbdT+mhu3Zmimx5Kw+ZnoRieNSvXlFBYJhcvPMhZ0ATq3LpQkrSrK5ETRT3wD5drq5KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ar1XRdtk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D496C4CEE7;
	Sat, 21 Jun 2025 21:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750540097;
	bh=2jC+faa0vhHMt058jQXuTWiq9PmawBgRcm0zmjbebN8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Ar1XRdtkpcsbBkiUxMPVbOG+KuufUZlkTWTVIDh6iJVyxwgahujACItMxBAcozJUh
	 X5OnRF4MPfjYPk3gPAugfVP40baW4nWQFeuS2ZwnDo55omIY/ycOccE5URisHN+Ukk
	 hHzFHLoEQzGVq9OVQBYwfLy4aStLo4FkJSRF9O6KKZfgl9m3R/86ae0gkE8GBbOFxC
	 KiXLhG51Z5q3zKBHXTc6kTOaoRliC2GgxJhZUtMNx7P1AQkE6jhzhm8DpxVNyMldlN
	 9aem64MCx/0AgybRvWns0UUBlWuUdA+GwQhiM98TcDNkNps4qEdPz/kQ696wEkeEQc
	 fQraBS9h7BWxQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250613134817.681832-20-herve.codina@bootlin.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com> <20250613134817.681832-20-herve.codina@bootlin.com>
Subject: Re: [PATCH v3 19/28] clk: lan966x: Add MCHP_LAN966X_PCI dependency
From: Stephen Boyd <sboyd@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>, Daniel Scally <djrscally@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Fabio Estevam <festevam@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Herve Codina <herve.codina@bootlin.com>, Len Brown <lenb@kernel.org>, Mark Brown <broonie@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Peter Rosin <peda@axentia.se>, Rafael J. Wysocki <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@google.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Sat, 21 Jun 2025 14:08:16 -0700
Message-ID: <175054009650.4372.6942087426361808940@lazor>
User-Agent: alot/0.11

Quoting Herve Codina (2025-06-13 06:47:59)
> The lan966x clock controller depends on the LAN969x architecture or the
> LAN966x SoC.
>=20
> This clock controller can be used by the LAN966x PCI device and so it
> needs to be available when the LAN966x PCI device is enabled.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

