Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4C71F9E15
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 19:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729789AbgFORGQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 13:06:16 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:40948 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729124AbgFORGQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Jun 2020 13:06:16 -0400
Received: by mail-il1-f194.google.com with SMTP id t8so68562ilm.7;
        Mon, 15 Jun 2020 10:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PBR+ikasBYezgWfg6lbl7wvtqOB14P0FNCohMlzbJzo=;
        b=JTLaycjBrUTtWoHLh4j/ZTivjliOeQjLIVZf99kxbSau0YqucSsDVtrbtKQCn7BjfG
         IYN09O7xO01sEBhDMldN+UtVAp8DGMrf7yRN90zUQyEMVDlX5M74i2hwoyPx7nC64EAU
         ZxG/Sc1PpElOiIVbZdpNY2CTp/7rcErw1NCXSxJ/bKp5pIP/7ijZCHS9ym5LANgr0T2H
         mYpMcBLiwFsxYwomuAcDKyPmIYmbLOLpGK4HVDPAQr1Umg1yj/u0SsGXY+le1yW8cS+R
         Yn3y8PBiv2pDfmjhZOF0m7Q5NqY1yqvoSPnJbZkLMKbNduO+7it6cfeZ1FJXhnPr6NmD
         /I3Q==
X-Gm-Message-State: AOAM531DglWk8cX4bRVL6LN2QrgQ+DF4b414x+DWDoDiKV+DGFbSMmU4
        Bxb0Ywkqxr+wS1QpcxJaAw==
X-Google-Smtp-Source: ABdhPJxDnT/nkNScLMhuFwLLrQAqZN4bGs2HZn8OCPlvNq4Dibjv0hu7uy7RD1R59Zo6M9WAAWCjuw==
X-Received: by 2002:a05:6e02:12b4:: with SMTP id f20mr27358656ilr.243.1592240775375;
        Mon, 15 Jun 2020 10:06:15 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id j63sm8527311ilg.50.2020.06.15.10.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 10:06:14 -0700 (PDT)
Received: (nullmailer pid 1961183 invoked by uid 1000);
        Mon, 15 Jun 2020 17:06:13 -0000
Date:   Mon, 15 Jun 2020 11:06:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux@rempel-privat.de,
        wolfram@the-dreams.de, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH V2 2/3] dt-bindings: i2c: Convert mxs i2c to json-schema
Message-ID: <20200615170613.GA1959567@bogus>
References: <1591235358-15516-1-git-send-email-Anson.Huang@nxp.com>
 <1591235358-15516-3-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591235358-15516-3-git-send-email-Anson.Huang@nxp.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 04, 2020 at 09:49:17AM +0800, Anson Huang wrote:
> Convert the MXS I2C binding to DT schema format using json-schema
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V1:
> 	- add "additionalProperties: false".
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mxs.txt  | 25 ----------
>  Documentation/devicetree/bindings/i2c/i2c-mxs.yaml | 55 ++++++++++++++++++++++
>  2 files changed, 55 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mxs.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mxs.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mxs.txt b/Documentation/devicetree/bindings/i2c/i2c-mxs.txt
> deleted file mode 100644
> index 4e1c8ac..0000000
> --- a/Documentation/devicetree/bindings/i2c/i2c-mxs.txt
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -* Freescale MXS Inter IC (I2C) Controller
> -
> -Required properties:
> -- compatible: Should be "fsl,<chip>-i2c"
> -- reg: Should contain registers location and length
> -- interrupts: Should contain ERROR interrupt number
> -- clock-frequency: Desired I2C bus clock frequency in Hz.
> -                   Only 100000Hz and 400000Hz modes are supported.
> -- dmas: DMA specifier, consisting of a phandle to DMA controller node
> -  and I2C DMA channel ID.
> -  Refer to dma.txt and fsl-mxs-dma.txt for details.
> -- dma-names: Must be "rx-tx".
> -
> -Examples:
> -
> -i2c0: i2c@80058000 {
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -	compatible = "fsl,imx28-i2c";
> -	reg = <0x80058000 2000>;
> -	interrupts = <111>;
> -	clock-frequency = <100000>;
> -	dmas = <&dma_apbx 6>;
> -	dma-names = "rx-tx";
> -};
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mxs.yaml b/Documentation/devicetree/bindings/i2c/i2c-mxs.yaml
> new file mode 100644
> index 0000000..3bc14bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mxs.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/i2c-mxs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale MXS Inter IC (I2C) Controller
> +
> +maintainers:
> +  - Shawn Guo <shawn.guo@linaro.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx23-i2c
> +      - fsl,imx28-i2c
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32

'clock-frequency' already has a type.

> +    description: |
> +      Desired I2C bus clock frequency in Hz, only 100000Hz and 400000Hz
> +      modes are supported.

Sounds like constraints.

> +    default: 100000
> +
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    const: rx-tx
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - dmas
> +  - dma-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c@80058000 {
> +        compatible = "fsl,imx28-i2c";
> +        reg = <0x80058000 2000>;
> +        interrupts = <111>;
> +        clock-frequency = <100000>;
> +        dmas = <&dma_apbx 6>;
> +        dma-names = "rx-tx";
> +    };
> -- 
> 2.7.4
> 
