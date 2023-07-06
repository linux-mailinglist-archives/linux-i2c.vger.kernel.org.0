Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24E3274A076
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 17:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbjGFPJS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jul 2023 11:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbjGFPJO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jul 2023 11:09:14 -0400
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D49578F;
        Thu,  6 Jul 2023 08:09:11 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-78374596182so27252839f.0;
        Thu, 06 Jul 2023 08:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656151; x=1691248151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agWvj58WC7T3LMV2aGcahAHT9AGyWaUQQ/8M5V5YO7c=;
        b=RvynrG4Gaj59q5AelhXgJdxmf0j4urySDL3yksj7JIcrHM/tJ9fjnm8U88Hp4Q3Ryd
         4ube/ievVN2Mx37LaTh3w3oPyQQmf4Fz01JwgtYTV6/ooPFAfg2nMuMWQ9mIledk2jNE
         KcPnjbXj1O9wcBrrXmi6vI/zVDc17Chb5j2fRvszqeNP1hdUKYN9wcnEQN/p7pWtXDJE
         mLRpXrvmIfoRZtncUfHyvPVizznrts4b0w1QaxcRX2hpyWbTDpYe06fEcPbV7NGgJdsl
         RAqDqVPA3bQ2iv7R9VwZa0aPUwUku0NeQPDn80D2X1j6eKFi1SDImSQ6NU0IRGrSeOM2
         52fQ==
X-Gm-Message-State: ABy/qLafeNEqKp1e3JCeCBNH+wMtfhDhh8Pz8MoV6zzKMdsrNvocK6e7
        O+7dM1b7mh1lN1gae9IwKA==
X-Google-Smtp-Source: APBJJlFGJU3qjnUCwyswSCpMUMJfvzDFSrJMHX7BS+SXsEGBzdCLa2ewD7RnXVHqaGFITbuGMesUOA==
X-Received: by 2002:a05:6602:42d3:b0:77e:3e85:34ee with SMTP id ce19-20020a05660242d300b0077e3e8534eemr2353957iob.13.1688656150906;
        Thu, 06 Jul 2023 08:09:10 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id t16-20020a02c910000000b00411bdcdc488sm558535jao.173.2023.07.06.08.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:09:10 -0700 (PDT)
Received: (nullmailer pid 3902613 invoked by uid 1000);
        Thu, 06 Jul 2023 15:09:06 -0000
Date:   Thu, 6 Jul 2023 09:09:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc:     Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        alexandre.torgue@foss.st.com, vkoul@kernel.org, jic23@kernel.org,
        olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
        mchehab@kernel.org, fabrice.gasnier@foss.st.com,
        andi.shyti@kernel.org, ulf.hansson@linaro.org, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, hugues.fruchet@foss.st.com,
        lee@kernel.org, will@kernel.org, catalin.marinas@arm.com,
        arnd@kernel.org, richardcochran@gmail.com,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        netdev@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 05/10] firewall: introduce stm32_firewall framework
Message-ID: <20230706150906.GB3858320-robh@kernel.org>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-6-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705172759.1610753-6-gatien.chevallier@foss.st.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 05, 2023 at 07:27:54PM +0200, Gatien Chevallier wrote:
> Introduce a firewall framework that offers to firewall consumers different
> firewall services such as the ability to check their access rights against
> their firewall controller(s).
> 
> The firewall framework offers a generic API that is defined in firewall
> controllers drivers to best fit the specificity of each firewall.
> 
> There are various types of firewalls:
> -Peripheral firewalls that filter accesses to peripherals
> -Memory firewalls that filter accesses to memories or memory regions
> -Resource firewalls that filter accesses to internal resources such as
> reset and clock controllers

How do resource firewalls work? Access to registers for some clocks in a 
clock controller are disabled? Or something gates off clocks/resets to 
a block?

It might make more sense for "resource" accesses to be managed within 
those resource APIs (i.e. the clock and reset frameworks) and leave this 
framework to bus accesses.

> A firewall controller must be probed at arch_initcall level and register
> to the framework so that consumers can use their services.

initcall ordering hacks should not be needed. We have both deferred 
probe and fw_devlinks to avoid that problem.

> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  MAINTAINERS                               |   5 +
>  arch/arm64/Kconfig.platforms              |   1 +
>  drivers/bus/Kconfig                       |  10 +
>  drivers/bus/Makefile                      |   1 +
>  drivers/bus/stm32_firewall.c              | 252 ++++++++++++++++++++++
>  drivers/bus/stm32_firewall.h              |  83 +++++++

Why something stm32 specific? We know there are multiple platforms 
wanting something in this area. Wasn't the last attempt common?

For a common binding, I'm not eager to accept anything new with only 1 
user. 

>  include/linux/bus/stm32_firewall_device.h | 134 ++++++++++++
>  7 files changed, 486 insertions(+)
>  create mode 100644 drivers/bus/stm32_firewall.c
>  create mode 100644 drivers/bus/stm32_firewall.h
>  create mode 100644 include/linux/bus/stm32_firewall_device.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 41385f01fa98..fabf95ba9b86 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20123,6 +20123,11 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
>  F:	drivers/media/i2c/st-mipid02.c
>  
> +ST STM32 FIREWALL
> +M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
> +S:	Maintained
> +F:	drivers/bus/stm32_firewall.c
> +
>  ST STM32 I2C/SMBUS DRIVER
>  M:	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
>  M:	Alain Volmat <alain.volmat@foss.st.com>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 6069120199bb..5a46e90f1e4e 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -293,6 +293,7 @@ config ARCH_STM32
>  	select ARM_SMC_MBOX
>  	select ARM_SCMI_PROTOCOL
>  	select COMMON_CLK_SCMI
> +	select STM32_FIREWALL
>  	help
>  	  This enables support for ARMv8 based STMicroelectronics
>  	  STM32 family, including:
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index fcfa280df98a..4d54a7ea52b2 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -163,6 +163,16 @@ config QCOM_SSC_BLOCK_BUS
>  	  i2c/spi/uart controllers, a hexagon core, and a clock controller
>  	  which provides clocks for the above.
>  
> +config STM32_FIREWALL
> +	bool "STM32 Firewall framework"
> +	depends on ARCH_STM32
> +	default MACH_STM32MP157 || MACH_STM32MP13 || MACH_STM32MP25
> +	help
> +	  Say y to enable firewall framework and its services. Firewall
> +	  controllers will be able to register to the framework. Firewall
> +	  controllers must be initialized and register to the firewall framework
> +	  at arch_initcall level.
> +
>  config SUN50I_DE2_BUS
>  	bool "Allwinner A64 DE2 Bus Driver"
>  	  default ARM64
> diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
> index d90eed189a65..fc0511450ec2 100644
> --- a/drivers/bus/Makefile
> +++ b/drivers/bus/Makefile
> @@ -26,6 +26,7 @@ obj-$(CONFIG_OMAP_INTERCONNECT)	+= omap_l3_smx.o omap_l3_noc.o
>  obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
>  obj-$(CONFIG_QCOM_EBI2)		+= qcom-ebi2.o
>  obj-$(CONFIG_QCOM_SSC_BLOCK_BUS)	+= qcom-ssc-block-bus.o
> +obj-$(CONFIG_STM32_FIREWALL)	+= stm32_firewall.o
>  obj-$(CONFIG_SUN50I_DE2_BUS)	+= sun50i-de2.o
>  obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
>  obj-$(CONFIG_OF)		+= simple-pm-bus.o
> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
> new file mode 100644
> index 000000000000..510db5bc6eaf
> --- /dev/null
> +++ b/drivers/bus/stm32_firewall.c
> @@ -0,0 +1,252 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later

The default kernel license is GPL-2.0-only. Why the deviation?

