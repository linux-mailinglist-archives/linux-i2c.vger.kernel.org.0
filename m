Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA4916EBEAB
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Apr 2023 12:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjDWKrW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Apr 2023 06:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbjDWKrV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 Apr 2023 06:47:21 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC4941B9
        for <linux-i2c@vger.kernel.org>; Sun, 23 Apr 2023 03:47:19 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-50685f1b6e0so5972180a12.0
        for <linux-i2c@vger.kernel.org>; Sun, 23 Apr 2023 03:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682246838; x=1684838838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+XRTRCwuJXviemws1Zz/yvRVYmSzKUNLKSeSX1GMTyI=;
        b=qmelLx0P4oQVBJ5d4axAcmfpgIV1DqogwtUO6C4a0NovNa+b6qlx/wEyx5yCG3VB0h
         HOeWFwJK1un1bcNzP8GWTTvMhl6Sy9SOw3PKLwtEKA+QYe8pzRr1cxEcphxx4YotDj5c
         s1cf3Lojm0KRLgVmECxzJXstybEf9Gtp4XFu9mf7G/GzC4pSbdNLhVCc5QL3u6y9HSN2
         78+wM4zB/a8NKpBOLWgfNC6fEhCFkVjTuFlNBdLInrN0odM4LGVqjp/TbtCP/OuQOU+a
         WosRgXeRLIJwzRLYmTnp7A9xzOtHKJuQkk6B3+sVLV+L4/UYLIwP5lTIU/WF8EB90Z8L
         Swvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682246838; x=1684838838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+XRTRCwuJXviemws1Zz/yvRVYmSzKUNLKSeSX1GMTyI=;
        b=bq2Np1Z3yPeVC4PGNQrvv3p2Qw3ENtGNHFkH5pglDdgxK1kNSYqoIN4iuImwCJ6Aim
         S46p2wiARmIu8nBDiNwmTE5aV92ZTVooBmT8jO4ZXjJ3gihTYm/zmf8SZBoUjm/JIEh/
         Sx7OZOsTlUPidWtgpaDV9thNTogWJbt1KeTEewREEH75utF9dM9MuhyUT2h3CZMVxQ6g
         w8504/O6dQcMzCjAVu6H4QgJINN1Rt4MuoblQ5K/O3fLQe6tA8OHQ4X8Tezqt+jxfZIv
         hiIKSy364XZ41ybwCej0yHbHADgO+dRf7SjW8mxSWkjvV5OjMkYHP7gz7Q/aXTUdPrj0
         LMNg==
X-Gm-Message-State: AAQBX9f1LaeIkOlYPBB4ybMh+eCMSsntP0Uz3hmLM1ema+1OkjxNq/aD
        OOLln9RWCyTixzQx22pcNZe/kw==
X-Google-Smtp-Source: AKy350acdjCks+1nK3zvE1zXtdwdVaobEzN4nlhn5hPLCUH3KRn7tQpsRhdWHELK4JOi3iWRUAUALA==
X-Received: by 2002:aa7:da93:0:b0:508:3ff5:a306 with SMTP id q19-20020aa7da93000000b005083ff5a306mr7882917eds.37.1682246838232;
        Sun, 23 Apr 2023 03:47:18 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5d52:d466:d57f:118c? ([2a02:810d:15c0:828:5d52:d466:d57f:118c])
        by smtp.gmail.com with ESMTPSA id k26-20020aa7c39a000000b005068053b53dsm3632568edq.73.2023.04.23.03.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Apr 2023 03:47:17 -0700 (PDT)
Message-ID: <47c3f816-413a-02c9-7e2a-d0b61873fc5c@linaro.org>
Date:   Sun, 23 Apr 2023 12:47:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] dt-bindings: i2c: brcm,kona-i2c: convert to YAML
To:     Stanislav Jakubek <stano.jakubek@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <9875ec0211187e4f5e2a4379c63eacdb69b31d7a.1682185969.git.stano.jakubek@gmail.com>
 <9f4a9a8e20084ba895a309e7d2b78d2047a84ac6.1682185969.git.stano.jakubek@gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9f4a9a8e20084ba895a309e7d2b78d2047a84ac6.1682185969.git.stano.jakubek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22/04/2023 20:07, Stanislav Jakubek wrote:
> Convert Broadcom Kona family I2C bindings to DT schema.
> 
> Changes during conversion:
>   - add used, but previously undocumented SoC-specific compatibles
>   - drop references to SoCs that are not upstream
>   - add supported clock frequencies according to the Linux driver [1]
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/i2c/busses/i2c-bcm-kona.c#n731
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---
>  .../devicetree/bindings/i2c/brcm,kona-i2c.txt | 35 -----------
>  .../bindings/i2c/brcm,kona-i2c.yaml           | 58 +++++++++++++++++++
>  2 files changed, 58 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/brcm,kona-i2c.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/brcm,kona-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/brcm,kona-i2c.txt b/Documentation/devicetree/bindings/i2c/brcm,kona-i2c.txt
> deleted file mode 100644
> index 1b87b741fa8e..000000000000
> --- a/Documentation/devicetree/bindings/i2c/brcm,kona-i2c.txt
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -Broadcom Kona Family I2C
> -=========================
> -
> -This I2C controller is used in the following Broadcom SoCs:
> -
> -  BCM11130
> -  BCM11140
> -  BCM11351
> -  BCM28145
> -  BCM28155
> -
> -Required Properties
> --------------------
> -- compatible: "brcm,bcm11351-i2c", "brcm,kona-i2c"
> -- reg: Physical base address and length of controller registers
> -- interrupts: The interrupt number used by the controller
> -- clocks: clock specifier for the kona i2c external clock
> -- clock-frequency: The I2C bus frequency in Hz
> -- #address-cells: Should be <1>
> -- #size-cells: Should be <0>
> -
> -Refer to clocks/clock-bindings.txt for generic clock consumer
> -properties.
> -
> -Example:
> -
> -i2c@3e016000 {
> -	compatible = "brcm,bcm11351-i2c","brcm,kona-i2c";
> -	reg = <0x3e016000 0x80>;
> -	interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> -	clocks = <&bsc1_clk>;
> -	clock-frequency = <400000>;
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -};
> diff --git a/Documentation/devicetree/bindings/i2c/brcm,kona-i2c.yaml b/Documentation/devicetree/bindings/i2c/brcm,kona-i2c.yaml
> new file mode 100644
> index 000000000000..636912d8518d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/brcm,kona-i2c.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/brcm,kona-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom Kona family I2C controller
> +
> +maintainers:
> +  - Florian Fainelli <f.fainelli@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - brcm,bcm11351-i2c
> +        - brcm,bcm21664-i2c
> +        - brcm,bcm23550-i2c
> +      - const: brcm,kona-i2c

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

Best regards,
Krzysztof

