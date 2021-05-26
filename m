Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5974B39212F
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 21:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234521AbhEZT6L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 May 2021 15:58:11 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:63453 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233845AbhEZT6I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 May 2021 15:58:08 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 690ED40004;
        Wed, 26 May 2021 19:56:33 +0000 (UTC)
Date:   Wed, 26 May 2021 21:56:33 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: rtc: nxp,pcf8563: Convert to DT
 schema
Message-ID: <YK6n8W2G4/I8+DXP@piout.net>
References: <20210526184839.2937899-1-robh@kernel.org>
 <20210526184839.2937899-3-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526184839.2937899-3-robh@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 26/05/2021 13:48:35-0500, Rob Herring wrote:
> Convert the Philips PCF8563/Epson RTC8564 binding to DT schema format.
> 
> Add 'interrupts' and 'wakeup-source' as this device has an interrupt
> which was not documented, but in use. Add 'start-year' as well.
> 
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
> v2:
>  - Add reference to rtc.yaml and wakeup-source and start-year properties
> ---
>  .../devicetree/bindings/rtc/nxp,pcf8563.yaml  | 56 +++++++++++++++++++
>  .../devicetree/bindings/rtc/pcf8563.txt       | 29 ----------
>  2 files changed, 56 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
>  delete mode 100644 Documentation/devicetree/bindings/rtc/pcf8563.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
> new file mode 100644
> index 000000000000..a542b6c7ff44
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/nxp,pcf8563.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Philips PCF8563/Epson RTC8564 Real Time Clock
> +
> +maintainers:
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - epson,rtc8564
> +      - microcrystal,rv8564
> +      - nxp,pcf8563
> +      - nxp,pca8565
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  clock-output-names:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  start-year: true
> +  wakeup-source: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        rtc@51 {
> +            compatible = "nxp,pcf8563";
> +            reg = <0x51>;
> +            #clock-cells = <0>;
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/rtc/pcf8563.txt b/Documentation/devicetree/bindings/rtc/pcf8563.txt
> deleted file mode 100644
> index 0a900f7c8977..000000000000
> --- a/Documentation/devicetree/bindings/rtc/pcf8563.txt
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -* Philips PCF8563/Epson RTC8564 Real Time Clock
> -
> -Philips PCF8563/Epson RTC8564 Real Time Clock
> -
> -Required properties:
> -- compatible: Should contain "nxp,pcf8563",
> -	"epson,rtc8564" or
> -	"microcrystal,rv8564" or
> -	"nxp,pca8565"
> -- reg: I2C address for chip.
> -
> -Optional property:
> -- #clock-cells: Should be 0.
> -- clock-output-names:
> -  overwrite the default clock name "pcf8563-clkout"
> -
> -Example:
> -
> -pcf8563: pcf8563@51 {
> -	compatible = "nxp,pcf8563";
> -	reg = <0x51>;
> -	#clock-cells = <0>;
> -};
> -
> -device {
> -...
> -	clocks = <&pcf8563>;
> -...
> -};
> -- 
> 2.27.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
