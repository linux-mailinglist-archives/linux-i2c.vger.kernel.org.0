Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E793500DF
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 15:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235536AbhCaNDz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 09:03:55 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:14656 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235347AbhCaNDv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 Mar 2021 09:03:51 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F9RJj41kzzmcVq;
        Wed, 31 Mar 2021 21:01:09 +0800 (CST)
Received: from [10.69.38.196] (10.69.38.196) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Wed, 31 Mar 2021
 21:03:30 +0800
Subject: Re: [PATCH v5 2/5] i2c: core: add api to provide frequency mode
 strings
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>, <wsa@kernel.org>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <Sergey.Semin@baikalelectronics.ru>, <linux-kernel@vger.kernel.org>
CC:     <digetx@gmail.com>, <treding@nvidia.com>,
        <rmk+kernel@armlinux.org.uk>, <song.bao.hua@hisilicon.com>,
        <john.garry@huawei.com>, <mika.westerberg@linux.intel.com>,
        <prime.zeng@huawei.com>, <linuxarm@huawei.com>
References: <1617113966-40498-1-git-send-email-yangyicong@hisilicon.com>
 <1617113966-40498-3-git-send-email-yangyicong@hisilicon.com>
 <0561a225-3dbb-97b1-a0a8-223520885c05@linux.intel.com>
From:   Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <d174b922-8c68-1db3-e9d5-afa2d5947bec@hisilicon.com>
Date:   Wed, 31 Mar 2021 21:03:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <0561a225-3dbb-97b1-a0a8-223520885c05@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.69.38.196]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/3/31 16:35, Jarkko Nikula wrote:
> Hi
> 
> On 3/30/21 5:19 PM, Yicong Yang wrote:
>> Some I2C drivers like Designware and HiSilicon will print the
>> bus frequency mode information, so add a public one that everyone
>> can make use of.
>>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>   include/linux/i2c.h | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
>> index 10bd0b0..6837e64 100644
>> --- a/include/linux/i2c.h
>> +++ b/include/linux/i2c.h
>> @@ -47,6 +47,26 @@ typedef int (*i2c_slave_cb_t)(struct i2c_client *client,
>>   #define I2C_MAX_HIGH_SPEED_MODE_FREQ    3400000
>>   #define I2C_MAX_ULTRA_FAST_MODE_FREQ    5000000
>>   +static inline const char *i2c_freq_mode_string(u32 bus_freq_hz)
>> +{
>> +    switch (bus_freq_hz) {
>> +    case I2C_MAX_STANDARD_MODE_FREQ:
>> +        return "Standard Mode(100KHz)";
>> +    case I2C_MAX_FAST_MODE_FREQ:
>> +        return "Fast Mode(400KHz)";
>> +    case I2C_MAX_FAST_MODE_PLUS_FREQ:
>> +        return "Fast Mode Plus(1.0MHz)";
>> +    case I2C_MAX_TURBO_MODE_FREQ:
>> +        return "Turbo Mode(1.4MHz)";
>> +    case I2C_MAX_HIGH_SPEED_MODE_FREQ:
>> +        return "High Speed Mode(3.4MHz)";
>> +    case I2C_MAX_ULTRA_FAST_MODE_FREQ:
>> +        return "Ultra Fast Mode(5.0MHz)";
>> +    default:
>> +        return "Unknown Mode";
>> +    }
> 
> A few minor nits here:
> - KHz -> kHz
> - Space between text and opening parenthesis: "Mode(" -> "Mode ("
> - Space between number and unit: (1.0MHz) -> (1.0 MHz)

will address. thanks!

> 
> With those changes you may add my
> 
> Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> .
