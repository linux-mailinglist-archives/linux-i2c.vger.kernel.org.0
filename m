Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E79436C62F2
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 10:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbjCWJMG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 05:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230476AbjCWJMF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 05:12:05 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F5A1B56E
        for <linux-i2c@vger.kernel.org>; Thu, 23 Mar 2023 02:11:58 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id t15so19634645wrz.7
        for <linux-i2c@vger.kernel.org>; Thu, 23 Mar 2023 02:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679562716;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FFw6On5GWKP9Yx/iOzJZ3hP79avgSWRYu5AU8eAnFgg=;
        b=XrOk5J0nOb+4Bwzoxv40TzazsK0MVkdhumyNdd2X20npfWaqd9fXxZXrjxFw3nvnYD
         6f8UHlhCTaQm3r2aCP4bdOGtexK5xje6t2s6ihYfpwcwme/6JpaaEm4Cwm8G5Wo1UfJg
         TwGGIA3TWc8BMxl2GHIrWdD5FOlffGfFVC7BBd4dzNvqXNLDq2uHUqARvfgo/TLztf2W
         8gKgxl02UlNLZXMppw7giKePav+cv99pOPjJG8sTsXHz3BY2Vs7yR+YrY65CWc3Xbri/
         ji5itVRKb9o7uC3I5bjPND6l9lLWaio5lcR4tgCG/DjYtF5ipjFwX7mYrRB397D36I7U
         F2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679562716;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FFw6On5GWKP9Yx/iOzJZ3hP79avgSWRYu5AU8eAnFgg=;
        b=Gks6KoVP+3mK8WmUVAzwWF+PGkgX+QB3fVRgIKiksOFqCJOJja1lbwgLg/2X9L42dH
         vnwdag9nGJsewbS/JOjBH0s3GbTXAgEPS514XO/4A475uvfRP6EoBOQYce01wLzSLUMM
         7UwalsPqWVrYyzhF9NiPNK/8fOfmffNYCd8lde/oy7DhSMGcoZ5WrFFIUm5dX47vaoH/
         4ZjHUCv7AGl57XAvQ4ZaCwWygtDtCu8KIslOTV0qvHLB1lxEl0h0jXCNdYcqz1Znyx0c
         s5TfD7IjW+F5mSYl8gEVfvVSL81UPN7Yb1olVRZ77YmOOfIiGSM0Q9JkFw6yfPhKhCcn
         LE4A==
X-Gm-Message-State: AAQBX9d9ZaYj21NpgJ2qoYF3SmjHJBSulRZzSVq1eUp9BsRZxhcXRfTU
        6sjuEh0vAO3eNGwQxoy1SAYooTxGPWNBI3lFJ6u3lA==
X-Google-Smtp-Source: AKy350b92zCNadItJJq5B+JKgVLvHKVmzqOd2qkeIzALoHhVFAZA099EcknZzO4P7ASa8073zZYoaQ==
X-Received: by 2002:a5d:5003:0:b0:2d7:a918:a2b7 with SMTP id e3-20020a5d5003000000b002d7a918a2b7mr2334209wrt.48.1679562716566;
        Thu, 23 Mar 2023 02:11:56 -0700 (PDT)
Received: from [192.168.7.188] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6082000000b002c6d0462163sm15607659wrt.100.2023.03.23.02.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 02:11:56 -0700 (PDT)
Message-ID: <6c0c9b5a-3499-b0b2-ae58-7d5b17039c6f@linaro.org>
Date:   Thu, 23 Mar 2023 10:11:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] dt-bindings: i2c: Drop unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Peter Rosin <peda@axentia.se>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20230322173530.3971676-1-robh@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <20230322173530.3971676-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22/03/2023 18:35, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml | 4 ++--

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>   Documentation/devicetree/bindings/i2c/apple,i2c.yaml          | 4 ++--
>   Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml  | 2 +-
>   Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml     | 4 ++--
>   Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml       | 4 ++--
>   Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++--
>   Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml       | 2 +-
>   .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml          | 4 ++--
>   8 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> index 199a354ccb97..26bed558c6b8 100644
> --- a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> @@ -2,8 +2,8 @@
>   # Copyright 2019 BayLibre, SAS
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/i2c/amlogic,meson6-i2c.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/amlogic,meson6-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Amlogic Meson I2C Controller
>   
> diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> index 4ac61fec90e2..243da7003cec 100644
> --- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/i2c/apple,i2c.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Apple/PASemi I2C controller
>   
> diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> index ea2303c0e143..6adedd3ec399 100644
> --- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> @@ -75,7 +75,7 @@ required:
>     - clocks
>   
>   allOf:
> -  - $ref: "i2c-controller.yaml"
> +  - $ref: i2c-controller.yaml
>     - if:
>         properties:
>           compatible:
> diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> index 2e95cda7262a..7a675aa08c44 100644
> --- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> +++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/i2c/cdns,i2c-r1p10.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/cdns,i2c-r1p10.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Cadence I2C controller
>   
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
> index 6e0a5686af04..f34cc7ad5a00 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
> @@ -45,7 +45,7 @@ properties:
>   
>     i2c-parent:
>       description: phandle of the I2C bus that this multiplexer's master-side port is connected to
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    $ref: /schemas/types.yaml#/definitions/phandle
>   
>     mux-gpios:
>       description: list of GPIOs used to control the muxer
> @@ -55,7 +55,7 @@ properties:
>     idle-state:
>       description: Value to set the muxer to when idle. When no value is given, it defaults to the
>         last value used.
> -    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    $ref: /schemas/types.yaml#/definitions/uint32
>   
>   allOf:
>     - $ref: i2c-mux.yaml
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> index 0e88c85985b5..9f66a3bb1f80 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Qualcomm Geni based QUP I2C Controller
>   
> diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> index bf396e9466aa..94b75d9f66cd 100644
> --- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> @@ -90,7 +90,7 @@ properties:
>     st,syscfg-fmp:
>       description: Use to set Fast Mode Plus bit within SYSCFG when Fast Mode
>         Plus speed is selected by slave.
> -    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>       items:
>         - items:
>             - description: phandle to syscfg
> diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
> index 1b598638d457..658ae92fa86d 100644
> --- a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
> +++ b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Xilinx IIC controller
>   

