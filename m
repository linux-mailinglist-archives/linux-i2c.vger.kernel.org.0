Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6570F74B381
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jul 2023 17:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233243AbjGGPB7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jul 2023 11:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233237AbjGGPB6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jul 2023 11:01:58 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3EEA2117;
        Fri,  7 Jul 2023 08:01:53 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 367CJqcS025684;
        Fri, 7 Jul 2023 17:01:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=eB9IoGWCIUvegW/ZzAcyhVetJXSpsKaIqIGV4oOGh/c=;
 b=tRhFLCWadOADsMtI7CDkPvEJbl4Tcr0n8Dd/Wx6sSteCwZNpX3HprcfJAwkDkxW7mrlR
 W68YnsETYM/v5EHMUG7yE+lRmrfi3GuqWkG1NCO6RcNSTwlrm2qsQgBad33QTYOMKt/j
 4LIJo1eclX8j6hsrk/00LbKEKlwxezamQK+933uDE/uNMegvqq+z98UMr+aUiQybkfRi
 m+ZJcRCYrDINREqlQ/+l+55fRxl+Bn+QWH65DbYzWPyjf4dQHlePuh+WT/jkPypNn2Gg
 AOemBmnLc9Blts1e5l8ve0zCZuChDSmAHX06A/w6ifnzXW/HP4YKQHckQYQC+a/m5q37 nA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rpjm7s44u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Jul 2023 17:01:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8627F100052;
        Fri,  7 Jul 2023 17:01:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C9272291CE;
        Fri,  7 Jul 2023 17:01:08 +0200 (CEST)
Received: from [10.201.21.121] (10.201.21.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 7 Jul
 2023 17:01:07 +0200
Message-ID: <66e74bba-ff7b-e3c1-9351-15bd23038e0d@foss.st.com>
Date:   Fri, 7 Jul 2023 17:01:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 05/10] firewall: introduce stm32_firewall framework
Content-Language: en-US
To:     Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "jic23@kernel.org" <jic23@kernel.org>,
        "olivier.moysan@foss.st.com" <olivier.moysan@foss.st.com>,
        "arnaud.pouliquen@foss.st.com" <arnaud.pouliquen@foss.st.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "fabrice.gasnier@foss.st.com" <fabrice.gasnier@foss.st.com>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "hugues.fruchet@foss.st.com" <hugues.fruchet@foss.st.com>,
        "lee@kernel.org" <lee@kernel.org>,
        "will@kernel.org" <will@kernel.org>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "arnd@kernel.org" <arnd@kernel.org>,
        "richardcochran@gmail.com" <richardcochran@gmail.com>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-6-gatien.chevallier@foss.st.com>
 <87a5w7zv8o.fsf@epam.com>
From:   Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <87a5w7zv8o.fsf@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_10,2023-07-06_02,2023-05-22_02
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Oleksii,

