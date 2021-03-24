Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 124A03473A6
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 09:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233658AbhCXIaC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Mar 2021 04:30:02 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14519 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233445AbhCXI3i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Mar 2021 04:29:38 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F51Yh11K0zPlkh;
        Wed, 24 Mar 2021 16:27:04 +0800 (CST)
Received: from [127.0.0.1] (10.69.38.196) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0; Wed, 24 Mar 2021
 16:29:26 +0800
Subject: Re: [PATCH v3 1/3] i2c: core: add managed function for adding i2c
 adapters
To:     Dmitry Osipenko <digetx@gmail.com>, <wsa@kernel.org>,
        <linux-i2c@vger.kernel.org>
CC:     <andriy.shevchenko@linux.intel.com>, <treding@nvidia.com>,
        <jarkko.nikula@linux.intel.com>, <rmk+kernel@armlinux.org.uk>,
        <song.bao.hua@hisilicon.com>, <john.garry@huawei.com>,
        <prime.zeng@huawei.com>, <linuxarm@huawei.com>
References: <1616411413-7177-1-git-send-email-yangyicong@hisilicon.com>
 <1616411413-7177-2-git-send-email-yangyicong@hisilicon.com>
 <c306cfc0-8574-9903-af4e-f27b99888d03@gmail.com>
From:   Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <23efcf01-5d04-242e-8574-bb9a5ef5face@hisilicon.com>
Date:   Wed, 24 Mar 2021 16:29:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <c306cfc0-8574-9903-af4e-f27b99888d03@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.69.38.196]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/3/23 0:45, Dmitry Osipenko wrote:
> 22.03.2021 14:10, Yicong Yang пишет:
>> Some I2C controller drivers will only unregister the I2C
>> adapter in their .remove() callback, which can be done
>> by simply using a managed variant to add the I2C adapter.
>>
>> So add the managed functions for adding the I2C adapter.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>  drivers/i2c/i2c-core-base.c | 39 +++++++++++++++++++++++++++++++++++++++
>>  include/linux/i2c.h         |  1 +
>>  2 files changed, 40 insertions(+)
>>
>> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
>> index 63ebf72..61486dc 100644
>> --- a/drivers/i2c/i2c-core-base.c
>> +++ b/drivers/i2c/i2c-core-base.c
>> @@ -1550,6 +1550,38 @@ int i2c_add_adapter(struct i2c_adapter *adapter)
>>  }
>>  EXPORT_SYMBOL(i2c_add_adapter);
>>  
>> +static void devm_i2c_del_adapter(struct device *dev, void *ptr);
>> +
>> +/**
>> + * devm_i2c_add_adapter - device-managed variant of i2c_add_adapter()
>> + * @dev: managing device for adding this I2C adapter
>> + * @adapter: the adapter to add
>> + * Context: can sleep
>> + *
>> + * Add adapter with dynamic bus number, same with i2c_add_adapter()
>> + * but the adapter will be auto deleted on driver detach.
>> + */
>> +int devm_i2c_add_adapter(struct device *dev, struct i2c_adapter *adapter)
>> +{
>> +	struct i2c_adapter **ptr;
>> +	int ret;
>> +
>> +	ptr = devres_alloc(devm_i2c_del_adapter, sizeof(*ptr), GFP_KERNEL);
>> +	if (!ptr)
>> +		return -ENOMEM;
>> +
>> +	ret = i2c_add_adapter(adapter);
>> +	if (!ret) {
>> +		*ptr = adapter;
>> +		devres_add(dev, ptr);
>> +	} else {
>> +		devres_free(ptr);
>> +	}
> 
> This could be simplified using devm_add_action_or_reset().

thanks for the hint. i'll see whether i can change to that.

> 
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(devm_i2c_add_adapter);
> 
> EXPORT_SYMBOL_GPL

considering i2c_add_adapter exported with no GPL, i think the variant should
keep the same.

Thanks,
Yicong

> 
> .
> 

