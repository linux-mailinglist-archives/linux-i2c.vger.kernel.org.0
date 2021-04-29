Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3E936F1EF
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Apr 2021 23:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbhD2VZF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Apr 2021 17:25:05 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:39647 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233293AbhD2VZF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Apr 2021 17:25:05 -0400
Received: by mail-ot1-f53.google.com with SMTP id 65-20020a9d03470000b02902808b4aec6dso57908311otv.6;
        Thu, 29 Apr 2021 14:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YJmU3tM1Eub093fQ+1L/D8f6mXaNJrWZhHn1LACy2qY=;
        b=W28mN4JlPYgqjikSWdbhW+bqas12bj8NXBIeO1WbK66EXOQgZGqyVMcHpaktLHi4MA
         iUE5PgRCFjaH5N8mU2tQza/s/8SuNWkLS9HCOvTLMJ2N/39jWwsLWdQDe6LQ7f3cN80F
         uUGRZ23GTteiaixxLjFDFXzAxN9CTcLONKSE0QmAX8HPw8CU/ypKU4PFvn7hMi4nU0U5
         DIkNnld0u1pSP/1PlNyKTJBoabzBAzVACCiTkGpMGFRLpRCBnnz8jzhBaygtxMBLq8UT
         kjrdExGmdyTDNnWytTtUG+LMoeWwzmMazoAU21qdtuc/QZCRL2oLn6eb92dJTwGNki9d
         QCiQ==
X-Gm-Message-State: AOAM5311nGCOAJ1+QnWWJxbsQO+TOwDfBLteL0MGImxfV8GZrn71Mc9b
        WFJCEqIg7ZXP2H3mFjfv3Q==
X-Google-Smtp-Source: ABdhPJw/MaPIBRCB4XVHuqL3chlif+uPvQnqdy32au/vfGi9bpn9qs1teSdatvmHS78bj8ozXXegNQ==
X-Received: by 2002:a9d:615a:: with SMTP id c26mr1107739otk.54.1619731456220;
        Thu, 29 Apr 2021 14:24:16 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v14sm231601oto.48.2021.04.29.14.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 14:24:14 -0700 (PDT)
Received: (nullmailer pid 1799784 invoked by uid 1000);
        Thu, 29 Apr 2021 21:24:13 -0000
Date:   Thu, 29 Apr 2021 16:24:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     cl@rock-chips.com
Cc:     heiko@sntech.de, jagan@amarulasolutions.com, wens@csie.org,
        uwe@kleine-koenig.org, mail@david-bauer.net, jbx6244@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        jensenhuang@friendlyarm.com, michael@amarulasolutions.com,
        cnsztl@gmail.com, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        wim@linux-watchdog.org, linux@roeck-us.net, jamie@jamieiles.com,
        linux-watchdog@vger.kernel.org, maz@kernel.org
Subject: Re: [PATCH v4 07/10] dt-bindings: soc: rockchip: Convert grf.txt to
 YAML
Message-ID: <20210429212413.GA1794356@robh.at.kernel.org>
References: <20210429081151.17558-1-cl@rock-chips.com>
 <20210429081321.17855-1-cl@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429081321.17855-1-cl@rock-chips.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 29, 2021 at 04:13:21PM +0800, cl@rock-chips.com wrote:
