Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0384F48EE
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Apr 2022 02:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231779AbiDEVzm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Apr 2022 17:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1392147AbiDEPfq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Apr 2022 11:35:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF9F710DB;
        Tue,  5 Apr 2022 06:46:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8D535D;
        Tue,  5 Apr 2022 15:46:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1649166397;
        bh=NozpGi0NsTMG/sB7xLGYVBuLZzmbJ7B3Gwh+tj4+cQI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G8zkeM3lID2r8WMzYcbEXGAKX30vNSczc4ScWlOdPdazVH/RfNFQL0KJdhysWOadF
         UCQQNWpNkGeaaTSgDAiZVcb+ZdCBuPEJQszJlD+quolRO/UOwM3K1+BDhoqKaHBHyj
         YDypJs7DW5COOEgATFL/Z3vHTMi97p9eqOQGL8UM=
Date:   Tue, 5 Apr 2022 16:46:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [v7 1/3] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Message-ID: <YkxIOgTl876orHbf@pendragon.ideasonboard.com>
References: <20220405120552.433415-1-patrick.rudolph@9elements.com>
 <20220405120552.433415-2-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220405120552.433415-2-patrick.rudolph@9elements.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Patrick,

Thank you for the patch.

On Tue, Apr 05, 2022 at 02:05:49PM +0200, Patrick Rudolph wrote:
> Update the pca954x bindings to add support for the Maxim MAX735x/MAX736x
> chips. The functionality will be provided by the exisintg pca954x driver.
> 
> While on it make the interrupts support conditionally as not all of the
> existing chips have interrupts.
> 
> For chips that are powered off by default add an optional regulator
> called vdd-supply.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 44 ++++++++++++++-----
>  1 file changed, 34 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> index 9f1726d0356b..132c3e54e7ab 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> @@ -4,21 +4,48 @@
>  $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: NXP PCA954x I2C bus switch
> +title: NXP PCA954x I2C and compatible bus switches
>  
>  maintainers:
>    - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  
>  description:
> -  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices.
> +  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices,
> +  and the Maxim MAX735x and MAX736x I2C mux/switch devices.
>  
>  allOf:
>    - $ref: /schemas/i2c/i2c-mux.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - maxim,max7367
> +              - maxim,max7369
> +              - nxp,pca9542
> +              - nxp,pca9543
> +              - nxp,pca9544
> +              - nxp,pca9545
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +
> +        "#interrupt-cells":
> +          const: 2
> +
> +        interrupt-controller: true

It feels a bit out of place to have those properties listed before the
main "properties" property, but we can only have a sincel allOf. I
wonder if the i2c-mux schema could be selected automatically based on
node name, but that's out of scope for this patch.

I thought it was more customary to define properties in the main
"properties" property, and then have

if:
  not:
    properties:
      compatible:
        contains:
          enum:
            - maxim,max7367
            - maxim,max7369
            - nxp,pca9542
            - nxp,pca9543
            - nxp,pca9544
            - nxp,pca9545
  then:
    properties:
      interrupts: false
      "#interrupt-cells": false
      interrupt-controller: false

I don't mind much either way though, but if one option is preferred over
the other, we may want to be consistent.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - maxim,max7356
> +          - maxim,max7357
> +          - maxim,max7358
> +          - maxim,max7367
> +          - maxim,max7368
> +          - maxim,max7369
>            - nxp,pca9540
>            - nxp,pca9542
>            - nxp,pca9543
> @@ -38,14 +65,6 @@ properties:
>    reg:
>      maxItems: 1
>  
> -  interrupts:
> -    maxItems: 1
> -
> -  "#interrupt-cells":
> -    const: 2
> -
> -  interrupt-controller: true
> -
>    reset-gpios:
>      maxItems: 1
>  
> @@ -59,6 +78,9 @@ properties:
>      description: if present, overrides i2c-mux-idle-disconnect
>      $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
>  
> +  vdd-supply:
> +    description: A voltage regulator supplying power to the chip.
> +
>  required:
>    - compatible
>    - reg
> @@ -79,6 +101,8 @@ examples:
>              #size-cells = <0>;
>              reg = <0x74>;
>  
> +            vdd-supply = <&p3v3>;
> +
>              interrupt-parent = <&ipic>;
>              interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
>              interrupt-controller;

-- 
Regards,

Laurent Pinchart
