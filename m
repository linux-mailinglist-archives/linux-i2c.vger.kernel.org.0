Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF12863BA04
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Nov 2022 07:56:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbiK2G4X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Nov 2022 01:56:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiK2G4W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Nov 2022 01:56:22 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EC57651324;
        Mon, 28 Nov 2022 22:56:19 -0800 (PST)
Received: from loongson.cn (unknown [117.133.84.114])
        by gateway (Coremail) with SMTP id _____8AxSukSrYVjzvYBAA--.1511S3;
        Tue, 29 Nov 2022 14:56:18 +0800 (CST)
Received: from [192.168.1.7] (unknown [117.133.84.114])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxmFcPrYVj4AweAA--.58004S3;
        Tue, 29 Nov 2022 14:56:15 +0800 (CST)
Message-ID: <2e10ae64-3c91-ccf8-a970-eb6e3371b948@loongson.cn>
Date:   Tue, 29 Nov 2022 14:56:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: add loongson i2c
From:   Yinbo Zhu <zhuyinbo@loongson.cn>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jan Dabros <jsd@semihalf.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
References: <20221128130025.23184-1-zhuyinbo@loongson.cn>
 <20221128130025.23184-2-zhuyinbo@loongson.cn>
 <9cc53272-6828-91b5-30a9-384168a9f94f@linaro.org>
 <4920a652-cc08-6602-7886-80b86a619d0a@loongson.cn>
In-Reply-To: <4920a652-cc08-6602-7886-80b86a619d0a@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxmFcPrYVj4AweAA--.58004S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Zw4xKrWxZF48Xw4DWrykZrb_yoW8tw43pF
        1xCFs8CFyUtF1xWrZrKFyUGry5Zr18AwnrXr47XF1UCryDKw1aqr12gr1q934DZr4xWFy7
        XrySgw429ws8ArJanT9S1TB71UUUUb7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bqxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
        kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28E
        F7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE
        52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I
        80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCj
        c4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI
        0_Jw0_GFyl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWrMxC20s026xCaFVCj
        c4AY6r1j6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
        Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY
        6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
        AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv
        6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU0TrW5UUUUU==
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


在 2022/11/29 7:51, Yinbo Zhu 写道:
>
> 在 2022/11/28 22:11, Krzysztof Kozlowski 写道:
>> On 28/11/2022 14:00, Yinbo Zhu wrote:
>>> Add the Loongson platform i2c binding with DT schema format using
>>> json-schema.
>>>
>>> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> ---
>>> Change in v2:
>>>         1. Removed the "#address-cells" and "#size-cells" in requied.
>>>         2. Add the reviewed-by information.
>>>
>>>   .../bindings/i2c/loongson,ls-i2c.yaml         | 47 
>>> +++++++++++++++++++
>>>   MAINTAINERS                                   |  1 +
>>>   2 files changed, 48 insertions(+)
>>>   create mode 100644 
>>> Documentation/devicetree/bindings/i2c/loongson,ls-i2c.yaml
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/i2c/loongson,ls-i2c.yaml 
>>> b/Documentation/devicetree/bindings/i2c/loongson,ls-i2c.yaml
>>> new file mode 100644
>>> index 000000000000..0e4aee9146f3
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/i2c/loongson,ls-i2c.yaml
>>> @@ -0,0 +1,47 @@
>>> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/i2c/loongson,ls-i2c.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Loongson I2C controller
>>> +
>>> +maintainers:
>>> +  - Yinbo Zhu <zhuyinbo@loongson.cn>
>>> +
>>> +allOf:
>>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - loongson,ls2k-i2c
>>> +      - loongson,ls7a-i2c
>> Why do we have the same bindings twice, with different people and file
>> names?
>>
>> https://lore.kernel.org/all/57339e73b6c0bfe446e19a7f55a48b7ca640b9ec.1669359515.git.zhoubinbin@loongson.cn/ 
>>
>>
>> Best regards,
>> Krzysztof
>
> Inthe previous internal discussion, I was assigned to go to upstream 
> for i2c, but I
>
> don't know why other people are also working on the patch. I will go to
>
> internal communication.

Hi

please follow zhoubinbin's loongson i2c series patch.

I will not cover it.


Thanks,

Yinbo.