On 7/7/23 15:50, Oleksii Moisieiev wrote:
> 
> Gatien Chevallier <gatien.chevallier@foss.st.com> writes:
> 
>> Introduce a firewall framework that offers to firewall consumers different
>> firewall services such as the ability to check their access rights against
>> their firewall controller(s).
>>
>> The firewall framework offers a generic API that is defined in firewall
>> controllers drivers to best fit the specificity of each firewall.
>>
>> There are various types of firewalls:
>> -Peripheral firewalls that filter accesses to peripherals
>> -Memory firewalls that filter accesses to memories or memory regions
>> -Resource firewalls that filter accesses to internal resources such as
>> reset and clock controllers
>>
>> A firewall controller must be probed at arch_initcall level and register
>> to the framework so that consumers can use their services.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> ---
>>   MAINTAINERS                               |   5 +
>>   arch/arm64/Kconfig.platforms              |   1 +
>>   drivers/bus/Kconfig                       |  10 +
>>   drivers/bus/Makefile                      |   1 +
>>   drivers/bus/stm32_firewall.c              | 252 ++++++++++++++++++++++
>>   drivers/bus/stm32_firewall.h              |  83 +++++++
>>   include/linux/bus/stm32_firewall_device.h | 134 ++++++++++++
>>   7 files changed, 486 insertions(+)
>>   create mode 100644 drivers/bus/stm32_firewall.c
>>   create mode 100644 drivers/bus/stm32_firewall.h
>>   create mode 100644 include/linux/bus/stm32_firewall_device.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 41385f01fa98..fabf95ba9b86 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -20123,6 +20123,11 @@ T:	git git://linuxtv.org/media_tree.git
>>   F:	Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
>>   F:	drivers/media/i2c/st-mipid02.c
>>   
>> +ST STM32 FIREWALL
>> +M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
>> +S:	Maintained
>> +F:	drivers/bus/stm32_firewall.c
>> +
>>   ST STM32 I2C/SMBUS DRIVER
>>   M:	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
>>   M:	Alain Volmat <alain.volmat@foss.st.com>
>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>> index 6069120199bb..5a46e90f1e4e 100644
>> --- a/arch/arm64/Kconfig.platforms
>> +++ b/arch/arm64/Kconfig.platforms
>> @@ -293,6 +293,7 @@ config ARCH_STM32
>>   	select ARM_SMC_MBOX
>>   	select ARM_SCMI_PROTOCOL
>>   	select COMMON_CLK_SCMI
>> +	select STM32_FIREWALL
>>   	help
>>   	  This enables support for ARMv8 based STMicroelectronics
>>   	  STM32 family, including:
>> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
>> index fcfa280df98a..4d54a7ea52b2 100644
>> --- a/drivers/bus/Kconfig
>> +++ b/drivers/bus/Kconfig
>> @@ -163,6 +163,16 @@ config QCOM_SSC_BLOCK_BUS
>>   	  i2c/spi/uart controllers, a hexagon core, and a clock controller
>>   	  which provides clocks for the above.
>>   
>> +config STM32_FIREWALL
>> +	bool "STM32 Firewall framework"
>> +	depends on ARCH_STM32
>> +	default MACH_STM32MP157 || MACH_STM32MP13 || MACH_STM32MP25
>> +	help
>> +	  Say y to enable firewall framework and its services. Firewall
>> +	  controllers will be able to register to the framework. Firewall
>> +	  controllers must be initialized and register to the firewall framework
>> +	  at arch_initcall level.
>> +
>>   config SUN50I_DE2_BUS
>>   	bool "Allwinner A64 DE2 Bus Driver"
>>   	  default ARM64
>> diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
>> index d90eed189a65..fc0511450ec2 100644
>> --- a/drivers/bus/Makefile
>> +++ b/drivers/bus/Makefile
>> @@ -26,6 +26,7 @@ obj-$(CONFIG_OMAP_INTERCONNECT)	+= omap_l3_smx.o omap_l3_noc.o
>>   obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
>>   obj-$(CONFIG_QCOM_EBI2)		+= qcom-ebi2.o
>>   obj-$(CONFIG_QCOM_SSC_BLOCK_BUS)	+= qcom-ssc-block-bus.o
>> +obj-$(CONFIG_STM32_FIREWALL)	+= stm32_firewall.o
>>   obj-$(CONFIG_SUN50I_DE2_BUS)	+= sun50i-de2.o
>>   obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
>>   obj-$(CONFIG_OF)		+= simple-pm-bus.o
>> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
>> new file mode 100644
>> index 000000000000..510db5bc6eaf
>> --- /dev/null
>> +++ b/drivers/bus/stm32_firewall.c
>> @@ -0,0 +1,252 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/bits.h>
>> +#include <linux/bus/stm32_firewall_device.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/init.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/types.h>
>> +
>> +#include "stm32_firewall.h"
>> +
>> +/* Corresponds to STM32_FIREWALL_MAX_EXTRA_ARGS + firewall controller reference + firewall ID */
>> +#define STM32_FIREWALL_MAX_ARGS		(STM32_FIREWALL_MAX_EXTRA_ARGS + 2)
>> +
>> +static LIST_HEAD(firewall_controller_list);
>> +static DEFINE_MUTEX(firewall_controller_list_lock);
>> +
>> +static int stm32_firewall_get_id(struct device_node *np, u32 *id)
>> +{
>> +	u32 feature_domain_cell[2];
>> +
>> +	/* Get property from device node */
>> +	if (of_property_read_u32_array(np, "feature-domains",
>> +				       feature_domain_cell,
>> +				       ARRAY_SIZE(feature_domain_cell))) {
>> +		pr_err("Unable to find get firewall ID property\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	*id = feature_domain_cell[1];
>> +
>> +	return 0;
>> +}
>> +
>> +/* Firewall device API */
>> +
>> +int stm32_firewall_get_firewall(struct device_node *np,
>> +				struct stm32_firewall *firewall)
>> +{
>> +	struct stm32_firewall_controller *ctrl;
>> +	struct of_phandle_args args;
>> +	u32 controller_phandle;
>> +	bool match = false;
>> +	size_t i;
>> +	int err;
>> +
>> +	if (!firewall)
>> +		return -EINVAL;
>> +
>> +	/* The controller phandle is always the first argument of the feature-domains property. */
>> +	err = of_property_read_u32(np, "feature-domains", &controller_phandle);
>> +	if (err) {
>> +		pr_err("Unable to get feature-domains property for node %s\n", np->full_name);
>> +		return err;
>> +	}
>> +
>> +	/* Parse property with phandle parsed out */
>> +	err = of_parse_phandle_with_args(np, "feature-domains", "#feature-domain-cells", 0, &args);
>> +	if (err) {
>> +		pr_err("Unable to read feature-domains arguments for node %s\n", np->full_name);
>> +		return err;
>> +	}
>> +
>> +	/* The phandle is parsed out */
>> +	if (args.args_count > STM32_FIREWALL_MAX_ARGS - 1)
>> +		return -EINVAL;
>> +
>> +	of_node_put(np);
>> +
>> +	/* Check if the parsed phandle corresponds to a registered firewall controller */
>> +	mutex_lock(&firewall_controller_list_lock);
>> +	list_for_each_entry(ctrl, &firewall_controller_list, entry) {
>> +		if (ctrl->dev->of_node->phandle == controller_phandle) {
>> +			match = true;
>> +			firewall->firewall_ctrl = ctrl;
>> +			break;
>> +		}
>> +	}
>> +	mutex_unlock(&firewall_controller_list_lock);
>> +	if (!match) {
>> +		firewall->firewall_ctrl = NULL;
>> +		pr_err("No firewall controller registered for %s\n", np->full_name);
>> +		return -ENODEV;
>> +	}
>> +
>> +	/*
>> +	 * The firewall ID is always the second argument of the feature-domains property.
>> +	 * The first argument is already parsed out, so args.args[0] is the second argument.
>> +	 */
>> +	firewall->firewall_id = args.args[0];
>> +
>> +	/* Extra args start at the third argument */
>> +	for (i = 0; i < args.args_count; i++)
>> +		firewall->extra_args[i] = args.args[i + 1];
>> +
>> +	/* Remove the firewall ID arg that is not an extra argument */
>> +	if (args.args_count >= 1)
>> +		firewall->extra_args_size = args.args_count - 1;
> 
> As I can see you support some extra args, that can be provided in the
> feature-domain property. But in the binding description I see maxItems:
> 2. I beliewe this should be highlighted in bindings description.
> 

Good point, maybe it would be better to define a high maxItem value in
the binding description that is aligned with STM32_FIREWALL_MAX_ARGS.

>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(stm32_firewall_get_firewall);
>> +
>> +int stm32_firewall_grant_access(struct stm32_firewall *firewall)
>> +{
>> +	struct stm32_firewall_controller *firewall_controller;
>> +
>> +	if (!firewall || firewall->firewall_id == U32_MAX)
>> +		return -EINVAL;
>> +
>> +	firewall_controller = firewall->firewall_ctrl;
>> +
>> +	if (!firewall_controller)
>> +		return -ENODEV;
>> +
>> +	return firewall_controller->grant_access(firewall_controller, firewall->firewall_id);
>> +}
>> +EXPORT_SYMBOL_GPL(stm32_firewall_grant_access);
>> +
>> +int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id)
>> +{
>> +	struct stm32_firewall_controller *firewall_controller;
>> +
>> +	if (!firewall || subsystem_id == U32_MAX || firewall->firewall_id == U32_MAX)
>> +		return -EINVAL;
>> +
>> +	firewall_controller = firewall->firewall_ctrl;
>> +
>> +	if (!firewall_controller)
>> +		return -ENODEV;
>> +
>> +	return firewall_controller->grant_access(firewall_controller, subsystem_id);
>> +}
>> +EXPORT_SYMBOL_GPL(stm32_firewall_grant_access_by_id);
>> +
>> +void stm32_firewall_release_access(struct stm32_firewall *firewall)
>> +{
>> +	struct stm32_firewall_controller *firewall_controller;
>> +
>> +	if (!firewall || firewall->firewall_id == U32_MAX) {
>> +		pr_err("Incorrect arguments when releasing a firewall access");
>> +		return;
>> +	}
>> +
>> +	firewall_controller = firewall->firewall_ctrl;
>> +
>> +	if (!firewall_controller) {
>> +		pr_debug("No firewall controller to release");
>> +		return;
>> +	}
>> +
>> +	firewall_controller->release_access(firewall_controller, firewall->firewall_id);
>> +}
>> +EXPORT_SYMBOL_GPL(stm32_firewall_release_access);
>> +
>> +void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id)
>> +{
>> +	struct stm32_firewall_controller *firewall_controller;
>> +
>> +	if (!firewall || subsystem_id == U32_MAX || firewall->firewall_id == U32_MAX) {
>> +		pr_err("Incorrect arguments when releasing a firewall access");
>> +		return;
>> +	}
>> +
>> +	firewall_controller = firewall->firewall_ctrl;
>> +
>> +	if (!firewall_controller) {
>> +		pr_debug("No firewall controller to release");
>> +		return;
>> +	}
>> +
>> +	firewall_controller->release_access(firewall_controller, subsystem_id);
>> +}
>> +EXPORT_SYMBOL_GPL(stm32_firewall_release_access_by_id);
>> +
>> +/* Firewall controller API */
>> +
>> +int stm32_firewall_controller_register(struct stm32_firewall_controller *firewall_controller)
>> +{
>> +	pr_info("Registering firewall controller %s", dev_name(firewall_controller->dev));
>> +
>> +	if (!firewall_controller)
>> +		return -ENODEV;
>> +
>> +	mutex_lock(&firewall_controller_list_lock);
>> +	list_add_tail(&firewall_controller->entry, &firewall_controller_list);
>> +	mutex_unlock(&firewall_controller_list_lock);
>> +
>> +	return 0;
>> +
>> +}
>> +
>> +void stm32_firewall_controller_unregister(struct stm32_firewall_controller *firewall_controller)
>> +{
>> +	struct stm32_firewall_controller *ctrl, *tmp;
>> +	bool controller_removed = false;
>> +
>> +	if (!firewall_controller) {
>> +		pr_debug("Null reference while unregistering firewall controller");
>> +		return;
>> +	}
>> +
>> +	mutex_lock(&firewall_controller_list_lock);
>> +	list_for_each_entry_safe(ctrl, tmp, &firewall_controller_list, entry) {
>> +		if (ctrl == firewall_controller) {
>> +			controller_removed = true;
>> +			list_del_init(&ctrl->entry);
>> +			break;
>> +		}
>> +	}
> IIUC list_for_each_entry_safe protects you from removing node during
> loop. But all list operations are done under
> firewall_controller_list_lock mutex. I beliewe there is no need for
> _safe call under the mutex because removing node during loop is
> impossible. I think it worth investigation if it's safe to use
> list_for_each_entry_safe without lock.

AFAICT, list_for_each_entry_safe() does not protect against concurrent
accesses, so I'll keep the mutex lock.

Deleting while iterating will cause trouble if not using the safe
version. I think it is fine as it is.

>> +	mutex_unlock(&firewall_controller_list_lock);
>> +
>> +	if (!controller_removed)
>> +		pr_debug("There was no firewall controller named %s to unregister",
>> +			 dev_name(firewall_controller->dev));
>> +}
>> +
>> +void stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
>> +{
>> +	struct device_node *child;
>> +	struct device *parent;
>> +	u32 firewall_id;
>> +	int err;
>> +
>> +	parent = firewall_controller->dev;
>> +
>> +	dev_dbg(parent, "Populating %s system bus\n", dev_name(firewall_controller->dev));
>> +
>> +	for_each_available_child_of_node(dev_of_node(parent), child) {
>> +		err = stm32_firewall_get_id(child, &firewall_id);
>> +		if (err < 0 ||
>> +		    firewall_controller->grant_access(firewall_controller, firewall_id)) {
>> +			/*
>> +			 * Peripheral access not allowed or not defined.
>> +			 * Mark the node as populated so platform bus won't probe it
>> +			 */
>> +			of_node_set_flag(child, OF_POPULATED);
>> +			dev_err(parent, "%s: Device driver will not be probed\n",
>> +				child->full_name);
>> +		}
>> +	}
>> +}
>> diff --git a/drivers/bus/stm32_firewall.h b/drivers/bus/stm32_firewall.h
>> new file mode 100644
>> index 000000000000..8d92e8c1ab77
>> --- /dev/null
>> +++ b/drivers/bus/stm32_firewall.h
>> @@ -0,0 +1,83 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
>> + */
>> +
>> +#ifndef _STM32_FIREWALL_H
>> +#define _STM32_FIREWALL_H
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/list.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/types.h>
>> +
>> +/**
>> + * STM32_PERIPHERAL_FIREWALL:		This type of firewall protects peripherals
> 
> Intendation
> 
>> + * STM32_MEMORY_FIREWALL:		This type of firewall protects memories/subsets of memory
>> + *					zones
>> + * STM32_RESOURCE_FIREWALL:		This type of firewall protects internal resources
>> + * STM32_NOTYPE_FIREWALL:		Undefined firewall type
>> + */
>> +
>> +#define STM32_PERIPHERAL_FIREWALL	BIT(1)
> 
> Intendation
> 

I'm sorry but I don't understand. I indent with tabs, maybe this is why
it appears strange here. The indentation is fine, same for others below.

>> +#define STM32_MEMORY_FIREWALL		BIT(2)
>> +#define STM32_RESOURCE_FIREWALL		BIT(3)
>> +#define STM32_NOTYPE_FIREWALL		BIT(4)
>> +
>> +/**
>> + * struct stm32_firewall_controller - Information on firewall controller supplying services
>> + *
>> + * @name			Name of the firewall controller
>> + * @dev				Device reference of the firewall controller
> 
> Intendation
> 
>> + * @mmio			Base address of the firewall controller
>> + * @entry			List entry of the firewall controller list
>> + * @type			Type of firewall
>> + * @max_entries			Number of entries covered by the firewall
> Intendation
> 
>> + * @grant_access		Callback used to grant access for a device access against a
>> + *				firewall controller
>> + * @release_access		Callback used to release resources taken by a device when access was
>> + *				granted
>> + * @grant_memory_range_access	Callback used to grant access for a device to a given memory region
>> + */
>> +struct stm32_firewall_controller {
>> +	const char *name;
>> +	struct device *dev;
>> +	void __iomem *mmio;
>> +	struct list_head entry;
>> +	unsigned int type;
>> +	unsigned int max_entries;
>> +
>> +	int (*grant_access)(struct stm32_firewall_controller *ctrl, u32 id);
>> +	void (*release_access)(struct stm32_firewall_controller *ctrl, u32 id);
>> +	int (*grant_memory_range_access)(struct stm32_firewall_controller *ctrl, phys_addr_t paddr,
>> +					 size_t size);
>> +};
>> +
>> +/**
>> + * int stm32_firewall_controller_register - Register a firewall controller to the STM32 firewall
>> + *					    framework
>> + * @firewall_controller		Firewall controller to register
>> + *
>> + * Returns 0 in case of success or -ENODEV if no controller was given.
>> + */
>> +int stm32_firewall_controller_register(struct stm32_firewall_controller *firewall_controller);
>> +
>> +/**
>> + * int stm32_firewall_controller_unregister - Unregister a firewall controller from the STM32
>> + *					      firewall framework
>> + * @firewall_controller		Firewall controller to unregister
>> + */
>> +void stm32_firewall_controller_unregister(struct stm32_firewall_controller *firewall_controller);
>> +
>> +/**
>> + * stm32_firewall_populate_bus - Populate device tree nodes that have a correct firewall
>> + *				 configuration. This is used at boot-time only, as a sanity check
>> + *				 between device tree and firewalls hardware configurations to
>> + *				 prevent a kernel crash when a device driver is not granted access
>> + *
>> + * @firewall_controller		Firewall controller which nodes will be populated or not
>> + */
>> +void stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller);
>> +
>> +#endif /* _STM32_FIREWALL_H */
>> diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
>> new file mode 100644
>> index 000000000000..ccaecea7fc6c
>> --- /dev/null
>> +++ b/include/linux/bus/stm32_firewall_device.h
>> @@ -0,0 +1,134 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
>> + */
>> +
>> +#ifndef STM32_FIREWALL_DEVICE_H
>> +#define STM32_FIREWALL_DEVICE_H
>> +
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/types.h>
>> +
>> +#define STM32_FIREWALL_MAX_EXTRA_ARGS		5
> 
> It's not clear to me why it's 5. Comment above sais this is
> implementation defined. Maybe this parameter can be configurable?
> 

