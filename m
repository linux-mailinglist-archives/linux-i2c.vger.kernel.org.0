Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBDE1725F8A
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jun 2023 14:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238076AbjFGMea (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 08:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240968AbjFGMeP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 08:34:15 -0400
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F41173A
        for <linux-i2c@vger.kernel.org>; Wed,  7 Jun 2023 05:34:08 -0700 (PDT)
X-ASG-Debug-ID: 1686141242-1eb14e2b480a070001-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx2.zhaoxin.com with ESMTP id S7NTg0venHdIvf69 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Wed, 07 Jun 2023 20:34:02 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Wed, 7 Jun
 2023 20:34:01 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Wed, 7 Jun
 2023 20:34:00 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Message-ID: <87c0be06-0ac4-5d34-671c-5668739bdb8b@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date:   Wed, 7 Jun 2023 20:33:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] i2c: add support for Zhaoxin I2C controller
To:     Krzysztof Kozlowski <krzk@kernel.org>, <andi.shyti@kernel.org>,
        <linux-i2c@vger.kernel.org>
X-ASG-Orig-Subj: Re: [PATCH v3] i2c: add support for Zhaoxin I2C controller
CC:     <cobechen@zhaoxin.com>, <TonyWWang@zhaoxin.com>
References: <20230602050103.11223-1-hanshu-oc@zhaoxin.com>
 <0489dec4-cd7a-4f50-e811-d4798d514fb4@kernel.org>
Content-Language: en-US
From:   Hans Hu <HansHu-oc@zhaoxin.com>
Reply-To: <0489dec4-cd7a-4f50-e811-d4798d514fb4@kernel.org>
In-Reply-To: <0489dec4-cd7a-4f50-e811-d4798d514fb4@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1686141242
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 8145
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.109721
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Krzysztof,

On 2023/6/6 16:34, Krzysztof Kozlowski wrote:
> On 02/06/2023 07:01, Hans Hu wrote:
>> Add Zhaoxin I2C controller driver. It provides the access to the i2c
>> busses, which connects to the touchpad, eeprom, etc.
>>
>> Zhaoxin I2C controller has two separate busses, so may accommodate up
>> to two I2C adapters. Those adapters are listed in the ACPI namespace
>> with the "IIC1D17" HID, and probed by a platform driver.
>>
>> The driver works with IRQ mode, and supports basic I2C features. Flags
>> I2C_AQ_NO_ZERO_LEN and I2C_AQ_COMB_WRITE_THEN_READ are used to limit
>> the unsupported access.
>>
>> Change since v2:
>>    * fixed some code style issues
>>    * check if "timeout == 0" first, then check if event $condition is true
>>    * add warnning message for "timeout == 1"
>>    Link: https://lore.kernel.org/all/20230531110058.n7ubjp2kzlx7tuoc@intel.intel/
>>
>> Change since v1:
>>    * remove some useless include files and sort the rest.
>>    * use mmio bar distinguish host index.
>>    * use pci-dev's name and i2c-dev's name rename adapter's name.
>>    * remove some debug code, fix some code style issue.
>>    Link: https://lore.kernel.org/all/20230504060043.13155-1-hanshu-oc@zhaoxin.com/
>>
>> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
>> ---
>>   drivers/i2c/busses/Kconfig       |  10 +
>>   drivers/i2c/busses/Makefile      |   1 +
>>   drivers/i2c/busses/i2c-zhaoxin.c | 645 +++++++++++++++++++++++++++++++
>>   3 files changed, 656 insertions(+)
>>   create mode 100644 drivers/i2c/busses/i2c-zhaoxin.c
>>
>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>> index 87600b4aacb3..4c2d302184aa 100644
>> --- a/drivers/i2c/busses/Kconfig
>> +++ b/drivers/i2c/busses/Kconfig
>> @@ -333,6 +333,16 @@ config I2C_VIAPRO
>>   	  This driver can also be built as a module.  If so, the module
>>   	  will be called i2c-viapro.
>>   
>> +config I2C_ZHAOXIN
>> +	tristate "ZHAOXIN I2C Interface"
>> +	depends on PCI && ACPI
> Why this cannot be compile tested?


