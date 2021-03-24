Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 047F13475D9
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 11:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233405AbhCXKVv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Mar 2021 06:21:51 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14459 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbhCXKVr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Mar 2021 06:21:47 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F543k5XcSzwQWx;
        Wed, 24 Mar 2021 18:19:46 +0800 (CST)
Received: from [127.0.0.1] (10.69.38.196) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Wed, 24 Mar 2021
 18:21:36 +0800
Subject: Re: [PATCH v3 2/3] i2c: add support for HiSilicon I2C controller
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>, <digetx@gmail.com>,
        <treding@nvidia.com>, <jarkko.nikula@linux.intel.com>,
        <rmk+kernel@armlinux.org.uk>, <song.bao.hua@hisilicon.com>,
        <john.garry@huawei.com>, <prime.zeng@huawei.com>,
        <linuxarm@huawei.com>
References: <1616411413-7177-1-git-send-email-yangyicong@hisilicon.com>
 <1616411413-7177-3-git-send-email-yangyicong@hisilicon.com>
 <YFjOLTpe7fYvE9C1@smile.fi.intel.com>
From:   Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <439bfa6f-139a-ee5b-d8c7-324e5084ecb3@hisilicon.com>
Date:   Wed, 24 Mar 2021 18:21:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <YFjOLTpe7fYvE9C1@smile.fi.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.69.38.196]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/3/23 1:04, Andy Shevchenko wrote:
> On Mon, Mar 22, 2021 at 07:10:12PM +0800, Yicong Yang wrote:
>> Add HiSilicon I2C controller driver for the Kunpeng SoC. It provides
>> the access to the i2c busses, which connects to the eeprom, rtc, etc.
>>
>> The driver works with IRQ mode, and supports basic I2C features and 10bit
>> address. The DMA is not supported.
> 
> ...
> 
>> +static const char *hisi_i2c_speed_string(u32 bus_freq_hz)
>> +{
>> +	switch (bus_freq_hz) {
>> +	case I2C_MAX_STANDARD_MODE_FREQ:
>> +		return "100K";
>> +	case I2C_MAX_FAST_MODE_FREQ:
>> +		return "400K";
>> +	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
>> +		return "3.4M";
>> +	default:
>> +		return "unknown";
>> +	}
>> +}
> 
> Just realized that if you print the name of the mode (and maybe frequency
> value) then it can be moved to generic I²C code and other will benefit out of
> this (DesignWare is the first in my mind).

sure, that's good. but the i2c core doesn't make use of the speed mode
information so maybe print of this information is rather driver depended.

> 

