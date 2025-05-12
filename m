Return-Path: <linux-i2c+bounces-10942-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F77AB474F
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 00:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC744189E98A
	for <lists+linux-i2c@lfdr.de>; Mon, 12 May 2025 22:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC975299AB6;
	Mon, 12 May 2025 22:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLZ1KgzQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BCC186A;
	Mon, 12 May 2025 22:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747089184; cv=none; b=d34MhThXQ05YY705fntZxXUM3/aCWfpZvf71ovMtIUT/9XQMYCCMTxt65+QwibZRXXzXNnktwmKm/vkgm5/ElRK7gpTa0OJ8yEO6sf1YH147obE5sXLIBi1WC/A5wxFbr09btVSae1tJoXVDRhTzJXfSJvBz7TdKGY/6x1EY0ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747089184; c=relaxed/simple;
	bh=7uaPkVruATXm9Huody3+3MZx6tE8WbKbRuYqnjKm0pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6L0Oa6RfpotKk2a/7URWTjFPE9sJ1IwANHcOSJEsblALhs/aIc4qp1KM7ysixxaCTXjuVkzX/JmWZL9tg3Zduv2i4GXqBEvnXXxGr9tqqrZNat/78ocipwnnX8CphjQruPjpg6fs6mTIEcjAbvkk5i+ILw1PuSGde2mfDOhB54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLZ1KgzQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80E1C4CEE7;
	Mon, 12 May 2025 22:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747089183;
	bh=7uaPkVruATXm9Huody3+3MZx6tE8WbKbRuYqnjKm0pI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MLZ1KgzQOJhVUAg9HL/gG+/R//L7FAoO/kB/yvK5yZYA02+YkydJW15gu7HC4e1/l
	 TwDqKmCGX8QJ1BMBsPkhEMfaHO0CeBjM16ODGskLNGUuuwssFGg9Zg2pN2cZMZhkxz
	 yZftrJotY5E5fl3AFwbv/ZA0XqmSjhZUZ3j4L05gEo4q0Gd71DcA7BPV0j+n88AqC/
	 /lXlbS0VrgwPwF4yyi7g4nUmRvIHmlMf4NUEQUPT6Bwunk1fLQ09V4q/NQG5V8APL6
	 zyyz1I7mHgeS9gkiYzuw+Zlc0XZcHmMtcT8e3ZxeSTWAKYT4a64llabhgqhbPyg1lX
	 Ent9sEQe4ZTww==
Date: Tue, 13 May 2025 00:32:59 +0200
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
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 19/26] i2c: busses: at91: Add MCHP_LAN966X_PCI
 dependency
Message-ID: <t362y4tvg3y2q5yop3vnqme3qi6wxxehpbyzbx6qp7zbrihqkr@5bvsxvd2ti7i>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-20-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-20-herve.codina@bootlin.com>

Hi Herve,

On Wed, May 07, 2025 at 09:13:01AM +0200, Herve Codina wrote:
> The AT91 I2C driver depends on ARCH_AT91.
> 
> This I2C controller can be used by the LAN966x PCI device and so
> it needs to be available when the LAN966x PCI device is enabled.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

