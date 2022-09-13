Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2ACA5B6AD7
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 11:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbiIMJh0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 05:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231741AbiIMJhO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 05:37:14 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A57A5E658;
        Tue, 13 Sep 2022 02:37:06 -0700 (PDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MRdb41TxVznVHk;
        Tue, 13 Sep 2022 17:34:24 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 17:37:04 +0800
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH next v4 1/2] i2c: hisi: Add initial device tree support
To:     chenweilong <chenweilong@huawei.com>, <yangyicong@hisilicon.com>,
        <xuwei5@huawei.com>, <wsa@kernel.org>, <robh+dt@kernel.org>
References: <20220909074842.281232-1-chenweilong@huawei.com>
 <cc27d1af-7f8a-7c51-a101-1b254a2d761b@huawei.com>
 <64721a3f-8fa4-45b4-1045-544cdd021bd8@huawei.com>
From:   Yicong Yang <yangyicong@huawei.com>
Message-ID: <9d2eb596-f16b-a87b-22f7-a6fcd9cb49fc@huawei.com>
Date:   Tue, 13 Sep 2022 17:37:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <64721a3f-8fa4-45b4-1045-544cdd021bd8@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2022/9/13 17:01, chenweilong wrote:
> On 2022/9/13 15:48, Yicong Yang wrote:
>> On 2022/9/9 15:48, Weilong Chen wrote:
>>> The HiSilicon I2C controller can be used on embedded platform, which
>>> boot from devicetree.
>>>
>>> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
>>> ---
>>>  drivers/i2c/busses/Kconfig    |  2 +-
>>>  drivers/i2c/busses/i2c-hisi.c | 19 ++++++++++++++++++-
>>>  2 files changed, 19 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>>> index 7284206b278b..6d0fdf48e97d 100644
>>> --- a/drivers/i2c/busses/Kconfig
>>> +++ b/drivers/i2c/busses/Kconfig
>>> @@ -673,7 +673,7 @@ config I2C_HIGHLANDER
>>>  
>>>  config I2C_HISI
>>>  	tristate "HiSilicon I2C controller"
>>> -	depends on (ARM64 && ACPI) || COMPILE_TEST
>>> +	depends on ARM64 || COMPILE_TEST
>>>  	help
>>>  	  Say Y here if you want to have Hisilicon I2C controller support
>>>  	  available on the Kunpeng Server.
>>> diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
>>> index 76c3d8f6fc3c..7a77f306d05f 100644
>>> --- a/drivers/i2c/busses/i2c-hisi.c
>>> +++ b/drivers/i2c/busses/i2c-hisi.c
>>> @@ -5,6 +5,9 @@
>>>   * Copyright (c) 2021 HiSilicon Technologies Co., Ltd.
>>>   */
>>>  
>>> +#ifdef CONFIG_ACPI
>>> +#include <linux/acpi.h>
>>> +#endif
>>>  #include <linux/bits.h>
>>>  #include <linux/bitfield.h>
>>>  #include <linux/completion.h>
>>> @@ -13,6 +16,9 @@
>>>  #include <linux/io.h>
>>>  #include <linux/module.h>
>>>  #include <linux/mod_devicetable.h>
>>> +#ifdef CONFIG_OF
>>> +#include <linux/of.h>
>>> +#endif
>> I don't think the protection for the headers is necessary and common. The
>> ACPI/OF specific functions should have already been handled well with{out}
>> ACPI/OF config. Have you met some problems without these?
>>
>> BTW, it's better to have a changelog when updating the patches.
> 
> This kind usage does exist in the kernel, for example: drivers/rtc/rtc-mc146818-lib.c.
> 

The protection for acpi.h used in that driver may also be unnecessary I think, but may need
test.

> It can be consistent with the protection below MODULE_DEVICE_TABLE.
> 

MODULE_DEVICE_TABLE is defined in module.h, so not depend on these two headers.

>>>  #include <linux/platform_device.h>
>>>  #include <linux/property.h>
>>>  #include <linux/units.h>
>>> @@ -483,17 +489,28 @@ static int hisi_i2c_probe(struct platform_device *pdev)
>>>  	return 0;
>>>  }
>>>  
>>> +#ifdef CONFIG_ACPI
>>>  static const struct acpi_device_id hisi_i2c_acpi_ids[] = {
>>>  	{ "HISI03D1", 0 },
>>>  	{ }
>>>  };
>>>  MODULE_DEVICE_TABLE(acpi, hisi_i2c_acpi_ids);
>>> +#endif
>>> +
>>> +#ifdef CONFIG_OF
>>> +static const struct of_device_id hisi_i2c_dts_ids[] = {
>>> +	{ .compatible = "hisilicon,hisi-i2c", },
>>> +	{ }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, hisi_i2c_dts_ids);
>>> +#endif
>>>  
>>>  static struct platform_driver hisi_i2c_driver = {
>>>  	.probe		= hisi_i2c_probe,
>>>  	.driver		= {
>>>  		.name	= "hisi-i2c",
>>> -		.acpi_match_table = hisi_i2c_acpi_ids,
>>> +		.acpi_match_table = ACPI_PTR(hisi_i2c_acpi_ids),
>>> +		.of_match_table = of_match_ptr(hisi_i2c_dts_ids),
>>>  	},
>>>  };
>>>  module_platform_driver(hisi_i2c_driver);
>>>
>> .
> 
> 
> .
> 
