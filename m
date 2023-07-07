Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E29474B429
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jul 2023 17:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233069AbjGGP1S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jul 2023 11:27:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231627AbjGGP1Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jul 2023 11:27:16 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C0D52127;
        Fri,  7 Jul 2023 08:27:14 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 367CH4gG027322;
        Fri, 7 Jul 2023 17:26:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=NgW+5B3NtGj3DecbU3YNpxdJJcdR0UsRQo/yFOYWdvQ=;
 b=Q+dSGLPzcri2KOzu9exP9BXgbg+7ilRAQzQ6nBGQhM3aA/ImoC2RiNJj6HQ3PRSkOIk3
 t6NlywGds90tIMz1zW3SEo+FMxXdzutsAb5Hov073GiO6YGgulK39SIHL1LePJXvs5Yd
 4equ4U1djHR1dE4sfMjbZHxaTwaxlDmavLcyOXLcOvMR4+LW/Wbz2y2/9UuunFw3Ij22
 2g8T2+w9EzNO7xjObMkBkioiIwqj+6WZTtxP2r4myjlOpHfUnoaqllZ2R4ZSz3apF9ai
 RB6DCoS8FiYUC8kLIkpXPac4CKBqTZL0LrXWuRROL3hRbx0ZDg7DrchSDJKeAyDCs+wZ 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rpjjtsb94-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Jul 2023 17:26:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A9E75100050;
        Fri,  7 Jul 2023 17:26:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4CE1522A6CD;
        Fri,  7 Jul 2023 17:26:43 +0200 (CEST)
Received: from [10.201.21.121] (10.201.21.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 7 Jul
 2023 17:26:41 +0200
Message-ID: <49276580-f68e-84b1-dbb6-26cde1a86af0@foss.st.com>
Date:   Fri, 7 Jul 2023 17:26:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 04/10] dt-bindings: treewide: add feature-domains
 description in binding files
Content-Language: en-US
To:     Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "jic23@kernel.org" <jic23@kernel.org>,
        "olivier.moysan@foss.st.com" <olivier.moysan@foss.st.com>,
        "arnaud.pouliquen@foss.st.com" <arnaud.pouliquen@foss.st.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "fabrice.gasnier@foss.st.com" <fabrice.gasnier@foss.st.com>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "hugues.fruchet@foss.st.com" <hugues.fruchet@foss.st.com>,
        "lee@kernel.org" <lee@kernel.org>,
        "will@kernel.org" <will@kernel.org>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "arnd@kernel.org" <arnd@kernel.org>,
        "richardcochran@gmail.com" <richardcochran@gmail.com>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-5-gatien.chevallier@foss.st.com>
 <875y6vzuga.fsf@epam.com>
From:   Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <875y6vzuga.fsf@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_10,2023-07-06_02,2023-05-22_02
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/7/23 16:07, Oleksii Moisieiev wrote:
> 
> Gatien Chevallier <gatien.chevallier@foss.st.com> writes:
> 
>> feature-domains is an optional property that allows a peripheral to
>> refer to one or more feature domain controller(s).
>>
>> Description of this property is added to all peripheral binding files of
>> the peripheral under the STM32 firewall controllers. It allows an accurate
>> representation of the hardware, where various peripherals are connected
>> to this firewall bus. The firewall can then check the peripheral accesses
>> before allowing it to probe.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> ---
>>
>> Disclaimer: Some error with dtbs_check will be observed as I've
>> considered the property to be generic, as Rob asked
>>
>>   Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml  | 4 ++++
>>   Documentation/devicetree/bindings/dma/st,stm32-dma.yaml      | 4 ++++
>>   Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml   | 4 ++++
>>   Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml      | 4 ++++
>>   Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 4 ++++
>>   .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 ++++
>>   Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 4 ++++
>>   .../devicetree/bindings/media/cec/st,stm32-cec.yaml          | 4 ++++
>>   Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml   | 4 ++++
>>   .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml       | 4 ++++
>>   Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml  | 4 ++++
>>   Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml   | 5 +++++
>>   Documentation/devicetree/bindings/mmc/arm,pl18x.yaml         | 4 ++++
>>   Documentation/devicetree/bindings/net/stm32-dwmac.yaml       | 4 ++++
>>   Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml | 4 ++++
>>   .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml      | 4 ++++
>>   Documentation/devicetree/bindings/rng/st,stm32-rng.yaml      | 4 ++++
>>   Documentation/devicetree/bindings/serial/st,stm32-uart.yaml  | 4 ++++
>>   Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml    | 4 ++++
>>   Documentation/devicetree/bindings/sound/st,stm32-sai.yaml    | 4 ++++
>>   .../devicetree/bindings/sound/st,stm32-spdifrx.yaml          | 4 ++++
>>   Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml     | 4 ++++
>>   Documentation/devicetree/bindings/spi/st,stm32-spi.yaml      | 4 ++++
>>   Documentation/devicetree/bindings/usb/dwc2.yaml              | 4 ++++
>>   24 files changed, 97 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
>> index b767ec72a999..daf8dcaef627 100644
>> --- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
>> +++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
>> @@ -50,6 +50,10 @@ properties:
>>     power-domains:
>>       maxItems: 1
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
> 
> I beliewe feature-domains is generic binding. This means that maxItems
> can be implementation dependend. I would rather drop maxItems so the
> following format will be possible:
> 
>            feature-domains = <&etzpc 1>, <&etzpc 2>, <&some_other_domain 1 2 3 4>
>            feature-domain-names = "firewall 1", "firewall 2", "other_domain"
> 

