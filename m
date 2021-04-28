Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A275736DDA2
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Apr 2021 18:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241292AbhD1Q5L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Apr 2021 12:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241217AbhD1Q5L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Apr 2021 12:57:11 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC67C061573;
        Wed, 28 Apr 2021 09:56:26 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id l4so95627842ejc.10;
        Wed, 28 Apr 2021 09:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RgwWWzRArBvsITzP0MfXSJen41tdFEmAecGMN7HXGzM=;
        b=CD9OPZyNfgFGI1NgZH3L4ac7J6xtx0nRn0yCF9Ru5HQXe8xkpJu2ueURt4b/Jt3C+4
         sJP5CcxTzW+WFlqMGgHlsHQQeSpvDQFPjjU8sb2wvXOVFRBiuZNEDStdwHayk5YxlIbq
         U5ce1Cdc4oyrKZ5VSyuPi3RyKHbJm2gJH8KnKBWrNiO0P5DJYwbANyIHpgfWCRKhX5n1
         Nemsuksq+bYfvq4rUNCM9IzCrL3Y5ZOpz4sdt60XZIBB6qJrQ75bU36pKXI/UzDmEYw5
         SJM8JKGgpHZbMEBzUTARWf8uwvvZ/v1LVjTM2ya5hfcyOPeeOI/YNFAs/zMdyVQ0z3JP
         NPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RgwWWzRArBvsITzP0MfXSJen41tdFEmAecGMN7HXGzM=;
        b=gB4VO1VWBGvdITCB14TO7pgk0J+szqVrxETiUUKHZ3I4B2juW69m/vVjz8zxNL4sOE
         Dqv9LSojj3ShBAHKLnd3DlAtgw6v6Q9SFGaefN5MS1AzQ4gGk4dYW5xth+0GhCXfh1z9
         YWJMo1mSfv4zZW4qw9+Ro5uNzAB84/SXpV0Pn1kAvI8zJs+g40enKVUAAxKomK1/Z54U
         JWNS3fWCOYtUXGtXqySRmYoOg9oh2FstVzi+6CNR6PAeNkYpszHqtbHmSRqzE3YNDjjm
         uD6NNbzi3NnZF6OKBWhF/tZ1UAUeBJ4OfnIhzOa3fnrTCSyTv7PtCAAP3bAZTSMDaxF0
         ++Bw==
X-Gm-Message-State: AOAM5331FltKsdJre26Q4QRagkWjNsK8ptOaqCYFp/L+x0OcnFEeuZBr
        D5sgA+tPAMIlNRl84h5qHuw=
X-Google-Smtp-Source: ABdhPJz8H2DAXvH8nsp6SM9J7kvnquRhbADOKtm5XWb3DJsquBPoPAQXmESbPx9RIg2yvtGofRuq5Q==
X-Received: by 2002:a17:906:4153:: with SMTP id l19mr29859824ejk.109.1619628984762;
        Wed, 28 Apr 2021 09:56:24 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id n10sm241125ejg.124.2021.04.28.09.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 09:56:24 -0700 (PDT)
Subject: Re: [PATCH v3 07/10] dt-bindings: soc: rockchip: Convert grf.txt to
 YAML
To:     cl@rock-chips.com, heiko@sntech.de
Cc:     robh+dt@kernel.org, jagan@amarulasolutions.com, wens@csie.org,
        uwe@kleine-koenig.org, mail@david-bauer.net,
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
References: <20210428134759.22076-1-cl@rock-chips.com>
 <20210428134938.22383-1-cl@rock-chips.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <1f0ddd45-98a0-1e9d-f228-3c58f88fb76d@gmail.com>
Date:   Wed, 28 Apr 2021 18:56:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210428134938.22383-1-cl@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Liang,

Check example with:
make ARCH=arm64 dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/soc/rockchip/grf.yaml

Build log:
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210428134938.22383-1-cl@rock-chips.com/

On 4/28/21 3:49 PM, cl@rock-chips.com wrote:
> From: Liang Chen <cl@rock-chips.com>
> 
> Current dts files with 'grf' nodes are manually verified. In order to
> automate this process grf.txt has to be converted to YAML.

Add new descriptions for:
"rockchip,rk3399-pmugrf", "syscon", "simple-mfd"
"rockchip,rk3399-grf", "syscon", "simple-mfd"

> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> ---
>  .../devicetree/bindings/soc/rockchip/grf.txt  | 61 -------------------
>  .../devicetree/bindings/soc/rockchip/grf.yaml | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 61 deletions(-)
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
> index 000000000000..61ce5b4c9ed0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> @@ -0,0 +1,61 @@
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

> +    oneOf:
> +      - items:

items:

When there are no other combinations then with syscon and simple-mfd
then there's no need for "oneOf".


> +          - enum:
> +              - rockchip,px30-grf
> +              - rockchip,px30-pmugrf
> +              - rockchip,px30-usb2phy-grf
> +              - rockchip,rk3036-grf
> +              - rockchip,rk3066-grf
> +              - rockchip,rk3188-grf
> +              - rockchip,rk3228-grf
> +              - rockchip,rk3288-grf
> +              - rockchip,rk3288-sgrf
> +              - rockchip,rk3308-core-grf
> +              - rockchip,rk3308-detect-grf
> +              - rockchip,rk3308-grf
> +              - rockchip,rk3328-grf
> +              - rockchip,rk3328-usb2phy-grf
> +              - rockchip,rk3368-grf
> +              - rockchip,rk3368-pmugrf
> +              - rockchip,rk3399-grf
> +              - rockchip,rk3399-pmugrf

> +              - rockchip,rk3568-grf
> +              - rockchip,rk3568-pmugrf

Conversion and new properties are two separate actions.
Must add that to the commit message.

> +              - rockchip,rv1108-grf
> +              - rockchip,rv1108-usbgrf
> +          - const: syscon
> +          - const: simple-mfd
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

> +       compatible = "rockchip,rk3399-pmugrf", "syscon";

compatible = "rockchip,rk3399-pmugrf", "syscon", "simple-mfd";

> +       reg = <0x0 0xff320000 0x0 0x1000>;

This is for 64 bit, normal examples use 32 bit.

> +    };
> +
> +    grf: syscon@ff770000 {

> +       compatible = "rockchip,rk3399-grf", "syscon";

compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";

> +       reg = <0x0 0xff770000 0x0 0x10000>;

use 32 bit

> +    };
> 