will add COMPILE_TEST in patch v4.


>> +	help
>> +	  If you say yes to this option, support will be included for the
>> +	  ZHAOXIN I2C interface
>> +
>> +	  This driver can also be built as a module.  If so, the module
>> +	  will be called i2c-zhaoxin.
>> +
>>   if ACPI
>>   
>>   comment "ACPI drivers"
>> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
>> index af56fe2c75c0..cc470ce470ca 100644
>> --- a/drivers/i2c/busses/Makefile
>> +++ b/drivers/i2c/busses/Makefile
>> @@ -29,6 +29,7 @@ obj-$(CONFIG_I2C_SIS630)	+= i2c-sis630.o
>>   obj-$(CONFIG_I2C_SIS96X)	+= i2c-sis96x.o
>>   obj-$(CONFIG_I2C_VIA)		+= i2c-via.o
>>   obj-$(CONFIG_I2C_VIAPRO)	+= i2c-viapro.o
>> +obj-$(CONFIG_I2C_ZHAOXIN)	+= i2c-zhaoxin.o
>>   
>>   # Mac SMBus host controller drivers
>>   obj-$(CONFIG_I2C_HYDRA)		+= i2c-hydra.o
>> diff --git a/drivers/i2c/busses/i2c-zhaoxin.c b/drivers/i2c/busses/i2c-zhaoxin.c
>> new file mode 100644
>> index 000000000000..61807da9c170
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-zhaoxin.c
>> @@ -0,0 +1,645 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + *  i2c-zhaoxin-i2c.c - Zhaoxin I2C controller driver
>> + *
>> + *  Copyright(c) 2021 Shanghai Zhaoxin Semiconductor Corporation.
>> + *                    All rights reserved.
>> + *
>> + *  CONTACTS:
>> + *
>> + *  Hans Hu             hanshu@zhaoxin.com
>> + *  Cobe Chen           cobechen@zhaoxin.com
>> + */
>> +
>> +#define DRIVER_VERSION "1.4.0"
>> +
> Drop. Linux already has a version.


will drop.


