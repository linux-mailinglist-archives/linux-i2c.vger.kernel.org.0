Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D21F136D0FB
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Apr 2021 05:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbhD1DxK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Apr 2021 23:53:10 -0400
Received: from regular1.263xmail.com ([211.150.70.195]:33620 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbhD1DxK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Apr 2021 23:53:10 -0400
Received: from localhost (unknown [192.168.167.16])
        by regular1.263xmail.com (Postfix) with ESMTP id BBCA01D0D;
        Wed, 28 Apr 2021 11:51:57 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.151] (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P31921T139684281841408S1619581915530662_;
        Wed, 28 Apr 2021 11:51:57 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <688f917f3d5249d5a3fcc18c8a4f120d>
X-RL-SENDER: cl@rock-chips.com
X-SENDER: cl@rock-chips.com
X-LOGIN-NAME: cl@rock-chips.com
X-FST-TO: linux-watchdog@vger.kernel.org
X-RCPT-COUNT: 29
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Cc:     cl@rock-chips.com, robh+dt@kernel.org, jagan@amarulasolutions.com,
        wens@csie.org, uwe@kleine-koenig.org, mail@david-bauer.net,
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
Subject: Re: [PATCH v2 6/7] arm64: dts: rockchip: add core dtsi for RK3568 SoC
To:     =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        Johan Jonker <jbx6244@gmail.com>
References: <20210425094216.25724-1-cl@rock-chips.com>
 <20210425094439.25895-1-cl@rock-chips.com>
 <16908f63-4e20-ba1b-3b5c-39b4c4db242b@gmail.com> <6618564.gtipl9YmvM@diego>
From:   =?UTF-8?B?6ZmI5Lqu?= <cl@rock-chips.com>
Message-ID: <12c486c7-f9ce-5ddc-c5db-97e4855f38d6@rock-chips.com>
Date:   Wed, 28 Apr 2021 11:51:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6618564.gtipl9YmvM@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi heiko,

         I plan to drop grf stuff in next version, and make a new submit 
for grf and document later, thanks.

在 2021/4/27 下午4:07, Heiko Stübner 写道:
> Am Dienstag, 27. April 2021, 09:41:40 CEST schrieb Johan Jonker:
>> On 4/25/21 11:44 AM, cl@rock-chips.com wrote:
>>> From: Liang Chen <cl@rock-chips.com>
>>>
>>> RK3568 is a high-performance and low power quad-core application processor
>>> designed for personal mobile internet device and AIoT equipments. This patch
>>> add basic core dtsi file for it.
>>>
>>> We use scmi_clk for cortex-a55 instead of standard ARMCLK, so that
>>> kernel/uboot/rtos can change cpu clk with the same code in ATF, and we will
>>> enalbe a special high-performacne PLL when high frequency is required. The
>>> smci_clk code is in ATF, and clkid for cpu is 0, as below:
>>>
>>>      cpu0: cpu@0 {
>>>          device_type = "cpu";
>>>          compatible = "arm,cortex-a55";
>>>          reg = <0x0 0x0>;
>>>          clocks = <&scmi_clk 0>;
>>>      };
>>>
>>> Signed-off-by: Liang Chen <cl@rock-chips.com>
>>> ---
>>>   .../boot/dts/rockchip/rk3568-pinctrl.dtsi     | 3119 +++++++++++++++++
>>>   arch/arm64/boot/dts/rockchip/rk3568.dtsi      |  812 +++++
>>>   2 files changed, 3931 insertions(+)
>>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
>>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3568.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
>>> new file mode 100644
>>> index 000000000000..94ee3c2c38af
>>> --- /dev/null
>> [..]
>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
>>> new file mode 100644
>>> index 000000000000..66cb50218ca1
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
>>> @@ -0,0 +1,812 @@
>> [..]
>>
>>> +
>>> +	pmugrf: syscon@fdc20000 {
>>> +		compatible = "rockchip,rk3568-pmugrf", "syscon", "simple-mfd";
>> TODO:
>>
>>> +		reg = <0x0 0xfdc20000 0x0 0x10000>;
>>> +
>>> +		reboot_mode: reboot-mode {
>>> +			compatible = "syscon-reboot-mode";
>>> +			mode-bootloader = <BOOT_BL_DOWNLOAD>;
>>> +			mode-fastboot = <BOOT_FASTBOOT>;
>>> +			mode-loader = <BOOT_BL_DOWNLOAD>;
>>> +			mode-normal = <BOOT_NORMAL>;
>>> +			mode-recovery = <BOOT_RECOVERY>;
>>> +			offset = <0x200>;
>>> +		};
>>> +	};
>>> +
>>> +	grf: syscon@fdc60000 {
>>> +		compatible = "rockchip,rk3568-grf", "syscon", "simple-mfd";
>> TODO:
>>
>>> +		reg = <0x0 0xfdc60000 0x0 0x10000>;
>>> +	};
>>> +
>>> +	pmucru: clock-controller@fdd00000 {
>>> +		compatible = "rockchip,rk3568-pmucru";
>>> +		reg = <0x0 0xfdd00000 0x0 0x1000>;
>>> +		rockchip,grf = <&grf>;
>>> +		rockchip,pmugrf = <&pmugrf>;
>> clock-controller@fdd00000: 'rockchip,grf', 'rockchip,pmugrf' do not
>> match any of the regexes: 'pinctrl-[0-9]+'
>>
>> Currently clk.c has only support for:
>>
>> 	ctx->grf = syscon_regmap_lookup_by_phandle(ctx->cru_node,
>> 						   "rockchip,grf");
>>
>> Manufacturer tree:
>>
>> 	ctx->pmugrf = syscon_regmap_lookup_by_phandle(ctx->cru_node,
>> 						   "rockchip,pmugrf");
>> 		case branch_muxpmugrf:
>> 			clk = rockchip_clk_register_muxgrf(list->name,
>> 				list->parent_names, list->num_parents,
>> 				flags, ctx->pmugrf, list->muxdiv_offset,
>> 				list->mux_shift, list->mux_width,
>> 				list->mux_flags);
>> 			break;
>>
>>
>> 	MUXPMUGRF(SCLK_32K_IOE, "clk_32k_ioe", clk_32k_ioe_p,  0,
>> 			RK3568_PMU_GRF_SOC_CON0, 0, 1, MFLAGS)
> (1) drop the rockchip,pmugrf property please
> (2) as I see it, we will only need the rockchip,grf property.
>
> For main clock controller grf points to main grf
> For pmu clock controller grf points to pmugrf
>
> Each clock controller has its own associated grf.
>
> I really see no case where main-clk would need to access the pmugrf
> same as pmu-clk would should not need to access the main grf, as the
> split into main-{clk,grf} + pmu-{clk,grf} is probably a for power-management
> reasons to separate different power-areas, the driver should also not
> cross this barrier anyway ;-) .
>
> Same as, if a clk uses the pmugrf it is a pmu-based clock, if it uses the
> main grf, it should live in the main clock driver.
>
> And as expected the clk_32k_ioe is already defined in the pmuclk
> part of the driver ;-)
>
>
> Heiko
>
>
>>> +		#clock-cells = <1>;
>>> +		#reset-cells = <1>;
>>> +	};
>>> +
>>> +	cru: clock-controller@fdd20000 {
>>> +		compatible = "rockchip,rk3568-cru";
>>> +		reg = <0x0 0xfdd20000 0x0 0x1000>;
>>> +		rockchip,grf = <&grf>;
>> clock-controller@fdd20000: 'assigned-clock-parents',
>> 'assigned-clock-rates', 'assigned-clocks', 'rockchip,grf' do not match
>> any of the regexes:
>>
>> Add more properties to rockchip,rk3568-cru.yaml
>>
>>> +		#clock-cells = <1>;
>>> +		#reset-cells = <1>;
>>> +
>>> +		assigned-clocks =
>>> +			<&pmucru CLK_RTC_32K>, <&pmucru PLL_PPLL>,
>>> +			<&pmucru PCLK_PMU>, <&cru PLL_CPLL>,
>>> +			<&cru PLL_GPLL>, <&cru ACLK_BUS>,
>>> +			<&cru PCLK_BUS>, <&cru ACLK_TOP_HIGH>,
>>> +			<&cru ACLK_TOP_LOW>, <&cru HCLK_TOP>,
>>> +			<&cru PCLK_TOP>, <&cru ACLK_PERIMID>,
>>> +			<&cru HCLK_PERIMID>, <&cru PLL_NPLL>,
>>> +			<&cru ACLK_PIPE>, <&cru PCLK_PIPE>,
>>> +			<&cru ACLK_VOP>;
>>> +		assigned-clock-rates =
>>> +			<32768>, <200000000>,
>>> +			<100000000>, <1000000000>,
>>> +			<1188000000>, <150000000>,
>>> +			<100000000>, <500000000>,
>>> +			<400000000>, <150000000>,
>>> +			<100000000>, <300000000>,
>>> +			<150000000>, <1200000000>,
>>> +			<400000000>, <100000000>,
>>> +			<500000000>;
>>> +		assigned-clock-parents =
>>> +			<&pmucru CLK_RTC32K_FRAC>;
>>> +	};
>
>
>
>
>
>


