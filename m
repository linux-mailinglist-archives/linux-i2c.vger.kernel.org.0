Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0FFD716572
	for <lists+linux-i2c@lfdr.de>; Tue, 30 May 2023 16:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbjE3O7I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 May 2023 10:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjE3O7H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 May 2023 10:59:07 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF8A131
        for <linux-i2c@vger.kernel.org>; Tue, 30 May 2023 07:58:39 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51492ae66a4so4782609a12.1
        for <linux-i2c@vger.kernel.org>; Tue, 30 May 2023 07:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685458716; x=1688050716;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y5roT10laz2CzdwcuNGZ1IEx+qEHueK0Fd53T1e6Xfk=;
        b=m8nB5byu9FRrq2xdOz/5PN01pQ542DAaRl8HaAx/xEegXEiP1+BIKz3/DBtds6G7L0
         YG9UbTW13AEpez9bXniZcEIOPeP8NvNNZuR5XTzAHSZHsR8OTo3+sjOycud5gTd2NCiv
         9wAteWijVbfam4t1GhAk8rh7tPXqA9gnOwgeZ/2x0FWwlwhXOg3jzI5f3j9f0hywMN3j
         ftodd438uGD7V9Gih/siMbZ0FCeQidy8MDMIHgQNTK8kTVmkAr/7HAovSI5TYsEzcQ6i
         Y6xUggAy1HmKBar/swX+Xcg+uKPJZZS+JQa7hdGyH0j8m8aoiYpkP+U997QBCwr13Rfg
         bDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685458716; x=1688050716;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5roT10laz2CzdwcuNGZ1IEx+qEHueK0Fd53T1e6Xfk=;
        b=feo9ImM3PenatKtQEb9bcwwzkVJIMDyOzbAI3Q7FIbCfJkoAK9b64LQzBiJ7nxiNjN
         YBDMUJpyzu8DwMxDTU3OZKMpeuoslicPYUSezWoDmlGE6jARyZh4afd9/q0O33toIRJc
         rmpYL1HocSe+k19Levzqce6hmrBcQv/+vmk45XFST4zd7rAFBIawJ8dSs+5MlUzlP7kY
         InDufps8jBwXITOvcp+O+R/2yPahneeR2ID5vFbQYwI3ZIbm5x4Ig3+G3MjBOArZhAvH
         NU5qzd/VqR3N/ZfYKq9pGpNOMujrqgfl4YiH1FI+w8fWJWiZedyT1kofdpofDPgCWqPB
         qwZQ==
X-Gm-Message-State: AC+VfDwSQDocOgfSig5e9J+ibxNwsFvGjJtqTz37ABeV88VVb3wtyj2q
        3RQ8Z8B+INnLsCZ0E0Xztq4KKw==
X-Google-Smtp-Source: ACHHUZ7Be8Z+NCpE61J4jKqCk67UtnMimLo2D/Jlbqp1FUziK8Rm1KdNBdY1sQ5h++vhPhdtE2COeQ==
X-Received: by 2002:a05:6402:1645:b0:50d:8991:d1b9 with SMTP id s5-20020a056402164500b0050d8991d1b9mr1853579edx.8.1685458716495;
        Tue, 30 May 2023 07:58:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id a21-20020aa7d755000000b0050bc041d2a8sm4425119eds.15.2023.05.30.07.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 07:58:35 -0700 (PDT)
Message-ID: <ed004607-5a23-564a-3185-a63af87783e5@linaro.org>
Date:   Tue, 30 May 2023 16:58:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] dt-bindings: i2c: imx-lpi2c: Add bus recovery example
Content-Language: en-US
To:     carlos.song@nxp.com, aisheng.dong@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, Anson.Huang@nxp.com
Cc:     xiaoning.wang@nxp.com, haibo.chen@nxp.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230529074302.3612294-1-carlos.song@nxp.com>
 <20230529074302.3612294-2-carlos.song@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230529074302.3612294-2-carlos.song@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 29/05/2023 09:43, carlos.song@nxp.com wrote:
> From: Clark Wang <xiaoning.wang@nxp.com>
> 
> Add i2c bus recovery configuration example.

Why? That's just example... also with coding style issue.

> 
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
>  .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> index 4656f5112b84..62ee457496e4 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> @@ -58,6 +58,16 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  pinctrl-names:
> +    minItems: 1
> +    maxItems: 3

What's the benefit of this? Entries should be defined but without it is
not really helpful. Anyway not explained in commit msg.

> +
> +  scl-gpios:
> +    maxItems: 1
> +
> +  sda-gpios:
> +    maxItems: 1

You don't need these two. Anyway not explained in commit msg.

> +
>  required:
>    - compatible
>    - reg
> @@ -70,6 +80,7 @@ examples:
>    - |
>      #include <dt-bindings/clock/imx7ulp-clock.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/gpio/gpio.h>
>  
>      i2c@40a50000 {
>          compatible = "fsl,imx7ulp-lpi2c";
> @@ -78,4 +89,9 @@ examples:
>          interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
>          clocks = <&clks IMX7ULP_CLK_LPI2C7>,
>                   <&clks IMX7ULP_CLK_NIC1_BUS_DIV>;
> +        pinctrl-names = "default","gpio";

Missing space.

> +        pinctrl-0 = <&pinctrl_i2c>;
> +        pinctrl-1 = <&pinctrl_i2c_recovery>;
> +        scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +        sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>      };

Best regards,
Krzysztof

