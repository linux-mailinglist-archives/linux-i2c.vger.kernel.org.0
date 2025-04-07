Return-Path: <linux-i2c+bounces-10188-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B15AEA7EE82
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 22:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D63A18956FF
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 20:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD34F21B9D6;
	Mon,  7 Apr 2025 20:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="qxWeMnez"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6FF1EE032;
	Mon,  7 Apr 2025 20:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744056354; cv=none; b=qrFN0xdCegD7r9WFtw4XDuM5D/8imAggVKK7ORTXFIQOfWofzBdc3AE4ZcbECByz6Sm2nnSYJ7dN80sdXZ4oqNVbmCeTFtU049MyMn5iXusDIOteFG98N1LRF3jykcW5QsdRImLSX/qgbb5hJhIekJ6LD7b70pVZd2RIasn3Ljk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744056354; c=relaxed/simple;
	bh=sOI/Ws0aQosMDdWy0Ov4bIs+PItfPMvkWap9D35EHWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzzQEDRVSV1sMnjLKS9mt7m+8eRTvD4tfM0YaB6DxWhpeBAcpEsnkG9fCVcuZBcQC7uH8Zfn/dKCZ6UM8D75BNn7cvVv51vh2mI1cWdTbVRhDZN1tQEA/iqcroueF7gd2FeR35NXDf9erCOQ7jz1i8SMT54PaBfinlslxACpJHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=qxWeMnez; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nl5JULT9PoC4C0/72HEzW8Mzovg/wHI2O7mxt7leeac=; b=qxWeMnezbVGyFUZ5BOqEZBMjTK
	4viXQQ3adWeVMFtj8DWC62nPkKxNP3JRzHmTYRUWNXDWfiC9zspf3TzS6xn3/qt+/aH7SogayZXAf
	9FfUvh72FV/sVaQ9VxcIoxpCx6DEvrtYWOUpWwVcdeWwajTvujFf2v2Ta/AVHazNifO0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u1sip-008Igt-Tz; Mon, 07 Apr 2025 22:05:31 +0200
Date: Mon, 7 Apr 2025 22:05:31 +0200
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
Message-ID: <19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-16-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145546.270683-16-herve.codina@bootlin.com>

On Mon, Apr 07, 2025 at 04:55:44PM +0200, Herve Codina wrote:
> Add device-tree nodes needed to support SFPs.
> Those nodes are:
>  - the clock controller
>  - the i2c controller
>  - the i2c mux
>  - the SFPs themselves and their related ports in the switch
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/misc/lan966x_pci.dtso | 111 ++++++++++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
> index 94a967b384f3..a2015b46cd44 100644
> --- a/drivers/misc/lan966x_pci.dtso
> +++ b/drivers/misc/lan966x_pci.dtso

What exactly does this DTSO file represent?


> @@ -47,6 +47,47 @@ sys_clk: clock-15625000 {
>  				clock-frequency = <15625000>;  /* System clock = 15.625MHz */
>  			};
>  
> +			i2c0_emux: i2c0-emux {
> +				compatible = "i2c-mux-pinctrl";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				i2c-parent = <&i2c0>;
> +				pinctrl-names = "i2c102", "i2c103", "idle";
> +				pinctrl-0 = <&i2cmux_0>;
> +				pinctrl-1 = <&i2cmux_1>;
> +				pinctrl-2 = <&i2cmux_pins>;
> +
> +				i2c102: i2c@0 {
> +					reg = <0>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +				};
> +
> +				i2c103: i2c@1 {
> +					reg = <1>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +				};
> +			};
> +
> +			sfp2: sfp2 {
> +				compatible = "sff,sfp";
> +				i2c-bus = <&i2c102>;
> +				tx-disable-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
> +				los-gpios = <&gpio 25 GPIO_ACTIVE_HIGH>;
> +				mod-def0-gpios = <&gpio 18 GPIO_ACTIVE_LOW>;
> +				tx-fault-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;

DT files are generally hierarchical. There is a soc .dtsi file which
describes everything internal to the SoC.  And then we have .dts file
which describes the board the SoC is placed on.

We have a slightly different setup here. A PCI chip instead of a SoC.
And a PCI card in a slot, which could be seen as the board.

The SFP cage is on the board. How the GPIOs and i2c busses are wired
to the SFP cage is a board property, not a SoC/PCI chip
property. Different boards could wire them up differently. So to me,
it seems wrong these nodes are here. They should be in a dtso file
which represents the PCIe board in the slot, and that .dtso file
imports the .dtso file which represents the PCIe chip.

I suppose this comes down to, what do the PCIe IDs represent, since
that is what is used for probing? The PCIe chip, or the board as a
whole. When somebody purchases the chips from Microchip, and builds
their own board, are they required to have their own PCIe IDs, and a
.dtso file representing their board design? The PCIe chip part should
be reusable, so we are talking about stacked dtso files, or at least
included .dtso files.

      Andrew

