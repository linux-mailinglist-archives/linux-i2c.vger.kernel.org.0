Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09EBE506CB8
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Apr 2022 14:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352397AbiDSMs4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Apr 2022 08:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350314AbiDSMsz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Apr 2022 08:48:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09AC736328;
        Tue, 19 Apr 2022 05:46:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-11-253-nat.elisa-mobile.fi [85.76.11.253])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EC4A25B;
        Tue, 19 Apr 2022 14:46:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650372369;
        bh=O+gH+rTCR/vvHYsgAZ5AlKxyNWOnO0lDWJVxpTLeLQ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OBZ77c4rUjk70vfBC5jVk7sWJnpcXHOBzlSOp07F+yaM9+gKNo4PI/TNnGOAPXRO9
         6KY/E2ufhUe6u+rSOAkGAEboHosSqwECgNS1pUwyZ7JUjRk63L7KiRv1nWSPoQwLGC
         yqLwdgRv3/kLkb65l5+2lrEE+Dn1WF/bZM+U0mA0=
Date:   Tue, 19 Apr 2022 15:46:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [v8 1/3] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Message-ID: <Yl6vD1tu1U24AuFB@pendragon.ideasonboard.com>
References: <20220419124025.1733230-1-patrick.rudolph@9elements.com>
 <20220419124025.1733230-2-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220419124025.1733230-2-patrick.rudolph@9elements.com>
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

On Tue, Apr 19, 2022 at 02:40:22PM +0200, Patrick Rudolph wrote:
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 39 ++++++++++++++++---
>  1 file changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> index 9f1726d0356b..21ab286c74f2 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> @@ -4,21 +4,25 @@
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
> -
> -allOf:
> -  - $ref: /schemas/i2c/i2c-mux.yaml#
> +  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices,
> +  and the Maxim MAX735x and MAX736x I2C mux/switch devices.
>  
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
> @@ -59,10 +63,33 @@ properties:
>      description: if present, overrides i2c-mux-idle-disconnect
>      $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
>  
> +  vdd-supply:
> +    description: A voltage regulator supplying power to the chip.
> +
>  required:
>    - compatible
>    - reg
>  
> +allOf:
> +  - $ref: /schemas/i2c/i2c-mux.yaml#
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - maxim,max7367
> +                - maxim,max7369
> +                - nxp,pca9542
> +                - nxp,pca9543
> +                - nxp,pca9544
> +                - nxp,pca9545
> +      then:
> +        properties:
> +          interrupts: false
> +          "#interrupt-cells": false
> +          interrupt-controller: false
> +
>  unevaluatedProperties: false
>  
>  examples:
> @@ -79,6 +106,8 @@ examples:
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
