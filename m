Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFB65611E40
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Oct 2022 01:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiJ1Xpy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Oct 2022 19:45:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbiJ1Xpw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Oct 2022 19:45:52 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8E080F5F
        for <linux-i2c@vger.kernel.org>; Fri, 28 Oct 2022 16:45:49 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id ml12so5123564qvb.0
        for <linux-i2c@vger.kernel.org>; Fri, 28 Oct 2022 16:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1gQLmBIcjnNwDxMMIUUxHnCdSXcoabEviMMvl3ldFps=;
        b=k7pJ9Xw9veeuK3YXuZTVvSVmRV4OPsWQETIy9YQs4t3jxxkTTSNf1jsahpmEEi/dOf
         IgWbQY6zkPWYPm4CqCCgUULhT7qrs8sXCkMppzUVwMPP7qrTTj3xbb749cdVh/+dmd3U
         MJbNKiJIr31X97CbHoWWX5kx/KwwTI6wwxGIClGwsWDrGT1406fNOx8cHyK8bEpYCZ/f
         klMq+Op81x7P1iF+v48IMvGgrAh7CSTHX/3YF3zRg1kAvc8/9qS7dLNCt+QLbge1jv/b
         s8Kxw0Ads6GQkE/Y3uPmt/rnlF/dSKgLCuS7RxiTGKVBd6XE9NGaA/CbRMapW6FiaPjF
         K5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1gQLmBIcjnNwDxMMIUUxHnCdSXcoabEviMMvl3ldFps=;
        b=g6FJOha/g6OsGc28n+obQUd3ulJQRZ9mgh2MYLID8kkkl1Y0V22q5m5PiJSMDGrTcM
         etXKW7T17cFC5XGc6f/B50u2nUkn7Yb4mvV6tc9ONi6kNa90Udzgi17HTHbO8Dxu2DDm
         oHGFn1xG9CU3I7B1isyUd5FUzy7Y5NHuv2IgIqYFs9NvsLCLleHtV6o828psYlF0s3lI
         28xeAZdMdPUnjvbqyI50WLc9K50kA/+8atBNwti/gJ2TQd+tZpk69h0OQx7IQ7rzHDm5
         OAWM4k7g40F7jWRn150cHPwf9602Mqos71VJc9KM+404ddCo6KwxeOTwL1+gXpa8cbf8
         akbA==
X-Gm-Message-State: ACrzQf01buhyHPTg7tkWZrCMMDVOdSb/rCbz8v96OC0cGNhMZE0FcHzQ
        O5/jyynW8uNvRRRAycR5uopoEdLyADCXeA==
X-Google-Smtp-Source: AMsMyM5PDqhzdN5zEC6ntlDWWSSJwQP9ZZzLjU7JL3+J5NIFOU89QjOUm7OyEg3q+6jhnGOCUC9adA==
X-Received: by 2002:a05:6214:2342:b0:473:e142:f758 with SMTP id hu2-20020a056214234200b00473e142f758mr1702056qvb.83.1667000748688;
        Fri, 28 Oct 2022 16:45:48 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id f11-20020a05620a280b00b006f8665f483fsm20867qkp.85.2022.10.28.16.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 16:45:47 -0700 (PDT)
Message-ID: <491837d1-4e81-496c-8442-7c1cae670907@linaro.org>
Date:   Fri, 28 Oct 2022 19:45:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH next v7 2/2] dt-bindings: i2c: add entry for
 hisilicon,i2c-ascend910
Content-Language: en-US
To:     Weilong Chen <chenweilong@huawei.com>, yangyicong@hisilicon.com,
        xuwei5@huawei.com, wsa@kernel.org, robh+dt@kernel.org,
        robh@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221021035638.203929-1-chenweilong@huawei.com>
 <20221021035638.203929-2-chenweilong@huawei.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021035638.203929-2-chenweilong@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20/10/2022 23:56, Weilong Chen wrote:
> Add the new compatible for HiSilicon i2c.
> 
> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
> ---
> Change since v6:
> - Rename to hisilicon,i2c-ascend910.yaml
> - Change all IIC to I2C
> - Add maintainer name
> Link: https://lore.kernel.org/lkml/7520818b-de40-7f2a-1b03-b1dcd29a2023@huawei.com/T/#ma89d78cef45e7ac6f2c6251ed958e8658e5c1eb5
> 

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.


>  .../bindings/i2c/hisilicon,i2c-ascend910.yaml | 70 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,i2c-ascend910.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/hisilicon,i2c-ascend910.yaml b/Documentation/devicetree/bindings/i2c/hisilicon,i2c-ascend910.yaml
> new file mode 100644
> index 000000000000..f4f532d69670
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/hisilicon,i2c-ascend910.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/i2c/hisilicon,i2c-xxx.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop quotes

> +
> +title: HiSilicon common I2C controller Device Tree Bindings

Drop "Device Tree bindings"

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

Description goes to top level description.

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

Use defines for constants.

Best regards,
Krzysztof

