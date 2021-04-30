Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5FA336F8BF
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Apr 2021 12:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhD3K70 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Apr 2021 06:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbhD3K7Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Apr 2021 06:59:25 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB70AC06174A;
        Fri, 30 Apr 2021 03:58:35 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id i24so22531560edy.8;
        Fri, 30 Apr 2021 03:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8xWBaV10Gk5zTcf0lrE/jDunsZwOFiT6TlpRJiJ0iIY=;
        b=aQFnixQurTO584qp0DZsR5R/Wc5Z5fm7hR/X9+wixuIhA95Wmy8ZO3VszL+nU52Um3
         k+4Wwry05NUwbcBYvNWxfTfwUoLSnLyHxUP+JlMTJmDJ1SRsIqlhGQiL1ZMD/knFFeal
         8V9PqpbAaVGwSB3dTSeMWooBGFGpujnkjOtwZ0oVkscjSMheVFewo6JDphhpWVJR9/Fu
         16/0MH2Y9cKnJTGrLRMK/+yxg9ST5mQMWiUtMFazg8syjjnpAeg3IjEgBPIuxjWGDLJd
         QUMUSUG2EwU7iO6UNSnMT2H03vXyDCbKGw+Bth0FaviumTUDEOwNGydzkQiQtP7gMj3j
         F+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8xWBaV10Gk5zTcf0lrE/jDunsZwOFiT6TlpRJiJ0iIY=;
        b=bucUEJUixXj/MDdSlDscUMoUi9TE94YHq7wXPoUf0DFQ2t/PetpIgFqjlVKrc2dYhy
         CCUkYZohIToPBaoM34jFmN51NvQ0HQCt2AKxFooGcm7vA4VGtNcnozi+cfXdvkiINjxW
         ycIy3GUqoWVgutWq9L9Swr08GvseaSZxtgzBrM7PnX+dCfefWYlWGU5IpfgQn8F0sdfY
         cbXoivpZizXNIib9CFCY8hqu9S6RM9qNyzGBIWZSGNN04F6iHTL23UeTu+uJaZymT0Lt
         xF3oLGIf80brfjSQplXXEvo7aBPZMoIKVBHw34gONn0Tf+ZaMw79JgntMALUIPZD/lvr
         P7Gg==
X-Gm-Message-State: AOAM531BuyQIRYa6W14OsWreOJyoR92/TVmlGpvjGhpC2cPg5Pd+bY6q
        XwTNtIxVWYWmC2cVQCK7pGI=
X-Google-Smtp-Source: ABdhPJzEZgBgxrLbBy1c75XIgzs3f76jZHE+f6Wo2RFq5MUv8/4LZSZg2o9jG/a8kIGmh/jVYiWidA==
X-Received: by 2002:a05:6402:3109:: with SMTP id dc9mr5137491edb.13.1619780314537;
        Fri, 30 Apr 2021 03:58:34 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id x20sm958240edd.58.2021.04.30.03.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Apr 2021 03:58:34 -0700 (PDT)
Subject: Re: [RESEND PATCH v4 07/10] dt-bindings: soc: rockchip: Convert
 grf.txt to YAML
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
References: <20210429081151.17558-1-cl@rock-chips.com>
 <20210430005708.1821-1-cl@rock-chips.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <953e4240-77ea-ce1c-00a5-0625111ab2cd@gmail.com>
Date:   Fri, 30 Apr 2021 12:58:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210430005708.1821-1-cl@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Liang,

On 4/30/21 2:57 AM, cl@rock-chips.com wrote:
> From: Liang Chen <cl@rock-chips.com>
> 
> Current dts files with 'grf' nodes are manually verified. In order to
> automate this process grf.txt has to be converted to YAML.
> 
> Add new descriptions for:
> "rockchip,rk3568-grf", "syscon", "simple-mfd"
> "rockchip,rk3568-pmugrf", "syscon", "simple-mfd"

