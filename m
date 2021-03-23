Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A164346AE1
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Mar 2021 22:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233536AbhCWVQQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 17:16:16 -0400
Received: from mail-il1-f182.google.com ([209.85.166.182]:37395 "EHLO
        mail-il1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233525AbhCWVPn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Mar 2021 17:15:43 -0400
Received: by mail-il1-f182.google.com with SMTP id z9so19474818ilb.4;
        Tue, 23 Mar 2021 14:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E+5BG5vFz63Xr32skD1RHumHzYiU0njvUnwlVoUcASI=;
        b=Y0oCEWmoZHhxMKYcisHycNEn6tWR4zWCMoCfZgMpNO71N8O+MZr2gRK97meqHRygfv
         8KXR/G6nhXAcfHZmAoUGpcsi2jZsNQq2YMi1NgXueDMQJMIPYvwZDvGglFxoZ16nWMHl
         H/d/9JhPuMenm+mfZWE8yCyfTmbCWjLHt1yLC0uZfORIbb4nPWNwYydbJLyK3MJajs5I
         1GeTpbuNF/AaOprG4aoodOB0GPq+sWId3WbaOvFqjNk0TvCZB1BcX66/VCdYNUhC/Fsv
         2H5tftg9ytB0TpbznsZyQaCIZ/kJahZ0Bh1pRuQ5KHw5fZBlhi+RkcgB7P3LRrIyQLc7
         OumQ==
X-Gm-Message-State: AOAM532b0uWqyE3wN5zqtOWOYvPdzMl7NW/VHXF3ycmgndr8PSJcXi5u
        b46mKOYhpvv+g8JbQNq3Hg==
X-Google-Smtp-Source: ABdhPJwRvZ8qZVmXcihKuPjqUYJOkMliriGo7xngHqWw28I06bKtqiOwjMf1bkXZjgRv2cgPbhtn2g==
X-Received: by 2002:a05:6e02:20ce:: with SMTP id 14mr148828ilq.25.1616534142183;
        Tue, 23 Mar 2021 14:15:42 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id u10sm35395ill.30.2021.03.23.14.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 14:15:41 -0700 (PDT)
Received: (nullmailer pid 1337245 invoked by uid 1000);
        Tue, 23 Mar 2021 21:15:39 -0000
Date:   Tue, 23 Mar 2021 15:15:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     linux@roeck-us.net, wsa@kernel.org, jdelvare@suse.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: i2c: convert i2c-mpc to json-schema
Message-ID: <20210323211539.GB1326908@robh.at.kernel.org>
References: <20210323043331.21878-1-chris.packham@alliedtelesis.co.nz>
 <20210323043331.21878-3-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323043331.21878-3-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 23, 2021 at 05:33:27PM +1300, Chris Packham wrote:
> Convert i2c-mpc to YAML.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  .../devicetree/bindings/i2c/i2c-mpc.txt       | 62 ------------
>  .../devicetree/bindings/i2c/i2c-mpc.yaml      | 99 +++++++++++++++++++
>  2 files changed, 99 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mpc.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mpc.txt b/Documentation/devicetree/bindings/i2c/i2c-mpc.txt
> deleted file mode 100644
> index b15acb43d84d..000000000000
> --- a/Documentation/devicetree/bindings/i2c/i2c-mpc.txt
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -* I2C
> -
> -Required properties :
> -
> - - reg : Offset and length of the register set for the device
> - - compatible : should be "fsl,CHIP-i2c" where CHIP is the name of a
> -   compatible processor, e.g. mpc8313, mpc8543, mpc8544, mpc5121,
> -   mpc5200 or mpc5200b. For the mpc5121, an additional node
> -   "fsl,mpc5121-i2c-ctrl" is required as shown in the example below.
> - - interrupts : <a b> where a is the interrupt number and b is a
> -   field that represents an encoding of the sense and level
> -   information for the interrupt.  This should be encoded based on
> -   the information in section 2) depending on the type of interrupt
> -   controller you have.
> -
> -Recommended properties :
> -
> - - fsl,preserve-clocking : boolean; if defined, the clock settings
> -   from the bootloader are preserved (not touched).
> - - clock-frequency : desired I2C bus clock frequency in Hz.
> - - fsl,timeout : I2C bus timeout in microseconds.
> -
> -Examples :
> -
> -	/* MPC5121 based board */
> -	i2c@1740 {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		compatible = "fsl,mpc5121-i2c", "fsl-i2c";
> -		reg = <0x1740 0x20>;
> -		interrupts = <11 0x8>;
> -		interrupt-parent = <&ipic>;
> -		clock-frequency = <100000>;
> -	};
> -
> -	i2ccontrol@1760 {
> -		compatible = "fsl,mpc5121-i2c-ctrl";
> -		reg = <0x1760 0x8>;
> -	};
> -
> -	/* MPC5200B based board */
> -	i2c@3d00 {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		compatible = "fsl,mpc5200b-i2c","fsl,mpc5200-i2c","fsl-i2c";
> -		reg = <0x3d00 0x40>;
> -		interrupts = <2 15 0>;
> -		interrupt-parent = <&mpc5200_pic>;
> -		fsl,preserve-clocking;
> -	};
> -
> -	/* MPC8544 base board */
> -	i2c@3100 {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		compatible = "fsl,mpc8544-i2c", "fsl-i2c";
> -		reg = <0x3100 0x100>;
> -		interrupts = <43 2>;
> -		interrupt-parent = <&mpic>;
> -		clock-frequency = <400000>;
> -		fsl,timeout = <10000>;
> -	};
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> new file mode 100644
> index 000000000000..97cea8a817ea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: I2C-Bus adapter for MPC824x/83xx/85xx/86xx/512x/52xx SoCs
> +
> +maintainers:
> +  - Chris Packham <chris.packham@alliedtelesis.co.nz>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    anyOf:
> +      - items:
> +        - enum:
> +          - mpc5200-i2c
> +          - fsl,mpc5200b-i2c
> +          - fsl,mpc5200-i2c
> +          - fsl,mpc5121-i2c
> +          - fsl,mpc8313-i2c
> +          - fsl,mpc8543-i2c
> +          - fsl,mpc8544-i2c
> +
> +        - const: fsl-i2c
> +
> +      - contains:
> +          const: fsl-i2c
> +        minItems: 1
> +        maxItems: 4

