Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E37BE77963F
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Aug 2023 19:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234559AbjHKRh4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Aug 2023 13:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjHKRhz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Aug 2023 13:37:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DACCA8;
        Fri, 11 Aug 2023 10:37:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AE6F9611EB;
        Fri, 11 Aug 2023 17:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F55EC433C7;
        Fri, 11 Aug 2023 17:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691775474;
        bh=fnj+2igSaTtuFkgijJ96vki2+pGJltBRBYpvInfk97U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZnTMmvNg5V0yMddC6Wn6RNvjkRX6rs+smIAuezkxOPUQx85gXEmFSLmqoh4d0p4DI
         cHWwLf5IGAW7YdBWOi5AWsBMHcQqok4vppM1wqmxwCHhs0ws11Qg3QOaIp31Yt26Vd
         GydsI2oNHnyXofopNkmk9hCzQ2CJ0FIhx1zew308C+/z3rognPceo/l9ORkuDYQ2cJ
         PgqlLJUr5+RoNddFKbXEXqpREShXUSZt7Tt4DhDLJMO8nZ2O4j8ZpPFmsUo5j2naUj
         4Ljoz/lwhxCwAGMSUVYP0nCYRH+1xeWhk+mqR7//bw5YbOLANgfzru8z8BaYQzsqEx
         69DUQl6ruUajw==
Received: (nullmailer pid 3652961 invoked by uid 1000);
        Fri, 11 Aug 2023 17:37:52 -0000
Date:   Fri, 11 Aug 2023 11:37:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: add binding for i2c-hotplug-gpio
Message-ID: <20230811173752.GA3639776-robh@kernel.org>
References: <20230729160857.6332-1-clamor95@gmail.com>
 <20230729160857.6332-2-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230729160857.6332-2-clamor95@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jul 29, 2023 at 07:08:56PM +0300, Svyatoslav Ryhel wrote:
> Document device tree schema which describes hot-pluggable via GPIO
> i2c bus.

What's that? 'hot-pluggable via GPIO i2c bus' is not coherent.

> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/i2c/i2c-hotplug-gpio.yaml        | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml
> new file mode 100644
> index 000000000000..21f2b74ca6c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/i2c-hotplug-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO detected hot-plugged I2C bus
> +
> +maintainers:
> +  - Michał Mirosław <mirq-linux@rere.qmqm.pl>
> +
> +description:
> +  Driver for hot-plugged I2C busses, where some devices on a bus

Bindings are for h/w, not a driver.

> +  are hot-pluggable and their presence is indicated by GPIO line.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: i2c-hotplug-gpio
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0

What are these for? You don't have any child nodes.

> +
> +  interrupts-extended:
> +    minItems: 1
> +
> +  detect-gpios:
> +    maxItems: 1
> +
> +  i2c-parent:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - '#address-cells'
> +  - '#size-cells'
> +  - interrupts-extended
> +  - detect-gpios
> +  - i2c-parent
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    /*
> +     * Asus Transformers use I2C hotplug for attachable dock keyboard
> +     */
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c-dock {
> +        compatible = "i2c-hotplug-gpio";
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        interrupts-extended = <&gpio 164 IRQ_TYPE_EDGE_BOTH>;
> +        detect-gpios = <&gpio 164 GPIO_ACTIVE_LOW>;

Looks like the same signal. You should only need one of them. Probably 
'detect-gpios' as I guess you need to read the state of the line.

> +
> +        i2c-parent = <&gen2_i2c>;

Couldn't you just add 'detect-gpios' to the existing bus node? It's 
really part of that bus and there's not a separate bus. That would be a 
lot simpler. I suppose you want to instantiate a driver, but that's not 
DT's problem.

Rob
