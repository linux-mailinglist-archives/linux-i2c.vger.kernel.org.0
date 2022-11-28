Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10F7763AA90
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Nov 2022 15:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbiK1OLT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Nov 2022 09:11:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbiK1OLS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Nov 2022 09:11:18 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A62241
        for <linux-i2c@vger.kernel.org>; Mon, 28 Nov 2022 06:11:17 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id c1so17515407lfi.7
        for <linux-i2c@vger.kernel.org>; Mon, 28 Nov 2022 06:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f7WMk8JdnukYc8uZcl1PFgG4y0ztQpkC05f+mmdnbaM=;
        b=a0xNI0KvjKVFPDMZ/k4JUSjljzMUST52etgZLEHZ5qeR06e0BippLuxPbQpLssxAFw
         NhnIBi6vxow0mtdTpzluOgPhXyz7eFCA2Q3hRxyuybzkvWiFklR7SJ25zGLv0zathbfw
         994PTySe4FmQmVcgqLvxwWdkM73vc7o81MbLvfghnbZAbPhTPGzb0Hg8+/pjSUCYESKT
         8RA1hPlwdmosXbzfXSnCj3xEob+hZOb9+PBFlKhrEU9bMVl7CcQsuyKPaU1iGE0gTrUl
         4x6+7+rd4LgUZ2Q5xHh+SQB0oyuWdlxcAFNkyJgvAmf2FiyTMNguwsgJc524hsSXzfra
         r76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7WMk8JdnukYc8uZcl1PFgG4y0ztQpkC05f+mmdnbaM=;
        b=OivcMugmpEph5wpxwNgBZkSpznopVjk95dPYyXgkxIQ7RzmHMFwFZTPAS6Ba3f13+e
         xLFmC1r9fWmFDt/QPrHvbjhI4frs+O6/HhRmLZYL4GF8MulP6XYoxWxpsd40oe69YKLW
         iHuEB1A8zEkCXYUsNOpm3m39slue1kyJAk9hpb3/gSDOsHD+qAVhbCNzMobZ52wa6bXH
         caYCLVKWa9VDvriOD76B/QZ9EkImj6wPrUW4WrK9EJ7ImNVvGgd7Yq5GIVx4RF+enNFn
         xuNtop+3RPz8mGXrpFEYcE8yzb5ugJ5t4e2CC0A2YvXve1tmlwR2PC9JYttnhZWtFlLP
         yY5g==
X-Gm-Message-State: ANoB5pnsO3qvjT7wJQmuJ8IMLkNalOQ/pXfiXHBGOX2IT5+HWy7YZjAC
        oKfWcm+i31YbVEGIhAS6a/VfrA==
X-Google-Smtp-Source: AA0mqf5Ev00V0oh+yCBMf2uHkbcJepQVFr0ujgek8EZrJvA62M4r9mCMjdscgP5kHDDAudpsdD55/A==
X-Received: by 2002:a05:6512:308f:b0:4b4:b8a8:69fe with SMTP id z15-20020a056512308f00b004b4b8a869femr16221464lfd.333.1669644675762;
        Mon, 28 Nov 2022 06:11:15 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f20-20020a056512361400b0047f7722b73csm1735219lfs.142.2022.11.28.06.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 06:11:15 -0800 (PST)
Message-ID: <9cc53272-6828-91b5-30a9-384168a9f94f@linaro.org>
Date:   Mon, 28 Nov 2022 15:11:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: add loongson i2c
Content-Language: en-US
To:     Yinbo Zhu <zhuyinbo@loongson.cn>, Rob Herring <robh+dt@kernel.org>,
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221128130025.23184-2-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 28/11/2022 14:00, Yinbo Zhu wrote:
> Add the Loongson platform i2c binding with DT schema format using
> json-schema.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Change in v2:
> 		1. Removed the "#address-cells" and "#size-cells" in requied.
> 		2. Add the reviewed-by information.
> 
>  .../bindings/i2c/loongson,ls-i2c.yaml         | 47 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/loongson,ls-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/loongson,ls-i2c.yaml b/Documentation/devicetree/bindings/i2c/loongson,ls-i2c.yaml
> new file mode 100644
> index 000000000000..0e4aee9146f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/loongson,ls-i2c.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/loongson,ls-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson I2C controller
> +
> +maintainers:
> +  - Yinbo Zhu <zhuyinbo@loongson.cn>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - loongson,ls2k-i2c
> +      - loongson,ls7a-i2c

Why do we have the same bindings twice, with different people and file
names?

https://lore.kernel.org/all/57339e73b6c0bfe446e19a7f55a48b7ca640b9ec.1669359515.git.zhoubinbin@loongson.cn/

Best regards,
Krzysztof

