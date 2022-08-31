Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A24C5A7AA5
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Aug 2022 11:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbiHaJx5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Aug 2022 05:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbiHaJxy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 Aug 2022 05:53:54 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50002D11EB;
        Wed, 31 Aug 2022 02:53:53 -0700 (PDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MHfYZ4p45zlWVR;
        Wed, 31 Aug 2022 17:50:26 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 31 Aug 2022 17:53:51 +0800
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <xuwei5@huawei.com>
Subject: Re: [PATCH next v2 2/2] dt-bindings: i2c: add entry for
 hisilicon,hisi-i2c
To:     Weilong Chen <chenweilong@huawei.com>, <yangyicong@hisilicon.com>,
        <wsa@kernel.org>
References: <20220825092412.307052-1-chenweilong@huawei.com>
 <20220825092412.307052-2-chenweilong@huawei.com>
From:   Yicong Yang <yangyicong@huawei.com>
Message-ID: <ffa076ea-2675-05ab-00bb-30b77ef13cba@huawei.com>
Date:   Wed, 31 Aug 2022 17:53:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20220825092412.307052-2-chenweilong@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[+cc xuwei for device tree expertise]

On 2022/8/25 17:24, Weilong Chen wrote:
> Add the new compatible for hisi common i2c.
> 

s/hisi/HiSilicon

> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
> ---
>  .../bindings/i2c/hisilicon,hisi-i2c.yaml      | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml b/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
> new file mode 100644
> index 000000000000..ea967abfe144
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/i2c/hisilicon,hisi-i2c.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Hisilicon common IIC controller Device Tree Bindings
> +

It's ok to have "HiSilicon common IIC controller"

> +maintainers:
> +  - yangyicong@huawei.com
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: hisilicon,hisi-i2c
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clk_rate:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    default: 100000
> +

I think it misses some properties here?

- i2c-sda-hold-time-ns
- sda_fall_ns
- scl_rise_ns
...

Do we need to mention them here?

Thanks.

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clk_rate
> +  - clock-frequency
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c1: i2c@5038B0000{
> +      compatible = "hisilicon,hisi-i2c";
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      reg = <0x5 0x038B0000 0 0x10000>;
> +      interrupts = <0x0 120 0x4>;
> +      clk_rate = <0x0 0xEE6B280>;
> +      clock-frequency = <400000>;
> +    };
> 
