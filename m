Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9CA302ECC
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Jan 2021 23:18:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732210AbhAYWRh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Jan 2021 17:17:37 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:38979 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732149AbhAYWRY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Jan 2021 17:17:24 -0500
Received: by mail-ot1-f42.google.com with SMTP id i30so14371662ota.6;
        Mon, 25 Jan 2021 14:17:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NQ5JL+SNoLNcGdkjrMErXpzVLEwik9AOVNcI7M81MEU=;
        b=I8DDx6cOrF1ZGkOTlrr65WJyRMLROOA+kCQR8T8UgMAly0ghI0Sep6CA24jhZHnRuV
         Lg5s/oXjtKrch+ASwobcQOBEBtWB6XEeWSOM7uxG48EWrWeMvSTrNTq1BzTajbjTb8du
         NNyACSsybarx6UVNaxMW02WEOHODLUwMEs2A0Q0ERm9UXCUkSNJD98akvCQVdvbd/Q7r
         dfOgofYQdzTeSFlR7/LQRxc+Hivrp7IBuLHwh3xWHGvbCc9Tmku/aSLsJ9jaFIom3Xto
         EEghXO9McQ3AKESMtmfGyQQR+lAGSpyfe+EsIC+PHY7CmffarzGHGEnRD5K0HbVeNcDx
         xCMw==
X-Gm-Message-State: AOAM5307esgJF3pZDd8zXyBrPwMrI2RltsZPp2KCwr+WVN2gLbx+xfey
        mRbocZP0sdAjmm8A1GLAvQ==
X-Google-Smtp-Source: ABdhPJzS7d1TUvtKHpkjE8UMffqfiSDjT+KfYEiCZzBnXitlT4F0Lm6QWG+s3w9pghPVr7CrJbg/ZA==
X-Received: by 2002:a9d:ea6:: with SMTP id 35mr1882871otj.188.1611613001124;
        Mon, 25 Jan 2021 14:16:41 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e17sm3764329otf.32.2021.01.25.14.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 14:16:39 -0800 (PST)
Received: (nullmailer pid 1117744 invoked by uid 1000);
        Mon, 25 Jan 2021 22:16:33 -0000
Date:   Mon, 25 Jan 2021 16:16:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: i2c: qcom,i2c-qup: Convert txt to
 YAML schema
Message-ID: <20210125221633.GA1112939@robh.at.kernel.org>
References: <20210114180415.404418-1-angelogioacchino.delregno@somainline.org>
 <20210114180415.404418-2-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114180415.404418-2-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 14, 2021 at 07:04:13PM +0100, AngeloGioacchino Del Regno wrote:
> Convert the qcom,i2c-qup binding to YAML schema.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../devicetree/bindings/i2c/qcom,i2c-qup.txt  | 40 ---------
>  .../devicetree/bindings/i2c/qcom,i2c-qup.yaml | 87 +++++++++++++++++++
>  2 files changed, 87 insertions(+), 40 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt b/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt
> deleted file mode 100644
> index dc71754a56af..000000000000
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -Qualcomm Universal Peripheral (QUP) I2C controller
> -
> -Required properties:
> - - compatible: Should be:
> -   * "qcom,i2c-qup-v1.1.1" for 8660, 8960 and 8064.
> -   * "qcom,i2c-qup-v2.1.1" for 8974 v1.
> -   * "qcom,i2c-qup-v2.2.1" for 8974 v2 and later.
> - - reg: Should contain QUP register address and length.
> - - interrupts: Should contain I2C interrupt.
> -
> - - clocks: A list of phandles + clock-specifiers, one for each entry in
> -   clock-names.
> - - clock-names: Should contain:
> -   * "core" for the core clock
> -   * "iface" for the AHB clock
> -
> - - #address-cells: Should be <1> Address cells for i2c device address
> - - #size-cells: Should be <0> as i2c addresses have no size component
> -
> -Optional properties:
> - - clock-frequency: Should specify the desired i2c bus clock frequency in Hz,
> -                    defaults to 100kHz if omitted.
> -
> -Child nodes should conform to i2c bus binding.
> -
> -Example:
> -
> - i2c@f9924000 {
> - 	compatible = "qcom,i2c-qup-v2.2.1";
> - 	reg = <0xf9924000 0x1000>;
> - 	interrupts = <0 96 0>;
> -
> - 	clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
> - 	clock-names = "core", "iface";
> -
> - 	clock-frequency = <355000>;
> -
> - 	#address-cells = <1>;
> - 	#size-cells = <0>;
> - };
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml
> new file mode 100644
> index 000000000000..c5c7db3ac2a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/i2c/qcom,i2c-qup.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Universal Peripheral (QUP) I2C controller
> +
> +maintainers:
> +  - Andy Gross <agross@kernel.org>
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description: Binding for Qualcomm "QUP" I2C controllers
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,i2c-qup-v1.1.1
> +      - qcom,i2c-qup-v2.1.1
> +      - qcom,i2c-qup-v2.2.1
> +
> +  reg:
> +    items:
> +      - description: QUP I2C register iospace

Just 'maxItems: 1' is sufficient for a single entry.

> +
> +  clocks:
> +    items:
> +      - description: Core QUP I2C clock
> +      - description: AHB clock
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: iface
> +
> +  clock-frequency:
> +    minimum: 100000
> +    maximum: 1000000
> +    default: 100000
> +
> +  dmas:
> +    items:
> +      - description: RX DMA Channel phandle
> +      - description: TX DMA Channel phandle
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +      - const: tx
> +

> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0

Can drop these. Covered by i2c-controller.yaml

> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-msm8998.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    i2c@c175000 {
> +        compatible = "qcom,i2c-qup-v2.2.1";
> +        reg = <0x0c175000 0x600>;
> +        interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>,
> +                 <&gcc GCC_BLSP1_AHB_CLK>;
> +        clock-names = "core", "iface";
> +        clock-frequency = <400000>;
> +        dmas = <&blsp_dma 4>, <&blsp_dma 5>;
> +        dma-names = "rx", "tx";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +    };
> -- 
> 2.29.2
> 
