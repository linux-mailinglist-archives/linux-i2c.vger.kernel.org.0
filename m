Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 138754886D9
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Jan 2022 00:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233140AbiAHXOx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jan 2022 18:14:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbiAHXOx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Jan 2022 18:14:53 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59948C06173F;
        Sat,  8 Jan 2022 15:14:53 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2CBCA1B;
        Sun,  9 Jan 2022 00:14:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641683691;
        bh=7Aio/iRDAxNunTbg8WsiGIhvJ9QnXJxaQ4E1tDijvNQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aNSEDsJgvdh4F4knVbBevLF9EM7wlrg3IO2x89Wb6re7ziDtXxmE/mhQJK4VJfpWz
         ea8FZ3qoPxmUF1P7olq/+Ic75FLIqcyoudgr58sOrPtKGRCC6rIo31B7MlQf4uNVnL
         9i+ohMduDNFqYcy0nDW507xCtoSuE8YOYADrWgr0=
Date:   Sun, 9 Jan 2022 01:14:42 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: Add Maxim MAX735x/MAX736x
 variants
Message-ID: <Ydoa4nK8PjzZGQ9F@pendragon.ideasonboard.com>
References: <20220108185759.2086347-1-patrick.rudolph@9elements.com>
 <20220108185759.2086347-2-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220108185759.2086347-2-patrick.rudolph@9elements.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Patrick,

Thank you for the patch.

On Sat, Jan 08, 2022 at 07:57:55PM +0100, Patrick Rudolph wrote:
> Add the Maxim MAX735x/MAX736x as supported chip and give an example
> how to use it. The functionality will be provided by the exisintg
> pca954x driver.

While DT bindings and drivers are decoupled, the fact that the same
driver provides support for the MAX735x/MAX736x indicates there's some
similarity between those and the PCA954x chips. Would they be similar
enough to have a single DT binding schema file ? This file looks very
similar to Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml.

> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  .../bindings/i2c/i2c-mux-max735x.yaml         | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux-max735x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-max735x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-max735x.yaml
> new file mode 100644
> index 000000000000..dc924ec934ca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-max735x.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/i2c-mux-max735x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim MAX735x/MAX736x I2C bus switch
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +description:
> +  The binding supports Maxim MAX735x and MAX736x I2C mux/switch devices.
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-mux.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - maxim,max7367
> +              - maxim,max7369
> +    then:
> +      properties:
> +        interrupts: true
> +
> +        "#interrupt-cells":
> +          const: 2
> +
> +        interrupt-controller: true
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - maxim,max7356
> +          - maxim,max7357
> +          - maxim,max7358
> +          - maxim,max7367
> +          - maxim,max7368
> +          - maxim,max7369
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  i2c-mux-idle-disconnect:
> +    type: boolean
> +    description: Forces mux to disconnect all children in idle state. This is
> +      necessary for example, if there are several multiplexers on the bus and
> +      the devices behind them use same I2C addresses.
> +
> +  idle-state:
> +    description: if present, overrides i2c-mux-idle-disconnect
> +    $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        i2c-mux@74 {
> +            compatible = "maxim,max7357";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0x74>;
> +
> +            i2c@1 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <1>;
> +
> +                eeprom@54 {
> +                    compatible = "atmel,24c08";
> +                    reg = <0x54>;
> +                };
> +            };
> +
> +            i2c@7 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <7>;
> +
> +                rtc@51 {
> +                    compatible = "nxp,pcf8563";
> +                    reg = <0x51>;
> +                };
> +            };
> +        };
> +    };
> +...

-- 
Regards,

Laurent Pinchart
