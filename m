Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1486B5B6AEC
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 11:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbiIMJkO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 05:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231417AbiIMJkJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 05:40:09 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC1AE002;
        Tue, 13 Sep 2022 02:40:07 -0700 (PDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MRddK6QTJzmVCX;
        Tue, 13 Sep 2022 17:36:21 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 17:40:05 +0800
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH next v4 2/2] dt-bindings: i2c: add entry for
 hisilicon,hisi-i2c
To:     chenweilong <chenweilong@huawei.com>, <yangyicong@hisilicon.com>,
        <xuwei5@huawei.com>, <wsa@kernel.org>, <robh+dt@kernel.org>
References: <20220909074842.281232-1-chenweilong@huawei.com>
 <20220909074842.281232-2-chenweilong@huawei.com>
 <58bd3483-3830-bb64-d7d6-5c0f1126de73@huawei.com>
 <c644d852-6d33-9de0-c99b-9cdffa081b99@huawei.com>
From:   Yicong Yang <yangyicong@huawei.com>
Message-ID: <3f830fcb-90b6-3359-583d-ed24975c72ca@huawei.com>
Date:   Tue, 13 Sep 2022 17:40:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <c644d852-6d33-9de0-c99b-9cdffa081b99@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2022/9/13 17:08, chenweilong wrote:
> On 2022/9/13 15:59, Yicong Yang wrote:
>> On 2022/9/9 15:48, Weilong Chen wrote:
>>> Add the new compatible for HiSilicon common i2c.
>>>
>>> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
>>> ---
>>>  .../bindings/i2c/hisilicon,hisi-i2c.yaml      | 67 +++++++++++++++++++
>>>  1 file changed, 67 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml b/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
>>> new file mode 100644
>>> index 000000000000..f1cb6a4c70d1
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
>>> @@ -0,0 +1,67 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: "http://devicetree.org/schemas/i2c/hisilicon,hisi-i2c.yaml#"
>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>>> +
>>> +title: HiSilicon common IIC controller Device Tree Bindings
>>> +
>>> +maintainers:
>>> +  - yangyicong@huawei.com
>>> +
>>> +allOf:
>>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: hisilicon,hisi-i2c
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  clk_rate:
>>> +    default: 0xEE6B280
>>> +
>>> +  clock-frequency:
>>> +    default: 400000
>>> +
>>> +  i2c-sda-falling-time-ns:
>>> +    default: 343
>>> +
>>> +  i2c-scl-falling-time-ns:
>>> +    default: 203
>>> +
>>> +  i2c-sda-hold-time-ns:
>>> +    default: 0x33E
>>> +
>>> +  i2c-scl-rising-time-ns:
>>> +    default: 365
>>> +
>>> +  i2c-digital-filter-width-ns:
>>> +    default: 0
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +
>>> +unevaluatedProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    i2c1: i2c@5038B0000{
>>> +      compatible = "hisilicon,hisi-i2c";
>>> +      reg = <0x38B0000 0x10000>;
>>> +      interrupts = <0x0 120 0x4>;
>>> +      i2c-sda-falling-time-ns = <56>;
>>> +      i2c-scl-falling-time-ns = <56>;
>>> +      i2c-sda-hold-time-ns = <56>;
>>> +      i2c-scl-rising-time-ns = <56>;
>> The values used here are different from above. Are they used on different
>> products?
> Yes, it's a specific config for new product.
>>> +      i2c-digital-filter;
>> Should we discard the empty properties or is it necessary to have it?
>>
>> Others looks good to me, but the device tree experts may have some comments.
>>
>> This binding file should also be listed in the MAINTAINERS file.
>>
>> Thanks.
> 
> No, i2c-digital-filter is needed to fix the error:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.example.dtb: i2c@5038B0000: 'i2c-digital-filter' is a dependency of 'i2c-digital-filter-width-ns'
> 
> And, I'll update the MAINTAINERS file.
> 

ok. Thanks for the explanation.

> Thanks.
> 
>>> +      i2c-digital-filter-width-ns = <0x0>;
>>> +      clk_rate = <0x0 0xEE6B280>;
>>> +      clock-frequency = <400000>;
>>> +    };
>>>
>> .
> 
> 
> .
> 
