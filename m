Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1438E47413C
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Dec 2021 12:13:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbhLNLNz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Dec 2021 06:13:55 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:36354 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbhLNLNz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Dec 2021 06:13:55 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BE4B8C4;
        Tue, 14 Dec 2021 12:13:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639480433;
        bh=6nPRmmvGcER3yg7mqkdC2HaRGmHh4NE1mbViJtHHWH0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XYIoCQHiC6g9sOnexmfEaQl8ZvQ5OG1lyGhEV8VwaYxAgA/E9IeCDqPm8LMnGMUXV
         N7+uNFKObkMF/LZpp2F3BPjZ6Gd87Kn8p7ay/GtxAb0G2McAsdkwDbTa1OGtAyqJHX
         Ko54v4c2nQM3viU/R4Ck49NHfBnEmumuFsH+XooE=
Date:   Tue, 14 Dec 2021 13:13:52 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: i2c Update PCA954x
Message-ID: <Ybh8cCU/zbfXkXYO@pendragon.ideasonboard.com>
References: <20211214095021.572799-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211214095021.572799-1-patrick.rudolph@9elements.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Patrick,

Thank you for the patch.

On Tue, Dec 14, 2021 at 10:50:18AM +0100, Patrick Rudolph wrote:
> Add the Maxim MAX735x as supported chip to PCA954x and add an
> example how to use it.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> index 9f1726d0356b..bd794cb80c11 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> @@ -11,6 +11,7 @@ maintainers:
>  
>  description:
>    The binding supports NXP PCA954x and PCA984x I2C mux/switch devices.
> +  Compatible with Maxim MAX7356 - MAX7358 I2C mux/switch devices.
>  
>  allOf:
>    - $ref: /schemas/i2c/i2c-mux.yaml#
> @@ -19,6 +20,9 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - maxim,max7356
> +          - maxim,max7357
> +          - maxim,max7358
>            - nxp,pca9540
>            - nxp,pca9542
>            - nxp,pca9543
> @@ -40,6 +44,7 @@ properties:
>  
>    interrupts:
>      maxItems: 1
> +    description: Only supported on NXP devices. Unsupported on Maxim MAX735x.

Could this be modelled by a YAML schema instead ? Something like

allOf:
  - if:
      properties:
        compatible:
	  contains:
	    enum:
              - maxim,max7356
              - maxim,max7357
              - maxim,max7358
    then:
      properties:
        interrupts: false

(untested, it would be nice to use a pattern check for the compatible
property if possible)

>  
>    "#interrupt-cells":
>      const: 2
> @@ -100,6 +105,41 @@ examples:
>                  #size-cells = <0>;
>                  reg = <4>;
>  
> +                rtc@51 {
> +                    compatible = "nxp,pcf8563";
> +                    reg = <0x51>;
> +                };
> +            };
> +        };
> +    };
> +
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
>                  rtc@51 {
>                      compatible = "nxp,pcf8563";
>                      reg = <0x51>;

-- 
Regards,

Laurent Pinchart
