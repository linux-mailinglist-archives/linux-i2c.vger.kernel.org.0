Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB4C360536
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 11:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbhDOJFM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 05:05:12 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15685 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231482AbhDOJFM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Apr 2021 05:05:12 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FLYHj6D7vzpY5v;
        Thu, 15 Apr 2021 17:01:53 +0800 (CST)
Received: from [127.0.0.1] (10.69.38.196) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.498.0; Thu, 15 Apr 2021
 17:04:39 +0800
Subject: Re: [PATCH] i2c: I2C_HISI should depend on ARCH_HISI && ACPI
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wei Xu <xuwei5@hisilicon.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linuxarm <linuxarm@huawei.com>
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
 <bd8db435-24e1-5ab3-6b35-1d4d8a292a7e@hisilicon.com>
 <CAMuHMdVouD+e4GpN_Dur8HSop4B8HVosGSYw7vfTpBEi_inMbw@mail.gmail.com>
 <21d833f0-b1b8-9732-21c7-3a73676e07d3@hisilicon.com>
From:   Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <39f6bbed-9eea-963a-1ef1-a83248f162aa@hisilicon.com>
Date:   Thu, 15 Apr 2021 17:04:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <21d833f0-b1b8-9732-21c7-3a73676e07d3@hisilicon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.38.196]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/4/15 16:18, Yicong Yang wrote:
> On 2021/4/15 2:06, Geert Uytterhoeven wrote:
>> Hi Yicong,
>>
>> On Wed, Apr 14, 2021 at 11:24 AM Yicong Yang <yangyicong@hisilicon.com> wrote:
>>> On 2021/4/13 20:26, Geert Uytterhoeven wrote:
>>>> The HiSilicon Kunpeng I2C controller is only present on HiSilicon
>>>> Kunpeng SoCs, and its driver relies on ACPI to probe for its presence.
>>>> Hence add dependencies on ARCH_HISI and ACPI, to prevent asking the user
>>>> about this driver when configuring a kernel without Hisilicon platform
>>>> or ACPI firmware support.
>>>
>>> this is a public IP which doesn't specifically depend on ARCH_HISI. I'm
>>> not sure all the platform this IP on has ARCH_HISI configured. The driver
>>> will not be compiled by default config. This is not correct to have
>>> this dependence.
>>
>> Thanks for your answer!
>>
>> I guess it's still fine to add a dependency on ACPI?
> 
> yes. currently we only use this driver through ACPI. So at least
> for this driver, it make sense to keep the dependency.
> 

sorry. i was a little mess about this. I dropped this in [1].
so just keep it as is.

[1] https://lore.kernel.org/linux-i2c/YGMntYT2iz72wgrd@smile.fi.intel.com/

>>
>> Thanks again!
>>
>>>> Fixes: d62fbdb99a85730a ("i2c: add support for HiSilicon I2C controller")
>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> ---
>>>>  drivers/i2c/busses/Kconfig | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>>>> index b5b4e0d0ff4dd0bc..3ead6d9e130b2ebc 100644
>>>> --- a/drivers/i2c/busses/Kconfig
>>>> +++ b/drivers/i2c/busses/Kconfig
>>>> @@ -647,7 +647,7 @@ config I2C_HIGHLANDER
>>>>
>>>>  config I2C_HISI
>>>>       tristate "HiSilicon I2C controller"
>>>> -     depends on ARM64 || COMPILE_TEST
>>>> +     depends on (ARM64 && ARCH_HISI && ACPI) || COMPILE_TEST
>>>>       help
>>>>         Say Y here if you want to have Hisilicon I2C controller support
>>>>         available on the Kunpeng Server.
>> \
>> Gr{oetje,eeting}s,
>>
>>                         Geert
>>
> 
> 
> .
> 