"rockchip,rv1108-pmugrf", "syscon"

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
> index 000000000000..21a67b9ae59c
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

syscon.yaml uses select if compatible contains "syscon", so use select
here too ??

> +properties:

> +  compatible:
> +    items:

When there are no other combinations then with syscon and simple-mfd
then there's no need for "oneOf", but a look in the build log shows
there are 2 (3) exceptions:

#cat build-dtbs-1471909.log | grep short
rv1108-elgin-r1.dt.yaml: syscon@202a0000: compatible:
['rockchip,rv1108-usbgrf', 'syscon'] is too short
rk3288-evb-act8846.dt.yaml: syscon@ff740000: compatible:
['rockchip,rk3288-sgrf', 'syscon'] is too short

https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210430005708.1821-1-cl@rock-chips.com/

===


	pmugrf: syscon@20060000 {

		compatible = "rockchip,rv1108-pmugrf", "syscon";

rockchip,rv1108-pmugrf was never added to a document.

		reg = <0x20060000 0x1000>;
	};

	usbgrf: syscon@202a0000 {
		compatible = "rockchip,rv1108-usbgrf", "syscon";
		reg = <0x202a0000 0x1000>;
	};
===

  compatible:
    oneOf:
      - items:
          - enum:
              - rockchip,rk3288-sgrf
===
              - rockchip,rv1108-pmugrf
===
              - rockchip,rv1108-usbgrf
          - const: syscon
      - items:
          - enum:
              - rockchip,px30-grf
              - rockchip,px30-pmugrf
              - rockchip,px30-usb2phy-grf
              - rockchip,rk3036-grf
              - rockchip,rk3066-grf
              - rockchip,rk3188-grf
              - rockchip,rk3228-grf
              - rockchip,rk3288-grf
              - rockchip,rk3308-core-grf
              - rockchip,rk3308-detect-grf
              - rockchip,rk3308-grf
              - rockchip,rk3328-grf
              - rockchip,rk3328-usb2phy-grf
              - rockchip,rk3368-grf
              - rockchip,rk3368-pmugrf
              - rockchip,rk3399-grf
              - rockchip,rk3399-pmugrf
              - rockchip,rk3568-grf
              - rockchip,rk3568-pmugrf
              - rockchip,rv1108-grf
          - const: syscon
          - const: simple-mfd

> +      - enum:
> +          - rockchip,px30-grf
> +          - rockchip,px30-pmugrf
> +          - rockchip,px30-usb2phy-grf
> +          - rockchip,rk3036-grf
> +          - rockchip,rk3066-grf
> +          - rockchip,rk3188-grf
> +          - rockchip,rk3228-grf
> +          - rockchip,rk3288-grf
> +          - rockchip,rk3288-sgrf
> +          - rockchip,rk3308-core-grf
> +          - rockchip,rk3308-detect-grf
> +          - rockchip,rk3308-grf
> +          - rockchip,rk3328-grf
> +          - rockchip,rk3328-usb2phy-grf
> +          - rockchip,rk3368-grf
> +          - rockchip,rk3368-pmugrf
> +          - rockchip,rk3399-grf
> +          - rockchip,rk3399-pmugrf
> +          - rockchip,rk3568-grf
> +          - rockchip,rk3568-pmugrf
> +          - rockchip,rv1108-grf
> +          - rockchip,rv1108-usbgrf
> +      - const: syscon
> +      - const: simple-mfd

> +
> +  reg:> +    maxItems: 1

"#address-cells":
  const: 1

"#size-cells":
  const: 1

rk3228-evb.dt.yaml: syscon@11000000: '#address-cells', '#size-cells',
'io-domains', 'usb2-phy@760', 'usb2-phy@800' do not match any of the
regexes: 'pinctrl-[0-9]+'

> +
> +required:
> +  - compatible
> +  - reg
> +

> +additionalProperties: false

additionalProperties: true

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
> 
