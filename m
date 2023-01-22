Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24C86676D5E
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Jan 2023 15:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbjAVOC5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 Jan 2023 09:02:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbjAVOC4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 Jan 2023 09:02:56 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E721F485
        for <linux-i2c@vger.kernel.org>; Sun, 22 Jan 2023 06:02:54 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso6763061wmq.5
        for <linux-i2c@vger.kernel.org>; Sun, 22 Jan 2023 06:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=khU7ZPQc8roE7siv/yWI9eKECkTeVRE2Pp/ERSgrr1g=;
        b=Pr7fK8tvvSp5BqJp/rMDpdRQRijqjloQGCneGA5yIO1/JF2k4IGl5KIalhRxIFD00z
         szILRu0fOF3N3qVAM/PY4Z5ldE3imcyZFHFiRC+3In6DbTodie4w0l7K4NsCJ5F5a39w
         iGSann5xiBzktHxg7dSR3D1Lct3JUlXbUTyKSvdHgaoE9mGNwtkF9/OODmIrIv9JfiD0
         z6ybG7G380Q6JO7wwwq4CxN+DBQAqqj/XGwKB0+A3iLAZ4zBCp5QdxTH5iYJW2VF27uN
         Hm/cma/lh1KYD4z24DGHsmtuh2wl3FsOiZPl66S3bl3gjVp6Ip+W9ISkdqMKPMRYxNt0
         lFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=khU7ZPQc8roE7siv/yWI9eKECkTeVRE2Pp/ERSgrr1g=;
        b=m/nDlkDHwQU3t1UpiHJ3rT9JBrfRqBVVg6oD8ktjhlKFGoI1fHvoeqp/RpsATTZanK
         1r3rBlvgfLXJPLaC6ABeFgEbNOJK6jI2xOpNDPf3BZz23YCsUy+NBkJkwpa39zIq78iP
         qtQ+/xnA1bzRroJvqtf0uuyMwPIQiEsOXnjf0eIZV3GxeJZ0zEsZ3Hw8m5CeTHgRaiIf
         A20B+i0FffaM9ybM/Rm9NXx8Hwey2XQwPPbZ83qUQNct+pcK314oeiWdbKZqYrwSl+0P
         5Z2qdKbcWgQmJRJ5j0qFlglx0IyS7opMRdbMvb90rXhg1NtZBVd10kkiLnCDgTvHppyN
         Otow==
X-Gm-Message-State: AFqh2kp4Ych15SmnaLeHVMxpMt8I6RarZ72JPUK3HnR0u6WFfa57cpu3
        BcTwa1mIKmzvpEbPcu1wZ0GYuA==
X-Google-Smtp-Source: AMrXdXuCGIvpJAQmkTd6AvZBg2tWd/Puu4z2+FfvoGAjjOhEue65gT4+4Afc75Ph03oyTVJPm8FM8A==
X-Received: by 2002:a05:600c:502c:b0:3db:30d:deac with SMTP id n44-20020a05600c502c00b003db030ddeacmr20710173wmr.1.1674396172865;
        Sun, 22 Jan 2023 06:02:52 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o24-20020a05600c511800b003d9de0c39fasm10675337wms.36.2023.01.22.06.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 06:02:52 -0800 (PST)
Message-ID: <d63231dd-38a7-2cf4-3433-8f28018665f6@linaro.org>
Date:   Sun, 22 Jan 2023 15:02:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 2/5] dt-bindings: i2c: Add hpe,gxp-i2c
Content-Language: en-US
To:     nick.hawkins@hpe.com, verdun@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230120190159.23459-1-nick.hawkins@hpe.com>
 <20230120190159.23459-3-nick.hawkins@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120190159.23459-3-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20/01/2023 20:01, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Document compatibility string to support I2C controller
> in GXP.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> 
> ---
> 
> v3:
>  *Provide better description with use of Phandle
> v2:
>  *Removed uneccessary size-cells and address-cells
>  *Removed phandle from hpe,sysreg-phandle
>  *Changed hpe,i2c-max-bus-freq to clock-frequency
> ---
>  .../devicetree/bindings/i2c/hpe,gxp-i2c.yaml  | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml b/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
> new file mode 100644
> index 000000000000..63bc69e92d0e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
> @@ -0,0 +1,57 @@
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
> +  interrupts:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    default: 100000
> +
> +  hpe,sysreg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to a global status and enable registers shared
> +      between each I2C controller instance. Each bit of the
> +      registers represents an individual I2C engine.

But what is the purpose? What is it doing? Why I2C controller needs it?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

Keep the same order as in properties:


Best regards,
Krzysztof

