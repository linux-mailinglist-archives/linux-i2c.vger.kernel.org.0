Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC2577B218B
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 17:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbjI1Pok (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 11:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231669AbjI1Poj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 11:44:39 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22916AC;
        Thu, 28 Sep 2023 08:44:36 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38SE466G015807;
        Thu, 28 Sep 2023 17:43:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        message-id:date:mime-version:subject:to:cc:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=
        selector1; bh=6T7vbZG0OatVCzrOUmocqe0etbqi1byTjrfN1YkQoYE=; b=fL
        9+e7J6OIfXQpnq6WHBL/m56cPdxye7XORHa4e/GNn4iRdwCB0xFD6o9ZYQAKjon0
        f5HUbpw4Ix0frpU2kvNOCKVFEwvWJkKOW73YVT5JyV0zLHgtzzUoWl3F6cNmAKyb
        UMJPEsjoC/guC48wUILQSbN7Si/bPAqspVm4Q3K3XGjySUlhB1Ii3rkoxn0sLfEZ
        QTCJA/iLyCDE7Z3wF+OtyrjFecFf1Iv05IMiVA3on6mQuM8jXNiIL8GzxWIOG19k
        bvhuhV8dKqjrhD3PqRPht1jClNa+HxVU65W9phEQjlLo203IyNwiok9UQGizuRnh
        T6hK4Mp3G6d5dheHFACg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t9qbx76ha-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Sep 2023 17:43:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F3259100057;
        Thu, 28 Sep 2023 17:43:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8F6EC24B8AC;
        Thu, 28 Sep 2023 17:43:48 +0200 (CEST)
Received: from [10.201.20.32] (10.201.20.32) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 17:43:46 +0200
Message-ID: <3c232c26-e03c-31ec-8ec8-f99c86a3ab83@foss.st.com>
Date:   Thu, 28 Sep 2023 17:43:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 05/11] firewall: introduce stm32_firewall framework
To:     Simon Horman <horms@kernel.org>
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
        <peng.fan@oss.nxp.com>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-media@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
References: <20230811100731.108145-1-gatien.chevallier@foss.st.com>
 <20230811100731.108145-6-gatien.chevallier@foss.st.com>
 <ZNeSiFQGdOXbR+2S@vergenet.net>
