Return-Path: <linux-i2c+bounces-6198-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D35C196C29E
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 17:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F37DB1C223FE
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 15:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E7F1DEFCE;
	Wed,  4 Sep 2024 15:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EtUbiqX6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF5F39FFE;
	Wed,  4 Sep 2024 15:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725464268; cv=none; b=BnX3x/jnP1LQdcJusqN+ZTuoMD+iJ7A6oftT7hcQebXSOAfMA1ONxZG9Y/oD2FQVxPhDBit+vxAQCU+9CXu8swI6yGI2U6lcSOYf7z2fIYDHaDeWZrncOZune+VS7etofqa9NQ2+vfPMLdiw1v/fqk8UqjseJcqhWDuDRecWeSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725464268; c=relaxed/simple;
	bh=1N29JHgehPKySQHCkVwdmFmA/1Fxv0X3tVIdFmrsfcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IEtp72csESs5ImcMk29txTmKB/HMwELypVwQxx/0kMGac3BSiMxtnhhBkjbnJRaoCE+OguW7olowOWRONtR9AUgJmW3Bk8YC1LQOzMWuPHWXpJSJxhrO0LHQPnUAopWACBG1tVgK57gkPn+7359nC3Po1tmYGxFSFmtLoG4I61M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EtUbiqX6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB18AC4CEC3;
	Wed,  4 Sep 2024 15:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725464267;
	bh=1N29JHgehPKySQHCkVwdmFmA/1Fxv0X3tVIdFmrsfcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EtUbiqX6an7G80pPKJmlYPyUCc1V5X8EndGTyQlPWEWF9UOtKk4sOov8u9PSguFJi
	 yNTgOo2bcabI86fKz9vITyYotHiU4TQboz2WXEXLwGsqW2SocThtObGF0Ysvo9iN1o
	 64oCw5UJDbpsKkRDRfKCuRHBfXeDJs5r84QC7H/bAWy5PZtoWAPN1hmDHjHwOcD7Ft
	 c9LeKzuNq9FPYfpF5uc5VIW5T5tGybTbBkXeYciA07SQGyRw9182AgZYZ5PoGUfXZ+
	 rDKe0UdKqlv77NQCJBAc0+5tfcScUHyRfOvviUfsmpbcovUxU31VsFP+V+iTLo7Msd
	 P81icHIWTc7yA==
Date: Wed, 4 Sep 2024 10:37:46 -0500
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 08/12] i2c: Introduce OF component probe function
Message-ID: <20240904153746.GA2610341-robh@kernel.org>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-9-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904090016.2841572-9-wenst@chromium.org>

