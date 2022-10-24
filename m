Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 841E460B074
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Oct 2022 18:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbiJXQFf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Oct 2022 12:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233907AbiJXQFK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Oct 2022 12:05:10 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC271357D1;
        Mon, 24 Oct 2022 07:58:00 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1322d768ba7so12132578fac.5;
        Mon, 24 Oct 2022 07:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gezVBAneqrs7XaH/fdMxwAK/2YWaqmP9HW9vTh1Ptis=;
        b=5ck8jY3wn3g1GFZCemkmlqIbMU53/OmH2UaNVLjAoQJ0Vh/rqxGdpBRaHln4B0Ahap
         CDMUmPHXHDEEhCbr8G3g8cRV6mw+YhC2gErSqQMkYy3EaqycwhqgaYBfBbujWB1zblg/
         4ubADQdf0GL76Zzuo9+Ad+xF6AgG9LgH8Z1uaXF9ov0WKfpgTNvHoHOgdLxb6lZaHM7X
         weMa0M7ts3sxzLCDMsSStJKPW2TQDUZx30zgueQ/r0roFF+6sgW9KBikuRn6JQHlux3K
         4aEGo+dzttL2f9QR5BTgI0MFvaT05YHamKUVgeBXbDA0lFkC6UNFKC7UPdAti2TMNJiG
         NACA==
X-Gm-Message-State: ACrzQf3qeeFsSTuHCBKDIJVauoEU9xs1IgJnfEC92j04p5HqqijCCVYy
        A1QKBAhSG+1SmAemKBN9qA==
X-Google-Smtp-Source: AMsMyM42Jg3r8Ewtmh0Qc3jpN13ZbUDnPdjYyras8m0IwxfR0o9ZvqlFWkFA5v9EIKywV/cIiznewg==
X-Received: by 2002:a05:6870:d389:b0:13b:a0cd:5fcd with SMTP id k9-20020a056870d38900b0013ba0cd5fcdmr3731915oag.260.1666623286325;
        Mon, 24 Oct 2022 07:54:46 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t19-20020a056871055300b0013b1301ce42sm5474921oal.47.2022.10.24.07.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 07:54:45 -0700 (PDT)
Received: (nullmailer pid 1774935 invoked by uid 1000);
        Mon, 24 Oct 2022 14:54:46 -0000
Date:   Mon, 24 Oct 2022 09:54:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Wayne Chang <waynec@nvidia.com>
Cc:     gregkh@linuxfoundation.org, krzysztof.kozlowski+dt@linaro.org,
        treding@nvidia.com, jonathanh@nvidia.com, thierry.reding@gmail.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com, kishon@ti.com,
        vkoul@kernel.org, p.zabel@pengutronix.de, balbi@kernel.org,
        mathias.nyman@intel.com, jckuo@nvidia.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 02/11] dt-bindings: usb: Add NVIDIA Tegra XUSB host
 controller binding
Message-ID: <20221024145446.GA1763588-robh@kernel.org>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-3-waynec@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024074128.1113554-3-waynec@nvidia.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 24, 2022 at 03:41:19PM +0800, Wayne Chang wrote:
> Add device-tree binding documentation for the XUSB host controller present
> on Tegra194 and Tegra234 SoC. This controller supports the USB 3.1
> specification.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
>  .../bindings/usb/nvidia,tegra-xhci.yaml       | 213 ++++++++++++++++++
>  1 file changed, 213 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xhci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xhci.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xhci.yaml
> new file mode 100644
> index 000000000000..d261a419a04f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xhci.yaml
> @@ -0,0 +1,213 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/usb/nvidia,tegra-xhci.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Device tree binding for NVIDIA Tegra XUSB host controller

Drop 'Device tree binding for '

> +
> +description:
> +  The Tegra XHCI controller supports both USB 2.0 HighSpeed/FullSpeed and
> +  USB 3.1 SuperSpeed protocols.
> +
> +maintainers:
> +  - Wayne Chang <waynec@nvidia.com>
> +

Ref to usb-xhci.yaml? Or usb-hcd.yaml.

> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - nvidia,tegra194-xusb # For Tegra194
> +          - nvidia,tegra234-xusb # For Tegra234

The comment is kind of redundant.

> +
> +  reg:
> +    minItems: 2
> +    items:
> +      - description: XUSB host controller registers
> +      - description: XUSB host PCI Config registers
> +      - description: XUSB host bar2 registers

Drop 'XUSB host '

> +
> +  reg-names:
> +    minItems: 2
> +    items:
> +      - const: hcd
> +      - const: fpci
> +      - const: bar2
> +
> +  interrupts:
> +    items:
> +      - description: Must contain the XUSB host interrupt.
> +      - description: Must contain the XUSB mbox interrupt.

Drop 'Must contain the '

