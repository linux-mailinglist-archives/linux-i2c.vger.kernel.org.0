Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8667D74986E
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 11:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231997AbjGFJaZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jul 2023 05:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbjGFJaX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jul 2023 05:30:23 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 075BF1725;
        Thu,  6 Jul 2023 02:30:21 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36684HLC016989;
        Thu, 6 Jul 2023 11:29:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=FJ0MomoThNUzsv1pX20GYZsRL0ZNxMl5ijEruyW+QsM=;
 b=Wfiz+s02qZ+/GlnKxXqYORZi2Cl675p0tcrGzK9P1iaimfEBZIEEn9BOP6BZj55AnFyQ
 SOksZ9EYhjIQjNmLpWRBblepAj6ayQlw+sNuBzx378/keLBSE3Ki4u9b9YDy1kQtsJGt
 TFbLM5w9wnv5VKMxPDsrTnNWGCzGRtlgI0FB8JDHQqHSh2R5FDNc2oElbvcrUBzQBYic
 dx3hf83LKCn4e+q5Yp8iyXO59+ppD3U075hFJrrggh9e3Hri8dvBjWowILkKbpX2AD0J
 Nrektl6lIyQAr2w9wKavixNCGpsDAlYOGTuqcjhYiUfg7js2J2iHgA0VeZkSbU5iXBDP Pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rnssf8ppn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 06 Jul 2023 11:29:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 29DA4100052;
        Thu,  6 Jul 2023 11:29:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B9CE216ECD;
        Thu,  6 Jul 2023 11:29:47 +0200 (CEST)
Received: from [10.201.21.121] (10.201.21.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 6 Jul
 2023 11:29:45 +0200
Message-ID: <1ac0f2e0-4ec1-3871-d0a3-3ccc2eb687e5@foss.st.com>
Date:   Thu, 6 Jul 2023 11:29:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 02/10] dt-bindings: bus: add device tree bindings for
 RIFSC
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <vkoul@kernel.org>, <jic23@kernel.org>,
        <olivier.moysan@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
        <mchehab@kernel.org>, <fabrice.gasnier@foss.st.com>,
        <andi.shyti@kernel.org>, <ulf.hansson@linaro.org>,
        <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
        <hugues.fruchet@foss.st.com>, <lee@kernel.org>, <will@kernel.org>,
        <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>
CC:     <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-media@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-3-gatien.chevallier@foss.st.com>
 <e871ad32-dfa4-067d-4f2c-207ffd42aafd@linaro.org>
From:   Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <e871ad32-dfa4-067d-4f2c-207ffd42aafd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_06,2023-07-06_01,2023-05-22_02
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Krzysztof,

Firstly, I will correct the bindings error pointed by Rob's robot.
Obviously, I did not pass the bindings check the proper way or maybe I'm 
running an old version.

On 7/6/23 08:28, Krzysztof Kozlowski wrote:
> On 05/07/2023 19:27, Gatien Chevallier wrote:
>> Document RIFSC (RIF security controller). RIFSC is a firewall controller
>> composed of different kinds of hardware resources.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> 
> A nit, subject: drop second/last, redundant "device tree bindings for".
> The "dt-bindings" prefix is already stating that these are bindings. 4
> words of your 6 word subject is meaningless...

Ack, I will rephrase, it is indeed redundant

> 
>> ---
>>   .../bindings/bus/st,stm32-rifsc.yaml          | 101 ++++++++++++++++++
>>   1 file changed, 101 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/bus/st,stm32-rifsc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/bus/st,stm32-rifsc.yaml b/Documentation/devicetree/bindings/bus/st,stm32-rifsc.yaml
>> new file mode 100644
>> index 000000000000..68d585ed369c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/bus/st,stm32-rifsc.yaml
> 
> Filename like compatible, unless you know list of compatibles will
> grow... but then add them.
> 
>> @@ -0,0 +1,101 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bus/st,stm32-rifsc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STM32 Resource isolation framework security controller bindings
> 
> Drop bindings

Ack

