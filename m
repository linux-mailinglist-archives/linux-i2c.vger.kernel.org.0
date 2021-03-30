Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3486334E9D6
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Mar 2021 16:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbhC3OEk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 10:04:40 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:14640 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232109AbhC3OEX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Mar 2021 10:04:23 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F8rj328nLzl3rq;
        Tue, 30 Mar 2021 22:01:43 +0800 (CST)
Received: from [10.69.38.196] (10.69.38.196) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0; Tue, 30 Mar 2021
 22:04:09 +0800
Subject: Re: [PATCH v4 0/4] Add support for HiSilicon I2C controller
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>, <digetx@gmail.com>,
        <treding@nvidia.com>, <jarkko.nikula@linux.intel.com>,
        <rmk+kernel@armlinux.org.uk>, <song.bao.hua@hisilicon.com>,
        <john.garry@huawei.com>, <prime.zeng@huawei.com>,
        <linuxarm@huawei.com>
References: <1617109549-4013-1-git-send-email-yangyicong@hisilicon.com>
 <YGMp+X9Ntuc3jd3J@smile.fi.intel.com>
From:   Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <e7f3dfaa-d1f6-40fe-26bc-36ed9bafa99a@hisilicon.com>
Date:   Tue, 30 Mar 2021 22:04:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <YGMp+X9Ntuc3jd3J@smile.fi.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.38.196]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/3/30 21:39, Andy Shevchenko wrote:
> On Tue, Mar 30, 2021 at 09:05:45PM +0800, Yicong Yang wrote:
>> Add driver and MAINTAINERS for HiSilicon I2C controller on Kunpeng SoC. Also
>> provide the devm_*() variants for adding the I2C adapters and a public
>> api to provide I2C frequency mode strings.
>>
>> Change since v3:
> 
>> - split the bus mode string api to I2C as suggested by Andy
> 
> I have prepared patch to convert i2c designware to use it.
> So, feel free to attach to your series in v5.
> 

sure. i'll address the comments and send an updated series with your patch
attached. i already have it in my mailbox. :)

>> - simplify the devm variants and change the export format
>> - address the comments of the HiSilicon I2C driver from Andy and Dmitry, thanks!
>> Link: https://lore.kernel.org/linux-i2c/1616411413-7177-1-git-send-email-yangyicong@hisilicon.com/
>>
>> Change since v2:
>> - handle -EPROBE_DEFER case when get irq number by platform_get_irq()
>> Link: https://lore.kernel.org/linux-i2c/1615296137-14558-1-git-send-email-yangyicong@hisilicon.com/
>>
>> Change since v1:
>> - fix compile test error on 32bit arch, reported by intel lkp robot:
>>   64 bit division without using kernel wrapper in probe function.
>> Link:https://lore.kernel.org/linux-i2c/1615016946-55670-1-git-send-email-yangyicong@hisilicon.com/
>>
>> Yicong Yang (4):
>>   i2c: core: add managed function for adding i2c adapters
>>   i2c: core: add api to provide frequency mode strings
>>   i2c: add support for HiSilicon I2C controller
>>   MAINTAINERS: Add maintainer for HiSilicon I2C driver
>>
>>  MAINTAINERS                   |   7 +
>>  drivers/i2c/busses/Kconfig    |  10 +
>>  drivers/i2c/busses/Makefile   |   1 +
>>  drivers/i2c/busses/i2c-hisi.c | 510 ++++++++++++++++++++++++++++++++++++++++++
>>  drivers/i2c/i2c-core-base.c   |  26 +++
>>  include/linux/i2c.h           |  21 ++
>>  6 files changed, 575 insertions(+)
>>  create mode 100644 drivers/i2c/busses/i2c-hisi.c
>>
>> -- 
>> 2.8.1
>>
> 
