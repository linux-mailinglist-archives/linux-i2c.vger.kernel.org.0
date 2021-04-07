Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5A535698D
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 12:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234125AbhDGKZf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 06:25:35 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:16014 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234299AbhDGKZM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Apr 2021 06:25:12 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FFgS712NvzPnx7;
        Wed,  7 Apr 2021 18:22:15 +0800 (CST)
Received: from [127.0.0.1] (10.69.38.196) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 7 Apr 2021
 18:24:54 +0800
Subject: Re: [PATCH v6 2/5] i2c: core: add api to provide frequency mode
 strings
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Wolfram Sang <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <Sergey.Semin@baikalelectronics.ru>,
        <linux-kernel@vger.kernel.org>, <digetx@gmail.com>,
        <treding@nvidia.com>, <jarkko.nikula@linux.intel.com>,
        <rmk+kernel@armlinux.org.uk>, <song.bao.hua@hisilicon.com>,
        <john.garry@huawei.com>, <mika.westerberg@linux.intel.com>,
        <prime.zeng@huawei.com>, <linuxarm@huawei.com>
References: <1617197790-30627-1-git-send-email-yangyicong@hisilicon.com>
 <1617197790-30627-3-git-send-email-yangyicong@hisilicon.com>
 <20210406195414.GG3122@kunai>
 <0d48f447-d1f2-1c86-27f4-3c8b23dcaf30@hisilicon.com>
 <YG2EjHuMb92mX5G5@smile.fi.intel.com>
From:   Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <3fc130fe-e34a-4aaa-05bf-23db60b3b9f1@hisilicon.com>
Date:   Wed, 7 Apr 2021 18:24:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <YG2EjHuMb92mX5G5@smile.fi.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.38.196]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/4/7 18:08, Andy Shevchenko wrote:
> On Wed, Apr 07, 2021 at 04:29:29PM +0800, Yicong Yang wrote:
>> On 2021/4/7 3:54, Wolfram Sang wrote:
>>>
>>>> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
>>>> index 10bd0b0..7268180 100644
>>>> --- a/include/linux/i2c.h
>>>> +++ b/include/linux/i2c.h
>>>> @@ -47,6 +47,26 @@ typedef int (*i2c_slave_cb_t)(struct i2c_client *client,
>>>>  #define I2C_MAX_HIGH_SPEED_MODE_FREQ	3400000
>>>>  #define I2C_MAX_ULTRA_FAST_MODE_FREQ	5000000
>>>>  
>>>> +static inline const char *i2c_freq_mode_string(u32 bus_freq_hz)
>>>> +{
>>>> +	switch (bus_freq_hz) {
>>>> +	case I2C_MAX_STANDARD_MODE_FREQ:
>>>> +		return "Standard Mode (100 kHz)";
>>>> +	case I2C_MAX_FAST_MODE_FREQ:
>>>> +		return "Fast Mode (400 kHz)";
>>>> +	case I2C_MAX_FAST_MODE_PLUS_FREQ:
>>>> +		return "Fast Mode Plus (1.0 MHz)";
>>>> +	case I2C_MAX_TURBO_MODE_FREQ:
>>>> +		return "Turbo Mode (1.4 MHz)";
>>>> +	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
>>>> +		return "High Speed Mode (3.4 MHz)";
>>>> +	case I2C_MAX_ULTRA_FAST_MODE_FREQ:
>>>> +		return "Ultra Fast Mode (5.0 MHz)";
>>>> +	default:
>>>> +		return "Unknown Mode";
>>>> +	}
>>>> +}
>>>
>>> Any reason ehy this is an inline function? My gut feeling says it would
>>> be better added to the core?
>>>
>>
>> it's not a complicated function so i didn't think it'll make much difference,
>> so i just put it in the header along with the coresponding macro definitions.
>> do you want me to move it to the core?
> 
> I guess exporting will save few dozens of bytes if the function is used more
> than once. (All strings will be duplicated or multiplied in that case)
> 

yes, that's one concern. since we don't need this to perform fast, an inline
one maybe unnecessary.

