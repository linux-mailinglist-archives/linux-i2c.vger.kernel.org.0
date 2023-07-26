Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E75657633F2
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 12:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233949AbjGZKik (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 06:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233938AbjGZKii (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 06:38:38 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E692688;
        Wed, 26 Jul 2023 03:38:33 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36Q7VVTF007894;
        Wed, 26 Jul 2023 12:38:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=m3mYWrA/DTLv41VpwfV17mvsYoyUfau6u7+hEa+ifQc=;
 b=StqXKwyL7+7LDaIZyI07PQqK9myM1eGjwiJXVgV7hXd1HYwrwqVxv0Ke6+jBU+gEHnNF
 C4IWMIndiWGcKwbazL4krgpwvf0h+hRpncBgnU0chBIWga4Ti/udQnnasVMjaruPCDHt
 SGLg56OGWAZ5MLGhf7vm28pQPHuWDFIdooMSYiONkEHXPU9h8iM3l1CmJnyRESF0yefK
 /LeH2/ekGQ5JH8AUoemR6NcabEhFT60e7RnR9S4yJUcJvDQoU5WwMRE4ECf+VSFP9dWq
 gThtuuQifp5g4G1WsHdpQU8TXWWKcSSiWY4Mv9xfZ5XkPtDsodKpJhg5UXAukT11wbv2 +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s2y641bv3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Jul 2023 12:38:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AC79A10002A;
        Wed, 26 Jul 2023 12:38:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9C31C217876;
        Wed, 26 Jul 2023 12:38:03 +0200 (CEST)
Received: from [10.201.21.121] (10.201.21.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 26 Jul
 2023 12:38:01 +0200
Message-ID: <d228e17b-4f5f-d5e0-1c59-d247cbc0693e@foss.st.com>
Date:   Wed, 26 Jul 2023 12:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 05/11] firewall: introduce stm32_firewall framework
Content-Language: en-US
To:     Simon Horman <simon.horman@corigine.com>
CC:     <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <vkoul@kernel.org>, <jic23@kernel.org>,
        <olivier.moysan@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
        <mchehab@kernel.org>, <fabrice.gasnier@foss.st.com>,
        <andi.shyti@kernel.org>, <ulf.hansson@linaro.org>,
        <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
        <hugues.fruchet@foss.st.com>, <lee@kernel.org>, <will@kernel.org>,
        <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
        <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-media@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
References: <20230725164104.273965-1-gatien.chevallier@foss.st.com>
 <20230725164104.273965-6-gatien.chevallier@foss.st.com>
 <ZMDzNSkRvvVsxUto@corigine.com>
From:   Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <ZMDzNSkRvvVsxUto@corigine.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_04,2023-07-25_01,2023-05-22_02
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 7/26/23 12:19, Simon Horman wrote:
> On Tue, Jul 25, 2023 at 06:40:58PM +0200, Gatien Chevallier wrote:
>> Introduce a STM32 firewall framework that offers to firewall consumers
>> different firewall services such as the ability to check their access
>> rights against their firewall controller(s).
>>
>> The STM32 firewall framework offers a generic API for STM32 firewall
>> controllers that is defined in their drivers to best fit the
>> specificity of each firewall.
>>
>> There are various types of firewalls:
>> -Peripheral firewalls that filter accesses to peripherals
>> -Memory firewalls that filter accesses to memories or memory regions
>> -No type for undefined type of firewall
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> 
> ...
> 
>> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
> 
> ...
> 
>> +int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
>> +{
>> +	struct stm32_firewall *firewalls;
>> +	struct device_node *child;
>> +	struct device *parent;
>> +	unsigned int i;
>> +	int len;
>> +	int err;
>> +
>> +	parent = firewall_controller->dev;
>> +
>> +	dev_dbg(parent, "Populating %s system bus\n", dev_name(firewall_controller->dev));
>> +
>> +	for_each_available_child_of_node(dev_of_node(parent), child) {
>> +		/* The feature-domains property is mandatory for firewall bus devices */
>> +		len = of_count_phandle_with_args(child, "feature-domains", "#feature-domain-cells");
>> +		if (len <= 0)
> 
> Coccinelle says that, due to breaking out of a
> for_each_available_child_of_node() loop, a call to of_node_put()
> is needed here
> 

Hi Simon,

Thank you, I already sent a V3 correcting the patch ordering issue. I
will implement this for V4.

>> +			return -EINVAL;
>> +
>> +		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
>> +		if (!firewalls)
> 
> And here.
> 

ditto

>> +			return -ENOMEM;
>> +
>> +		err = stm32_firewall_get_firewall(child, firewalls, (unsigned int)len);
>> +		if (err) {
>> +			kfree(firewalls);
> 
> And here.
> 

ditto

>> +			return err;
>> +		}
>> +
>> +		for (i = 0; i < len; i++) {
>> +			if (firewall_controller->grant_access(firewall_controller,
>> +							      firewalls[i].firewall_id)) {
>> +				/*
>> +				 * Peripheral access not allowed or not defined.
>> +				 * Mark the node as populated so platform bus won't probe it
>> +				 */
>> +				of_node_set_flag(child, OF_POPULATED);
>> +				dev_err(parent, "%s: Device driver will not be probed\n",
>> +					child->full_name);
>> +			}
>> +		}
>> +
>> +		kfree(firewalls);
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(stm32_firewall_populate_bus);
> 
>> diff --git a/drivers/bus/stm32_firewall.h b/drivers/bus/stm32_firewall.h
> 
> ...
> 
>> +/**
>> + * struct stm32_firewall_controller - Information on firewall controller supplying services
>> + *
>> + * @name			Name of the firewall controller
> 
> kernel-doc complains that name and the other fields of
> struct stm32_firewall_controller are not documented.
> I believe this is because a ':' is needed after the name of
> the parameter (in this case 'name').
> 
>   * @name:			Name of the firewall controller
> 
> Likewise, elsewhere.
> 

I will implement it in V4, thank you.

>> + * @dev				Device reference of the firewall controller
>> + * @mmio			Base address of the firewall controller
>> + * @entry			List entry of the firewall controller list
>> + * @type			Type of firewall
>> + * @max_entries			Number of entries covered by the firewall
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
> 
> kernel-doc seems unhappy about the presence of 'int' on this line.
> 
>   * stm32_firewall_controller_register - Register a firewall controller to the STM32 firewall
> 
> Likewise, elsewhere.
> 

Yes, I will remove the type in V4.

>> + *					    framework
>> + * @firewall_controller		Firewall controller to register
>> + *
>> + * Returns 0 in case of success or -ENODEV if no controller was given.
>> + */
>> +int stm32_firewall_controller_register(struct stm32_firewall_controller *firewall_controller);
> 
> ...
> 
>> diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
>> new file mode 100644
>> index 000000000000..9bdc4060154c
>> --- /dev/null
>> +++ b/include/linux/bus/stm32_firewall_device.h
>> @@ -0,0 +1,140 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
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
>> +
>> +/* Opaque reference to stm32_firewall_controller */
>> +struct stm32_firewall_controller;
>> +
>> +/**
>> + * stm32_firewall - Information on a device's firewall. Each device can have more than one firewall.
> 
> kernel-doc seems unhappy about the absence of struct on this line.
> 
>   * struct stm32_firewall - Information on a device's firewall. Each device can have more than one firewall.
> 

Yes, I will add the struct in V4.

>> + *
>> + * @firewall_ctrl		Pointer referencing a firewall controller of the device. It is
>> + *				opaque so a device cannot manipulate the controller's ops or access
>> + *				the controller's data
>> + * @extra_args			Extra arguments that are implementation dependent
>> + * @entry			Name of the firewall entry
>> + * @extra_args_size		Number of extra arguments
>> + * @firewall_id			Firewall ID associated the device for this firewall controller
>> + */
>> +struct stm32_firewall {
>> +	struct stm32_firewall_controller *firewall_ctrl;
>> +	u32 extra_args[STM32_FIREWALL_MAX_EXTRA_ARGS];
>> +	const char *entry;
>> +	size_t extra_args_size;
>> +	u32 firewall_id;
>> +};
> 
> ...
> 
Best regards,
Gatien
