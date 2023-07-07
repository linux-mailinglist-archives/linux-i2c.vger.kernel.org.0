Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 192A974B265
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jul 2023 16:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbjGGOB0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jul 2023 10:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232709AbjGGOBW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jul 2023 10:01:22 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5DB61FEF;
        Fri,  7 Jul 2023 07:01:11 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 367D5JPm029918;
        Fri, 7 Jul 2023 16:00:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=geb7y3s4woJ3gVvgbLEepweyY2vxzrtl4SkK7CXSDOM=;
 b=XImO+YhUaKoxthCWbN1dHrm9EWgj7Ol4QnI642tf/UuBsjrjg4RCxEX18++7YVWQRjMe
 2gClSEn5DCM70KR0iBJxU1HCp4pq8VdtPqncnsahJDTG8LO8pnkGuZiFjSAUUHyn2qOO
 87w5QQQVhOAohte/TMzbFUUj8Kv+0O6f2AFZfmeMFCsQWaC7u4cHeJ6leZ/cXPKJ8H/p
 RDvCSFE7xdtBOmzK6K/w8vqYYtB/ofpAbZsVZPlmaJmO2Iy7eN4Mr8JYQdhkh9U9TQyH
 lz8ho3clWXCOZVYuJNs4Hc8eIbNm29P+xV/I9xFqDEXYwpI5NLsnRpuH5kNVbX77ZWzr CA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rpfncj7rs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Jul 2023 16:00:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 582A2100050;
        Fri,  7 Jul 2023 16:00:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E4CF2278A4;
        Fri,  7 Jul 2023 16:00:25 +0200 (CEST)
Received: from [10.201.21.121] (10.201.21.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 7 Jul
 2023 16:00:23 +0200
Message-ID: <febd65e1-68c7-f9d8-c8a4-3c3e88f15f3e@foss.st.com>
Date:   Fri, 7 Jul 2023 16:00:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 05/10] firewall: introduce stm32_firewall framework
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <Oleksii_Moisieiev@epam.com>, <herbert@gondor.apana.org.au>,
        <davem@davemloft.net>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <alexandre.torgue@foss.st.com>, <vkoul@kernel.org>,
        <jic23@kernel.org>, <olivier.moysan@foss.st.com>,
        <arnaud.pouliquen@foss.st.com>, <mchehab@kernel.org>,
        <fabrice.gasnier@foss.st.com>, <andi.shyti@kernel.org>,
        <ulf.hansson@linaro.org>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <hugues.fruchet@foss.st.com>,
        <lee@kernel.org>, <will@kernel.org>, <catalin.marinas@arm.com>,
        <arnd@kernel.org>, <richardcochran@gmail.com>,
        <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-media@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-6-gatien.chevallier@foss.st.com>
 <2023070748-false-enroll-e5dc@gregkh>
From:   Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <2023070748-false-enroll-e5dc@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_09,2023-07-06_02,2023-05-22_02
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Greg,

On 7/7/23 12:37, Greg KH wrote:
> On Wed, Jul 05, 2023 at 07:27:54PM +0200, Gatien Chevallier wrote:
>> Introduce a firewall framework that offers to firewall consumers different
>> firewall services such as the ability to check their access rights against
>> their firewall controller(s).
>>
>> The firewall framework offers a generic API that is defined in firewall
>> controllers drivers to best fit the specificity of each firewall.
> 
> But you aren't defining a "generic" api here, you are defining a
> specific one for your specific hardware.
> 
> Or am I missing something?
> 

This framework is indeed ST-oriented, I should have specified :
"...offers a generic API for STM32 firewall controllers that is defined
in their drivers...". Will change in V2

>>
>> There are various types of firewalls:
>> -Peripheral firewalls that filter accesses to peripherals
>> -Memory firewalls that filter accesses to memories or memory regions
>> -Resource firewalls that filter accesses to internal resources such as
>> reset and clock controllers
>>
>> A firewall controller must be probed at arch_initcall level and register
>> to the framework so that consumers can use their services.
> 
> Why must it happen at arch_initcall?  So it can never be a module?  That
> feels wrong.
> 

Rob asked the same question.

I responded under his comment, I'm not quite sure how to handle it with
fw_devlink for dependencies with drivers that are probed at early init
levels.