> From: Liang Chen <cl@rock-chips.com>
> 
> Current dts files with 'grf' nodes are manually verified. In order to
> automate this process grf.txt has to be converted to YAML.
> 
> Add new descriptions for:
> "rockchip,rk3568-grf", "syscon", "simple-mfd"
> "rockchip,rk3568-pmugrf", "syscon", "simple-mfd"
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> ---
>  .../devicetree/bindings/soc/rockchip/grf.txt  | 61 -------------------
>  .../devicetree/bindings/soc/rockchip/grf.yaml | 60 ++++++++++++++++++
>  2 files changed, 60 insertions(+), 61 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.txt b/Documentation/devicetree/bindings/soc/rockchip/grf.txt
> deleted file mode 100644
> index f96511aa3897..000000000000
> --- a/Documentation/devicetree/bindings/soc/rockchip/grf.txt
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -* Rockchip General Register Files (GRF)
> -
> -The general register file will be used to do static set by software, which
> -is composed of many registers for system control.
> -
> -From RK3368 SoCs, the GRF is divided into two sections,
> -- GRF, used for general non-secure system,
> -- SGRF, used for general secure system,
> -- PMUGRF, used for always on system
> -
> -On RK3328 SoCs, the GRF adds a section for USB2PHYGRF,
> -
> -ON RK3308 SoC, the GRF is divided into four sections:
> -- GRF, used for general non-secure system,
> -- SGRF, used for general secure system,
> -- DETECTGRF, used for audio codec system,
> -- COREGRF, used for pvtm,
> -
> -Required Properties:
> -
> -- compatible: GRF should be one of the following:
> -   - "rockchip,px30-grf", "syscon": for px30
> -   - "rockchip,rk3036-grf", "syscon": for rk3036
> -   - "rockchip,rk3066-grf", "syscon": for rk3066
> -   - "rockchip,rk3188-grf", "syscon": for rk3188
> -   - "rockchip,rk3228-grf", "syscon": for rk3228
> -   - "rockchip,rk3288-grf", "syscon": for rk3288
> -   - "rockchip,rk3308-grf", "syscon": for rk3308
> -   - "rockchip,rk3328-grf", "syscon": for rk3328
> -   - "rockchip,rk3368-grf", "syscon": for rk3368
> -   - "rockchip,rk3399-grf", "syscon": for rk3399
> -   - "rockchip,rv1108-grf", "syscon": for rv1108
> -- compatible: DETECTGRF should be one of the following:
> -   - "rockchip,rk3308-detect-grf", "syscon": for rk3308
> -- compatilbe: COREGRF should be one of the following:
> -   - "rockchip,rk3308-core-grf", "syscon": for rk3308
> -- compatible: PMUGRF should be one of the following:
> -   - "rockchip,px30-pmugrf", "syscon": for px30
> -   - "rockchip,rk3368-pmugrf", "syscon": for rk3368
> -   - "rockchip,rk3399-pmugrf", "syscon": for rk3399
> -- compatible: SGRF should be one of the following:
> -   - "rockchip,rk3288-sgrf", "syscon": for rk3288
> -- compatible: USB2PHYGRF should be one of the following:
> -   - "rockchip,px30-usb2phy-grf", "syscon": for px30
> -   - "rockchip,rk3328-usb2phy-grf", "syscon": for rk3328
> -- compatible: USBGRF should be one of the following:
> -   - "rockchip,rv1108-usbgrf", "syscon": for rv1108
> -- reg: physical base address of the controller and length of memory mapped
> -  region.
> -
> -Example: GRF and PMUGRF of RK3399 SoCs
> -
> -	pmugrf: syscon@ff320000 {
> -		compatible = "rockchip,rk3399-pmugrf", "syscon";
> -		reg = <0x0 0xff320000 0x0 0x1000>;
> -	};
> -
> -	grf: syscon@ff770000 {
> -		compatible = "rockchip,rk3399-grf", "syscon";
> -		reg = <0x0 0xff770000 0x0 0x10000>;
> -	};
> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> new file mode 100644
> index 000000000000..93231b95554b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip General Register Files
> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  compatible:
> +    - items:

The '-' is the source of your error.

> +        - enum:
> +            - rockchip,px30-grf
> +            - rockchip,px30-pmugrf
> +            - rockchip,px30-usb2phy-grf
> +            - rockchip,rk3036-grf
> +            - rockchip,rk3066-grf
> +            - rockchip,rk3188-grf
> +            - rockchip,rk3228-grf
> +            - rockchip,rk3288-grf
> +            - rockchip,rk3288-sgrf
> +            - rockchip,rk3308-core-grf
> +            - rockchip,rk3308-detect-grf
> +            - rockchip,rk3308-grf
> +            - rockchip,rk3328-grf
> +            - rockchip,rk3328-usb2phy-grf
> +            - rockchip,rk3368-grf
> +            - rockchip,rk3368-pmugrf
> +            - rockchip,rk3399-grf
> +            - rockchip,rk3399-pmugrf
> +            - rockchip,rk3568-grf
> +            - rockchip,rk3568-pmugrf
> +            - rockchip,rv1108-grf
> +            - rockchip,rv1108-usbgrf
> +        - const: syscon
> +        - const: simple-mfd

'simple-mfd' was not in the old binding. That implies you have child 
nodes, and if so, they need to be documented. I imagine that will mean 
splitting this into multiple schemas if that's the case.

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pmugrf: syscon@ff320000 {
> +       compatible = "rockchip,rk3399-pmugrf", "syscon", "simple-mfd";
> +       reg = <0xff320000 0x1000>;
> +    };
> +
> +    grf: syscon@ff770000 {
> +       compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
> +       reg = <0xff770000 0x10000>;
> +    };
> -- 
> 2.17.1
> 
> 
> 