> 
>> +
>> +maintainers:
>> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
>> +
>> +description: |
>> +  Resource isolation framework (RIF) is a comprehensive set of hardware blocks
>> +  designed to enforce and manage isolation of STM32 hardware resources like
>> +  memory and peripherals.
>> +
>> +  The RIFSC (RIF security controller) is composed of three sets of registers,
>> +  each managing a specific set of hardware resources:
>> +    - RISC registers associated with RISUP logic (resource isolation device unit
>> +      for peripherals), assign all non-RIF aware peripherals to zero, one or
>> +      any security domains (secure, privilege, compartment).
>> +    - RIMC registers: associated with RIMU logic (resource isolation master
>> +      unit), assign all non RIF-aware bus master to one security domain by
>> +      setting secure, privileged and compartment information on the system bus.
>> +      Alternatively, the RISUP logic controlling the device port access to a
>> +      peripheral can assign target bus attributes to this peripheral master port
>> +      (supported attribute: CID).
>> +    - RISC registers associated with RISAL logic (resource isolation device unit
>> +      for address space - Lite version), assign address space subregions to one
>> +      security domains (secure, privilege, compartment).
>> +
>> +properties:
>> +  compatible:
>> +    const: st,stm32mp25-rifsc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 1
>> +
>> +  "#feature-domain-cells":
>> +    const: 1
>> +
>> +  ranges: true
>> +
>> +  feature-domain-controller: true
>> +
>> +patternProperties:
>> +  "^.*@[0-9a-f]+$":
>> +    description: Peripherals
>> +    type: object
>> +    properties:
>> +      feature-domains:
>> +        minItems: 1
>> +        maxItems: 2
>> +        description:
>> +          The first argument must always be a phandle that references to the
>> +          firewall controller of the peripheral. The second can contain the
>> +          platform specific firewall ID of the peripheral.
> 
> It does not make much sense to me to have hierarchy parent-child and via
> phandle at the same time. You express the similar relationship twice
Thank you for pointing this out.

About the parent-child relation:

The bus-like device tree architecture allows a bus-probe mechanism with 
which we want to check accesses of peripherals before probing their 
driver. This has several advantages:
-This bus architecture provides a clearer view of the hardware.
-No peripheral driver modifications as it is fully handled by the 
firewall drivers.
-Drivers for devices that aren't accessible will not even be probed => 
no probe fail.

It would be possible to manage this mechanism another way by handling 
probe deferrals in drivers. But it would mean modifying every driver 
with a check on ST firewall that we probe and some of them aren't from 
STMicroelectronics.

About the phandle relation:

I agree on the fact that this double expression of the relationship is 
redundant.

I've done it this way because there will be other nodes outside the 
RIFSC node that will need to reference it as their feature-domain 
controller. I kept the same information in the property to be coherent 
between all.

For nodes under the RIFSC, the phandle is indeed useless and could be 
removed, just to leave the firewall ID. And I'm inclined to do so. I 
just have one worry on the YAML binding files where I will have a 
pattern property in the RIFSC that will state something and maybe 
another description in the peripheral YAML files. What is your take on that?

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - feature-domain-controller
>> +  - "#feature-domain-cells"
>> +  - ranges
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    // In this example, the usart2 device refers to rifsc as its domain
>> +    // controller.
>> +    // Access rights are verified before creating devices.
>> +
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    rifsc: rifsc-bus@42080000 {
>> +        compatible = "st,stm32mp25-rifsc";
>> +        reg = <0x42080000 0x1000>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges;
>> +        feature-domain-controller;
>> +        #feature-domain-cells = <1>;
>> +
>> +        usart2: serial@400e0000 {
>> +            compatible = "st,stm32h7-uart";
>> +            reg = <0x400e0000 0x400>;
>> +            interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&ck_flexgen_08>;
>> +            feature-domains = <&rifsc 32>;
>> +            status = "disabled";
> 
> No status in the examples.
> 
>> +        };
>> +    };
> 
> Best regards,
> Krzysztof
> 

Best regards,
Gatien
