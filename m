Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6DEC74CFCC
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jul 2023 10:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232139AbjGJIXP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jul 2023 04:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232861AbjGJIXF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jul 2023 04:23:05 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1765291;
        Mon, 10 Jul 2023 01:23:03 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36A8BaDe027592;
        Mon, 10 Jul 2023 10:22:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=GE6zkKpI6t9uY6L4iGZvQGH0DZZlhk/alBlWR2MxhUs=;
 b=G+4K12NnVLRH60fLRSLye1p6QMQOse6GHGYvmcXkLdfiDUaeFSQxdVHB8IuIaLl3hTIj
 cNhrU2X+aizJuhnIEVZGZ3AtqalmKwy1lusGnOvoDtQS3WL/XPW52RrEXjNw6EgYgYRX
 7ykkxWK3XJLDKaZW3ywfdgnSJd28+A7BuIgG2xvGBzKbVSK1AorcTFJiX/vb2qrSUU7K
 KbGigglmesbBjV7AwerCwSCze7W6exOddeiEWGNQenh3iQE5kIdzdont68RbEOAeqajB
 dsS/sLb1eB5zRqc8iDpTZ5mswkIA4Czb8vK9LHM+wRn2Vrpy2YeSvgiltQE7LfmEfE58 LQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rre8vr37g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jul 2023 10:22:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C00B010005A;
        Mon, 10 Jul 2023 10:22:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 58FB521BF6A;
        Mon, 10 Jul 2023 10:22:19 +0200 (CEST)
Received: from [10.201.21.121] (10.201.21.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 10 Jul
 2023 10:22:18 +0200
Message-ID: <fb72b4e4-d5c6-d9be-269d-29aff996001c@foss.st.com>
Date:   Mon, 10 Jul 2023 10:22:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 04/10] dt-bindings: treewide: add feature-domains
 description in binding files
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
CC:     <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
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
 <20230705172759.1610753-5-gatien.chevallier@foss.st.com>
 <20230706145108.GA3858320-robh@kernel.org>
 <0aaace47-1bb4-82c5-57a5-6f5d27eb4d45@foss.st.com>
 <20230707152056.GA317056-robh@kernel.org>
From:   Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20230707152056.GA317056-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_05,2023-07-06_02,2023-05-22_02
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 7/7/23 17:20, Rob Herring wrote:
> On Fri, Jul 07, 2023 at 02:28:28PM +0200, Gatien CHEVALLIER wrote:
>> Hello Rob,
>>
>> On 7/6/23 16:51, Rob Herring wrote:
>>> On Wed, Jul 05, 2023 at 07:27:53PM +0200, Gatien Chevallier wrote:
>>>> feature-domains is an optional property that allows a peripheral to
>>>> refer to one or more feature domain controller(s).
>>>>
>>>> Description of this property is added to all peripheral binding files of
>>>> the peripheral under the STM32 firewall controllers. It allows an accurate
>>>> representation of the hardware, where various peripherals are connected
>>>> to this firewall bus. The firewall can then check the peripheral accesses
>>>> before allowing it to probe.
>>>>
>>>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>>>> ---
>>>>
>>>> Disclaimer: Some error with dtbs_check will be observed as I've
>>>> considered the property to be generic, as Rob asked
>>>>
>>>>    Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml  | 4 ++++
>>>>    Documentation/devicetree/bindings/dma/st,stm32-dma.yaml      | 4 ++++
>>>>    Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml   | 4 ++++
>>>>    Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml      | 4 ++++
>>>>    Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 4 ++++
>>>>    .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 ++++
>>>>    Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 4 ++++
>>>>    .../devicetree/bindings/media/cec/st,stm32-cec.yaml          | 4 ++++
>>>>    Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml   | 4 ++++
>>>>    .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml       | 4 ++++
>>>>    Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml  | 4 ++++
>>>>    Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml   | 5 +++++
>>>>    Documentation/devicetree/bindings/mmc/arm,pl18x.yaml         | 4 ++++
>>>>    Documentation/devicetree/bindings/net/stm32-dwmac.yaml       | 4 ++++
>>>>    Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml | 4 ++++
>>>>    .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml      | 4 ++++
>>>>    Documentation/devicetree/bindings/rng/st,stm32-rng.yaml      | 4 ++++
>>>>    Documentation/devicetree/bindings/serial/st,stm32-uart.yaml  | 4 ++++
>>>>    Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml    | 4 ++++
>>>>    Documentation/devicetree/bindings/sound/st,stm32-sai.yaml    | 4 ++++
>>>>    .../devicetree/bindings/sound/st,stm32-spdifrx.yaml          | 4 ++++
>>>>    Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml     | 4 ++++
>>>>    Documentation/devicetree/bindings/spi/st,stm32-spi.yaml      | 4 ++++
>>>>    Documentation/devicetree/bindings/usb/dwc2.yaml              | 4 ++++
>>>>    24 files changed, 97 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
>>>> index b767ec72a999..daf8dcaef627 100644
>>>> --- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
>>>> +++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
>>>> @@ -50,6 +50,10 @@ properties:
>>>>      power-domains:
>>>>        maxItems: 1
>>>> +  feature-domains:
>>>> +    minItems: 1
>>>> +    maxItems: 3
>>>
>>> What are the 3 entries?
>>>
>>> Rob
>>
>> I thought I was benefiting from the description of the pattern-property in
>> the RIFSC YAML file. But yes anyway, it seems like it needs some description
>> here as the dependency does not appear in this file.
> 
> Humm, that should limit the maximum entries to 2, so 3 would never work
> (if RIFSC is the parent).
> 
>> I picked 3 as a maxItems for our ST needs, I'll give it some more thought
>> when coming back with something clearer.
> 
> I'd expect you have 1 entry for register bus and 1 entry for DMA bus if
> there is one. It's block specific for how many entries, so the RIFSC
> schema should not be setting that. You could possibly say that
> 'feature-domains' is required for all the child nodes though.

Ok, I will change to not specifying the number of entries in the
RIFSC YAML file for V2.

> 
> Rob
Some hardware blocks may have a firewall ID for their device part and
another ID for their master part as well. In the end, the number of
entries could very well vary between different platforms. And the YAML
files are common to these platforms.

This property could be used for "extra" arguments as well, that are not
firewall IDs.

What do you suggest between picking a high maxItems value that would
(hopefully) cover all cases and not specifying maxItems at all? Or maybe
another property dedicated to such arguments?

Best regards,
Gatien
