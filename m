Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F35A63B626
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Nov 2022 00:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234812AbiK1XwB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Nov 2022 18:52:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234805AbiK1Xv7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Nov 2022 18:51:59 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 16EE431F97;
        Mon, 28 Nov 2022 15:51:57 -0800 (PST)
Received: from loongson.cn (unknown [117.133.84.114])
        by gateway (Coremail) with SMTP id _____8DxM_CcSYVj+tkBAA--.4421S3;
        Tue, 29 Nov 2022 07:51:56 +0800 (CST)
Received: from [192.168.1.7] (unknown [117.133.84.114])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxb+KZSYVj8sodAA--.10214S3;
        Tue, 29 Nov 2022 07:51:53 +0800 (CST)
Message-ID: <4920a652-cc08-6602-7886-80b86a619d0a@loongson.cn>
Date:   Tue, 29 Nov 2022 07:51:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: add loongson i2c
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
From:   Yinbo Zhu <zhuyinbo@loongson.cn>
In-Reply-To: <9cc53272-6828-91b5-30a9-384168a9f94f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxb+KZSYVj8sodAA--.10214S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7AFWDKr4fKw4UZr18Kw43trb_yoW8CFyUp3
        W7CFsIyFW0qF12g393Wa48Cr15Zrn7A3W7Wr42gw1UCas8u3Z8XFWakrn8ua95ur1rWFW7
        XFWIga1j9a1kAaDanT9S1TB71UUUUbDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bDAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
        kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28E
        F7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAaw2AFwI0_Jw0_GFyle2I262IYc4CY
        6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrV
        C2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE
        7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14
        v26r1q6r43MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_WwCFx2IqxVCFs4IE
        7xkEbVWUJVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I
        0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAI
        cVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcV
        CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIE
        c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jsWrXUUUUU=
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


在 2022/11/28 22:11, Krzysztof Kozlowski 写道:
> On 28/11/2022 14:00, Yinbo Zhu wrote:
>> Add the Loongson platform i2c binding with DT schema format using
>> json-schema.
>>
>> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>> Change in v2:
>> 		1. Removed the "#address-cells" and "#size-cells" in requied.
>> 		2. Add the reviewed-by information.
>>
>>   .../bindings/i2c/loongson,ls-i2c.yaml         | 47 +++++++++++++++++++
>>   MAINTAINERS                                   |  1 +
>>   2 files changed, 48 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/i2c/loongson,ls-i2c.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/loongson,ls-i2c.yaml b/Documentation/devicetree/bindings/i2c/loongson,ls-i2c.yaml
>> new file mode 100644
>> index 000000000000..0e4aee9146f3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/loongson,ls-i2c.yaml
>> @@ -0,0 +1,47 @@
>> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/i2c/loongson,ls-i2c.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Loongson I2C controller
>> +
>> +maintainers:
>> +  - Yinbo Zhu <zhuyinbo@loongson.cn>
>> +
>> +allOf:
>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - loongson,ls2k-i2c
>> +      - loongson,ls7a-i2c
> Why do we have the same bindings twice, with different people and file
> names?
>
> https://lore.kernel.org/all/57339e73b6c0bfe446e19a7f55a48b7ca640b9ec.1669359515.git.zhoubinbin@loongson.cn/
>
> Best regards,
> Krzysztof

Inthe previous internal discussion, I was assigned to go to upstream for 
i2c, but I

don't know why other people are also working on the patch. I will go to

internal communication.

