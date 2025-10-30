Return-Path: <linux-i2c+bounces-13907-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D8FC20BD2
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 15:52:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C7EAC4F0B64
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 14:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B900927A907;
	Thu, 30 Oct 2025 14:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCcQ0B+w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F88D14A91;
	Thu, 30 Oct 2025 14:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761835617; cv=none; b=bUWjfzZ8JZsrvMjC54vPYJCY/PT230PRPV/ystkJPp3ZB/z7jMprpGk2LPXm0ja47MY7dtFW+f9LePxZqX5eckFqzMogrVJWm96X2CDe8d0gRAEbuQ4sCD0UEcrAQIMXYggpRGtPMdRym4nEc90DUajp3HmIL30+wBnaHNMGr0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761835617; c=relaxed/simple;
	bh=ZbD7yOLwW/cgaU5VsklEXPxgoTiYiE4edNqVj6qNico=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e61Gp111G+88GCHPpvfyACPbeVEa3fw7ujsLioHbfn1WdfNd7WETM3webYkEcQGyQ6FVDOuZ7KhaLYWLd6Iw1jTYl4oa2MAYvRdJuOXqKs1HP2NhNxawgpVvihjzs5FN97DANRLXHYVLhFjb9BbjY83UKfG450dZuq3NFJNIf/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCcQ0B+w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840B5C4CEF8;
	Thu, 30 Oct 2025 14:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761835616;
	bh=ZbD7yOLwW/cgaU5VsklEXPxgoTiYiE4edNqVj6qNico=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FCcQ0B+w8LJ6ToMaS6Qm6GHAn0D54ovIPp2mSH+uiK/SKSLzgJBCV3Snalz6zFMcp
	 UUjEDY+D73uxZGayO0srDEnQe6uWD3GHNw3n7bYLcbuxIiA8/sBQTFaoJB7/cI09E2
	 XxQaY0TUrWYvhLs4KGQYVdvBusWUB9vRkaSu58MVvJheIaPF3suaEBTcmQ/puWLR8C
	 x0qSrQuC3NGFxPrA7RSI5DXKUzK3z0kbqOVAbyA6CUn+thpA0Y3NC/0rem3AnoO9I/
	 UblRftK8xQfF4/jViVZT1NPycEdWVdsd+pHU/H15mBM2H2zkXd3RmKIn0omPOZRxHc
	 Sf80ZkUjpjz5g==
Date: Thu, 30 Oct 2025 09:46:50 -0500
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Len Brown <lenb@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 19/29] of: property: Allow fw_devlink device-tree on
 x86
Message-ID: <20251030144650.GA3911092-robh@kernel.org>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
 <20251015071420.1173068-20-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015071420.1173068-20-herve.codina@bootlin.com>

On Wed, Oct 15, 2025 at 09:14:06AM +0200, Herve Codina wrote:
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
> Instead of disabling this support for all x86 system, use a finer grain
> and disable this support only for the possible problematic subset of x86
> systems (at least OLPC and CE4100).
> 
> Those systems use a device-tree to describe their hardware. Identify
> those systems using key properties in the device-tree.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Link: https://lore.kernel.org/lkml/3c1f2473-92ad-bfc4-258e-a5a08ad73dd0@web.de/ [0]
> ---
>  drivers/of/property.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index c1feb631e383..09b568e3b826 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1600,12 +1600,41 @@ static int of_fwnode_irq_get(const struct fwnode_handle *fwnode,
>  	return of_irq_get(to_of_node(fwnode), index);
>  }
>  
> +static int match_property_by_path(const char *node_path, const char *prop_name,
> +				  const char *value)
> +{
> +	struct device_node *np __free(device_node) = of_find_node_by_path(node_path);
> +
> +	return of_property_match_string(np, prop_name, value);
> +}
> +
> +static bool of_is_fwnode_add_links_supported(void)
> +{
> +	static int is_supported = -1;
> +
> +	if (is_supported != -1)
> +		return !!is_supported;
> +

All of this:

> +	if (match_property_by_path("/soc", "compatible", "intel,ce4100-cp") >= 0)
> +		goto not_supported;
> +
> +	if (match_property_by_path("/", "architecture", "OLPC") >= 0)
> +		goto not_supported;
> +
> +	is_supported = 1;
> +	return !!is_supported;
> +
> +not_supported:
> +	is_supported = 0;

can be simplified to:

is_supported = !((match_property_by_path("/soc", "compatible", "intel,ce4100-cp") >= 0) || 
                 (match_property_by_path("/", "architecture", "OLPC") >= 0));

> +	return !!is_supported;
> +}
> +
>  static int of_fwnode_add_links(struct fwnode_handle *fwnode)
>  {
>  	const struct property *p;
>  	struct device_node *con_np = to_of_node(fwnode);
>  
> -	if (IS_ENABLED(CONFIG_X86))
> +	if (IS_ENABLED(CONFIG_X86) && !of_is_fwnode_add_links_supported())

I would move the IS_ENABLED() check to 
of_is_fwnode_add_links_supported().

Rob

