Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A48DD53E87D
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 19:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238472AbiFFNLX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 09:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238474AbiFFNLW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 09:11:22 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1DA3BF89C
        for <linux-i2c@vger.kernel.org>; Mon,  6 Jun 2022 06:11:19 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id gl15so15010168ejb.4
        for <linux-i2c@vger.kernel.org>; Mon, 06 Jun 2022 06:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/KmFuF4jKpeydY8hbk92wijllFhsM6aXhxKlyczUkII=;
        b=Zb2v5Bcxnbp4pnPLrvvGYauoWTb/YiV4kr8T2Bi3n31ywqgW1fDOcnj4Y5Qhzv1Idm
         MtLyfN+8uIZc5GUyYpWyqNcQCNEu8dkKk7IursYxJsDaqiVxqLHRa4JB7NHYjwKnL6M7
         /3UxvJ7MWHZ77ML3MxF6LiYrWv7viZSTbkz3TsQWULBtNM5HutUhv/vinEye4zL0ktwO
         CVr/8QdM1mXeK+pk46ww+rW1D4EQ/ZjP9iUSoU2PevWy97kHLwuhi2FOU3gZ0MQkikqe
         +dB/NpUmOd+8KGvBG6jNes9RmCwT6wheAtCMtKlPC7bCbmBl/DcnMsqZ2gUa1/YwpMw5
         N/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/KmFuF4jKpeydY8hbk92wijllFhsM6aXhxKlyczUkII=;
        b=iuG/q9iO7gHa7efcPZr4AWlTqu0eJOG03XEq7vI+o6l9YPfV4Mrjc2DEVv77a3AMCd
         Fyp87vuA6RJgzj9HtAr/PB+FJ6Gk6pexa2LFCj91T9FatcboFFb1ALdawwF9rUlh73f9
         fbRxpuG9vd2JQ8qiEoBs4BLfUjWQFBIZrTdLRXhzau+WwwoUCKOe/JJxzwILGLl3xMs8
         y5awZlE+StIIYZKk7s2JltdKFU1GxEGsq21R5KuJF7/i3D2W2Yx7MO2WrnqUh+mforwE
         CNeDGERhTlQWXR8bLlDcLrBixjDWWhW++AHMxq3YsB6ZIoLeRrBGeGmIS19aVob6D2H1
         Nnqw==
X-Gm-Message-State: AOAM532VRW+sd0RNvFLeXILdQLjZIsJ47t8IQZpXQMIwOc8sVnhPRA8w
        QzlYpcdRuBchw/H2hJxczR9G1g==
X-Google-Smtp-Source: ABdhPJxK/dku1Cegj7+im0IoLMrrBQFPj08zFzUqOe++/+VsCOLq+IIcBWQ4fVLUqypvR16LpDcDUg==
X-Received: by 2002:a17:906:4fce:b0:6f4:f41c:3233 with SMTP id i14-20020a1709064fce00b006f4f41c3233mr20383676ejw.117.1654521078400;
        Mon, 06 Jun 2022 06:11:18 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id cf4-20020a0564020b8400b0042fbc23bfcesm4528813edb.46.2022.06.06.06.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 06:11:17 -0700 (PDT)
Message-ID: <cf00eaad-420f-a6ad-ab7f-418f273886fe@linaro.org>
Date:   Mon, 6 Jun 2022 15:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 4/6] dt-bindings: mfd: convert da9063 to yaml
Content-Language: en-US
To:     mail@conchuod.ie, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Steve Twiss <stwiss.opensource@diasemi.com>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Atul Khare <atulkhare@rivosinc.com>
References: <20220605133300.376161-1-mail@conchuod.ie>
 <20220605133300.376161-5-mail@conchuod.ie>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220605133300.376161-5-mail@conchuod.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05/06/2022 15:32, mail@conchuod.ie wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the dt binding for the da9063/da9063l to yaml.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/mfd/da9063.txt        | 111 ----------------
