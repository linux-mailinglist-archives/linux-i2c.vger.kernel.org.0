Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4D133D4A3
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Mar 2021 14:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbhCPNOk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Mar 2021 09:14:40 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:13945 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231992AbhCPNOT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Mar 2021 09:14:19 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F0DH05m6xzjVkM;
        Tue, 16 Mar 2021 21:12:44 +0800 (CST)
Received: from [127.0.0.1] (10.69.38.196) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Tue, 16 Mar 2021
 21:14:08 +0800
Subject: Re: [Linuxarm] [PATCH v2 1/3] i2c: core: add managed function for
 adding i2c adapters
To:     "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        yangyicong <yangyicong@huawei.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
        "Zengtao (B)" <prime.zeng@hisilicon.com>
References: <1615296137-14558-1-git-send-email-yangyicong@hisilicon.com>
 <1615296137-14558-2-git-send-email-yangyicong@hisilicon.com>
 <8369a924a36b4a16873cacff5177677f@hisilicon.com>
From:   Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <cfc327b9-7b8e-7946-0eae-c3e2e54c6772@hisilicon.com>
Date:   Tue, 16 Mar 2021 21:14:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <8369a924a36b4a16873cacff5177677f@hisilicon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.38.196]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/3/16 16:56, Song Bao Hua (Barry Song) wrote:
> 
> 
>> -----Original Message-----
>> From: Yicong Yang [mailto:yangyicong@hisilicon.com]
>> Sent: Wednesday, March 10, 2021 2:22 AM
>> To: wsa@kernel.org; linux-i2c@vger.kernel.org
>> Cc: linuxarm@openeuler.org; Zengtao (B) <prime.zeng@hisilicon.com>;
>> yangyicong <yangyicong@huawei.com>
>> Subject: [Linuxarm] [PATCH v2 1/3] i2c: core: add managed function for adding
>> i2c adapters
>>
>> Some I2C controller drivers will only unregister the I2C
>> adapter in their .remove() callback, which can be done
>> by simply using a managed variant to add the I2C adapter.
>>
>> So add the managed functions for adding the I2C adapter.
> 
> Sounds like a very useful wrapper. We are able to remove
> some  "remove" callbacks afterwards.
> We have some similar wrappers like devm_hwrng_register
> which is always helpful.

devm_* are widely used for helping managing the resources
and simplify the driver in other subsystems, so i think
i2c core will also benefit from this. :)
thanks for looking into this patch.

Regards,
Yicong

> 
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
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(devm_i2c_add_adapter);
>> +
>>  /**
>>   * i2c_add_numbered_adapter - declare i2c adapter, use static bus number
>>   * @adap: the adapter to register (with adap->nr initialized)
>> @@ -1703,6 +1735,13 @@ void i2c_del_adapter(struct i2c_adapter *adap)
>>  }
>>  EXPORT_SYMBOL(i2c_del_adapter);
>>
>> +static void devm_i2c_del_adapter(struct device *dev, void *ptr)
>> +{
>> +	struct i2c_adapter *adapter = *((struct i2c_adapter **)ptr);
>> +
>> +	i2c_del_adapter(adapter);
>> +}
>> +
>>  static void i2c_parse_timing(struct device *dev, char *prop_name, u32
>> *cur_val_p,
>>  			    u32 def_val, bool use_def)
>>  {
>> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
>> index 5662265..10bd0b0 100644
>> --- a/include/linux/i2c.h
>> +++ b/include/linux/i2c.h
>> @@ -844,6 +844,7 @@ static inline void i2c_mark_adapter_resumed(struct
>> i2c_adapter *adap)
>>   */
>>  #if IS_ENABLED(CONFIG_I2C)
>>  int i2c_add_adapter(struct i2c_adapter *adap);
>> +int devm_i2c_add_adapter(struct device *dev, struct i2c_adapter *adapter);
>>  void i2c_del_adapter(struct i2c_adapter *adap);
>>  int i2c_add_numbered_adapter(struct i2c_adapter *adap);
>>
>> --
>> 2.8.1
> 
> Thanks
> Barry
> 