Can't we drop this and list out any other compatibles?

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  fsl,preserve-clocking:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      if defined, the clock settings from the bootloader are
> +      preserved (not touched)
> +
> +  fsl,timeout:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      I2C bus timeout in microseconds
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    /* MPC5121 based board */
> +    i2c@1740 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "fsl,mpc5121-i2c", "fsl-i2c";
> +        reg = <0x1740 0x20>;
> +        interrupts = <11 0x8>;
> +        interrupt-parent = <&ipic>;
> +        clock-frequency = <100000>;
> +    };
> +
> +    i2ccontrol@1760 {
> +        compatible = "fsl,mpc5121-i2c-ctrl";

Drop this or document it. I'm trying to get rid of undocumented (by 
schemas) compatibles in examples. 

> +        reg = <0x1760 0x8>;
> +    };
> +
> +    /* MPC5200B based board */
> +    i2c@3d00 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "fsl,mpc5200b-i2c", "fsl,mpc5200-i2c", "fsl-i2c";
> +        reg = <0x3d00 0x40>;
> +        interrupts = <2 15 0>;
> +        interrupt-parent = <&mpc5200_pic>;
> +        fsl,preserve-clocking;
> +    };
> +
> +    /* MPC8544 base board */
> +    i2c@3100 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "fsl,mpc8544-i2c", "fsl-i2c";
> +        reg = <0x3100 0x100>;
> +        interrupts = <43 2>;
> +        interrupt-parent = <&mpic>;
> +        clock-frequency = <400000>;
> +        fsl,timeout = <10000>;
> +    };
> +...
> -- 
> 2.30.2
> 