>  .../devicetree/bindings/mfd/da9063.yaml       | 123 ++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.yaml  |   2 -
>  3 files changed, 123 insertions(+), 113 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/da9063.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/da9063.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/da9063.txt b/Documentation/devicetree/bindings/mfd/da9063.txt
> deleted file mode 100644
> index 91b79a21d403..000000000000
> --- a/Documentation/devicetree/bindings/mfd/da9063.txt
> +++ /dev/null
> @@ -1,111 +0,0 @@
> -* Dialog DA9063/DA9063L Power Management Integrated Circuit (PMIC)
> -
> -DA9063 consists of a large and varied group of sub-devices (I2C Only):
> -
> -Device                   Supply Names    Description
> -------                   ------------    -----------
> -da9063-regulator        :               : LDOs & BUCKs
> -da9063-onkey            :               : On Key
> -da9063-rtc              :               : Real-Time Clock (DA9063 only)
> -da9063-watchdog         :               : Watchdog
> -
> -======
> -
> -Required properties:
> -
> -- compatible : Should be "dlg,da9063" or "dlg,da9063l"
> -- reg : Specifies the I2C slave address (this defaults to 0x58 but it can be
> -  modified to match the chip's OTP settings).
> -- interrupts : IRQ line information.
> -- interrupt-controller
> -
> -Sub-nodes:
> -
> -- regulators : This node defines the settings for the LDOs and BUCKs.
> -  The DA9063(L) regulators are bound using their names listed below:
> -
> -    bcore1    : BUCK CORE1
> -    bcore2    : BUCK CORE2
> -    bpro      : BUCK PRO
> -    bmem      : BUCK MEM
> -    bio       : BUCK IO
> -    bperi     : BUCK PERI
> -    ldo1      : LDO_1	(DA9063 only)
> -    ldo2      : LDO_2	(DA9063 only)
> -    ldo3      : LDO_3
> -    ldo4      : LDO_4	(DA9063 only)
> -    ldo5      : LDO_5	(DA9063 only)
> -    ldo6      : LDO_6	(DA9063 only)
> -    ldo7      : LDO_7
> -    ldo8      : LDO_8
> -    ldo9      : LDO_9
> -    ldo10     : LDO_10	(DA9063 only)
> -    ldo11     : LDO_11
> -
> -  The component follows the standard regulator framework and the bindings
> -  details of individual regulator device can be found in:
> -  Documentation/devicetree/bindings/regulator/regulator.txt
> -
> -- rtc : This node defines settings for the Real-Time Clock associated with
> -  the DA9063 only. The RTC is not present in DA9063L. There are currently
> -  no entries in this binding, however compatible = "dlg,da9063-rtc" should
> -  be added if a node is created.
> -
> -- onkey : This node defines the OnKey settings for controlling the key
> -  functionality of the device. The node should contain the compatible property
> -  with the value "dlg,da9063-onkey".
> -
> -  Optional onkey properties:
> -
> -  - dlg,disable-key-power : Disable power-down using a long key-press. If this
> -    entry exists the OnKey driver will remove support for the KEY_POWER key
> -    press. If this entry does not exist then by default the key-press
> -    triggered power down is enabled and the OnKey will support both KEY_POWER
> -    and KEY_SLEEP.
> -
> -- watchdog : This node defines settings for the Watchdog timer associated
> -  with the DA9063 and DA9063L. There are currently no entries in this
> -  binding, however compatible = "dlg,da9063-watchdog" should be added
> -  if a node is created.
> -
> -
> -Example:
> -
> -	pmic0: da9063@58 {
> -		compatible = "dlg,da9063"
> -		reg = <0x58>;
> -		interrupt-parent = <&gpio6>;
> -		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> -		interrupt-controller;
> -
> -		rtc {
> -			compatible = "dlg,da9063-rtc";
> -		};
> -
> -		wdt {
> -			compatible = "dlg,da9063-watchdog";
> -		};
> -
> -		onkey {
> -			compatible = "dlg,da9063-onkey";
> -			dlg,disable-key-power;
> -		};
> -
> -		regulators {
> -			DA9063_BCORE1: bcore1 {
> -				regulator-name = "BCORE1";
> -				regulator-min-microvolt = <300000>;
> -				regulator-max-microvolt = <1570000>;
> -				regulator-min-microamp = <500000>;
> -				regulator-max-microamp = <2000000>;
> -				regulator-boot-on;
> -			};
> -			DA9063_LDO11: ldo11 {
> -				regulator-name = "LDO_11";
> -				regulator-min-microvolt = <900000>;
> -				regulator-max-microvolt = <3600000>;
> -				regulator-boot-on;
> -			};
> -		};
> -	};
> -
> diff --git a/Documentation/devicetree/bindings/mfd/da9063.yaml b/Documentation/devicetree/bindings/mfd/da9063.yaml
> new file mode 100644
> index 000000000000..376880061f42
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/da9063.yaml

dlg,da9063.yaml

> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/da9063.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dialog DA9063/DA9063L Power Management Integrated Circuit (PMIC)
> +
> +maintainers:
> +  - Steve Twiss <stwiss.opensource@diasemi.com>
> +
> +description: |
> +  For device-tree bindings of other sub-modules refer to the binding documents
> +  under the respective sub-system directories.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - dlg,da9063
> +      - dlg,da9063l
> +
> +  reg:
> +    description:
> +      I2C device address.

Skip description.

> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  watchdog:
> +    type: object
> +    $ref: ../watchdog/watchdog.yaml#

1. full reference, so /schemas/watchdog/....
2. unevaluatedProperties:false

> +    properties:
> +      compatible:
> +        const: dlg,da9063-watchdog

> +
> +  rtc:
> +    type: object
> +    $ref: ../rtc/rtc.yaml#

Ditto

> +    properties:
> +      compatible:
> +        const: dlg,da9063-rtc
> +
> +  onkey:
> +    type: object
> +    $ref: ../input/input.yaml#

Ditto

> +    properties:
> +      compatible:
> +        const: dlg,da9063-onkey
> +
> +      dlg,disable-key-power:
> +        type: boolean
> +        description: |
> +          Disable power-down using a long key-press.
> +          If this entry does not exist then by default the key-press triggered
> +          power down is enabled and the OnKey will support both KEY_POWER and
> +          KEY_SLEEP.
> +
> +  regulators:
> +    type: object
> +    patternProperties:
> +      "^(ldo[1-11]|bcore[1-2]|bpro|bmem|bio|bperi)$":
> +        $ref: ../regulator/regulator.yaml

Ditto

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +
Best regards,
Krzysztof