Maybe it should be part of compat_data of firewall controllers :)

>> +
>> +/* Opaque reference to stm32_firewall_controller */
>> +struct stm32_firewall_controller;
>> +
>> +/**
>> + * stm32_firewall - Information on a device's firewall. Each device can have more than one firewall.
>> + *
>> + * @firewall_ctrl		Pointer referencing a firewall controller of the device. It is
>> + *				opaque so a device cannot manipulate the controller's ops or access
>> + *				the controller's data
>> + * @extra_args			Extra arguments that are implementation dependent
>> + * @extra_args_size		Number of extra arguments
>> + * @firewall_id			Firewall ID associated the device for this firewall controller
>> + */
>> +struct stm32_firewall {
>> +	struct stm32_firewall_controller *firewall_ctrl;
>> +	u32 extra_args[STM32_FIREWALL_MAX_EXTRA_ARGS];
>> +	size_t extra_args_size;
>> +	u32 firewall_id;
>> +};
>> +
>> +#if IS_ENABLED(CONFIG_STM32_FIREWALL)
>> +/**
>> + * stm32_firewall_get_firewall - Get the firewall(s) associated to given device.
>> + *				 The firewall controller reference is always the first argument
>> + *				 of the feature-domains property.
>> + *				 The firewall ID is always the second argument of the
>> + *				 feature-domains property.
>> + *
>> + * @np				Device node to parse
> 
> Intendation
> 
>> + * @firewall			Resulting firewall reference(s)
>> + *
>> + * Returns 0 on success, -ENODEV if there's no match with a firewall controller or appropriate errno
>> + * code if error occurred.
>> + */
>> +int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *firewall);
>> +
>> +/**
>> + * stm32_firewall_grant_access - Request firewall access rights and grant access.
>> + *
>> + * @firewall			Firewall reference containing the ID to check against its firewall
>> + *				controller
>> + *
>> + * Returns 0 if access is granted, -EACCES if access is denied, -ENODEV if firewall is null or
>> + * appropriate errno code if error occurred
>> + */
>> +int stm32_firewall_grant_access(struct stm32_firewall *firewall);
>> +
>> +/**
>> + * stm32_firewall_release_access - Release access granted from a call to
>> + *				   stm32_firewall_grant_access().
>> + *
>> + * @firewall			Firewall reference containing the ID to check against its firewall
>> + *				controller
>> + */
>> +void stm32_firewall_release_access(struct stm32_firewall *firewall);
>> +
>> +/**
>> + * stm32_firewall_grant_access_by_id - Request firewall access rights of a given device
>> + *				       based on a specific firewall ID
>> + *
>> + * Warnings:
>> + * There is no way to ensure that the given ID will correspond to the firewall referenced in the
>> + * device node if the ID did not come from stm32_firewall_get_firewall(). In that case, this
>> + * function must be used with caution.
>> + * This function should be used for subsystem resources that do not have the same firewall ID
>> + * as their parent.
>> + * U32_MAX is an invalid ID.
>> + *
>> + * @firewall			Firewall reference containing the firewall controller
>> + * @subsystem_id		Firewall ID of the subsystem resource
>> + *
>> + * Returns 0 if access is granted, -EACCES if access is denied, -ENODEV if firewall is null or
>> + * appropriate errno code if error occurred
>> + */
>> +int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id);
> 
> Can we store all registered IDs that were found by populate_bus
> functio, or is it expected when this function was called before
> populate_bus call?
> 

