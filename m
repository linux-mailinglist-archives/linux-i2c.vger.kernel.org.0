Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC23D5B800D
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Sep 2022 06:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiINENh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Sep 2022 00:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiINENb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Sep 2022 00:13:31 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81399132;
        Tue, 13 Sep 2022 21:13:28 -0700 (PDT)
Received: from canpemm500004.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MS6Jz2ZmkzNm7C;
        Wed, 14 Sep 2022 12:08:51 +0800 (CST)
Received: from [10.174.179.106] (10.174.179.106) by
 canpemm500004.china.huawei.com (7.192.104.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 14 Sep 2022 12:13:26 +0800
Subject: Re: [PATCH next v4 2/2] dt-bindings: i2c: add entry for
 hisilicon,hisi-i2c
To:     Rob Herring <robh@kernel.org>
CC:     <yangyicong@hisilicon.com>, <xuwei5@huawei.com>, <wsa@kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20220909074842.281232-1-chenweilong@huawei.com>
 <20220909074842.281232-2-chenweilong@huawei.com>
 <20220913122203.GA3413501-robh@kernel.org>
From:   chenweilong <chenweilong@huawei.com>
Message-ID: <a4f1011c-0034-9acf-e0ce-aa9e900823f9@huawei.com>
Date:   Wed, 14 Sep 2022 12:13:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20220913122203.GA3413501-robh@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.179.106]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500004.china.huawei.com (7.192.104.92)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks for your review. I'll update the patch.
On 2022/9/13 20:22, Rob Herring wrote:
> On Fri, Sep 09, 2022 at 03:48:42PM +0800, Weilong Chen wrote:
>> Add the new compatible for HiSilicon common i2c.
>>
>> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
>> ---
>>  .../bindings/i2c/hisilicon,hisi-i2c.yaml      | 67 +++++++++++++++++++
>>  1 file changed, 67 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml b/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
>> new file mode 100644
>> index 000000000000..f1cb6a4c70d1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
>> @@ -0,0 +1,67 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/i2c/hisilicon,hisi-i2c.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: HiSilicon common IIC controller Device Tree Bindings
>> +
>> +maintainers:
>> +  - yangyicong@huawei.com
>> +
>> +allOf:
>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: hisilicon,hisi-i2c
> You need SoC specific compatibles.
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clk_rate:
>> +    default: 0xEE6B280
> What is this property for? Use the clock binding.
>
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
>> +    default: 0x33E
> The rest are in decimal. Be consistent.
>
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
>> +    i2c1: i2c@5038B0000{
> Space needed              ^
>
> Use lowercase hex.
>
> Drop unused labels.
>   
>> +      compatible = "hisilicon,hisi-i2c";
>> +      reg = <0x38B0000 0x10000>;
>> +      interrupts = <0x0 120 0x4>;
>> +      i2c-sda-falling-time-ns = <56>;
>> +      i2c-scl-falling-time-ns = <56>;
>> +      i2c-sda-hold-time-ns = <56>;
>> +      i2c-scl-rising-time-ns = <56>;
>> +      i2c-digital-filter;
>> +      i2c-digital-filter-width-ns = <0x0>;
>> +      clk_rate = <0x0 0xEE6B280>;
>> +      clock-frequency = <400000>;
>> +    };
>> -- 
>> 2.31.GIT
>>
>>
> .


