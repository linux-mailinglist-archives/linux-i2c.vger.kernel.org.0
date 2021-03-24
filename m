Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B79A234739C
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 09:27:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234194AbhCXI1S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Mar 2021 04:27:18 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:14882 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233659AbhCXI1E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Mar 2021 04:27:04 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F51Wn4bmrzkdhf;
        Wed, 24 Mar 2021 16:25:25 +0800 (CST)
Received: from [127.0.0.1] (10.69.38.196) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.498.0; Wed, 24 Mar 2021
 16:26:54 +0800
Subject: Re: [PATCH v3 1/3] i2c: core: add managed function for adding i2c
 adapters
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>, <digetx@gmail.com>,
        <treding@nvidia.com>, <jarkko.nikula@linux.intel.com>,
        <rmk+kernel@armlinux.org.uk>, <song.bao.hua@hisilicon.com>,
        <john.garry@huawei.com>, <prime.zeng@huawei.com>,
        <linuxarm@huawei.com>
References: <1616411413-7177-1-git-send-email-yangyicong@hisilicon.com>
 <1616411413-7177-2-git-send-email-yangyicong@hisilicon.com>
 <YFjHVQlbygLljCvp@smile.fi.intel.com>
From:   Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <f91c36f4-bcad-ba49-5c30-88c359946f20@hisilicon.com>
Date:   Wed, 24 Mar 2021 16:26:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <YFjHVQlbygLljCvp@smile.fi.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.38.196]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/3/23 0:35, Andy Shevchenko wrote:
> On Mon, Mar 22, 2021 at 07:10:11PM +0800, Yicong Yang wrote:
>> Some I2C controller drivers will only unregister the I2C
>> adapter in their .remove() callback, which can be done
>> by simply using a managed variant to add the I2C adapter.
>>
>> So add the managed functions for adding the I2C adapter.
> 
> ...
> 
>> +static void devm_i2c_del_adapter(struct device *dev, void *ptr);
> 
> Can we instead of forward declaration simply move below to be after
> devm_i2c_del_adapter()?

i just want to put the devm variant near i2c_add_adapter, i'll address
this if it's unnecessary.

Thanks,
Yicong

> 
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
>> +
>> +	return ret;
>> +}
> 

