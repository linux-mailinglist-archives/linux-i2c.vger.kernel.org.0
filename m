Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96FD1761AF9
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 16:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbjGYOIt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 10:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232298AbjGYOIs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 10:08:48 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF82D1FD7;
        Tue, 25 Jul 2023 07:08:46 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36PDXDMu010531;
        Tue, 25 Jul 2023 16:08:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=aKox1fifr/MD7CscnSNaYClzgh1MKEowYV/1CFbHY8Q=;
 b=4sFWeFLREgJioc9H+rODp72hj3AVdLAeXn//m7QoqBPjLcHM3h6ErPmn4WA399Y/aITY
 Es+zEl+7c1OuNWP/mY/sYFUWBgIrS0ZnwoA5voqLfap1MOnNtJ/zdQsJH70zP6mKb4It
 up4nrSg6m/QvGFbwtP1STGuEVZLJ00BGoK2EjvjlEjCcZJFyhQQwWBxUeAAPCbeV4q3h
 6aBJcowFMNfbDdrNiVfgGpJZ6jk6/MU4C0knjVH4EQXo3oCJXoEvofraY3JZmoYetI5I
 ZcYWT0tL9hA+ODD+fHxyfM0nlDUmDa3FOMio5gfyLhC4I0CiM1Tbi4NIEhA6R3rIQpjx iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s2bkbhv00-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Jul 2023 16:08:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B9F8E100048;
        Tue, 25 Jul 2023 16:07:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5ACB4241EF6;
        Tue, 25 Jul 2023 16:07:56 +0200 (CEST)
Received: from [10.201.21.121] (10.201.21.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 25 Jul
 2023 16:07:54 +0200
Message-ID: <1faa5511-a341-9c17-5e2a-974f8139d1d6@foss.st.com>
Date:   Tue, 25 Jul 2023 16:07:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 07/10] arm64: dts: st: add RIFSC as a domain controller
 for STM32MP25x boards
Content-Language: en-US
From:   Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
To:     Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <vkoul@kernel.org>, <jic23@kernel.org>,
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
 <20230705172759.1610753-8-gatien.chevallier@foss.st.com>
 <61d93738-4ffd-411d-d32c-912c14eea56d@foss.st.com>
 <997780a9-1cbc-46a2-2743-7fd493682278@foss.st.com>
In-Reply-To: <997780a9-1cbc-46a2-2743-7fd493682278@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_08,2023-07-25_01,2023-05-22_02
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alex,

On 7/6/23 11:30, Gatien CHEVALLIER wrote:
> Hi Alex,
> 
> On 7/6/23 11:25, Alexandre TORGUE wrote:
>> Hi Gatien
>>
>> On 7/5/23 19:27, Gatien Chevallier wrote:
>>> RIFSC is a firewall controller. Change its compatible so that is matches
>>> the documentation and reference RIFSC as a feature-domain-controller.
>>>
>>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>>> ---
>>>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi 
>>> b/arch/arm64/boot/dts/st/stm32mp251.dtsi
>>> index 5268a4321841..62101084cab8 100644
>>> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
>>> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
>>> @@ -106,17 +106,20 @@ soc@0 {
>>>           ranges = <0x0 0x0 0x0 0x80000000>;
>>>           rifsc: rifsc-bus@42080000 {
>>> -            compatible = "simple-bus";
>>> +            compatible = "st,stm32mp25-rifsc";
>>
>> You could keep "simple-bus" compatible (in second position). In case 
>> of the RIFSC is not probed, the platform will be able to boot. If you 
>> agree you can use the same for ETZPC.
>>
>> Cheers
>> Alex
> 
> Sure, good point.
> 
> I'll change that in V2
> 
> Best regards,
> Gatien

Actually, it would be a bad idea to keep "simple-bus" as a compatible.

Practical example:
1) Firewall controller forbids a device probe by marking the device's
node as populated (OF_POPULATED flag).
2) The simple-bus, which is simple, populates all the devices
from the device tree data, overriding what the firewall bus has done.
3)=>Forbidden device's driver will be probed.

I think it's best to keep one compatible. If someone wants these drivers
as external modules, then it'll be best to handle this differently.
I'll resubmit with a single compatible for V2, please do not
hesitate to comment on the V2 if you're not okay with this.

Best regards,
Gatien

>>
>>>               reg = <0x42080000 0x1000>;
>>>               #address-cells = <1>;
>>>               #size-cells = <1>;
>>>               ranges;
>>> +            feature-domain-controller;
>>> +            #feature-domain-cells = <1>;
>>>               usart2: serial@400e0000 {
>>>                   compatible = "st,stm32h7-uart";
>>>                   reg = <0x400e0000 0x400>;
>>>                   interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
>>>                   clocks = <&ck_flexgen_08>;
>>> +                feature-domains = <&rifsc 32>;
>>>                   status = "disabled";
>>>               };
>>>           };
>>
