Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A37FE4F0175
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Apr 2022 14:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345049AbiDBMbz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Apr 2022 08:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243066AbiDBMby (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Apr 2022 08:31:54 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170714F9F5
        for <linux-i2c@vger.kernel.org>; Sat,  2 Apr 2022 05:30:02 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id c7so7851396wrd.0
        for <linux-i2c@vger.kernel.org>; Sat, 02 Apr 2022 05:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WHHY6/AA+RV5B6HQp/JMxKSATkAk8e0U+XPm3mIVbG4=;
        b=w0+Pu5NJu0h1cXv19IbjAmNV5ldGQMzlT1e5o18hrVpSP81bd/f43dGd4yCkcjnXFj
         R2qlaT8dm6+KGQHjMYI04hf69HstNdN/nB7hBe9L6nw7imHMUmYH62EuePSEGeotSAyo
         TMYbT9Rl0CP6maAEFQJhy0+zlZZYuue+n0MScmtkGpgZXbQ/jCVFOhunGuUpuXOT7DY6
         ++1yAu+IKf8/nhs+mI8cEXHjLfuxqOLTiQVnSp14MrHUZJctA7D9dx7v01OJSVxKR5YV
         Jjw5XaIx4iuyqjwSE8ny0tXsCnqRScAYHTaFNURSwCIo602rpbOAl+bStzbU7xV3EaaW
         /9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WHHY6/AA+RV5B6HQp/JMxKSATkAk8e0U+XPm3mIVbG4=;
        b=74xcy4oJdNCqb/tj65W+CLS6K49VdeK+QktFFVw3FXJoBis50ZDLtUkEMejr7BYkQX
         a9epNcSUIG+wsSXwDfuuxzKhTUvm+xyKzphprogskVcwHvtii8Bwp/3QghT8rG1mEA6r
         rHGeceyoY4s49YiYMjWH1HzL5jGDFe01i17RLcDPZMJxNBRTVSBjDjek0OiZGNn9btMn
         5xS34Q2nMDwt7jYnlk317nJKJCXcyUOr8c/rJz1JzlYp2CpocNLR56LmSqfO7GwtiHcU
         0cAEqgi39hlIRjs1hzCLg1KAGQHQ8aqrzs2UXnjrD4m+3g2cBW6o2vYZz7l2lz/1bEm+
         U7tA==
X-Gm-Message-State: AOAM532E/5vg5wgWV8B3tmzKYpI3raOYXqXuCnmJrZWnxVSulOJPdAFs
        i9LPX3me2mz7AFGDtQHNHokJeHz5EEs2Hue+
X-Google-Smtp-Source: ABdhPJwdpU3ivl1IB9fl4GewiNTFa7+yJoV0fEBquDI28ZJajPWiHd7NxgeG3sRDbNbcE2+dDMylew==
X-Received: by 2002:a5d:47a7:0:b0:203:d1b4:8f6 with SMTP id 7-20020a5d47a7000000b00203d1b408f6mr11192742wrb.36.1648902600596;
        Sat, 02 Apr 2022 05:30:00 -0700 (PDT)
Received: from [192.168.0.171] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id r4-20020a1c2b04000000b0038a0e15ee13sm12705690wmr.8.2022.04.02.05.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 05:30:00 -0700 (PDT)
Message-ID: <b27db209-d146-e104-6f0c-b0d860e9cc8c@linaro.org>
Date:   Sat, 2 Apr 2022 14:29:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/5] dt-bindings: i2c: Add Qualcomm Geni based QUP i2c
 bindings
Content-Language: en-US
To:     Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20220402051206.6115-1-singh.kuldeep87k@gmail.com>
 <20220402051206.6115-2-singh.kuldeep87k@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220402051206.6115-2-singh.kuldeep87k@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02/04/2022 07:12, Kuldeep Singh wrote:
> GENI(generic interface) based Qualcomm Universal Peripheral controller
> can support multiple serial interfaces like spi,uart and i2c.
> 
> Unlike other i2c controllers, QUP i2c bindings are present in parent
> schema. Move it out from parent to an individual binding and let parent
> refer to child schema later on.
> 
> Please note, current schema isn't complete as it misses out few
> properties and thus, add these missing properties along the process.
> 
> Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
> ---
>  .../bindings/i2c/qcom,i2c-geni-qcom.yaml      | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> new file mode 100644
> index 000000000000..01a02e680ea3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Geni based QUP I2C Controller
> +
> +maintainers:
> +  - Andy Gross <agross@kernel.org>
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,geni-i2c

Just const, no enum. There are no other flavors of this (unless you
think there are?).

> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: se
> +
> +  clock-frequency:
> +    description: Desired I2C bus clock frequency in Hz
> +    default: 100000
> +
> +  interconnects:
> +    maxItems: 3
> +
> +  interconnect-names:
> +    items:
> +      - const: qup-core
> +      - const: qup-config
> +      - const: qup-memory
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  required-opps:
> +    maxItems: 1

I have doubts this is correct property. Usually it is part of the
opp-table. I see sc7180 needs this, but I think it is a mistake. Do you
know how it is supposed to work?


Best regards,
Krzysztof
