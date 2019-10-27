Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D74A4E61F9
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Oct 2019 11:13:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbfJ0KNi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Oct 2019 06:13:38 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40739 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726469AbfJ0KNi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Oct 2019 06:13:38 -0400
Received: by mail-wr1-f66.google.com with SMTP id o28so6847314wro.7;
        Sun, 27 Oct 2019 03:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3IpxudYqh0cSrXHsSd20R7gPXReXwAlu/vXTGneJYeA=;
        b=hXSrnSicmffaawvfQsBwMScW37guK9vJsdCcRiACwyis734sAiZI/nTCvDoOIDsET7
         TxtFjanFZ02nUA7cHDwWPIFp3Wx9wPk9pHfz4krCdEpKEoPX88wY3FMAVOWGpc/OX7B7
         Bh1E0NNOMzTeVp4Ue0NCazljr31u3LzQ5gMLo8SsI4wQzZaKYBiglONEya/fahW+Ur24
         LYh1aPSCIPEnF5yPeMBKq7cfSMD04Tn75BpyUpRxCuL7HuhYqTCa0qEi32R38iOoOK4r
         CEYbDUa53uUuTladP7ghiETvoYMGUus48sJzOtcbbKyTm+HJp9KLFhdzkdxw26oeLZoq
         lZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3IpxudYqh0cSrXHsSd20R7gPXReXwAlu/vXTGneJYeA=;
        b=ox4chG7pKQBHEolvO+W9gW2Uq3l8sqTxRto1eYv1NAIgCPj8pESX8BhgFpEsRcovKt
         5WjB98wI6UClcj3YhhqhjPFHB/f64zAIKBWliuX6roVCjnOHyD181q+TagAZ3xkVF5zM
         Q6Izx/olCsfwyLpCMuB03O9CQE6PnaqlhQjhmps3/GmMzotnenLPWEGOFuDAZYII6IcA
         BmTwbyYeez2wV5PI68JzGHzQg1vs15gpibhXE6ICHOz/P5gfNrDdp6PfE/b5TNP6asmU
         0B6qSobEDYBXnUdCcWQWgg3eoBat2fla2AutOO63OwPN6kyGyDC4sxb7qDPZrGprwrho
         O7Ww==
X-Gm-Message-State: APjAAAVbHT3B1pvGatdDSVNX8cEzvcdWA34zebHFoA89/FC5Xd18XF/p
        jZhtTy4PAUxtL4YPcifgTxA=
X-Google-Smtp-Source: APXvYqw1cxLvV4/3XED3x2mClTOpoL5pylt99SzhNdORtAzzBZRNtAnqcjg/6X+pCOpQ4725HtypWQ==
X-Received: by 2002:a5d:4589:: with SMTP id p9mr10044913wrq.397.1572171214637;
        Sun, 27 Oct 2019 03:13:34 -0700 (PDT)
Received: from gmail.com (host159-41-dynamic.116-80-r.retail.telecomitalia.it. [80.116.41.159])
        by smtp.gmail.com with ESMTPSA id d199sm8235130wmd.35.2019.10.27.03.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2019 03:13:33 -0700 (PDT)
Date:   Sun, 27 Oct 2019 11:12:45 +0100
From:   Beniamino Galvani <b.galvani@gmail.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: meson: convert to yaml
Message-ID: <20191027101245.GA2194@gmail.com>
References: <20191021140053.9525-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021140053.9525-1-narmstrong@baylibre.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 21, 2019 at 04:00:53PM +0200, Neil Armstrong wrote:
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic I2C Controller over to YAML schemas.

Acked-by: Beniamino Galvani <b.galvani@gmail.com>


> Cc: Beniamino Galvani <b.galvani@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/i2c/amlogic,meson6-i2c.yaml      | 53 +++++++++++++++++++
>  .../devicetree/bindings/i2c/i2c-meson.txt     | 30 -----------
>  2 files changed, 53 insertions(+), 30 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-meson.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> new file mode 100644
> index 000000000000..49cad273c8e5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/i2c/amlogic,meson6-i2c.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson I2C Controller
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +  - Beniamino Galvani <b.galvani@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson6-i2c # Meson6, Meson8 and compatible SoCs
> +      - amlogic,meson-gxbb-i2c # GXBB and compatible SoCs
> +      - amlogic,meson-axg-i2c # AXG and compatible SoCs
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +examples:
> +  - |
> +    i2c@c8100500 {
> +        compatible = "amlogic,meson6-i2c";
> +        reg = <0xc8100500 0x20>;
> +        interrupts = <92>;
> +        clocks = <&clk81>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        eeprom@52 {
> +            compatible = "atmel,24c32";
> +            reg = <0x52>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-meson.txt b/Documentation/devicetree/bindings/i2c/i2c-meson.txt
> deleted file mode 100644
> index 13d410de077c..000000000000
> --- a/Documentation/devicetree/bindings/i2c/i2c-meson.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -Amlogic Meson I2C controller
> -
> -Required properties:
> - - compatible: must be:
> -	"amlogic,meson6-i2c" for Meson8 and compatible SoCs
> -	"amlogic,meson-gxbb-i2c" for GXBB and compatible SoCs
> -	"amlogic,meson-axg-i2c"for AXG and compatible SoCs
> -
> - - reg: physical address and length of the device registers
> - - interrupts: a single interrupt specifier
> - - clocks: clock for the device
> - - #address-cells: should be <1>
> - - #size-cells: should be <0>
> -
> -For details regarding the following core I2C bindings see also i2c.txt.
> -
> -Optional properties:
> -- clock-frequency: the desired I2C bus clock frequency in Hz; in
> -  absence of this property the default value is used (100 kHz).
> -
> -Examples:
> -
> -	i2c@c8100500 {
> -		compatible = "amlogic,meson6-i2c";
> -		reg = <0xc8100500 0x20>;
> -		interrupts = <0 92 1>;
> -		clocks = <&clk81>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -	};
> -- 
> 2.22.0
> 
