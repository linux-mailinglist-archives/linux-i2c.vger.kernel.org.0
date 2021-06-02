Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4348D399465
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jun 2021 22:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbhFBUTH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Jun 2021 16:19:07 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:36611 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhFBUTG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Jun 2021 16:19:06 -0400
Received: by mail-ot1-f47.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so3632754otl.3;
        Wed, 02 Jun 2021 13:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/jmVznYmQTH93X26NjVfXHcldPh3SZGCs6s2/JZMXiE=;
        b=OrwyWOujqXbyo0Dlic9Lds9TIuTbdYNvqjlbDc6FYNWvK9ytF09HQtq1dXPgff35VW
         8bmu3lF+PD3uxjDls2VD8Jzept0hoPE6btR8Z/Tb1RMlRiIknSJCEAAdwl9iMCM6CJW7
         JDe2k8IrV6q7mH58V80MEB2z/AVvc3xbjd2+jf9KQwTY5mlt8ytHCbsZi874IhirPNv4
         nNibUz8yIXD8Ta08tEUVxaaLpLfU3qJuVzATu3zcBF4xHV1OnI4V464FmT9TBlMlBmQQ
         G5SZ4lSuTAkKbuUi3llKSirDPOCS91+MlhJJder83jtdBbYOKDQ8YnY1o6zD0jvMEJM7
         IssQ==
X-Gm-Message-State: AOAM531uFQ24IH4RjzttY4XJY0hcbv1ebhuU+u7j5kCAtIBt05XIU1LU
        Xyv2Eh6WO4/RWeCp9iKsbg==
X-Google-Smtp-Source: ABdhPJyniojfQZIQ5XkjjIwjiuhE4C04qsmxU08698rH3heQFT1ZtGUEhu3qHxE4j9cQaciRdXki9Q==
X-Received: by 2002:a9d:5e8c:: with SMTP id f12mr27237550otl.18.1622665042758;
        Wed, 02 Jun 2021 13:17:22 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q15sm208624oon.28.2021.06.02.13.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 13:17:22 -0700 (PDT)
Received: (nullmailer pid 3920332 invoked by uid 1000);
        Wed, 02 Jun 2021 20:17:20 -0000
Date:   Wed, 2 Jun 2021 15:17:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jamin Lin <jamin_lin@aspeedtech.com>
Cc:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Rayn Chen <rayn_chen@aspeedtech.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
        ryan_chen@aspeedtech.com, chin-ting_kuo@aspeedtech.com,
        troy_lee@aspeedtech.com, steven_lee@aspeedtech.com
Subject: Re: [PATCH v2 1/1] dt-bindings: aspeed-i2c: Convert txt to yaml
 format
Message-ID: <20210602201720.GA3910963@robh.at.kernel.org>
References: <20210527102512.20684-1-jamin_lin@aspeedtech.com>
 <20210527102512.20684-2-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527102512.20684-2-jamin_lin@aspeedtech.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 27, 2021 at 06:25:05PM +0800, Jamin Lin wrote:
> Convert aspeed i2c to yaml.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 86 +++++++++++++++++++
>  .../devicetree/bindings/i2c/i2c-aspeed.txt    | 49 -----------
>  2 files changed, 86 insertions(+), 49 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> new file mode 100644
> index 000000000000..1f7064d77708
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED I2C on the AST24XX, AST25XX, and AST26XX SoCs Device Tree Bindings
> +
> +maintainers:
> +  - Rayn Chen <rayn_chen@aspeedtech.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2400-i2c-bus
> +      - aspeed,ast2500-i2c-bus
> +      - aspeed,ast2600-i2c-bus
> +
> +  "#size-cells":
> +    const: 0
> +
> +  "#address-cells":
> +    const: 1

These 2 are covered by i2c-controller.yaml.

> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description: address offset and range of bus
> +      - description: address offset and range of bus buffer
> +
> +  interrupts:
> +    maxItems: 1
> +    description: interrupt number

Drop. Not a useful description.

> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      root clock of bus, should reference the APB
> +      clock in the second cell
> +
> +  reset:

resets

> +    maxItems: 1
> +    description: phandle to reset controller with the reset number in
> +      the second cell

No need to describe the format of 'resets'.

> +
> +  bus-frequency:
> +    minimum: 500
> +    maximum: 4000000
> +    default: 100000
> +    description: frequency of the bus clock in Hz defaults to 100 kHz when not
> +      specified
> +
> +  multi-master:
> +    type: boolean
> +    description:
> +      states that there is another master active on this bus
> +
> +required:
> +  - reg
> +  - compatible
> +  - clocks
> +  - resets
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    i2c0: i2c-bus@40 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      #interrupt-cells = <1>;
> +      reg = <0x40 0x40>;
> +      compatible = "aspeed,ast2500-i2c-bus";

Convention is compatible first in the list of properties.

> +      clocks = <&syscon ASPEED_CLK_APB>;
> +      resets = <&syscon ASPEED_RESET_I2C>;
> +      bus-frequency = <100000>;
> +      interrupts = <0>;
> +      interrupt-parent = <&i2c_ic>;
> +      status = "disabled";

Don't show status in examples especially when disabling disables some 
validation...

> +      /* Does not need pinctrl properties */
> +    };