> +/*
> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/bus/stm32_firewall_device.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +
> +#include "stm32_firewall.h"
> +
> +/* Corresponds to STM32_FIREWALL_MAX_EXTRA_ARGS + firewall controller reference + firewall ID */
> +#define STM32_FIREWALL_MAX_ARGS		(STM32_FIREWALL_MAX_EXTRA_ARGS + 2)
> +
> +static LIST_HEAD(firewall_controller_list);
> +static DEFINE_MUTEX(firewall_controller_list_lock);
> +
> +static int stm32_firewall_get_id(struct device_node *np, u32 *id)
> +{
> +	u32 feature_domain_cell[2];
> +
> +	/* Get property from device node */
> +	if (of_property_read_u32_array(np, "feature-domains",
> +				       feature_domain_cell,
> +				       ARRAY_SIZE(feature_domain_cell))) {
> +		pr_err("Unable to find get firewall ID property\n");
> +		return -ENODEV;
> +	}
> +
> +	*id = feature_domain_cell[1];
> +
> +	return 0;
> +}
> +
> +/* Firewall device API */
> +
> +int stm32_firewall_get_firewall(struct device_node *np,
> +				struct stm32_firewall *firewall)
> +{
> +	struct stm32_firewall_controller *ctrl;
> +	struct of_phandle_args args;
> +	u32 controller_phandle;
> +	bool match = false;
> +	size_t i;
> +	int err;
> +
> +	if (!firewall)
> +		return -EINVAL;
> +
> +	/* The controller phandle is always the first argument of the feature-domains property. */
> +	err = of_property_read_u32(np, "feature-domains", &controller_phandle);

Why do you need to parse the property twice?

> +	if (err) {
> +		pr_err("Unable to get feature-domains property for node %s\n", np->full_name);
> +		return err;
> +	}
> +
> +	/* Parse property with phandle parsed out */
> +	err = of_parse_phandle_with_args(np, "feature-domains", "#feature-domain-cells", 0, &args);
> +	if (err) {
> +		pr_err("Unable to read feature-domains arguments for node %s\n", np->full_name);
> +		return err;
> +	}
> +
> +	/* The phandle is parsed out */
> +	if (args.args_count > STM32_FIREWALL_MAX_ARGS - 1)
> +		return -EINVAL;
> +
> +	of_node_put(np);
> +
> +	/* Check if the parsed phandle corresponds to a registered firewall controller */
> +	mutex_lock(&firewall_controller_list_lock);
> +	list_for_each_entry(ctrl, &firewall_controller_list, entry) {
> +		if (ctrl->dev->of_node->phandle == controller_phandle) {
> +			match = true;
> +			firewall->firewall_ctrl = ctrl;
> +			break;
> +		}
> +	}
> +	mutex_unlock(&firewall_controller_list_lock);
> +	if (!match) {
> +		firewall->firewall_ctrl = NULL;
> +		pr_err("No firewall controller registered for %s\n", np->full_name);
> +		return -ENODEV;
> +	}
> +
> +	/*
> +	 * The firewall ID is always the second argument of the feature-domains property.
> +	 * The first argument is already parsed out, so args.args[0] is the second argument.
> +	 */
> +	firewall->firewall_id = args.args[0];
> +
> +	/* Extra args start at the third argument */
> +	for (i = 0; i < args.args_count; i++)
> +		firewall->extra_args[i] = args.args[i + 1];
> +
> +	/* Remove the firewall ID arg that is not an extra argument */
> +	if (args.args_count >= 1)
> +		firewall->extra_args_size = args.args_count - 1;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(stm32_firewall_get_firewall);
> +
> +int stm32_firewall_grant_access(struct stm32_firewall *firewall)
> +{
> +	struct stm32_firewall_controller *firewall_controller;
> +
> +	if (!firewall || firewall->firewall_id == U32_MAX)
> +		return -EINVAL;
> +
> +	firewall_controller = firewall->firewall_ctrl;
> +
> +	if (!firewall_controller)
> +		return -ENODEV;
> +
> +	return firewall_controller->grant_access(firewall_controller, firewall->firewall_id);
> +}
> +EXPORT_SYMBOL_GPL(stm32_firewall_grant_access);
> +
> +int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id)
> +{
> +	struct stm32_firewall_controller *firewall_controller;
> +
> +	if (!firewall || subsystem_id == U32_MAX || firewall->firewall_id == U32_MAX)
> +		return -EINVAL;
> +
> +	firewall_controller = firewall->firewall_ctrl;
> +
> +	if (!firewall_controller)
> +		return -ENODEV;
> +
> +	return firewall_controller->grant_access(firewall_controller, subsystem_id);
> +}
> +EXPORT_SYMBOL_GPL(stm32_firewall_grant_access_by_id);
> +
> +void stm32_firewall_release_access(struct stm32_firewall *firewall)
> +{
> +	struct stm32_firewall_controller *firewall_controller;
> +
> +	if (!firewall || firewall->firewall_id == U32_MAX) {
> +		pr_err("Incorrect arguments when releasing a firewall access");
> +		return;
> +	}
> +
> +	firewall_controller = firewall->firewall_ctrl;
> +
> +	if (!firewall_controller) {
> +		pr_debug("No firewall controller to release");
> +		return;
> +	}
> +
> +	firewall_controller->release_access(firewall_controller, firewall->firewall_id);
> +}
> +EXPORT_SYMBOL_GPL(stm32_firewall_release_access);
> +
> +void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id)
> +{
> +	struct stm32_firewall_controller *firewall_controller;
> +
> +	if (!firewall || subsystem_id == U32_MAX || firewall->firewall_id == U32_MAX) {
> +		pr_err("Incorrect arguments when releasing a firewall access");
> +		return;
> +	}
> +
> +	firewall_controller = firewall->firewall_ctrl;
> +
> +	if (!firewall_controller) {
> +		pr_debug("No firewall controller to release");
> +		return;
> +	}
> +
> +	firewall_controller->release_access(firewall_controller, subsystem_id);
> +}
> +EXPORT_SYMBOL_GPL(stm32_firewall_release_access_by_id);
> +
> +/* Firewall controller API */
> +
> +int stm32_firewall_controller_register(struct stm32_firewall_controller *firewall_controller)
> +{
> +	pr_info("Registering firewall controller %s", dev_name(firewall_controller->dev));
> +
> +	if (!firewall_controller)
> +		return -ENODEV;
> +
> +	mutex_lock(&firewall_controller_list_lock);
> +	list_add_tail(&firewall_controller->entry, &firewall_controller_list);
> +	mutex_unlock(&firewall_controller_list_lock);
> +
> +	return 0;
> +
> +}
> +
> +void stm32_firewall_controller_unregister(struct stm32_firewall_controller *firewall_controller)
> +{
> +	struct stm32_firewall_controller *ctrl, *tmp;
> +	bool controller_removed = false;
> +
> +	if (!firewall_controller) {
> +		pr_debug("Null reference while unregistering firewall controller");
> +		return;
> +	}
> +
> +	mutex_lock(&firewall_controller_list_lock);
> +	list_for_each_entry_safe(ctrl, tmp, &firewall_controller_list, entry) {
> +		if (ctrl == firewall_controller) {
> +			controller_removed = true;
> +			list_del_init(&ctrl->entry);
> +			break;
> +		}
> +	}
> +	mutex_unlock(&firewall_controller_list_lock);
> +
> +	if (!controller_removed)
> +		pr_debug("There was no firewall controller named %s to unregister",
> +			 dev_name(firewall_controller->dev));
> +}
> +
> +void stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
> +{
> +	struct device_node *child;
> +	struct device *parent;
> +	u32 firewall_id;
> +	int err;
> +
> +	parent = firewall_controller->dev;
> +
> +	dev_dbg(parent, "Populating %s system bus\n", dev_name(firewall_controller->dev));
> +
> +	for_each_available_child_of_node(dev_of_node(parent), child) {
> +		err = stm32_firewall_get_id(child, &firewall_id);
> +		if (err < 0 ||
> +		    firewall_controller->grant_access(firewall_controller, firewall_id)) {
> +			/*
> +			 * Peripheral access not allowed or not defined.
> +			 * Mark the node as populated so platform bus won't probe it
> +			 */
> +			of_node_set_flag(child, OF_POPULATED);
> +			dev_err(parent, "%s: Device driver will not be probed\n",
> +				child->full_name);
> +		}
> +	}
> +}
> diff --git a/drivers/bus/stm32_firewall.h b/drivers/bus/stm32_firewall.h
> new file mode 100644
> index 000000000000..8d92e8c1ab77
> --- /dev/null
> +++ b/drivers/bus/stm32_firewall.h
> @@ -0,0 +1,83 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
> + */
> +
> +#ifndef _STM32_FIREWALL_H
> +#define _STM32_FIREWALL_H
> +
> +#include <linux/kernel.h>
> +#include <linux/list.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +
> +/**
> + * STM32_PERIPHERAL_FIREWALL:		This type of firewall protects peripherals
> + * STM32_MEMORY_FIREWALL:		This type of firewall protects memories/subsets of memory
> + *					zones
> + * STM32_RESOURCE_FIREWALL:		This type of firewall protects internal resources
> + * STM32_NOTYPE_FIREWALL:		Undefined firewall type
> + */
> +
> +#define STM32_PERIPHERAL_FIREWALL	BIT(1)
> +#define STM32_MEMORY_FIREWALL		BIT(2)
> +#define STM32_RESOURCE_FIREWALL		BIT(3)
> +#define STM32_NOTYPE_FIREWALL		BIT(4)
> +
> +/**
> + * struct stm32_firewall_controller - Information on firewall controller supplying services
> + *
> + * @name			Name of the firewall controller
> + * @dev				Device reference of the firewall controller
> + * @mmio			Base address of the firewall controller
> + * @entry			List entry of the firewall controller list
> + * @type			Type of firewall
> + * @max_entries			Number of entries covered by the firewall
> + * @grant_access		Callback used to grant access for a device access against a
> + *				firewall controller
> + * @release_access		Callback used to release resources taken by a device when access was
> + *				granted
> + * @grant_memory_range_access	Callback used to grant access for a device to a given memory region
> + */
> +struct stm32_firewall_controller {
> +	const char *name;
> +	struct device *dev;
> +	void __iomem *mmio;
> +	struct list_head entry;
> +	unsigned int type;
> +	unsigned int max_entries;
> +
> +	int (*grant_access)(struct stm32_firewall_controller *ctrl, u32 id);
> +	void (*release_access)(struct stm32_firewall_controller *ctrl, u32 id);
> +	int (*grant_memory_range_access)(struct stm32_firewall_controller *ctrl, phys_addr_t paddr,
> +					 size_t size);
> +};
> +
> +/**
> + * int stm32_firewall_controller_register - Register a firewall controller to the STM32 firewall
> + *					    framework
> + * @firewall_controller		Firewall controller to register
> + *
> + * Returns 0 in case of success or -ENODEV if no controller was given.
> + */
> +int stm32_firewall_controller_register(struct stm32_firewall_controller *firewall_controller);
> +
> +/**
> + * int stm32_firewall_controller_unregister - Unregister a firewall controller from the STM32
> + *					      firewall framework
> + * @firewall_controller		Firewall controller to unregister
> + */
> +void stm32_firewall_controller_unregister(struct stm32_firewall_controller *firewall_controller);
> +
> +/**
> + * stm32_firewall_populate_bus - Populate device tree nodes that have a correct firewall
> + *				 configuration. This is used at boot-time only, as a sanity check
> + *				 between device tree and firewalls hardware configurations to
> + *				 prevent a kernel crash when a device driver is not granted access
> + *
> + * @firewall_controller		Firewall controller which nodes will be populated or not
> + */
> +void stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller);
> +
> +#endif /* _STM32_FIREWALL_H */
> diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
> new file mode 100644
> index 000000000000..ccaecea7fc6c
> --- /dev/null
> +++ b/include/linux/bus/stm32_firewall_device.h
> @@ -0,0 +1,134 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
> + */
> +
> +#ifndef STM32_FIREWALL_DEVICE_H
> +#define STM32_FIREWALL_DEVICE_H
> +
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +
> +#define STM32_FIREWALL_MAX_EXTRA_ARGS		5
> +
> +/* Opaque reference to stm32_firewall_controller */
> +struct stm32_firewall_controller;
> +
> +/**
> + * stm32_firewall - Information on a device's firewall. Each device can have more than one firewall.
> + *
> + * @firewall_ctrl		Pointer referencing a firewall controller of the device. It is
> + *				opaque so a device cannot manipulate the controller's ops or access
> + *				the controller's data
> + * @extra_args			Extra arguments that are implementation dependent
> + * @extra_args_size		Number of extra arguments
> + * @firewall_id			Firewall ID associated the device for this firewall controller
> + */
> +struct stm32_firewall {
> +	struct stm32_firewall_controller *firewall_ctrl;
> +	u32 extra_args[STM32_FIREWALL_MAX_EXTRA_ARGS];
> +	size_t extra_args_size;
> +	u32 firewall_id;
> +};
> +
> +#if IS_ENABLED(CONFIG_STM32_FIREWALL)
> +/**
> + * stm32_firewall_get_firewall - Get the firewall(s) associated to given device.
> + *				 The firewall controller reference is always the first argument
> + *				 of the feature-domains property.
> + *				 The firewall ID is always the second argument of the
> + *				 feature-domains property.
> + *
> + * @np				Device node to parse
> + * @firewall			Resulting firewall reference(s)
> + *
> + * Returns 0 on success, -ENODEV if there's no match with a firewall controller or appropriate errno
> + * code if error occurred.
> + */
> +int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *firewall);
> +
> +/**
> + * stm32_firewall_grant_access - Request firewall access rights and grant access.
> + *
> + * @firewall			Firewall reference containing the ID to check against its firewall
> + *				controller
> + *
> + * Returns 0 if access is granted, -EACCES if access is denied, -ENODEV if firewall is null or
> + * appropriate errno code if error occurred
> + */
> +int stm32_firewall_grant_access(struct stm32_firewall *firewall);
> +
> +/**
> + * stm32_firewall_release_access - Release access granted from a call to
> + *				   stm32_firewall_grant_access().
> + *
> + * @firewall			Firewall reference containing the ID to check against its firewall
> + *				controller
> + */
> +void stm32_firewall_release_access(struct stm32_firewall *firewall);
> +
> +/**
> + * stm32_firewall_grant_access_by_id - Request firewall access rights of a given device
> + *				       based on a specific firewall ID
> + *
> + * Warnings:
> + * There is no way to ensure that the given ID will correspond to the firewall referenced in the
> + * device node if the ID did not come from stm32_firewall_get_firewall(). In that case, this
> + * function must be used with caution.
> + * This function should be used for subsystem resources that do not have the same firewall ID
> + * as their parent.
> + * U32_MAX is an invalid ID.
> + *
> + * @firewall			Firewall reference containing the firewall controller
> + * @subsystem_id		Firewall ID of the subsystem resource
> + *
> + * Returns 0 if access is granted, -EACCES if access is denied, -ENODEV if firewall is null or
> + * appropriate errno code if error occurred
> + */
> +int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id);
> +
> +/**
> + * stm32_firewall_release_access_by_id - Release access granted from a call to
> + *					 stm32_firewall_grant_access_by_id().
> + *
> + * Warnings:
> + * There is no way to ensure that the given ID will correspond to the firewall referenced in the
> + * device node if the ID did not come from stm32_firewall_get_firewall(). In that case, this
> + * function must be used with caution.
> + * This function should be used for subsystem resources that do not have the same firewall ID
> + * as their parent.
> + * U32_MAX is an invalid ID.
> + *
> + * @firewall			Firewall reference containing the firewall controller
> + * @subsystem_id		Firewall ID of the subsystem resource
> + */
> +void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id);
> +
> +#else /* CONFIG_STM32_FIREWALL */
> +
> +int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *firewall)
> +{
> +	return -ENODEV;
> +}
> +
> +int stm32_firewall_grant_access(struct stm32_firewall *firewall)
> +{
> +	return -ENODEV;
> +}
> +
> +void stm32_firewall_release_access(struct stm32_firewall *firewall)
> +{
> +}
> +
> +int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id)
> +{
> +	return -ENODEV;
> +}
> +
> +void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id)
> +{
> +}
> +
> +#endif /* CONFIG_STM32_FIREWALL */
> +#endif /* STM32_FIREWALL_DEVICE_H */
> -- 
> 2.25.1
> 
