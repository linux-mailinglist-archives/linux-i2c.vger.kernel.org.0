Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08B1261229C
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Oct 2022 13:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiJ2Lx3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Oct 2022 07:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiJ2Lx2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 29 Oct 2022 07:53:28 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B693B6C138;
        Sat, 29 Oct 2022 04:53:27 -0700 (PDT)
Received: from canpemm500004.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MzyNX6TcgzmVXh;
        Sat, 29 Oct 2022 19:48:28 +0800 (CST)
Received: from [10.174.179.106] (10.174.179.106) by
 canpemm500004.china.huawei.com (7.192.104.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 29 Oct 2022 19:53:25 +0800
Subject: Re: [PATCH next v7 2/2] dt-bindings: i2c: add entry for
 hisilicon,i2c-ascend910
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <yangyicong@hisilicon.com>, <xuwei5@huawei.com>, <wsa@kernel.org>,
        <robh+dt@kernel.org>, <robh@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20221021035638.203929-1-chenweilong@huawei.com>
 <20221021035638.203929-2-chenweilong@huawei.com>
 <491837d1-4e81-496c-8442-7c1cae670907@linaro.org>
From:   chenweilong <chenweilong@huawei.com>
Message-ID: <4b6256e6-6f06-5d6e-6cc3-d3f3649f0ac6@huawei.com>
Date:   Sat, 29 Oct 2022 19:53:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <491837d1-4e81-496c-8442-7c1cae670907@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.179.106]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500004.china.huawei.com (7.192.104.92)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2022/10/29 7:45, Krzysztof Kozlowski wrote:
> On 20/10/2022 23:56, Weilong Chen wrote:
>> Add the new compatible for HiSilicon i2c.
>>
>> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
>> ---
>> Change since v6:
>> - Rename to hisilicon,i2c-ascend910.yaml
>> - Change all IIC to I2C
>> - Add maintainer name
>> Link: https://lore.kernel.org/lkml/7520818b-de40-7f2a-1b03-b1dcd29a2023@huawei.com/T/#ma89d78cef45e7ac6f2c6251ed958e8658e5c1eb5
>>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC.  It might happen, that command when run on an older
> kernel, gives you outdated entries.  Therefore please be sure you base
> your patches on recent Linux kernel.

Thanks for review, I'll fix this.

>
>
>>  .../bindings/i2c/hisilicon,i2c-ascend910.yaml | 70 +++++++++++++++++++
>>  MAINTAINERS                                   |  1 +
>>  2 files changed, 71 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,i2c-ascend910.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/hisilicon,i2c-ascend910.yaml b/Documentation/devicetree/bindings/i2c/hisilicon,i2c-ascend910.yaml
>> new file mode 100644
>> index 000000000000..f4f532d69670
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/hisilicon,i2c-ascend910.yaml
>> @@ -0,0 +1,70 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/i2c/hisilicon,i2c-xxx.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> Drop quotes
>
>> +
>> +title: HiSilicon common I2C controller Device Tree Bindings
> Drop "Device Tree bindings"
>
>> +
>> +maintainers:
>> +  - Yicong Yang <yangyicong@hisilicon.com>
>> +
>> +allOf:
>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: hisilicon,i2c-ascend910
>> +    description:
>> +      The HiSilicon common I2C controller can be used for many different
>> +      types of SoC such as Huawei Ascend AI series chips.
> Description goes to top level description.
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-frequency:
>> +    default: 400000
>> +
>> +  i2c-sda-falling-time-ns:
>> +    default: 343
>> +
>> +  i2c-scl-falling-time-ns:
>> +    default: 203
>> +
>> +  i2c-sda-hold-time-ns:
>> +    default: 830
>> +
>> +  i2c-scl-rising-time-ns:
>> +    default: 365
>> +
>> +  i2c-digital-filter-width-ns:
>> +    default: 0
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c@5038b0000 {
>> +      compatible = "hisilicon,i2c-ascend910";
>> +      reg = <0x38b0000 0x10000>;
>> +      interrupts = <0x0 120 0x4>;
> Use defines for constants.
>
> Best regards,
> Krzysztof
>
> .


