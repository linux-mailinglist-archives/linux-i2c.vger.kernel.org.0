Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77541611E96
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Oct 2022 02:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbiJ2AFO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Oct 2022 20:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbiJ2AFN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Oct 2022 20:05:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0AAE4A830;
        Fri, 28 Oct 2022 17:05:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7B943B82DE1;
        Sat, 29 Oct 2022 00:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3B3C433D7;
        Sat, 29 Oct 2022 00:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667001902;
        bh=YC+e6whfjf04npKAsVbYriXuxVx8o81YW1bGePbuxs4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=XZtDH9hskgd+DcdN6r/uI+3H+zwpSM0oHxfwv4zT6UkMti5zONqh4om+cFikwlDxO
         SocagtPpUBOZVsJV93xAw5irDidO79KgBEdTpDhDq4/6Cl2QFPAFQZYG2pNgE2pxPB
         EDPMikvkGFgiDFbIo+N+k+N0YEwUMrpvqOYRA/rFmcEbSlL1D8KPAP2xF+lNv6ei3Z
         uJjY5i6CAnMfgGGlGuQgie8ygvh7vq8DYaRdKqRdU9HNpCZ5NtaIs6N21U6dcWepnh
         I2da3hBzKwXGkq99bip3bOiQRo1VLiEFdrRieeyur1sYXNzIePbQOW7FNqZURecXmU
         nelCO6FNXnJYA==
Message-ID: <d40193d3-d933-0e89-a08e-47fd87aaf07a@kernel.org>
Date:   Fri, 28 Oct 2022 20:04:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH next v8 2/2] dt-bindings: i2c: add entry for
 hisilicon,i2c-ascend910
Content-Language: en-US
To:     Weilong Chen <chenweilong@huawei.com>, yangyicong@hisilicon.com,
        xuwei5@huawei.com, wsa@kernel.org, robh+dt@kernel.org,
        robh@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221024015151.342651-1-chenweilong@huawei.com>
 <20221024015151.342651-2-chenweilong@huawei.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20221024015151.342651-2-chenweilong@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 23/10/2022 21:51, Weilong Chen wrote:
> Add the new compatible for HiSilicon i2c.
> 
> Signed-off-by: Weilong Chen <chenweilong@huawei.com>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

> ---
> Change since v7:
> - Fix yamllint errors, rename i2c-xxx to i2c-ascend910
> Link: https://lore.kernel.org/all/166635752527.3428089.707277745439761591.robh@kernel.org/
> 
>  .../bindings/i2c/hisilicon,i2c-ascend910.yaml | 70 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,i2c-ascend910.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/hisilicon,i2c-ascend910.yaml b/Documentation/devicetree/bindings/i2c/hisilicon,i2c-ascend910.yaml
> new file mode 100644
> index 000000000000..918825a3026b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/hisilicon,i2c-ascend910.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/i2c/hisilicon,i2c-ascend910.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

My previous comments apply.

> +
> +title: HiSilicon common I2C controller Device Tree Bindings
> +
> +maintainers:
> +  - Yicong Yang <yangyicong@hisilicon.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: hisilicon,i2c-ascend910
> +    description:
> +      The HiSilicon common I2C controller can be used for many different
> +      types of SoC such as Huawei Ascend AI series chips.

Comment still applies.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    default: 400000
> +
> +  i2c-sda-falling-time-ns:
> +    default: 343
> +
> +  i2c-scl-falling-time-ns:
> +    default: 203
> +
> +  i2c-sda-hold-time-ns:
> +    default: 830
> +
> +  i2c-scl-rising-time-ns:
> +    default: 365
> +
> +  i2c-digital-filter-width-ns:
> +    default: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c@5038b0000 {
> +      compatible = "hisilicon,i2c-ascend910";
> +      reg = <0x38b0000 0x10000>;
> +      interrupts = <0x0 120 0x4>;

Same here.


Best regards,
Krzysztof