> +
> +  clocks:
> +    items:
> +      - description: Clock to enable core XUSB host clock.
> +      - description: Clock to enable XUSB falcon clock.
> +      - description: Clock to enable XUSB super speed clock.
> +      - description: Clock to enable XUSB super speed dev clock.
> +      - description: Clock to enable XUSB high speed dev clock.
> +      - description: Clock to enable XUSB full speed dev clock.
> +      - description: Clock to enable XUSB UTMI PLL clock.
> +      - description: Clock to enable core XUSB dev clock.
> +      - description: Clock to enable XUSB PLLE clock.

Drop 'Clock to enable '

> +
> +  clock-names:
> +    items:
> +      - const: xusb_host
> +      - const: xusb_falcon_src
> +      - const: xusb_ss
> +      - const: xusb_ss_src
> +      - const: xusb_hs_src
> +      - const: xusb_fs_src
> +      - const: pll_u_480m
> +      - const: clk_m
> +      - const: pll_e
> +
> +  interconnects:
> +    items:
> +      - description: memory read client
> +      - description: memory write client
> +
> +  interconnect-names:
> +    items:
> +      - const: dma-mem # read
> +      - const: write
> +
> +  iommus:
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description: XUSBC(host) power-domain
> +      - description: XUSBA(superspeed) power-domain
> +
> +  power-domain-names:
> +    items:
> +      - const: xusb_host
> +      - const: xusb_ss

Drop 'xusb_'.

> +
> +  nvidia,xusb-padctl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to the XUSB pad controller that is used to configure the USB pads
> +      used by the XUDC controller.
> +
> +  phys:
> +    minItems: 1
> +    maxItems: 8
> +    description:
> +      Must contain an entry for each entry in phy-names.
> +      See ../phy/phy-bindings.txt for details.

Drop description.

> +
> +  phy-names:
> +    minItems: 1
> +    maxItems: 8
> +    items:
> +      anyOf:
> +        - const: usb2-0
> +        - const: usb2-1
> +        - const: usb2-2
> +        - const: usb2-3
> +        - const: usb3-0
> +        - const: usb3-1
> +        - const: usb3-2
> +        - const: usb3-3
> +
> +  dma-coherent:
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - power-domain-names
> +  - nvidia,xusb-padctl
> +  - phys
> +  - phy-names
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra194-xusb
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        reg-names:
> +          minItems: 2
> +        clocks:
> +          minItems: 9
> +        clock-names:
> +          minItems: 9
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra234-xusb
> +    then:
> +      properties:
> +        reg:
> +          minItems: 3
> +        reg-names:
> +          minItems: 3
> +        clocks:
> +          minItems: 9
> +        clock-names:
> +          minItems: 9

Same number of items, why are clocks in the if/then?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/tegra234-gpio.h>
> +    #include <dt-bindings/clock/tegra234-clock.h>
> +    #include <dt-bindings/memory/tegra234-mc.h>
> +    #include <dt-bindings/power/tegra234-powergate.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    usb@3610000 {
> +      compatible = "nvidia,tegra234-xusb";
> +      reg = <0x03610000 0x40000>,
> +            <0x03600000 0x10000>,
> +            <0x03650000 0x10000>;
> +      reg-names = "hcd", "fpci", "bar2";
> +
> +      interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> +             <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
> +
> +      clocks = <&bpmp TEGRA234_CLK_XUSB_CORE_HOST>,
> +         <&bpmp TEGRA234_CLK_XUSB_FALCON>,
> +         <&bpmp TEGRA234_CLK_XUSB_CORE_SS>,
> +         <&bpmp TEGRA234_CLK_XUSB_SS>,
> +         <&bpmp TEGRA234_CLK_CLK_M>,
> +         <&bpmp TEGRA234_CLK_XUSB_FS>,
> +         <&bpmp TEGRA234_CLK_UTMIP_PLL>,
> +         <&bpmp TEGRA234_CLK_CLK_M>,
> +         <&bpmp TEGRA234_CLK_PLLE>;
> +      clock-names = "xusb_host", "xusb_falcon_src",
> +              "xusb_ss", "xusb_ss_src", "xusb_hs_src",
> +              "xusb_fs_src", "pll_u_480m", "clk_m",
> +              "pll_e";
> +      interconnects = <&mc TEGRA234_MEMORY_CLIENT_XUSB_HOSTR &emc>,
> +          <&mc TEGRA234_MEMORY_CLIENT_XUSB_HOSTW &emc>;
> +      interconnect-names = "dma-mem", "write";
> +      iommus = <&smmu_niso1 TEGRA234_SID_XUSB_HOST>;
> +
> +      power-domains = <&bpmp TEGRA234_POWER_DOMAIN_XUSBC>,
> +          <&bpmp TEGRA234_POWER_DOMAIN_XUSBA>;
> +      power-domain-names = "xusb_host", "xusb_ss";
> +
> +      nvidia,xusb-padctl = <&xusb_padctl>;
> +
> +      phys =  <&pad_lanes_usb2_0>;
> +      phy-names = "usb2-0";
> +
> +    };
> -- 
> 2.25.1
> 
> 