>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> ---
>>   MAINTAINERS                               |   5 +
>>   arch/arm64/Kconfig.platforms              |   1 +
>>   drivers/bus/Kconfig                       |  10 +
>>   drivers/bus/Makefile                      |   1 +
>>   drivers/bus/stm32_firewall.c              | 252 ++++++++++++++++++++++
>>   drivers/bus/stm32_firewall.h              |  83 +++++++
>>   include/linux/bus/stm32_firewall_device.h | 134 ++++++++++++
>>   7 files changed, 486 insertions(+)
>>   create mode 100644 drivers/bus/stm32_firewall.c
>>   create mode 100644 drivers/bus/stm32_firewall.h
>>   create mode 100644 include/linux/bus/stm32_firewall_device.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 41385f01fa98..fabf95ba9b86 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -20123,6 +20123,11 @@ T:	git git://linuxtv.org/media_tree.git
>>   F:	Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
>>   F:	drivers/media/i2c/st-mipid02.c
>>   
>> +ST STM32 FIREWALL
>> +M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
>> +S:	Maintained
>> +F:	drivers/bus/stm32_firewall.c
>> +
>>   ST STM32 I2C/SMBUS DRIVER
>>   M:	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
>>   M:	Alain Volmat <alain.volmat@foss.st.com>
>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>> index 6069120199bb..5a46e90f1e4e 100644
>> --- a/arch/arm64/Kconfig.platforms
>> +++ b/arch/arm64/Kconfig.platforms
>> @@ -293,6 +293,7 @@ config ARCH_STM32
>>   	select ARM_SMC_MBOX
>>   	select ARM_SCMI_PROTOCOL
>>   	select COMMON_CLK_SCMI
>> +	select STM32_FIREWALL
>>   	help
>>   	  This enables support for ARMv8 based STMicroelectronics
>>   	  STM32 family, including:
>> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
>> index fcfa280df98a..4d54a7ea52b2 100644
>> --- a/drivers/bus/Kconfig
>> +++ b/drivers/bus/Kconfig
>> @@ -163,6 +163,16 @@ config QCOM_SSC_BLOCK_BUS
>>   	  i2c/spi/uart controllers, a hexagon core, and a clock controller
>>   	  which provides clocks for the above.
>>   
>> +config STM32_FIREWALL
>> +	bool "STM32 Firewall framework"
>> +	depends on ARCH_STM32
> 
> Why this dependency?
> 
>> +	default MACH_STM32MP157 || MACH_STM32MP13 || MACH_STM32MP25
>> +	help
>> +	  Say y to enable firewall framework and its services. Firewall
>> +	  controllers will be able to register to the framework. Firewall
>> +	  controllers must be initialized and register to the firewall framework
>> +	  at arch_initcall level.
> 
> This needs better wording saying it is only for stm32 devices.
> 

Ack, will change in V2.

>> +
>>   config SUN50I_DE2_BUS
>>   	bool "Allwinner A64 DE2 Bus Driver"
>>   	  default ARM64
>> diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
>> index d90eed189a65..fc0511450ec2 100644
>> --- a/drivers/bus/Makefile
>> +++ b/drivers/bus/Makefile
>> @@ -26,6 +26,7 @@ obj-$(CONFIG_OMAP_INTERCONNECT)	+= omap_l3_smx.o omap_l3_noc.o
>>   obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
>>   obj-$(CONFIG_QCOM_EBI2)		+= qcom-ebi2.o
>>   obj-$(CONFIG_QCOM_SSC_BLOCK_BUS)	+= qcom-ssc-block-bus.o
>> +obj-$(CONFIG_STM32_FIREWALL)	+= stm32_firewall.o
>>   obj-$(CONFIG_SUN50I_DE2_BUS)	+= sun50i-de2.o
>>   obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
>>   obj-$(CONFIG_OF)		+= simple-pm-bus.o
>> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
>> new file mode 100644
>> index 000000000000..510db5bc6eaf
>> --- /dev/null
>> +++ b/drivers/bus/stm32_firewall.c
>> @@ -0,0 +1,252 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
> 
> Are you _SURE_ this needs to be "or later"?  Sorry, I have to ask.
> 
> thanks,
> 
> greg k-h

I'll change to (GPL-2.0-only OR BSD-3-Clause) :)

Best regards,
Gatien