I'd prefer to drop the maxItems as well. I've been told at one point in
the first series to choose a number for this maybe picking a high but
reasonnable number is preferrable.

Based on How to Get Your DT Schema Bindings Accepted in Less than 10 
Iterations pdf published by Krzysztof, I see that examples use
minItems/maxItems. But I can't find if it's mandatory


> Also I beliewe driver will handle feature-domain-names property so it
> will parse feature-domains only related to the firewall.
> 

Yep, in case of multiple feature-domains, it could be nice.

>>   required:
>>     - compatible
>>     - reg
>> diff --git a/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml b/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
>> index 329847ef096a..2236ac95574b 100644
>> --- a/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
>> +++ b/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
>> @@ -82,6 +82,10 @@ properties:
>>       description: if defined, it indicates that the controller
>>         supports memory-to-memory transfer
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>   required:
>>     - compatible
>>     - reg
>> diff --git a/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml b/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
>> index e722fbcd8a5f..47ae890f5bd9 100644
>> --- a/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
>> +++ b/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
>> @@ -28,6 +28,10 @@ properties:
>>     resets:
>>       maxItems: 1
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>   required:
>>     - compatible
>>     - reg
>> diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
>> index 94b75d9f66cd..326a96741f50 100644
>> --- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
>> @@ -99,6 +99,10 @@ properties:
>>   
>>     wakeup-source: true
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>   required:
>>     - compatible
>>     - reg
>> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
>> index 995cbf8cefc6..3eb20d67f0fc 100644
>> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
>> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
>> @@ -93,6 +93,10 @@ properties:
>>     '#size-cells':
>>       const: 0
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>   allOf:
>>     - if:
>>         properties:
>> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
>> index 1970503389aa..bc34ae172417 100644
>> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
>> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
>> @@ -59,6 +59,10 @@ properties:
>>         If not, SPI CLKOUT frequency will not be accurate.
>>       maximum: 20000000
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>   required:
>>     - compatible
>>     - reg
>> diff --git a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
>> index 04045b932bd2..90d35a2a6504 100644
>> --- a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
>> +++ b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
>> @@ -45,6 +45,10 @@ properties:
>>     '#size-cells':
>>       const: 0
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>   additionalProperties: false
>>   
>>   required:
>> diff --git a/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
>> index 2314a9a14650..f88e3c0e6175 100644
>> --- a/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
>> +++ b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
>> @@ -29,6 +29,10 @@ properties:
>>         - const: cec
>>         - const: hdmi-cec
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>   required:
>>     - compatible
>>     - reg
>> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
>> index 6b3e413cedb2..4fa1d14910df 100644
>> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
>> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
>> @@ -36,6 +36,10 @@ properties:
>>     resets:
>>       maxItems: 1
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>     port:
>>       $ref: /schemas/graph.yaml#/$defs/port-base
>>       unevaluatedProperties: false
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
>> index 14f1833d37c9..63b3d012147b 100644
>> --- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
>> +++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
>> @@ -45,6 +45,10 @@ properties:
>>         Reflects the memory layout with four integer values per bank. Format:
>>         <bank-number> 0 <address of the bank> <size>
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>   patternProperties:
>>     "^.*@[0-4],[a-f0-9]+$":
>>       additionalProperties: true
>> diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
>> index 27329c5dc38e..59d770544950 100644
>> --- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
>> @@ -44,6 +44,10 @@ properties:
>>   
>>     wakeup-source: true
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>     pwm:
>>       type: object
>>       additionalProperties: false
>> diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
>> index f84e09a5743b..d5ad097e94ec 100644
>> --- a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
>> @@ -67,6 +67,11 @@ properties:
>>     "#size-cells":
>>       const: 0
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>> +
>>     pwm:
>>       type: object
>>       additionalProperties: false
>> diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
>> index 2459a55ed540..6ebedee65153 100644
>> --- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
>> +++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
>> @@ -79,6 +79,10 @@ properties:
>>             - const: rx
>>             - const: tx
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>     power-domains: true
>>   
>>     resets:
>> diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
>> index fc8c96b08d7d..0e408dc85c13 100644
>> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
>> @@ -93,6 +93,10 @@ properties:
>>         select RCC clock instead of ETH_REF_CLK.
>>       type: boolean
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>   required:
>>     - compatible
>>     - clocks
>> diff --git a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
>> index 24a3dbde223b..b9ac20c8bf05 100644
>> --- a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
>> +++ b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
>> @@ -55,6 +55,10 @@ properties:
>>       description: number of clock cells for ck_usbo_48m consumer
>>       const: 0
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>   # Required child nodes:
>>   
>>   patternProperties:
>> diff --git a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
>> index 05f4ad2c7d3a..02cefe4ef42b 100644
>> --- a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
>> +++ b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
>> @@ -30,6 +30,10 @@ properties:
>>     vdda-supply:
>>       description: phandle to the vdda input analog voltage.
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>   required:
>>     - compatible
>>     - reg
>> diff --git a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
>> index 187b172d0cca..79eb5f5bd252 100644
>> --- a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
>> +++ b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
>> @@ -30,6 +30,10 @@ properties:
>>       type: boolean
>>       description: If set enable the clock detection management
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>   required:
>>     - compatible
>>     - reg
>> diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
>> index 1df8ffe95fc6..893978e7170f 100644
>> --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
>> +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
>> @@ -70,6 +70,10 @@ properties:
>>       enum: [1, 2, 4, 8, 12, 14, 16]
>>       default: 8
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>   allOf:
>>     - $ref: rs485.yaml#
>>     - $ref: serial.yaml#
>> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
>> index b9111d375b93..64c5898e51f8 100644
>> --- a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
>> +++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
>> @@ -65,6 +65,10 @@ properties:
>>       $ref: audio-graph-port.yaml#
>>       unevaluatedProperties: false
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>   required:
>>     - compatible
>>     - "#sound-dai-cells"
>> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
>> index 56d206f97a96..9bc08b7645dc 100644
>> --- a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
>> +++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
>> @@ -48,6 +48,10 @@ properties:
>>     clock-names:
>>       maxItems: 3
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>   required:
>>     - compatible
>>     - reg
>> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
>> index bc48151b9adb..f00e5db9ee3b 100644
>> --- a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
>> +++ b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
>> @@ -50,6 +50,10 @@ properties:
>>     resets:
>>       maxItems: 1
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>   required:
>>     - compatible
>>     - "#sound-dai-cells"
>> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
>> index 8bba965a9ae6..2ac136802467 100644
>> --- a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
>> @@ -46,6 +46,10 @@ properties:
>>         - const: tx
>>         - const: rx
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>   required:
>>     - compatible
>>     - reg
>> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
>> index 9ca1a843c820..725c26daabe4 100644
>> --- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
>> @@ -59,6 +59,10 @@ properties:
>>         - const: rx
>>         - const: tx
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>   patternProperties:
>>     "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-f]+$":
>>       type: object
>> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
>> index d3506090f8b1..c372caf154fc 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
>> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
>> @@ -171,6 +171,10 @@ properties:
>>   
>>     tpl-support: true
>>   
>> +  feature-domains:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>   dependencies:
>>     port: [ usb-role-switch ]
>>     role-switch-default-mode: [ usb-role-switch ]
> 
> 