This function is intended to be used by devices that needs to check
specific ID. Maybe IDs of peripherals that do not have a driver in
Linux / driver isn't probed / ...

About storing all IDs found when populating the bus, do you have some
use in mind? :) Else I'd prefer to save some memory.

Best regards,
Gatien

>> +
>> +/**
>> + * stm32_firewall_release_access_by_id - Release access granted from a call to
>> + *					 stm32_firewall_grant_access_by_id().
>> + *
>> + * Warnings:
>> + * There is no way to ensure that the given ID will correspond to the firewall referenced in the
>> + * device node if the ID did not come from stm32_firewall_get_firewall(). In that case, this
>> + * function must be used with caution.
>> + * This function should be used for subsystem resources that do not have the same firewall ID
>> + * as their parent.
>> + * U32_MAX is an invalid ID.
>> + *
>> + * @firewall			Firewall reference containing the firewall controller
>> + * @subsystem_id		Firewall ID of the subsystem resource
>> + */
>> +void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id);
>> +
>> +#else /* CONFIG_STM32_FIREWALL */
>> +
>> +int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *firewall)
>> +{
>> +	return -ENODEV;
>> +}
>> +
>> +int stm32_firewall_grant_access(struct stm32_firewall *firewall)
>> +{
>> +	return -ENODEV;
>> +}
>> +
>> +void stm32_firewall_release_access(struct stm32_firewall *firewall)
>> +{
>> +}
>> +
>> +int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id)
>> +{
>> +	return -ENODEV;
>> +}
>> +
>> +void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id)
>> +{
>> +}
>> +
>> +#endif /* CONFIG_STM32_FIREWALL */
>> +#endif /* STM32_FIREWALL_DEVICE_H */
> 
> 