>> +
>> +static int zxi2c_parse_resources(struct zxi2c *i2c)
>> +{
>> +	struct platform_device *pdev = to_platform_device(i2c->dev);
>> +	struct resource *res;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	i2c->regs = devm_ioremap_resource(&pdev->dev, res);
> There is a helper for these two.


I want to use the lower 8 bits of the physical address to
distinguish the controller's index, to set reset_bitmask.


>> +	if (IS_ERR(i2c->regs))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->regs),
>> +				"get base addr failed\n");
>> +
>> +	if (res->start & 0x20)
>> +		i2c->reset_bitmask = BIT(4);
>> +	else
>> +		i2c->reset_bitmask = BIT(5);
>> +
>> +	i2c->irq = platform_get_irq(pdev, 0);
>> +	if (i2c->irq < 0)
>> +		return dev_err_probe(&pdev->dev, i2c->irq,
>> +				"get irq failed\n");
>> +
>> +	zxi2c_get_bus_speed(i2c);
>> +
>> +	i2c->hrv = get_reversion(i2c->regs);
>> +
>> +	i2c->dynamic = get_dynamic_clock(i2c->regs);
>> +	set_dynamic_clock(i2c->regs, i2c->dynamic);
>> +
>> +	i2c->fstp = get_fstp_value(i2c->regs);
>> +	zxi2c_set_bus_speed(i2c);
>> +
>> +	return 0;
>> +}
>> +
>> +static int zxi2c_probe(struct platform_device *pdev)
>> +{
>> +	int error;
>> +	struct zxi2c *i2c;
>> +	struct pci_dev *pci;
>> +	struct device *dev;
>> +
>> +	/* make sure this is zhaoxin platform */
> Why? How can you match to different platform?
>

In case a platform device named "IIC1D17" is also reported on
non-zhaoxin platform, this driver may also be registered successfully,
even if it shouldn't. In theory.


>> +	dev = pdev->dev.parent;
>> +	if (dev && dev_is_pci(dev)) {
>> +		pci = to_pci_dev(dev);
>> +		if (pci->vendor != 0x1d17 || pci->device != 0x1001)
>> +			return -ENODEV;
>> +	} else {
>> +		return -ENODEV;
>> +	}
>> +
>> +	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
>> +	if (IS_ERR(i2c)) {
>> +		return dev_err_probe(&pdev->dev, -ENOMEM,
>> +				"devm_kzalloc failed\n");
> Don't print ENOMEM.


will change to just return -ENOMEM;


> Run:
> 1. Checkpatch
> 2. Coccinelle
> to fix trivial issues.


I used the checkpatch in different versions of the kernel, and there were
no errors, just a warning about the modify MAINTAINERS, will modify it.


>> +	}
>> +
>> +	i2c->pci = pci;
>> +	i2c->dev = &pdev->dev;
>> +	error = zxi2c_parse_resources(i2c);
>> +	if (error)
>> +		return error;
>> +
>> +	platform_set_drvdata(pdev, (void *)i2c);
>> +
>> +	error = devm_request_irq(&pdev->dev, i2c->irq, zxi2c_irq_handle,
>> +			     IRQF_SHARED, pdev->name, i2c);
>> +	if (error < 0)
>> +		return dev_err_probe(i2c->dev, error,
>> +				"IRQ%d request failed\n",
>> +				i2c->irq);
>> +
>> +	init_waitqueue_head(&i2c->waitq);
>> +
>> +	i2c->adap.owner = THIS_MODULE;
>> +	i2c->adap.algo = &zxi2c_algorithm;
>> +	i2c->adap.retries = 2;
>> +	i2c->adap.quirks = &zxi2c_quirks;
>> +	i2c->adap.dev.parent = &pdev->dev;
>> +	ACPI_COMPANION_SET(&i2c->adap.dev, ACPI_COMPANION(&pdev->dev));
>> +	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
>> +		 "%s-%s", dev_name(&pci->dev), dev_name(i2c->dev));
>> +	i2c_set_adapdata(&i2c->adap, i2c);
>> +
>> +	error = i2c_add_adapter(&i2c->adap);
>> +	if (unlikely(error))
>> +		return dev_err_probe(i2c->dev, error,
>> +				"adapter registration failed\n");
>> +
>> +	dev_info(i2c->dev, "adapter /dev/i2c-%d registered. hw version %x\n",
>> +		 i2c->adap.nr, i2c->hrv);
>> +
>> +	return 0;
>> +}
>> +
>> +static int zxi2c_remove(struct platform_device *pdev)
>> +{
>> +	struct zxi2c *i2c = platform_get_drvdata(pdev);
>> +
>> +	i2c_lock_bus(&i2c->adap, I2C_LOCK_ROOT_ADAPTER);
>> +
>> +	zxi2c_module_reset(i2c);
>> +	master_regs_reset(i2c->regs);
>> +
>> +	devm_free_irq(&pdev->dev, i2c->irq, i2c);
>> +
>> +	i2c_unlock_bus(&i2c->adap, I2C_LOCK_ROOT_ADAPTER);
>> +
>> +	i2c_del_adapter(&i2c->adap);
>> +
>> +	platform_set_drvdata(pdev, NULL);
>> +	devm_kfree(&pdev->dev, i2c);
> Why do you do it? Its devm.
>

will drop it, and replace i2c_add_adapter with devm_i2c_add_adapter.


>> +
>> +	dev_info(&pdev->dev, "adapter unregistered\n");
> Drop simple probe or function success statuses. Kernel has other ways to
> get this information.
>

will drop it.


> ...
>
>
>> +		.acpi_match_table = ACPI_PTR(zxi2c_acpi_match),
> Drop ACPI_PTR. This will cause warnings.


will drop it.

Thank you,
Hans


>
> Best regards,
> Krzysztof
>
