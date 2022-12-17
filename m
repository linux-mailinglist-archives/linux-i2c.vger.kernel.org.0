Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4795164F8C8
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Dec 2022 11:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbiLQKzn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Dec 2022 05:55:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbiLQKzl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Dec 2022 05:55:41 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D416E1029
        for <linux-i2c@vger.kernel.org>; Sat, 17 Dec 2022 02:55:40 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id j4so7256839lfk.0
        for <linux-i2c@vger.kernel.org>; Sat, 17 Dec 2022 02:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dgeIfPkL/uAsGQYe43m14UGQ6KeF1AJBZCItoIswQjA=;
        b=TjaXqQvjIE4ADe59iDZUvuhgHC4c0qDSOPDIyMPQF9p5KFJ0kTheTCLpKt6ae7qFgZ
         g/E3ETklQKvtjMxVhJN4AhhxD17DH5XfaAPWq4K9C8l82EyCVnTlOcKKhiCgJHVruF+J
         rHiw7PQSHaDxK9cWnCmYUpXuBJHwUUljh3/TZdhkEpPXrY1TeG++Ft/J8DlCifrDPImu
         EkUmNi6/BEKy4J5kHk37vzJ77M/FyIt3g2Zxo8pdDZNDTbQ7oYt+HKWvnbJdChr5KKqu
         zhh61pgN9BAduUNFvbbatEByFNM0/qa9Tv3VwwzeifV8hbYVdmmz9bbyD3b14d5//6mx
         N5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dgeIfPkL/uAsGQYe43m14UGQ6KeF1AJBZCItoIswQjA=;
        b=ZWafSugm4mzuHiu2vFpn0qFfkx6wb9kBsHCwt+v6GSkYRM0MfnqY1dNv0lW02BzxYg
         5qyGI4P10l1ZqzoGxuQTkxs9FQmAKWG16veNbbpLkeNjzeMqm/UyRL9PdGvE9qCOxO5v
         VRiliZc4bTlWvd3kR94Ysk84dLTH12DtfmDZrDXcDJM9gihVXURWDc0pdWSm4vmblaaU
         LUNRo6acKIKEnpGxIf5tvRqKmgu3Yvd0kwuwDo7lmXaVUydf+WajR8SSiVu7wKKDO9tY
         gNIp/WYG3wlBM5Yz8xoeFdEI4KzmADRiZlsAfZ11sjkeqpSMuFw6PQODCmdvFHFCVNAt
         tIvA==
X-Gm-Message-State: ANoB5plp9ni4sq0Lt7w0W4IbWAz2Fe5ch2YURjccmWSyu3v5FenIMUbU
        e+mj2Zz1g6XqQs6t04Z9lhbX1A==
X-Google-Smtp-Source: AA0mqf6Bnxu9VFQRjM1hc7UoQnQPYgU8xl2tt1W7wzJI5NWV3jvwRu4cpAUIxaxvNjLiuseak8u1Bg==
X-Received: by 2002:a19:5f0d:0:b0:4a4:68b9:608c with SMTP id t13-20020a195f0d000000b004a468b9608cmr10625310lfb.23.1671274539224;
        Sat, 17 Dec 2022 02:55:39 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u10-20020a05651220ca00b0048a982ad0a8sm482085lfr.23.2022.12.17.02.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 02:55:38 -0800 (PST)
Message-ID: <bd3a04ea-8c99-1a84-62f6-7ed5ec79c48f@linaro.org>
Date:   Sat, 17 Dec 2022 11:55:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 2/6] dt-bindings: i2c: hpe,gxp-i2c
Content-Language: en-US
To:     nick.hawkins@hpe.com, verdun@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20221216183532.78933-1-nick.hawkins@hpe.com>
 <20221216183532.78933-3-nick.hawkins@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221216183532.78933-3-nick.hawkins@hpe.com>
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

On 16/12/2022 19:35, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 

Subject: missing explanation what you are doing. Use `git log` to learn
how this can be written.

> Document binding to support I2C controller in GXP.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---
>  .../devicetree/bindings/i2c/hpe,gxp-i2c.yaml  | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml b/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
> new file mode 100644
> index 000000000000..fa378e991fdb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/hpe,gxp-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HPE GXP SoC I2C Controller
> +
> +maintainers:
> +  - Nick Hawkins <nick.hawkins@hpe.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: hpe,gxp-i2c
> +
> +  '#address-cells':
> +    const: 1

Drop, it's coming from i2c-controller.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  hpe,i2c-max-bus-freq:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Desired frequency in Hz of the bus.

No, there is existing property for this - clock-frequency. Do not invent
own stuff.

Even if this was accepted, you must use standard property suffixes.

> +    default: 100000
> +
> +  hpe,sysreg-phandle:

Don't encode the type in property name. You do not call "reg" a
"reg-uint32", right?  or hpe,i2c-max-bus-freq-uint32?

hpe,sysreg
(unless you can name it more accurately)


> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Pandle to syscon used to control the system registers.
> +
> +  '#size-cells':
> +    const: 0

Drop, it's coming from i2c-controller.


Krzysztof

