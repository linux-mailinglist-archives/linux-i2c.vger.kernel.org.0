Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD2A168199
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2020 16:29:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729015AbgBUP3F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Feb 2020 10:29:05 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59182 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728528AbgBUP3E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Feb 2020 10:29:04 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id C5347294EDD
Subject: Re: [PATCH v4 1/2] dt-bindings: i2c: cros-ec-tunnel: convert
 i2c-cros-ec-tunnel.txt to yaml
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-i2c@vger.kernel.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, bleung@chromium.org,
        groeck@chromium.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        sebastian.reichel@collabora.com
References: <20200221123214.26341-1-dafna.hirschfeld@collabora.com>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <f903795e-cd62-7407-2da2-bea3a1df8da0@collabora.com>
Date:   Fri, 21 Feb 2020 16:28:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221123214.26341-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dafna,

On 21/2/20 13:32, Dafna Hirschfeld wrote:
> Convert the binding file i2c-cros-ec-tunnel.txt to yaml format.
> 
> This was tested and verified on ARM and ARM64 with:
> 
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.yaml
> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.yaml
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
> Changes since v1:
> - changing the subject to start with "dt-bindings: i2c: cros-ec-tunnel:"
> - changing the license to (GPL-2.0-only OR BSD-2-Clause)
> - removing "Guenter Roeck <groeck@chromium.org>" from the maintainers list
> - adding ref: /schemas/i2c/i2c-controller.yaml
> 
> Changes since v2:
> - adding another patch that fixes a warning found by this patch
> 
> Changes since v3:
> - In the example, change sbs-battery@b to battery@b
> 
> 
>  .../bindings/i2c/i2c-cros-ec-tunnel.txt       | 39 ------------
>  .../bindings/i2c/i2c-cros-ec-tunnel.yaml      | 63 +++++++++++++++++++
>  2 files changed, 63 insertions(+), 39 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.yaml
> 

According to the feedback I received on another patch from Rob, seems that you
should name the file with the full compatible string
"google,i2c-cros-ec-tunnel.yaml"

I know we didn't do this with the extcon-usbc-cros-ec.yaml but seems this is the
right way to do it. Just take this in consideration for future patches.


> diff --git a/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt b/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt
> deleted file mode 100644
> index 898f030eba62..000000000000
> --- a/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -I2C bus that tunnels through the ChromeOS EC (cros-ec)
> -======================================================
> -On some ChromeOS board designs we've got a connection to the EC (embedded
> -controller) but no direct connection to some devices on the other side of
> -the EC (like a battery and PMIC).  To get access to those devices we need
> -to tunnel our i2c commands through the EC.
> -
> -The node for this device should be under a cros-ec node like google,cros-ec-spi
> -or google,cros-ec-i2c.
> -
> -
> -Required properties:
> -- compatible: google,cros-ec-i2c-tunnel
> -- google,remote-bus: The EC bus we'd like to talk to.
> -
> -Optional child nodes:
> -- One node per I2C device connected to the tunnelled I2C bus.
> -
> -
> -Example:
> -	cros-ec@0 {
> -		compatible = "google,cros-ec-spi";
> -
> -		...
> -
> -		i2c-tunnel {
> -			compatible = "google,cros-ec-i2c-tunnel";
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			google,remote-bus = <0>;
> -
> -			battery: sbs-battery@b {
> -				compatible = "sbs,sbs-battery";
> -				reg = <0xb>;
> -				sbs,poll-retry-count = <1>;
> -			};
> -		};
> -	}
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.yaml b/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.yaml
> new file mode 100644
> index 000000000000..cfe4f0aeb46f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/i2c-cros-ec-tunnel.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: I2C bus that tunnels through the ChromeOS EC (cros-ec)
> +
> +maintainers:
> +  - Benson Leung <bleung@chromium.org>
> +  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> +
> +description: |
> +  On some ChromeOS board designs we've got a connection to the EC (embedded
> +  controller) but no direct connection to some devices on the other side of
> +  the EC (like a battery and PMIC). To get access to those devices we need
> +  to tunnel our i2c commands through the EC.
> +  The node for this device should be under a cros-ec node like google,cros-ec-spi
> +  or google,cros-ec-i2c.
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const:
> +      google,cros-ec-i2c-tunnel
> +
> +  google,remote-bus:
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    description: The EC bus we'd like to talk to.
> +
> +  "#address-cells": true
> +  "#size-cells": true
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    type: object
> +    description: One node per I2C device connected to the tunnelled I2C bus.
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - google,remote-bus
> +
> +examples:
> +  - |
> +    cros-ec@0 {
> +        compatible = "google,cros-ec-spi";

Like we did with the extcon-usbc-cros-ec.yaml I think would be nice have a
complete example here too.

+    spi0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        cros-ec@0 {
+            compatible = "google,cros-ec-spi";
+            reg = <0>;


> +        i2c-tunnel {
> +            compatible = "google,cros-ec-i2c-tunnel";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            google,remote-bus = <0>;
> +
> +            battery: battery@b {
> +                compatible = "sbs,sbs-battery";
> +                reg = <0xb>;
> +                sbs,poll-retry-count = <1>;
> +            };
> +        };
> +    };
> 