On Wed, Sep 04, 2024 at 05:00:10PM +0800, Chen-Yu Tsai wrote:
> Some devices are designed and manufactured with some components having
> multiple drop-in replacement options. These components are often
> connected to the mainboard via ribbon cables, having the same signals
> and pin assignments across all options. These may include the display
> panel and touchscreen on laptops and tablets, and the trackpad on
> laptops. Sometimes which component option is used in a particular device
> can be detected by some firmware provided identifier, other times that
> information is not available, and the kernel has to try to probe each
> device.
> 
> This change attempts to make the "probe each device" case cleaner. The
> current approach is to have all options added and enabled in the device
> tree. The kernel would then bind each device and run each driver's probe
> function. This works, but has been broken before due to the introduction
> of asynchronous probing, causing multiple instances requesting "shared"
> resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> time, with only one instance succeeding. Work arounds for these include
> moving the pinmux to the parent I2C controller, using GPIO hogs or
> pinmux settings to keep the GPIO pins in some fixed configuration, and
> requesting the interrupt line very late. Such configurations can be seen
> on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> Lenovo Thinkpad 13S.
> 
> Instead of this delicate dance between drivers and device tree quirks,
> this change introduces a simple I2C component probe. function For a
> given class of devices on the same I2C bus, it will go through all of
> them, doing a simple I2C read transfer and see which one of them responds.
> It will then enable the device that responds.
> 
> This requires some minor modifications in the existing device tree. The
> status for all the device nodes for the component options must be set
> to "failed-needs-probe". This makes it clear that some mechanism is
> needed to enable one of them, and also prevents the prober and device
> drivers running at the same time.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v5:
> - Fixed indent in Makefile
> - Split regulator and GPIO TODO items
> - Reversed final conditional in i2c_of_probe_enable_node()
> 
> Changes since v4:
> - Split code into helper functions
> - Use scoped helpers and __free() to reduce error path
> 
> Changes since v3:
> - Complete kernel-doc
> - Return different error if I2C controller is disabled
> - Expand comment to explain assumptions and constraints
> - Split for-loop finding target node and operations on target node
> - Add missing i2c_put_adapter()
> - Move prober code to separate file
> 
> Rob also asked why there was a limitation of "exactly one touchscreen
> will be enabled across the whole tree".
> 
> The use case this prober currently targets is a component on consumer
> electronics (tablet or laptop) being swapped out due to cost or supply
> reasons. Designs with multiple components of the same type are pretty
> rare. The way the next patch is written also assumes this for efficiency
> reasons.
> 
> Changes since v2:
> - New patch split out from "of: Introduce hardware prober driver"
> - Addressed Rob's comments
>   - Move i2c prober to i2c subsystem
>   - Use of_node_is_available() to check if node is enabled.
>   - Use OF changeset API to update status property
> - Addressed Andy's comments
>   - Probe function now accepts "struct device *dev" instead to reduce
>     line length and dereferences
>   - Move "ret = 0" to just before for_each_child_of_node(i2c_node, node)
> ---
>  drivers/i2c/Makefile             |   1 +
>  drivers/i2c/i2c-core-of-prober.c | 158 +++++++++++++++++++++++++++++++
>  include/linux/i2c.h              |   4 +
>  3 files changed, 163 insertions(+)
>  create mode 100644 drivers/i2c/i2c-core-of-prober.c
> 
> diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
> index f12d6b10a85e..c539cdc1e305 100644
> --- a/drivers/i2c/Makefile
> +++ b/drivers/i2c/Makefile
> @@ -9,6 +9,7 @@ i2c-core-objs			:= i2c-core-base.o i2c-core-smbus.o
>  i2c-core-$(CONFIG_ACPI)		+= i2c-core-acpi.o
>  i2c-core-$(CONFIG_I2C_SLAVE)	+= i2c-core-slave.o
>  i2c-core-$(CONFIG_OF)		+= i2c-core-of.o
> +i2c-core-$(CONFIG_OF_DYNAMIC)	+= i2c-core-of-prober.o
>  
>  obj-$(CONFIG_I2C_SMBUS)		+= i2c-smbus.o
>  obj-$(CONFIG_I2C_CHARDEV)	+= i2c-dev.o
> diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
> new file mode 100644
> index 000000000000..64d7631f4885
> --- /dev/null
> +++ b/drivers/i2c/i2c-core-of-prober.c
> @@ -0,0 +1,158 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Linux I2C core OF component prober code
> + *
> + * Copyright (C) 2024 Google LLC
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/dev_printk.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +
> +/*
> + * Some devices, such as Google Hana Chromebooks, are produced by multiple
> + * vendors each using their preferred components. Such components are all
> + * in the device tree. Instead of having all of them enabled and having each
> + * driver separately try and probe its device while fighting over shared
> + * resources, they can be marked as "fail-needs-probe" and have a prober
> + * figure out which one is actually used beforehand.
> + *
> + * This prober assumes such drop-in parts are on the same I2C bus, have
> + * non-conflicting addresses, and can be directly probed by seeing which
> + * address responds.
> + *
> + * TODO:
> + * - Support handling common regulators.
> + * - Support handling common GPIOs.
> + * - Support I2C muxes
> + */
> +
> +static struct device_node *i2c_of_probe_get_i2c_node(struct device *dev, const char *type)
> +{
> +	struct device_node *node __free(device_node) = of_find_node_by_name(NULL, type);
> +	if (!node)
> +		return dev_err_ptr_probe(dev, -ENODEV, "Could not find %s device node\n", type);
> +
> +	struct device_node *i2c_node __free(device_node) = of_get_parent(node);
> +	if (!of_node_name_eq(i2c_node, "i2c"))
> +		return dev_err_ptr_probe(dev, -EINVAL, "%s device isn't on I2C bus\n", type);
> +
> +	if (!of_device_is_available(i2c_node))
> +		return dev_err_ptr_probe(dev, -ENODEV, "I2C controller not available\n");
> +
> +	return no_free_ptr(i2c_node);
> +}
> +
> +static int i2c_of_probe_enable_node(struct device *dev, struct device_node *node)
> +{
> +	int ret;
> +
> +	dev_info(dev, "Enabling %pOF\n", node);
> +
> +	struct of_changeset *ocs __free(kfree) = kzalloc(sizeof(*ocs), GFP_KERNEL);
> +	if (!ocs)
> +		return -ENOMEM;
> +
> +	of_changeset_init(ocs);
> +	ret = of_changeset_update_prop_string(ocs, node, "status", "okay");
> +	if (ret)
> +		return ret;
> +
> +	ret = of_changeset_apply(ocs);
> +	if (ret) {
> +		/* ocs needs to be explicitly cleaned up before being freed. */
> +		of_changeset_destroy(ocs);
> +	} else {
> +		/*
> +		 * ocs is intentionally kept around as it needs to
> +		 * exist as long as the change is applied.
> +		 */
> +		void *ptr __always_unused = no_free_ptr(ocs);
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * i2c_of_probe_component() - probe for devices of "type" on the same i2c bus
> + * @dev: &struct device of the caller, only used for dev_* printk messages
> + * @type: a string to match the device node name prefix to probe for
> + *
> + * Probe for possible I2C components of the same "type" on the same I2C bus
> + * that have their status marked as "fail".
> + *
> + * Assumes that across the entire device tree the only instances of nodes
> + * prefixed with "type" are the ones that need handling for second source
> + * components. In other words, if type is "touchscreen", then all device
> + * nodes named "touchscreen*" are the ones that need probing. There cannot
> + * be another "touchscreen" node that is already enabled.
> + *
> + * Assumes that for each "type" of component, only one actually exists. In
> + * other words, only one matching and existing device will be enabled.
> + *
> + * Context: Process context only. Does non-atomic I2C transfers.
> + *          Should only be used from a driver probe function, as the function
> + *          can return -EPROBE_DEFER if the I2C adapter is unavailable.
> + * Return: 0 on success or no-op, error code otherwise.
> + *         A no-op can happen when it seems like the device tree already
> + *         has components of the type to be probed already enabled. This
> + *         can happen when the device tree had not been updated to mark
> + *         the status of the to-be-probed components as "fail". Or this
> + *         function was already run with the same parameters and succeeded
> + *         in enabling a component. The latter could happen if the user
> + *         had multiple types of components to probe, and one of them down
> + *         the list caused a deferred probe. This is expected behavior.
> + */
> +int i2c_of_probe_component(struct device *dev, const char *type)
> +{
> +	struct i2c_adapter *i2c;
> +	int ret;
> +
> +	struct device_node *i2c_node __free(device_node) = i2c_of_probe_get_i2c_node(dev, type);
> +	if (IS_ERR(i2c_node))
> +		return PTR_ERR(i2c_node);
> +
> +	for_each_child_of_node_scoped(i2c_node, node) {

for_each_available_child_of_node_scoped()


> +		if (!of_node_name_prefix(node, type))
> +			continue;
> +		if (!of_device_is_available(node))
> +			continue;
> +
> +		/*
> +		 * Device tree has component already enabled. Either the
> +		 * device tree isn't supported or we already probed once.
> +		 */
> +		return 0;
> +	}

