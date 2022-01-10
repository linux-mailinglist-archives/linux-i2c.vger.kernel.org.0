Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC2A648A29A
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jan 2022 23:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241425AbiAJWTD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jan 2022 17:19:03 -0500
Received: from mail-oi1-f172.google.com ([209.85.167.172]:34584 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233977AbiAJWTD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jan 2022 17:19:03 -0500
Received: by mail-oi1-f172.google.com with SMTP id r131so20557643oig.1;
        Mon, 10 Jan 2022 14:19:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4fI2fNIwN0HoAziyHrYlHNkRkROkw7ilQQ3nQUt41GU=;
        b=Fvez5mZeUUTmA1abRRFR5T7DL/8+ljKiSk6y3Hlw6Zb3VRRrEMMpSqrwQ0u6JMnodE
         QxF9ox22+y12JJ/b0jzqv9smaumiZ/npMBbO8BaQrPYwijTeEmrZ7WwLoz84DTC2wI+f
         znr/UlVSl0M38suX15f+2kFquJ9edQx5CpNBQ6UBKAlVwHfkcT8f6n8auR4r+U0gmUME
         DZc9yM69Acts4GDYLbdV1zVcUmNOIl+wATi3pMaBz8PtpaxPOMybS232QyAa8Xz1DEp0
         zw4uHQ3Meu2SjJBI9tQ/Oa/yKjMVp8plxWZI/ENnAp4D+bgev9p66/9sikdLo+dbUAfB
         v4NQ==
X-Gm-Message-State: AOAM533GFS1Sl/kdmNfAcK7wL9EGsS/zZDVjsmB5w1sWTkunRZStq6Fk
        KGxHHpNQuzBnWIQmO3zsTmiXf3Qv9Q==
X-Google-Smtp-Source: ABdhPJzQUAjvmuKjO91qlwzuYoMB9qXz0jc5g3WW3QfhlYUW6DDCO+pr1K0W6HgeJ43cm88/4t+K+A==
X-Received: by 2002:a05:6808:144f:: with SMTP id x15mr1055430oiv.166.1641853142440;
        Mon, 10 Jan 2022 14:19:02 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id y10sm1735448oto.44.2022.01.10.14.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 14:19:01 -0800 (PST)
Received: (nullmailer pid 1625991 invoked by uid 1000);
        Mon, 10 Jan 2022 22:19:01 -0000
Date:   Mon, 10 Jan 2022 16:19:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Li-hao Kuo <lhjeff911@gmail.com>
Cc:     p.zabel@pengutronix.de, daniel.thompson@linaro.org,
        lee.jones@linaro.org, u.kleine-koenig@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, lh.kuo@sunplus.com,
        wells.lu@sunplus.com
Subject: Re: [PATCH v3 2/2] devicetree bindings I2C Add bindings doc for
 Sunplus SP7021
Message-ID: <Ydyw1bMJB41Cyflb@robh.at.kernel.org>
References: <cover.1641188699.git.lhjeff911@gmail.com>
 <9831c3acbbd34ad0d82eec67916f51bff68ae7fe.1641188699.git.lhjeff911@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9831c3acbbd34ad0d82eec67916f51bff68ae7fe.1641188699.git.lhjeff911@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 03, 2022 at 01:49:23PM +0800, Li-hao Kuo wrote:
> Add devicetree bindings I2C Add bindings doc for Sunplus SP7021
> 
> Signed-off-by: Li-hao Kuo <lhjeff911@gmail.com>
> ---
> Changes in v3:
>  - Addressed all comments from Mr. Rob Herring.
>  - Modified the structure and register access method.
>  - Modifiedthe the YAML file.
> 
>  .../devicetree/bindings/i2c/i2c-sunplus.yaml       | 72 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml b/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
> new file mode 100644
> index 0000000..ac03041
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (C) Sunplus Co., Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/i2c-sunplus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sunplus I2C controller
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +maintainers:
> +  - Li-hao Kuo <lhjeff911@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sunplus,sp7021-i2cm
> +      - sunplus,q645-i2cm
> +
> +  reg:
> +    items:
> +      - description: I2C registers
> +      - description: I2C DMA registers
> +      - description: I2C DMA power registers
> +
> +  reg-names:
> +    items:
> +      - const: i2cm
> +      - const: i2cmdma
> +      - const: i2cdmapower
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - resets
> +  - pinctrl-names
> +  - pinctrl-0
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/sp-sp7021.h>
> +    #include <dt-bindings/reset/sp-sp7021.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c@9C004600 {
> +        compatible = "sunplus,sp7021-i2cm";
> +			reg = <0x9c004600 0x80>, <0x9c004680 0x80>, <0x9c000000 0x80>;
> +			reg-names = "i2cm", "i2cmdma", "i2cdmapower";

Indentation is messed up. Use spaces.

> +        interrupt-parent = <&intc>;
> +        interrupts = <174 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clkc I2CM0>;
> +        resets = <&rstc RST_I2CM0>;
> +        clock-frequency = <100000>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&i2cm0_pins>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a06993b..2b8fa55 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18246,6 +18246,7 @@ SUNPLUS I2C CONTROLLER INTERFACE DRIVER
>  M:	Li-hao Kuo <lhjeff911@gmail.com>
>  L:	linux-i2c@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
>  F:	drivers/i2c/busses/i2c-sunplus.c
>  
>  SUPERH
> -- 
> 2.7.4
> 
> 
