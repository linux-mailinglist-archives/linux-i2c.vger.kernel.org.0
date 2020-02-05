Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF121536F8
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2020 18:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgBERrq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Feb 2020 12:47:46 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44974 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbgBERrp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Feb 2020 12:47:45 -0500
Received: by mail-wr1-f68.google.com with SMTP id m16so3791843wrx.11;
        Wed, 05 Feb 2020 09:47:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CYLfMRQOnfB9NcsP3jbmvn6lucoo/vUebKxirhMntc0=;
        b=tnm44IXJ1eniMLeztRtHWnM9AwcJ+TGr2TsJ8OKwvmrQuTyUARXpabN8l0FDHnNrv5
         0Q17YoiBIo3HyMUeHBlCfx6JC1xc6+hlgEHrsVrmm721vJemwZVJsq1iD0Fx7RKGBbue
         sGJnjSUhkHSrldPFqLZjEF0Uz2yEmF+DII+d2v2Lki4TAjIizvgAIyDpsw+DNhVspx4J
         wab/gMU2Ahe4c/jbdt5+kQuaEgWdQFS5E92Z4TIGpY5Iww7DbxIGUg8CG5nPqGvVgIVb
         +7dVNtP74D7gIAvZt4t2GSO+6NqbPkpCKCgRwevR+TtunDvEmUyquZVJU2uSwj2Vhfp4
         Yh1A==
X-Gm-Message-State: APjAAAWm5atDHrolSkbJDaDi0qSwHBFe6JINvvHRUF/fW28gywxakkD9
        Lne2u1PIen9+16wDNJIF+g==
X-Google-Smtp-Source: APXvYqztCHUsi45+Mt62Wd/cXHFhEBCqL5ykVTJiCzLLf1seeZgXV2jDrI41CauiGVreIOnEmV30nA==
X-Received: by 2002:adf:fe43:: with SMTP id m3mr31718793wrs.213.1580924862634;
        Wed, 05 Feb 2020 09:47:42 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id u14sm659294wrm.51.2020.02.05.09.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 09:47:42 -0800 (PST)
Received: (nullmailer pid 26578 invoked by uid 1000);
        Wed, 05 Feb 2020 17:47:40 -0000
Date:   Wed, 5 Feb 2020 17:47:40 +0000
From:   Rob Herring <robh@kernel.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-i2c@vger.kernel.org, mark.rutland@arm.com,
        bleung@chromium.org, enric.balletbo@collabora.com,
        groeck@chromium.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com
Subject: Re: [PATCH] dt-bindings: convert i2c-cros-ec-tunnel.txt to yaml
Message-ID: <20200205174740.GA10738@bogus>
References: <20200127161213.13339-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200127161213.13339-1-dafna.hirschfeld@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 27, 2020 at 05:12:13PM +0100, Dafna Hirschfeld wrote:
> Convert the binding file i2c-cros-ec-tunnel.txt to yaml format.
> 
> This was tested and verified on ARM and ARM64 with:
> 
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.yaml
> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.yaml
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  .../bindings/i2c/i2c-cros-ec-tunnel.txt       | 39 ------------
>  .../bindings/i2c/i2c-cros-ec-tunnel.yaml      | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 39 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.yaml
> 
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
> index 000000000000..c1383e607f47
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: GPL-2.0
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
> +  - Guenter Roeck <groeck@chromium.org>
> +
> +description: |
> +  On some ChromeOS board designs we've got a connection to the EC (embedded
> +  controller) but no direct connection to some devices on the other side of
> +  the EC (like a battery and PMIC). To get access to those devices we need
> +  to tunnel our i2c commands through the EC.
> +  The node for this device should be under a cros-ec node like google,cros-ec-spi
> +  or google,cros-ec-i2c.

You should have a ref to /schemas/i2c-controller.yaml here.

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
> +        i2c-tunnel {
> +            compatible = "google,cros-ec-i2c-tunnel";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            google,remote-bus = <0>;
> +
> +            battery: sbs-battery@b {
> +                compatible = "sbs,sbs-battery";
> +                reg = <0xb>;
> +                sbs,poll-retry-count = <1>;
> +            };
> +        };
> +    };
> -- 
> 2.17.1
> 
