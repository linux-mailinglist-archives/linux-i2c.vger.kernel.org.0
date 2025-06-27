Return-Path: <linux-i2c+bounces-11674-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A96AEBD26
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 18:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65D4156300F
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 16:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB9F2EA482;
	Fri, 27 Jun 2025 16:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9+kRI24"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F5E2D3EE8;
	Fri, 27 Jun 2025 16:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041367; cv=none; b=nv++dJlmLK3Z/+crg1Ye0k0wCz9mkR6xgN43sRYRipplAdMGnVkNV2oNRNQZTf99gxwzeSTZUdtU+kA+5eP7PsPux+6f4ygU4VIJNecIlETRZsoNIcjjksqRUJis+DZL+qKjnNhUpkblJWAro8TSUH7phmOHJ5Nl+xMgfSQdZvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041367; c=relaxed/simple;
	bh=S4rQXSxYy7l30Jex5dOyQNVkfrqjgNBFJChd03NJJd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nt/A/6TCDTZSTUeRThDAgS5pkheb6/eeWrJCEyzTxOqTRqNJYNrdvnmgIWSDXq0prj9YF/sL3kmUIZwoht9JKDgrIISvK07oi8AQhqirwSVbw7eE8YF6nNzZoHTJd1i/9CK1h1odOEJQP1uMqVPWS4V2iW6rxfjjyD8ORB7swlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9+kRI24; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3C2C4CEE3;
	Fri, 27 Jun 2025 16:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751041366;
	bh=S4rQXSxYy7l30Jex5dOyQNVkfrqjgNBFJChd03NJJd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q9+kRI24E/sv8i/YQJ0N921DtCB+0kcRk3H1pQUMNQtT02K02PjfsySme4B8GniwI
	 9dRRJgnIYjYIcYjcs5Tb6obHmqh8Twkaf0TCIOBrTfj53TmQdFrvAxOP+wruzM3Ril
	 JCTW0cM7wsH4IW+Zw3XsSKRN7zxXgWdw8fzZVfaBSHnAOFcYr4+qCebHHiZca51pkr
	 3BUYtnmUuDrHiFYPlicYhuFNogDvoLoyaU3CKheMqkHeHJarNuPc7Ks6Whuzf7UE8A
	 TZW+lJ9Gtdsw5sd9/k4NKCLKh0F893QUDS6oOqMbIefzWUsXHa7lfFZkbD8l+/snV+
	 iZPTmjg/hmAvQ==
Date: Fri, 27 Jun 2025 11:22:45 -0500
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
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
	Arnd Bergmann <arnd@arndb.de>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 18/28] of: property: Allow fw_devlink device-tree on
 x86 when PCI device-tree node creation is enabled
Message-ID: <20250627162245.GA3513535-robh@kernel.org>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-19-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134817.681832-19-herve.codina@bootlin.com>

On Fri, Jun 13, 2025 at 03:47:58PM +0200, Herve Codina wrote:
> PCI drivers can use a device-tree overlay to describe the hardware
> available on the PCI board. This is the case, for instance, of the
> LAN966x PCI device driver.
> 
> Adding some more nodes in the device-tree overlay adds some more
> consumer/supplier relationship between devices instantiated from this
> overlay.
> 
> Those fw_node consumer/supplier relationships are handled by fw_devlink
> and are created based on the device-tree parsing done by the
> of_fwnode_add_links() function.
> 
> Those consumer/supplier links are needed in order to ensure a correct PM
> runtime management and a correct removal order between devices.
> 
> For instance, without those links a supplier can be removed before its
> consumers is removed leading to all kind of issue if this consumer still
> want the use the already removed supplier.
> 
> The support for the usage of an overlay from a PCI driver has been added
> on x86 systems in commit 1f340724419ed ("PCI: of: Create device tree PCI
> host bridge node").
> 
> In the past, support for fw_devlink on x86 had been tried but this
> support has been removed in commit 4a48b66b3f52 ("of: property: Disable
> fw_devlink DT support for X86"). Indeed, this support was breaking some
> x86 systems such as OLPC system and the regression was reported in [0].
> 
> Instead of disabling this support for all x86 system, a first approach
> would be to use a finer grain and disable this support only for the
> possible problematic subset of x86 systems (at least OLPC and CE4100).
> 
> This first approach could still leads to issues. Indeed, the list of
> possible problematic system and the way to identify them using Kconfig
> symbols is not well defined and so some system can be missed leading to
> kernel regressions on those missing systems.
> 
> Use an other way and enable the support on x86 system only when this
> support is needed by some specific feature. The usage of a device-tree
> overlay by a PCI driver and thus the creation of PCI device-tree nodes
> is a feature that needs it.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Link: https://lore.kernel.org/lkml/3c1f2473-92ad-bfc4-258e-a5a08ad73dd0@web.de/ [0]
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/of/property.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index c1feb631e383..8b5cfee696e2 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1605,7 +1605,7 @@ static int of_fwnode_add_links(struct fwnode_handle *fwnode)
>  	const struct property *p;
>  	struct device_node *con_np = to_of_node(fwnode);
>  
> -	if (IS_ENABLED(CONFIG_X86))
> +	if (IS_ENABLED(CONFIG_X86) && !IS_ENABLED(CONFIG_PCI_DYNAMIC_OF_NODES))

I really want CONFIG_PCI_DYNAMIC_OF_NODES to go away at some point, not 
add more users. 

I think this should instead check for specific platforms not with 
kconfig symbols but DT properties. For ce4100, you can just check the 
root compatible string. For OLPC, there isn't a root compatible (in the 
DT I have). You could check for /architecture == OLPC instead. There's 
some virtualization guests using DT now too. I would think their DT's 
are simple enough to avoid any fw_devlink issues. 

Alternatively, we could perhaps make x86 fw_devlink default off and then 
enable it only when you create nodes. Maybe it has to be restricted a 
sub tree of the DT to avoid any later interactions if devices are 
unbound and rebound. Not a fully fleshed out idea...

Rob

