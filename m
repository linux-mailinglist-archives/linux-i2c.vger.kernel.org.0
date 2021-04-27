Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28E0D36C050
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Apr 2021 09:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234917AbhD0Hmf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Apr 2021 03:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235054AbhD0Hmd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Apr 2021 03:42:33 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03F5BC06175F;
        Tue, 27 Apr 2021 00:41:46 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id s15so68806286edd.4;
        Tue, 27 Apr 2021 00:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jOHpNKh1HTjasyN4XJNLgqTp4hVmVQAAzXgA0kDhz08=;
        b=XilaRLgG4z7jtAP1K1nwwywk6vXmjxVmuHvxQCk5mSk7JfDFK5iAJ4qw9YJyYZVPE4
         B4CUsFEuFGWCMoxYDIcR1R+oDjYn/rxp/yyde8qWZ2y8BujKLm/rvudYRc1T43br5eEE
         GA5lNbbCMExfmHzyBLJ4d5+yVpW2O5X6U30g/JDZ4ykGqiHgwnlQfU4pQTshEBNI3HAi
         /R+7X0wl1D7iF5IU5TwIKJC5UQ8ebt69G/JvzuSH1A6pkZj6j9s0bJOxFlTKA97IBs0J
         7R32IZUy0KLSxDipYeyUrb1jUDXXjHf1jBN+PzuXadJxH/5Dzp/M8rm0x2BWEVw19WUI
         YoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jOHpNKh1HTjasyN4XJNLgqTp4hVmVQAAzXgA0kDhz08=;
        b=FHhj1aMuk4/1/1RfH/pQ4elePnX02q6s/qv6P302yPOgrCFmRooQud/1o89Y7LV4kQ
         s5i2eTx0NeRmC0nifUqHVVeWiaNr0Q3/eryhYDHzfIS3SyRDuUe8nm+dEAquVcfGwLfb
         rnYcXxmQW+X4NAjsw3J4fs8kWlhdQUpzssThXOQBsgKJV7LXjZNx8goN6YD7FYPaVu6g
         7HQXmqQ3U+uHAi1Ha4nsAzhB+NYNM2UHAUEHgSdrzsK0TklTO4iddwhKM2hHhAvpDQtc
         vrZ4eBeXUVbyuqKaC0rmzBK25noZoV/2hFk3mnQnZxLl3nhlmk5vvOaymVPsXFg0zfAO
         GWUw==
X-Gm-Message-State: AOAM532Q/uHzLz8WmOg/ZbDaqZsMYO9Cahc2j5BV5BSbofATzDOiQBus
        95xtQKinqVNeWuE3KbkmFJJJSe8QBLAH+aTi
X-Google-Smtp-Source: ABdhPJxxYgiGZAbNM0IERzUdIhVwLuzii5Ng242BVgzibHt+OJkKlsutNVXxDRLTuGvg6x5UDfJ0nw==
X-Received: by 2002:a05:6402:51cd:: with SMTP id r13mr2786656edd.116.1619509304721;
        Tue, 27 Apr 2021 00:41:44 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id t1sm12922627eju.88.2021.04.27.00.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Apr 2021 00:41:44 -0700 (PDT)
Subject: Re: [PATCH v2 6/7] arm64: dts: rockchip: add core dtsi for RK3568 SoC
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
        linux-watchdog@vger.kernel.org
References: <20210425094216.25724-1-cl@rock-chips.com>
 <20210425094439.25895-1-cl@rock-chips.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <16908f63-4e20-ba1b-3b5c-39b4c4db242b@gmail.com>
Date:   Tue, 27 Apr 2021 09:41:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210425094439.25895-1-cl@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 4/25/21 11:44 AM, cl@rock-chips.com wrote:
> From: Liang Chen <cl@rock-chips.com>
> 
> RK3568 is a high-performance and low power quad-core application processor
> designed for personal mobile internet device and AIoT equipments. This patch
> add basic core dtsi file for it.
> 
> We use scmi_clk for cortex-a55 instead of standard ARMCLK, so that
> kernel/uboot/rtos can change cpu clk with the same code in ATF, and we will
> enalbe a special high-performacne PLL when high frequency is required. The
> smci_clk code is in ATF, and clkid for cpu is 0, as below:
> 
>     cpu0: cpu@0 {
>         device_type = "cpu";
>         compatible = "arm,cortex-a55";
>         reg = <0x0 0x0>;
>         clocks = <&scmi_clk 0>;
>     };
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> ---
>  .../boot/dts/rockchip/rk3568-pinctrl.dtsi     | 3119 +++++++++++++++++
>  arch/arm64/boot/dts/rockchip/rk3568.dtsi      |  812 +++++
>  2 files changed, 3931 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3568.dtsi
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
> new file mode 100644
> index 000000000000..94ee3c2c38af
> --- /dev/null

