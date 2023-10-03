Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 741DC7B62BA
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Oct 2023 09:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbjJCHqh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Oct 2023 03:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbjJCHqg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Oct 2023 03:46:36 -0400
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7289F90;
        Tue,  3 Oct 2023 00:46:32 -0700 (PDT)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39353va3021962;
        Tue, 3 Oct 2023 09:45:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        message-id:date:mime-version:subject:to:cc:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=
        selector1; bh=x3zvFTP/cLetsfZPkK+gIr/Q1D7D0ztqpwYaPZYqEI8=; b=uO
        k9aJK7R1840fb0b3pBnvZI/Q+sO/3kzxpReIyl8a2WtjvEs45JT6XTDrlHMrsGPn
        Io4kdlT3zs4GfXE3bNHXaM0035fkGjMAqp2uMreLcEPQiYepILPOa+cc7NCAPguM
        XG/+aAp+4tKUhiooqE+RCJHYp2y7MjmaJGdf1IMZoAa94a14CtlOeJUBnEw8dsgw
        u6oWujro9NzuU9qeHL/ppQLDYgxAEDr6y873+ikT+KJq7Fg4e8TZp7c+qkB+QmPp
        mFyCfe1vyeHFUsZQmgUNkpuoVew6YGy6z2Wppfm2ptuSn7pxaIHLo+x4mVReKTrQ
        5oexx004P/dDF0l4T6kQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3texmj0c3h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 03 Oct 2023 09:45:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 787F8100057;
        Tue,  3 Oct 2023 09:45:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1D361229A9D;
        Tue,  3 Oct 2023 09:45:54 +0200 (CEST)
Received: from [10.201.20.32] (10.201.20.32) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 3 Oct
 2023 09:45:52 +0200
Message-ID: <1a48fce4-0faf-5e26-c57a-064307573c69@foss.st.com>
Date:   Tue, 3 Oct 2023 09:45:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 01/11] dt-bindings: document generic access controller
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
        Frank Rowand <frowand.list@gmail.com>, <peng.fan@oss.nxp.com>,
        <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-media@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-p.hy@lists.infradead.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
References: <20230929142852.578394-1-gatien.chevallier@foss.st.com>
 <20230929142852.578394-2-gatien.chevallier@foss.st.com>
 <20231002173019.GA2037244-robh@kernel.org>
Content-Language: en-US
From:   Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20231002173019.GA2037244-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-03_04,2023-10-02_01,2023-05-22_02
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rob,

On 10/2/23 19:30, Rob Herring wrote:
> On Fri, Sep 29, 2023 at 04:28:42PM +0200, Gatien Chevallier wrote:
>> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
>>
>> Introducing of the generic access controller bindings for the
>> access controller provider and consumer devices. Those bindings are
>> intended to allow a better handling of accesses to resources in a
>> hardware architecture supporting several compartments.
>>
>> This patch is based on [1]. It is integrated in this patchset as it
>> provides a use-case for it.
>>
>> Diffs with [1]:
>> 	- Rename feature-domain* properties to access-control* to narrow
>> 	  down the scope of the binding
>> 	- YAML errors and typos corrected.
>> 	- Example updated
>> 	- Some rephrasing in the binding description
>>
>> [1]: https://lore.kernel.org/lkml/0c0a82bb-18ae-d057-562b
>>
>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>>
>> ---
>> Changes in V5:
>> 	- Diffs with [1]
>> 	- Discarded the [IGNORE] tag as the patch is now part of the
>> 	  patchset
>>
>>   .../access-controllers/access-controller.yaml | 90 +++++++++++++++++++
>>   1 file changed, 90 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/access-controllers/access-controller.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/access-controllers/access-controller.yaml b/Documentation/devicetree/bindings/access-controllers/access-controller.yaml
>> new file mode 100644
>> index 000000000000..9d305fccc333
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/access-controllers/access-controller.yaml
>> @@ -0,0 +1,90 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/access-controllers/access-controller.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Generic Domain Access Controller
>> +
>> +maintainers:
>> +  - Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>> +
>> +description: |+
>> +  Common access controllers properties
>> +
>> +  Access controllers are in charge of stating which of the hardware blocks under
>> +  their responsibility (their domain) can be accesssed by which compartment. A
>> +  compartment can be a cluster of CPUs (or coprocessors), a range of addresses
>> +  or a group of hardware blocks. An access controller's domain is the set of
>> +  resources covered by the access controller.
>> +
>> +  This device tree bindings can be used to bind devices to their access
>> +  controller provided by access-controller property. In this case, the device is
>> +  a consumer and the access controller is the provider.
>> +
>> +  An access controller can be represented by any node in the device tree and
>> +  can provide one or more configuration parameters, needed to control parameters
>> +  of the consumer device. A consumer node can refer to the provider by phandle
>> +  and a set of phandle arguments, specified by '#access-controller-cells'
>> +  property in the access controller node.
>> +
>> +  Access controllers are typically used to set/read the permissions of a
>> +  hardware block and grant access to it. Any of which depends on the access
>> +  controller. The capabilities of each access controller are defined by the
>> +  binding of the access controller device.
>> +
>> +  Each node can be a consumer for the several access controllers.
>> +
>> +# always select the core schema
>> +select: true
>> +
>> +properties:
>> +  "#access-controller-cells":
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> Drop. "#.*-cells" already defines the type.
> 

Ok, I will drop it for V6

>> +    description:
>> +      Number of cells in a access-controller specifier;
>> +      Can be any value as specified by device tree binding documentation
>> +      of a particular provider.
>> +
>> +  access-control-provider:
>> +    description:
>> +      Indicates that the node is an access controller.
> 
> Drop. The presence of "#access-controller-cells" is enough to do that.
> 

Ok, I wasn't sure. I'll will drop it for V6

>> +
>> +  access-controller-names:
>> +    $ref: /schemas/types.yaml#/definitions/string-array
>> +    description:
>> +      A list of access-controller names, sorted in the same order as
>> +      access-controller entries. Consumer drivers will use
>> +      access-controller-names to match with existing access-controller entries.
>> +
>> +  access-controller:
> 
> For consistency with other provider bindings: access-controllers
> 

Ack

>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description:
>> +      A list of access controller specifiers, as defined by the
>> +      bindings of the access-controller provider.
>> +
>> +additionalProperties: true
>> +
>> +examples:
>> +  - |
>> +    uart_controller: access-controller@50000 {
>> +        reg = <0x50000 0x10>;
>> +        access-control-provider;
>> +        #access-controller-cells = <2>;
>> +    };
>> +
>> +    bus_controller: bus@60000 {
>> +        reg = <0x60000 0x10000>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges;
>> +        access-control-provider;
>> +        #access-controller-cells = <3>;
>> +
>> +        uart4: serial@60100 {
>> +            reg = <0x60100 0x400>;
>> +            access-controller = <&uart_controller 1 2>,
>> +                                <&bus_controller 1 3 5>;
>> +            access-controller-names = "controller", "bus-controller";
> 
> Not great names. It should indicate what access is being controlled
> locally. Perhaps "reg" for register access, "dma" or "bus" for bus
> master access. (Not sure what your uart_controller is controlling access
> to.)
> 
> Rob

Yes, I agree it's poor naming. I'll come up with something more
adequate. Thank you for the input.

Best regards,
Gatien