Content-Language: en-US
From:   Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <ZNeSiFQGdOXbR+2S@vergenet.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-28_15,2023-09-28_02,2023-05-22_02
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 8/12/23 16:09, Simon Horman wrote:
> On Fri, Aug 11, 2023 at 12:07:25PM +0200, Gatien Chevallier wrote:
> 
> ...
> 
>> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
>> new file mode 100644
>> index 000000000000..900f3b052a66
>> --- /dev/null
>> +++ b/drivers/bus/stm32_firewall.c
>> @@ -0,0 +1,293 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
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
>> +#include <linux/slab.h>
>> +
>> +#include "stm32_firewall.h"
>> +
>> +/* Corresponds to STM32_FIREWALL_MAX_EXTRA_ARGS + firewall ID */
>> +#define STM32_FIREWALL_MAX_ARGS		(STM32_FIREWALL_MAX_EXTRA_ARGS + 1)
>> +
>> +static LIST_HEAD(firewall_controller_list);
>> +static DEFINE_MUTEX(firewall_controller_list_lock);
>> +
>> +/* Firewall device API */
>> +int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *firewall,
>> +				unsigned int nb_firewall)
>> +{
>> +	struct stm32_firewall_controller *ctrl;
>> +	struct of_phandle_iterator it;
>> +	unsigned int i, j = 0;
>> +	int err;
>> +
>> +	if (!firewall || !nb_firewall)
>> +		return -EINVAL;
>> +
>> +	/* Parse property with phandle parsed out */
>> +	of_for_each_phandle(&it, err, np, "feature-domains", "#feature-domain-cells", 0) {
>> +		struct of_phandle_args provider_args;
>> +		struct device_node *provider = it.node;
>> +		const char *fw_entry;
>> +		bool match = false;
>> +
>> +		if (err) {
>> +			pr_err("Unable to get feature-domains property for node %s\n, err: %d",
>> +			       np->full_name, err);
>> +			of_node_put(provider);
>> +			return err;
>> +		}
>> +
>> +		if (j > nb_firewall) {
>> +			pr_err("Too many firewall controllers");
>> +			of_node_put(provider);
>> +			return -EINVAL;
>> +		}
>> +
>> +		provider_args.args_count = of_phandle_iterator_args(&it, provider_args.args,
>> +								    STM32_FIREWALL_MAX_ARGS);
>> +
>> +		/* Check if the parsed phandle corresponds to a registered firewall controller */
>> +		mutex_lock(&firewall_controller_list_lock);
>> +		list_for_each_entry(ctrl, &firewall_controller_list, entry) {
>> +			if (ctrl->dev->of_node->phandle == it.phandle) {
>> +				match = true;
>> +				firewall[j].firewall_ctrl = ctrl;
>> +				break;
>> +			}
>> +		}
>> +		mutex_unlock(&firewall_controller_list_lock);
>> +
>> +		if (!match) {
>> +			firewall[j].firewall_ctrl = NULL;
>> +			pr_err("No firewall controller registered for %s\n", np->full_name);
>> +			of_node_put(provider);
>> +			return -ENODEV;
>> +		}
>> +
>> +		err = of_property_read_string_index(np, "feature-domain-names", j, &fw_entry);
>> +		if (err == 0)
>> +			firewall[j].entry = fw_entry;
>> +
>> +		/* Handle the case when there are no arguments given along with the phandle */
>> +		if (provider_args.args_count < 0 ||
>> +		    provider_args.args_count > STM32_FIREWALL_MAX_ARGS) {
>> +			of_node_put(provider);
>> +			return -EINVAL;
>> +		} else if (provider_args.args_count == 0) {
>> +			firewall[j].extra_args_size = 0;
>> +			firewall[j].firewall_id = U32_MAX;
>> +			j++;
>> +			continue;
>> +		}
>> +
>> +		/* The firewall ID is always the first argument */
>> +		firewall[j].firewall_id = provider_args.args[0];
>> +
>> +		/* Extra args start at the third argument */
>> +		for (i = 0; i < provider_args.args_count; i++)
>> +			firewall[j].extra_args[i] = provider_args.args[i + 1];
> 
> Hi Gatien,
> 
> Above it is checked that the maximum value of provider_args.args_count is
> STM32_FIREWALL_MAX_ARGS.
> So here the maximum value of i is STM32_FIREWALL_MAX_ARGS - 1.
> 
> STM32_FIREWALL_MAX_ARGS is defined as STM32_FIREWALL_MAX_EXTRA_ARGS + 1
> And STM32_FIREWALL_MAX_EXTRA_ARGS is defined as 5.
> So the maximum value of i is (5 + 1 - 1) = 5.
> 
> firewall[j] is of type struct stm32_firewall.
> And its args field has STM32_FIREWALL_MAX_EXTRA_ARGS (5) elements.
> Thus the maximum valid index is (5 - 1) = 4.
> 
> But the line above may access index 5.
> 
> Flagged by Smatch.
> 

Hi Simon,

Thank you for pointing this out.

I'll correct it for V5.

Best regards,
Gatien
>> +
>> +		/* Remove the firewall ID arg that is not an extra argument */
>> +		firewall[j].extra_args_size = provider_args.args_count - 1;
>> +
>> +		j++;
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(stm32_firewall_get_firewall);
> 
> ...
> 
>> diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
>> new file mode 100644
>> index 000000000000..7b4450a8ec15
>> --- /dev/null
>> +++ b/include/linux/bus/stm32_firewall_device.h
>> @@ -0,0 +1,141 @@
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
>> + * struct stm32_firewall - Information on a device's firewall. Each device can have more than one
>> + *			   firewall.
>> + *
>> + * @firewall_ctrl:		Pointer referencing a firewall controller of the device. It is
>> + *				opaque so a device cannot manipulate the controller's ops or access
>> + *				the controller's data
>> + * @extra_args:			Extra arguments that are implementation dependent
>> + * @entry:			Name of the firewall entry
>> + * @extra_args_size:		Number of extra arguments
>> + * @firewall_id:		Firewall ID associated the device for this firewall controller
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