[..]

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> new file mode 100644
> index 000000000000..66cb50218ca1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> @@ -0,0 +1,812 @@

[..]

> +
> +	pmugrf: syscon@fdc20000 {

> +		compatible = "rockchip,rk3568-pmugrf", "syscon", "simple-mfd";

TODO:

> +		reg = <0x0 0xfdc20000 0x0 0x10000>;
> +
> +		reboot_mode: reboot-mode {
> +			compatible = "syscon-reboot-mode";
> +			mode-bootloader = <BOOT_BL_DOWNLOAD>;
> +			mode-fastboot = <BOOT_FASTBOOT>;
> +			mode-loader = <BOOT_BL_DOWNLOAD>;
> +			mode-normal = <BOOT_NORMAL>;
> +			mode-recovery = <BOOT_RECOVERY>;
> +			offset = <0x200>;
> +		};
> +	};
> +
> +	grf: syscon@fdc60000 {

> +		compatible = "rockchip,rk3568-grf", "syscon", "simple-mfd";

TODO:

> +		reg = <0x0 0xfdc60000 0x0 0x10000>;
> +	};
> +
> +	pmucru: clock-controller@fdd00000 {
> +		compatible = "rockchip,rk3568-pmucru";
> +		reg = <0x0 0xfdd00000 0x0 0x1000>;

> +		rockchip,grf = <&grf>;
> +		rockchip,pmugrf = <&pmugrf>;

clock-controller@fdd00000: 'rockchip,grf', 'rockchip,pmugrf' do not
match any of the regexes: 'pinctrl-[0-9]+'

Currently clk.c has only support for:

	ctx->grf = syscon_regmap_lookup_by_phandle(ctx->cru_node,
						   "rockchip,grf");

Manufacturer tree:

	ctx->pmugrf = syscon_regmap_lookup_by_phandle(ctx->cru_node,
						   "rockchip,pmugrf");
		case branch_muxpmugrf:
			clk = rockchip_clk_register_muxgrf(list->name,
				list->parent_names, list->num_parents,
				flags, ctx->pmugrf, list->muxdiv_offset,
				list->mux_shift, list->mux_width,
				list->mux_flags);
			break;


	MUXPMUGRF(SCLK_32K_IOE, "clk_32k_ioe", clk_32k_ioe_p,  0,
			RK3568_PMU_GRF_SOC_CON0, 0, 1, MFLAGS)

Do we need a fix?

> +		#clock-cells = <1>;
> +		#reset-cells = <1>;
> +	};
> +
> +	cru: clock-controller@fdd20000 {
> +		compatible = "rockchip,rk3568-cru";
> +		reg = <0x0 0xfdd20000 0x0 0x1000>;

> +		rockchip,grf = <&grf>;

clock-controller@fdd20000: 'assigned-clock-parents',
'assigned-clock-rates', 'assigned-clocks', 'rockchip,grf' do not match
any of the regexes:

Add more properties to rockchip,rk3568-cru.yaml

> +		#clock-cells = <1>;
> +		#reset-cells = <1>;
> +
> +		assigned-clocks =
> +			<&pmucru CLK_RTC_32K>, <&pmucru PLL_PPLL>,
> +			<&pmucru PCLK_PMU>, <&cru PLL_CPLL>,
> +			<&cru PLL_GPLL>, <&cru ACLK_BUS>,
> +			<&cru PCLK_BUS>, <&cru ACLK_TOP_HIGH>,
> +			<&cru ACLK_TOP_LOW>, <&cru HCLK_TOP>,
> +			<&cru PCLK_TOP>, <&cru ACLK_PERIMID>,
> +			<&cru HCLK_PERIMID>, <&cru PLL_NPLL>,
> +			<&cru ACLK_PIPE>, <&cru PCLK_PIPE>,
> +			<&cru ACLK_VOP>;
> +		assigned-clock-rates =
> +			<32768>, <200000000>,
> +			<100000000>, <1000000000>,
> +			<1188000000>, <150000000>,
> +			<100000000>, <500000000>,
> +			<400000000>, <150000000>,
> +			<100000000>, <300000000>,
> +			<150000000>, <1200000000>,
> +			<400000000>, <100000000>,
> +			<500000000>;
> +		assigned-clock-parents =
> +			<&pmucru CLK_RTC32K_FRAC>;
> +	};
