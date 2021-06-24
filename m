Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82BEA3B38AB
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jun 2021 23:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232654AbhFXVbW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Jun 2021 17:31:22 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:35354 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbhFXVbW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Jun 2021 17:31:22 -0400
Received: by mail-io1-f48.google.com with SMTP id d9so10093618ioo.2;
        Thu, 24 Jun 2021 14:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y+ykEWYcQLjlgpcIIfyX0n0bLIPZS2IJ5iGmNYAn4LQ=;
        b=SKhEXP4aVWo52jFKi4xUQMNGM3dqz1kXhPguTqTu0V6oKfOgdAghTRxMj71iJyNkUX
         TbLMQDeqVLgBU8iyWt96AEy+KnlDjwYBp3pm0oVqwZ5RxcFHkXr4POde15FHbwJ+fuIK
         TNe+VKHwylY++radweUt76+78F/vxx1ZjF7Iopi6UgIsP5Qmi0/KVxvha0/fbAxmrx97
         rJ8IkZ4PR4YxyRzWYz/cT4IeHxuRc+QM6qff1jS0kdQ5JtdK8yMwhELYTwTiccrq9Z41
         qpycGZCHzQS0e4QVfzrIS/AjUZxaDr3sFpaxt1EzXJ45xdz4uyu2Z/AO4Q8tA1rx0za+
         j2oA==
X-Gm-Message-State: AOAM531GI7xFrqMv8Ij9NHtBjjXPetQSOAxsWZVN0GktUHA8fdJ/sDNo
        DbivPZupOsFfK77Hv5Pgrw==
X-Google-Smtp-Source: ABdhPJxhsWo9K1agrJ//pvcpy6h/mSqqSv/FoLKL8s07k45EF5g8iQyCAq+n+lb59bzOfKRkUO748g==
X-Received: by 2002:a02:3781:: with SMTP id r123mr3387819jar.26.1624570142442;
        Thu, 24 Jun 2021 14:29:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q8sm2118264iot.30.2021.06.24.14.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 14:29:01 -0700 (PDT)
Received: (nullmailer pid 2017356 invoked by uid 1000);
        Thu, 24 Jun 2021 21:28:53 -0000
Date:   Thu, 24 Jun 2021 15:28:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jamin Lin <jamin_lin@aspeedtech.com>
Cc:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Arnd Bergmann <arnd@arndb.de>, Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        Mike Rapoport <rppt@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        chiawei_wang@aspeedtech.com, troy_lee@aspeedtech.com,
        steven_lee@aspeedtech.com
Subject: Re: [PATCH 2/3] dt-bindings: i2c-new: Add bindings for AST2600 I2C
Message-ID: <20210624212853.GA2013136@robh.at.kernel.org>
References: <20210617094424.27123-1-jamin_lin@aspeedtech.com>
 <20210617094424.27123-3-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617094424.27123-3-jamin_lin@aspeedtech.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 17, 2021 at 05:43:39PM +0800, Jamin Lin wrote:
> AST2600 support the new register set of I2C controller
> Add bindings document to support the new driver of I2C
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  .../bindings/i2c/aspeed,new-i2c.yaml          | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,new-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,new-i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,new-i2c.yaml
> new file mode 100644
> index 000000000000..2c264596b138
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,new-i2c.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/aspeed,new-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED I2C on the AST26XX SoCs Device Tree Bindings
> +
> +description: |
> +  ASPEED I2C controller support the new register set since AST26XX
> +  The i2c-global-regs device is used to enable new register set
> +
> +maintainers:
> +  - Ryan Chen <ryan_chen@aspeedtech.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - aspeed,ast2600-i2c-bus
> +      - items:
> +          - enum:
> +              - aspeed,ast2600-i2c-global

This is not an i2c controller and a separate block, so it belongs in 
its own binding doc.

> +          - const: syscon
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2

Drop maxItems. 2 is implied by items length.

> +    items:
> +      - description: address offset and range of bus
> +      - description: address offset and range of bus buffer
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      root clock of bus, should reference the APB
> +      clock in the second cell
> +
> +  resets:
> +    maxItems: 1
> +
> +  bus-frequency:
> +    minimum: 100
> +    maximum: 5000000
> +    default: 100000
> +    description: frequency of the bus clock in Hz defaults to 100 kHz when not
> +      specified
> +
> +  multi-master:
> +    type: boolean
> +    description:
> +      states that there is another master active on this bus
> +
> +  buff-mode:
> +    type: boolean
> +    description:
> +      buffer mode data transfer
> +
> +  byte-mode:
> +    type: boolean
> +    description:
> +      byte mode tata transfer
> +
> +  smbus-alert:
> +    type: boolean
> +    description:
> +      smbus alert protocol
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
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/aspeed-scu-ic.h>
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +
> +    i2c_gr: i2c-global-regs@0 {
> +      compatible = "aspeed,ast2600-i2c-global", "syscon";
> +      reg = <0x0 0x20>;
> +      clocks = <&syscon ASPEED_CLK_APB2>;
> +      resets = <&syscon ASPEED_RESET_I2C>;
> +    };
> +
> +    i2c0: i2c-bus@80 {
> +      compatible = "aspeed,ast2600-i2c-bus";
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      #interrupt-cells = <1>;
> +      reg = <0x80 0x80>, <0xC00 0x20>;
> +      clocks = <&syscon ASPEED_CLK_APB2>;
> +      resets = <&syscon ASPEED_RESET_I2C>;
> +      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +      bus-frequency = <100000>;
> +    };
> -- 
> 2.17.1
> 
> 
