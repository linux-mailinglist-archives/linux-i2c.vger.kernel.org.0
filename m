Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 338B472B61A
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 05:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbjFLDbv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Jun 2023 23:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231764AbjFLDbu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Jun 2023 23:31:50 -0400
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D84D0F4
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 20:31:47 -0700 (PDT)
X-ASG-Debug-ID: 1686540696-086e233136139b0001-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx1.zhaoxin.com with ESMTP id LjEbKVIn4quw4Dpw (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Mon, 12 Jun 2023 11:31:37 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 12 Jun
 2023 11:31:36 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 12 Jun
 2023 11:31:35 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Message-ID: <8273f8a5-bbbc-efeb-16fc-f9eef6561337@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date:   Mon, 12 Jun 2023 11:31:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4] i2c: add support for Zhaoxin I2C controller
To:     Krzysztof Kozlowski <krzk@kernel.org>, <andi.shyti@kernel.org>,
        <linux-i2c@vger.kernel.org>
X-ASG-Orig-Subj: Re: [PATCH v4] i2c: add support for Zhaoxin I2C controller
CC:     <cobechen@zhaoxin.com>, <TonyWWang@zhaoxin.com>
References: <20230609031625.6928-1-hanshu-oc@zhaoxin.com>
 <a6c22dd5-262c-4829-1eda-601cff697553@kernel.org>
Content-Language: en-US
Reply-To: <a6c22dd5-262c-4829-1eda-601cff697553@kernel.org>
From:   Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <a6c22dd5-262c-4829-1eda-601cff697553@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1686540696
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 3200
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.109929
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


On 2023/6/9 17:33, Krzysztof Kozlowski wrote:
> On 09/06/2023 05:16, Hans Hu wrote:
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
>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index cb932c6f8959..bb61e19eef72 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -9761,6 +9761,13 @@ L:	linux-i2c@vger.kernel.org
>>   F:	Documentation/i2c/busses/i2c-ismt.rst
>>   F:	drivers/i2c/busses/i2c-ismt.c
>>   
>> +ZHAOXIN I2C CONTROLLER DRIVER
>> +M:	Hans Hu <hanshu@zhaoxin.com>
>> +L:	linux-i2c@vger.kernel.org
>> +S:	Maintained
>> +W:	https://www.zhaoxin.com
>> +F:	drivers/i2c/busses/i2c-zhaoxin.c
>> +
>>   I2C/SMBUS STUB DRIVER
>>   M:	Jean Delvare <jdelvare@suse.com>
>>   L:	linux-i2c@vger.kernel.org
>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>> index 87600b4aacb3..1f181757ce2a 100644
>> --- a/drivers/i2c/busses/Kconfig
>> +++ b/drivers/i2c/busses/Kconfig
>> @@ -333,6 +333,16 @@ config I2C_VIAPRO
>>   	  This driver can also be built as a module.  If so, the module
>>   	  will be called i2c-viapro.
>>   
>> +config I2C_ZHAOXIN
>> +	tristate "ZHAOXIN I2C Interface"
>> +	depends on (PCI && ACPI) || COMPILE_TEST
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
> Shouldn't you driver be in ACPI drivers?


Ok, so should I add COMPILE_TEST after ACPI?
Like:
-if ACPI
+if ACPI || COMPILE_TEST
[...]
+    config I2C_ZHAOXIN
+        tristate "ZHAOXIN I2C Interface"
+        depends on PCI || COMPILE_TEST


> ...
>
>> +
>> +static int zxi2c_probe(struct platform_device *pdev)
>> +{
>> +	int err = 0;
>> +	struct zxi2c *i2c;
>> +	struct pci_dev *pci;
>> +	struct device *dev;
>> +
>> +	/* make sure this is zhaoxin platform */
> Why? You didn't provid explanation last time for this.


I explained this earlier in my email.  Link:
https://lore.kernel.org/all/689522d4-b7b3-59ee-685d-fa88315dbde6@zhaoxin.com/
Since I have not received any further reply from you, I have not made 
any change.

I saw your latest discussion with Andi. I understand what you mean now,
so I will drop it in the patch v5.

Thank you,
Hans


>
>> +	dev = pdev->dev.parent;
>> +	if (dev && dev_is_pci(dev)) {
>> +		pci = to_pci_dev(dev);
>> +		if (pci->vendor != PCI_VENDOR_ID_ZHAOXIN ||
>> +		    pci->device != ZXI2C_PARENT_PCI_DID)
>> +			return -ENODEV;
>> +	} else {
>> +		return -ENODEV;
>> +	}
> Drop it.
>
>> +
>
> Best regards,
> Krzysztof
>
