Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB74936A614
	for <lists+linux-i2c@lfdr.de>; Sun, 25 Apr 2021 11:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbhDYJ0z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 25 Apr 2021 05:26:55 -0400
Received: from regular1.263xmail.com ([211.150.70.197]:53162 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbhDYJ0y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 25 Apr 2021 05:26:54 -0400
Received: from localhost (unknown [192.168.167.235])
        by regular1.263xmail.com (Postfix) with ESMTP id 577261B58;
        Sun, 25 Apr 2021 17:26:10 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.151] (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P2752T140649326405376S1619342768387187_;
        Sun, 25 Apr 2021 17:26:09 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <f02763177796729d92939f2eb5520341>
X-RL-SENDER: cl@rock-chips.com
X-SENDER: cl@rock-chips.com
X-LOGIN-NAME: cl@rock-chips.com
X-FST-TO: huangtao@rock-chips.com
X-RCPT-COUNT: 25
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
        zhangqing@rock-chips.com, huangtao@rock-chips.com
Subject: Re: [PATCH v1 4/5] arm64: dts: rockchip: add core dtsi for RK3568 SoC
To:     Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de
References: <20210421065921.23917-1-cl@rock-chips.com>
 <20210421065921.23917-5-cl@rock-chips.com>
 <3739e650-7ffc-c521-b97f-5476576036cf@gmail.com>
From:   =?UTF-8?B?6ZmI5Lqu?= <cl@rock-chips.com>
Message-ID: <c550599a-f468-d8f5-8cca-cf0764a67a6a@rock-chips.com>
Date:   Sun, 25 Apr 2021 17:26:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3739e650-7ffc-c521-b97f-5476576036cf@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Johan,

Thanks for reply.

The dts/dtsi is fixed follow the rules, some documents is still in progress.

I will send version 2 later,  and i will add documents after the pending 
documents is merged.


在 2021/4/22 上午2:48, Johan Jonker 写道:
> Hi Liang,
>
> In version 2 add YAML changes/documents for these strings below.
>
> "rockchip,rk3568";
> "rockchip,rk3568-dw-mshc", "rockchip,rk3288-dw-mshc";
> "rockchip,rk3568-grf", "syscon", "simple-mfd";
> "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
> "rockchip,rk3568-pmugrf", "syscon", "simple-mfd";
> "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> "rockchip,rk3568-uart", "snps,dw-apb-uart";
> "rockchip,rk3568-wdt", "snps,dw-wdt"
>
> ===
> Heiko's sort rules:
>
> compatible
> reg
> interrupts
> [alphabetical]
> status [if needed]
>
> ===
> My incomplete list:
>
> For nodes:
> If exists on top: model, compatible and chosen.
> Sort things without reg alphabetical first,
> then sort the rest by reg address.
>
> Inside nodes:
> If exists on top: compatible, reg and interrupts.
> In alphabetical order the required properties.
> Then in alphabetical order the other properties.
> And as last things that start with '#' in alphabetical order.
> Add status below all other properties for soc internal components with
> any board-specifics.
> Keep an empty line between properties and nodes.
>
> Exceptions:
> Sort pinctrl-0 above pinctrl-names, so it stays in line with clock-names
> and dma-names.
> Sort simple-audio-card,name above other simple-audio-card properties.
> Sort regulator-name above other regulator properties.
> Sort regulator-min-microvolt above regulator-max-microvolt.
>
> ===
>
> Fix complete dtsi for property sort order!
>
> Johan
>
> On 4/21/21 8:59 AM, cl@rock-chips.com wrote:
>> From: Liang Chen <cl@rock-chips.com>
>>
>> RK3568 is a high-performance and low power quad-core application processor
>> designed for personal mobile internet device and AIoT equipments.
>>
>> This patch add basic core dtsi file for it.
>>
>> Signed-off-by: Liang Chen <cl@rock-chips.com>
>> ---
>>   .../boot/dts/rockchip/rk3568-pinctrl.dtsi     | 2789 +++++++++++++++++
>>   arch/arm64/boot/dts/rockchip/rk3568.dtsi      |  795 +++++
>>   .../boot/dts/rockchip/rockchip-pinconf.dtsi   |  346 ++
>>   3 files changed, 3930 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3568.dtsi
>>   create mode 100644 arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
>> new file mode 100644
>> index 000000000000..92b315763dc0
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
>> @@ -0,0 +1,2789 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
>> + */
>> +
>> +#include <dt-bindings/pinctrl/rockchip.h>
>> +#include "rockchip-pinconf.dtsi"
>> +
>> +/*
>> + * This file is auto generated by pin2dts tool, please keep these code
>> + * by adding changes at end of this file.
>> + */
>> +&pinctrl {
>> +	acodec {
>> +		/omit-if-no-ref/
>> +		acodec_pins: acodec-pins {
>> +			rockchip,pins =
>> +				/* acodec_adc_sync */
>> +				<1 RK_PB1 5 &pcfg_pull_none>,
>> +				/* acodec_adcclk */
>> +				<1 RK_PA1 5 &pcfg_pull_none>,
>> +				/* acodec_adcdata */
>> +				<1 RK_PA0 5 &pcfg_pull_none>,
>> +				/* acodec_dac_datal */
>> +				<1 RK_PA7 5 &pcfg_pull_none>,
>> +				/* acodec_dac_datar */
>> +				<1 RK_PB0 5 &pcfg_pull_none>,
>> +				/* acodec_dacclk */
>> +				<1 RK_PA3 5 &pcfg_pull_none>,
>> +				/* acodec_dacsync */
>> +				<1 RK_PA5 5 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	audiopwm {
>> +		/omit-if-no-ref/
>> +		audiopwm_lout: audiopwm-lout {
>> +			rockchip,pins =
>> +				/* audiopwm_lout */
>> +				<1 RK_PA0 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		audiopwm_loutn: audiopwm-loutn {
>> +			rockchip,pins =
>> +				/* audiopwm_loutn */
>> +				<1 RK_PA1 6 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		audiopwm_loutp: audiopwm-loutp {
>> +			rockchip,pins =
>> +				/* audiopwm_loutp */
>> +				<1 RK_PA0 6 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		audiopwm_rout: audiopwm-rout {
>> +			rockchip,pins =
>> +				/* audiopwm_rout */
>> +				<1 RK_PA1 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		audiopwm_routn: audiopwm-routn {
>> +			rockchip,pins =
>> +				/* audiopwm_routn */
>> +				<1 RK_PA7 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		audiopwm_routp: audiopwm-routp {
>> +			rockchip,pins =
>> +				/* audiopwm_routp */
>> +				<1 RK_PA6 4 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	bt656 {
>> +		/omit-if-no-ref/
>> +		bt656m0_pins: bt656m0-pins {
>> +			rockchip,pins =
>> +				/* bt656_clkm0 */
>> +				<3 RK_PA0 2 &pcfg_pull_none>,
>> +				/* bt656_d0m0 */
>> +				<2 RK_PD0 2 &pcfg_pull_none>,
>> +				/* bt656_d1m0 */
>> +				<2 RK_PD1 2 &pcfg_pull_none>,
>> +				/* bt656_d2m0 */
>> +				<2 RK_PD2 2 &pcfg_pull_none>,
>> +				/* bt656_d3m0 */
>> +				<2 RK_PD3 2 &pcfg_pull_none>,
>> +				/* bt656_d4m0 */
>> +				<2 RK_PD4 2 &pcfg_pull_none>,
>> +				/* bt656_d5m0 */
>> +				<2 RK_PD5 2 &pcfg_pull_none>,
>> +				/* bt656_d6m0 */
>> +				<2 RK_PD6 2 &pcfg_pull_none>,
>> +				/* bt656_d7m0 */
>> +				<2 RK_PD7 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		bt656m1_pins: bt656m1-pins {
>> +			rockchip,pins =
>> +				/* bt656_clkm1 */
>> +				<4 RK_PB4 5 &pcfg_pull_none>,
>> +				/* bt656_d0m1 */
>> +				<3 RK_PC6 5 &pcfg_pull_none>,
>> +				/* bt656_d1m1 */
>> +				<3 RK_PC7 5 &pcfg_pull_none>,
>> +				/* bt656_d2m1 */
>> +				<3 RK_PD0 5 &pcfg_pull_none>,
>> +				/* bt656_d3m1 */
>> +				<3 RK_PD1 5 &pcfg_pull_none>,
>> +				/* bt656_d4m1 */
>> +				<3 RK_PD2 5 &pcfg_pull_none>,
>> +				/* bt656_d5m1 */
>> +				<3 RK_PD3 5 &pcfg_pull_none>,
>> +				/* bt656_d6m1 */
>> +				<3 RK_PD4 5 &pcfg_pull_none>,
>> +				/* bt656_d7m1 */
>> +				<3 RK_PD5 5 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	bt1120 {
>> +		/omit-if-no-ref/
>> +		bt1120_pins: bt1120-pins {
>> +			rockchip,pins =
>> +				/* bt1120_clk */
>> +				<3 RK_PA6 2 &pcfg_pull_none>,
>> +				/* bt1120_d0 */
>> +				<3 RK_PA1 2 &pcfg_pull_none>,
>> +				/* bt1120_d1 */
>> +				<3 RK_PA2 2 &pcfg_pull_none>,
>> +				/* bt1120_d2 */
>> +				<3 RK_PA3 2 &pcfg_pull_none>,
>> +				/* bt1120_d3 */
>> +				<3 RK_PA4 2 &pcfg_pull_none>,
>> +				/* bt1120_d4 */
>> +				<3 RK_PA5 2 &pcfg_pull_none>,
>> +				/* bt1120_d5 */
>> +				<3 RK_PA7 2 &pcfg_pull_none>,
>> +				/* bt1120_d6 */
>> +				<3 RK_PB0 2 &pcfg_pull_none>,
>> +				/* bt1120_d7 */
>> +				<3 RK_PB1 2 &pcfg_pull_none>,
>> +				/* bt1120_d8 */
>> +				<3 RK_PB2 2 &pcfg_pull_none>,
>> +				/* bt1120_d9 */
>> +				<3 RK_PB3 2 &pcfg_pull_none>,
>> +				/* bt1120_d10 */
>> +				<3 RK_PB4 2 &pcfg_pull_none>,
>> +				/* bt1120_d11 */
>> +				<3 RK_PB5 2 &pcfg_pull_none>,
>> +				/* bt1120_d12 */
>> +				<3 RK_PB6 2 &pcfg_pull_none>,
>> +				/* bt1120_d13 */
>> +				<3 RK_PC1 2 &pcfg_pull_none>,
>> +				/* bt1120_d14 */
>> +				<3 RK_PC2 2 &pcfg_pull_none>,
>> +				/* bt1120_d15 */
>> +				<3 RK_PC3 2 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	cam {
>> +		/omit-if-no-ref/
>> +		cam_clkout0: cam-clkout0 {
>> +			rockchip,pins =
>> +				/* cam_clkout0 */
>> +				<4 RK_PA7 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		cam_clkout1: cam-clkout1 {
>> +			rockchip,pins =
>> +				/* cam_clkout1 */
>> +				<4 RK_PB0 1 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	can0 {
>> +		/omit-if-no-ref/
>> +		can0m0_pins: can0m0-pins {
>> +			rockchip,pins =
>> +				/* can0_rxm0 */
>> +				<0 RK_PB4 2 &pcfg_pull_none>,
>> +				/* can0_txm0 */
>> +				<0 RK_PB3 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		can0m1_pins: can0m1-pins {
>> +			rockchip,pins =
>> +				/* can0_rxm1 */
>> +				<2 RK_PA2 4 &pcfg_pull_none>,
>> +				/* can0_txm1 */
>> +				<2 RK_PA1 4 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	can1 {
>> +		/omit-if-no-ref/
>> +		can1m0_pins: can1m0-pins {
>> +			rockchip,pins =
>> +				/* can1_rxm0 */
>> +				<1 RK_PA0 3 &pcfg_pull_none>,
>> +				/* can1_txm0 */
>> +				<1 RK_PA1 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		can1m1_pins: can1m1-pins {
>> +			rockchip,pins =
>> +				/* can1_rxm1 */
>> +				<4 RK_PC2 3 &pcfg_pull_none>,
>> +				/* can1_txm1 */
>> +				<4 RK_PC3 3 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	can2 {
>> +		/omit-if-no-ref/
>> +		can2m0_pins: can2m0-pins {
>> +			rockchip,pins =
>> +				/* can2_rxm0 */
>> +				<4 RK_PB4 3 &pcfg_pull_none>,
>> +				/* can2_txm0 */
>> +				<4 RK_PB5 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		can2m1_pins: can2m1-pins {
>> +			rockchip,pins =
>> +				/* can2_rxm1 */
>> +				<2 RK_PB1 4 &pcfg_pull_none>,
>> +				/* can2_txm1 */
>> +				<2 RK_PB2 4 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	cif {
>> +		/omit-if-no-ref/
>> +		cif_clk: cif-clk {
>> +			rockchip,pins =
>> +				/* cif_clkout */
>> +				<4 RK_PC0 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		cif_dvp_clk: cif-dvp-clk {
>> +			rockchip,pins =
>> +				/* cif_clkin */
>> +				<4 RK_PC1 1 &pcfg_pull_none>,
>> +				/* cif_href */
>> +				<4 RK_PB6 1 &pcfg_pull_none>,
>> +				/* cif_vsync */
>> +				<4 RK_PB7 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		cif_dvp_bus16: cif-dvp-bus16 {
>> +			rockchip,pins =
>> +				/* cif_d8 */
>> +				<3 RK_PD6 1 &pcfg_pull_none>,
>> +				/* cif_d9 */
>> +				<3 RK_PD7 1 &pcfg_pull_none>,
>> +				/* cif_d10 */
>> +				<4 RK_PA0 1 &pcfg_pull_none>,
>> +				/* cif_d11 */
>> +				<4 RK_PA1 1 &pcfg_pull_none>,
>> +				/* cif_d12 */
>> +				<4 RK_PA2 1 &pcfg_pull_none>,
>> +				/* cif_d13 */
>> +				<4 RK_PA3 1 &pcfg_pull_none>,
>> +				/* cif_d14 */
>> +				<4 RK_PA4 1 &pcfg_pull_none>,
>> +				/* cif_d15 */
>> +				<4 RK_PA5 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		cif_dvp_bus8: cif-dvp-bus8 {
>> +			rockchip,pins =
>> +				/* cif_d0 */
>> +				<3 RK_PC6 1 &pcfg_pull_none>,
>> +				/* cif_d1 */
>> +				<3 RK_PC7 1 &pcfg_pull_none>,
>> +				/* cif_d2 */
>> +				<3 RK_PD0 1 &pcfg_pull_none>,
>> +				/* cif_d3 */
>> +				<3 RK_PD1 1 &pcfg_pull_none>,
>> +				/* cif_d4 */
>> +				<3 RK_PD2 1 &pcfg_pull_none>,
>> +				/* cif_d5 */
>> +				<3 RK_PD3 1 &pcfg_pull_none>,
>> +				/* cif_d6 */
>> +				<3 RK_PD4 1 &pcfg_pull_none>,
>> +				/* cif_d7 */
>> +				<3 RK_PD5 1 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	clk32k {
>> +		/omit-if-no-ref/
>> +		clk32k_in: clk32k-in {
>> +			rockchip,pins =
>> +				/* clk32k_in */
>> +				<0 RK_PB0 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		clk32k_out0: clk32k-out0 {
>> +			rockchip,pins =
>> +				/* clk32k_out0 */
>> +				<0 RK_PB0 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		clk32k_out1: clk32k-out1 {
>> +			rockchip,pins =
>> +				/* clk32k_out1 */
>> +				<2 RK_PC6 1 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	cpu {
>> +		/omit-if-no-ref/
>> +		cpu_pins: cpu-pins {
>> +			rockchip,pins =
>> +				/* cpu_avs */
>> +				<0 RK_PB7 2 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	ebc {
>> +		/omit-if-no-ref/
>> +		ebc_extern: ebc-extern {
>> +			rockchip,pins =
>> +				/* ebc_sdce1 */
>> +				<4 RK_PA7 2 &pcfg_pull_none>,
>> +				/* ebc_sdce2 */
>> +				<4 RK_PB0 2 &pcfg_pull_none>,
>> +				/* ebc_sdce3 */
>> +				<4 RK_PB1 2 &pcfg_pull_none>,
>> +				/* ebc_sdshr */
>> +				<4 RK_PB5 2 &pcfg_pull_none>,
>> +				/* ebc_vcom */
>> +				<4 RK_PB2 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		ebc_pins: ebc-pins {
>> +			rockchip,pins =
>> +				/* ebc_gdclk */
>> +				<4 RK_PC0 2 &pcfg_pull_none>,
>> +				/* ebc_gdoe */
>> +				<4 RK_PB3 2 &pcfg_pull_none>,
>> +				/* ebc_gdsp */
>> +				<4 RK_PB4 2 &pcfg_pull_none>,
>> +				/* ebc_sdce0 */
>> +				<4 RK_PA6 2 &pcfg_pull_none>,
>> +				/* ebc_sdclk */
>> +				<4 RK_PC1 2 &pcfg_pull_none>,
>> +				/* ebc_sddo0 */
>> +				<3 RK_PC6 2 &pcfg_pull_none>,
>> +				/* ebc_sddo1 */
>> +				<3 RK_PC7 2 &pcfg_pull_none>,
>> +				/* ebc_sddo2 */
>> +				<3 RK_PD0 2 &pcfg_pull_none>,
>> +				/* ebc_sddo3 */
>> +				<3 RK_PD1 2 &pcfg_pull_none>,
>> +				/* ebc_sddo4 */
>> +				<3 RK_PD2 2 &pcfg_pull_none>,
>> +				/* ebc_sddo5 */
>> +				<3 RK_PD3 2 &pcfg_pull_none>,
>> +				/* ebc_sddo6 */
>> +				<3 RK_PD4 2 &pcfg_pull_none>,
>> +				/* ebc_sddo7 */
>> +				<3 RK_PD5 2 &pcfg_pull_none>,
>> +				/* ebc_sddo8 */
>> +				<3 RK_PD6 2 &pcfg_pull_none>,
>> +				/* ebc_sddo9 */
>> +				<3 RK_PD7 2 &pcfg_pull_none>,
>> +				/* ebc_sddo10 */
>> +				<4 RK_PA0 2 &pcfg_pull_none>,
>> +				/* ebc_sddo11 */
>> +				<4 RK_PA1 2 &pcfg_pull_none>,
>> +				/* ebc_sddo12 */
>> +				<4 RK_PA2 2 &pcfg_pull_none>,
>> +				/* ebc_sddo13 */
>> +				<4 RK_PA3 2 &pcfg_pull_none>,
>> +				/* ebc_sddo14 */
>> +				<4 RK_PA4 2 &pcfg_pull_none>,
>> +				/* ebc_sddo15 */
>> +				<4 RK_PA5 2 &pcfg_pull_none>,
>> +				/* ebc_sdle */
>> +				<4 RK_PB6 2 &pcfg_pull_none>,
>> +				/* ebc_sdoe */
>> +				<4 RK_PB7 2 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	edpdp {
>> +		/omit-if-no-ref/
>> +		edpdpm0_pins: edpdpm0-pins {
>> +			rockchip,pins =
>> +				/* edpdp_hpdinm0 */
>> +				<4 RK_PC4 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		edpdpm1_pins: edpdpm1-pins {
>> +			rockchip,pins =
>> +				/* edpdp_hpdinm1 */
>> +				<0 RK_PC2 2 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	emmc {
>> +		/omit-if-no-ref/
>> +		emmc_rstnout: emmc-rstnout {
>> +			rockchip,pins =
>> +				/* emmc_rstn */
>> +				<1 RK_PC7 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		emmc_bus8: emmc-bus8 {
>> +			rockchip,pins =
>> +				/* emmc_d0 */
>> +				<1 RK_PB4 1 &pcfg_pull_up_drv_level_2>,
>> +				/* emmc_d1 */
>> +				<1 RK_PB5 1 &pcfg_pull_up_drv_level_2>,
>> +				/* emmc_d2 */
>> +				<1 RK_PB6 1 &pcfg_pull_up_drv_level_2>,
>> +				/* emmc_d3 */
>> +				<1 RK_PB7 1 &pcfg_pull_up_drv_level_2>,
>> +				/* emmc_d4 */
>> +				<1 RK_PC0 1 &pcfg_pull_up_drv_level_2>,
>> +				/* emmc_d5 */
>> +				<1 RK_PC1 1 &pcfg_pull_up_drv_level_2>,
>> +				/* emmc_d6 */
>> +				<1 RK_PC2 1 &pcfg_pull_up_drv_level_2>,
>> +				/* emmc_d7 */
>> +				<1 RK_PC3 1 &pcfg_pull_up_drv_level_2>;
>> +		};
>> +		/omit-if-no-ref/
>> +		emmc_clk: emmc-clk {
>> +			rockchip,pins =
>> +				/* emmc_clkout */
>> +				<1 RK_PC5 1 &pcfg_pull_up_drv_level_2>;
>> +		};
>> +		/omit-if-no-ref/
>> +		emmc_cmd: emmc-cmd {
>> +			rockchip,pins =
>> +				/* emmc_cmd */
>> +				<1 RK_PC4 1 &pcfg_pull_up_drv_level_2>;
>> +		};
>> +		/omit-if-no-ref/
>> +		emmc_datastrobe: emmc-datastrobe {
>> +			rockchip,pins =
>> +				/* emmc_datastrobe */
>> +				<1 RK_PC6 1 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	eth0 {
>> +		/omit-if-no-ref/
>> +		eth0_pins: eth0-pins {
>> +			rockchip,pins =
>> +				/* eth0_refclko25m */
>> +				<2 RK_PC1 2 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	eth1 {
>> +		/omit-if-no-ref/
>> +		eth1m0_pins: eth1m0-pins {
>> +			rockchip,pins =
>> +				/* eth1_refclko25mm0 */
>> +				<3 RK_PB0 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		eth1m1_pins: eth1m1-pins {
>> +			rockchip,pins =
>> +				/* eth1_refclko25mm1 */
>> +				<4 RK_PB3 3 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	flash {
>> +		/omit-if-no-ref/
>> +		flash_pins: flash-pins {
>> +			rockchip,pins =
>> +				/* flash_ale */
>> +				<1 RK_PD0 2 &pcfg_pull_none>,
>> +				/* flash_cle */
>> +				<1 RK_PC6 3 &pcfg_pull_none>,
>> +				/* flash_cs0n */
>> +				<1 RK_PD3 2 &pcfg_pull_none>,
>> +				/* flash_cs1n */
>> +				<1 RK_PD4 2 &pcfg_pull_none>,
>> +				/* flash_d0 */
>> +				<1 RK_PB4 2 &pcfg_pull_none>,
>> +				/* flash_d1 */
>> +				<1 RK_PB5 2 &pcfg_pull_none>,
>> +				/* flash_d2 */
>> +				<1 RK_PB6 2 &pcfg_pull_none>,
>> +				/* flash_d3 */
>> +				<1 RK_PB7 2 &pcfg_pull_none>,
>> +				/* flash_d4 */
>> +				<1 RK_PC0 2 &pcfg_pull_none>,
>> +				/* flash_d5 */
>> +				<1 RK_PC1 2 &pcfg_pull_none>,
>> +				/* flash_d6 */
>> +				<1 RK_PC2 2 &pcfg_pull_none>,
>> +				/* flash_d7 */
>> +				<1 RK_PC3 2 &pcfg_pull_none>,
>> +				/* flash_dqs */
>> +				<1 RK_PC5 2 &pcfg_pull_none>,
>> +				/* flash_rdn */
>> +				<1 RK_PD2 2 &pcfg_pull_none>,
>> +				/* flash_rdy */
>> +				<1 RK_PD1 2 &pcfg_pull_none>,
>> +				/* flash_volsel */
>> +				<0 RK_PA7 1 &pcfg_pull_none>,
>> +				/* flash_wpn */
>> +				<1 RK_PC7 3 &pcfg_pull_none>,
>> +				/* flash_wrn */
>> +				<1 RK_PC4 2 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	fspi {
>> +		/omit-if-no-ref/
>> +		fspi_pins: fspi-pins {
>> +			rockchip,pins =
>> +				/* fspi_clk */
>> +				<1 RK_PD0 1 &pcfg_pull_none>,
>> +				/* fspi_cs0n */
>> +				<1 RK_PD3 1 &pcfg_pull_none>,
>> +				/* fspi_d0 */
>> +				<1 RK_PD1 1 &pcfg_pull_none>,
>> +				/* fspi_d1 */
>> +				<1 RK_PD2 1 &pcfg_pull_none>,
>> +				/* fspi_d2 */
>> +				<1 RK_PC7 2 &pcfg_pull_none>,
>> +				/* fspi_d3 */
>> +				<1 RK_PD4 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		fspi_cs1: fspi-cs1 {
>> +			rockchip,pins =
>> +				/* fspi_cs1n */
>> +				<1 RK_PC6 2 &pcfg_pull_up>;
>> +		};
>> +	};
>> +	gmac0 {
>> +		/omit-if-no-ref/
>> +		gmac0_miim: gmac0-miim {
>> +			rockchip,pins =
>> +				/* gmac0_mdc */
>> +				<2 RK_PC3 2 &pcfg_pull_none>,
>> +				/* gmac0_mdio */
>> +				<2 RK_PC4 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac0_clkinout: gmac0-clkinout {
>> +			rockchip,pins =
>> +				/* gmac0_mclkinout */
>> +				<2 RK_PC2 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac0_rx_er: gmac0-rx-er {
>> +			rockchip,pins =
>> +				/* gmac0_rxer */
>> +				<2 RK_PC5 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac0_rx_bus2: gmac0-rx-bus2 {
>> +			rockchip,pins =
>> +				/* gmac0_rxd0 */
>> +				<2 RK_PB6 1 &pcfg_pull_none>,
>> +				/* gmac0_rxd1 */
>> +				<2 RK_PB7 2 &pcfg_pull_none>,
>> +				/* gmac0_rxdvcrs */
>> +				<2 RK_PC0 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac0_tx_bus2: gmac0-tx-bus2 {
>> +			rockchip,pins =
>> +				/* gmac0_txd0 */
>> +				<2 RK_PB3 1 &pcfg_pull_none_drv_level_2>,
>> +				/* gmac0_txd1 */
>> +				<2 RK_PB4 1 &pcfg_pull_none_drv_level_2>,
>> +				/* gmac0_txen */
>> +				<2 RK_PB5 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac0_rgmii_clk: gmac0-rgmii-clk {
>> +			rockchip,pins =
>> +				/* gmac0_rxclk */
>> +				<2 RK_PA5 2 &pcfg_pull_none>,
>> +				/* gmac0_txclk */
>> +				<2 RK_PB0 2 &pcfg_pull_none_drv_level_1>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac0_rgmii_bus: gmac0-rgmii-bus {
>> +			rockchip,pins =
>> +				/* gmac0_rxd2 */
>> +				<2 RK_PA3 2 &pcfg_pull_none>,
>> +				/* gmac0_rxd3 */
>> +				<2 RK_PA4 2 &pcfg_pull_none>,
>> +				/* gmac0_txd2 */
>> +				<2 RK_PA6 2 &pcfg_pull_none_drv_level_2>,
>> +				/* gmac0_txd3 */
>> +				<2 RK_PA7 2 &pcfg_pull_none_drv_level_2>;
>> +		};
>> +	};
>> +	gmac1 {
>> +		/omit-if-no-ref/
>> +		gmac1m0_miim: gmac1m0-miim {
>> +			rockchip,pins =
>> +				/* gmac1_mdcm0 */
>> +				<3 RK_PC4 3 &pcfg_pull_none>,
>> +				/* gmac1_mdiom0 */
>> +				<3 RK_PC5 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac1m0_clkinout: gmac1m0-clkinout {
>> +			rockchip,pins =
>> +				/* gmac1_mclkinoutm0 */
>> +				<3 RK_PC0 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac1m0_rx_er: gmac1m0-rx-er {
>> +			rockchip,pins =
>> +				/* gmac1_rxerm0 */
>> +				<3 RK_PB4 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac1m0_rx_bus2: gmac1m0-rx-bus2 {
>> +			rockchip,pins =
>> +				/* gmac1_rxd0m0 */
>> +				<3 RK_PB1 3 &pcfg_pull_none>,
>> +				/* gmac1_rxd1m0 */
>> +				<3 RK_PB2 3 &pcfg_pull_none>,
>> +				/* gmac1_rxdvcrsm0 */
>> +				<3 RK_PB3 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac1m0_tx_bus2: gmac1m0-tx-bus2 {
>> +			rockchip,pins =
>> +				/* gmac1_txd0m0 */
>> +				<3 RK_PB5 3 &pcfg_pull_none_drv_level_2>,
>> +				/* gmac1_txd1m0 */
>> +				<3 RK_PB6 3 &pcfg_pull_none_drv_level_2>,
>> +				/* gmac1_txenm0 */
>> +				<3 RK_PB7 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac1m0_rgmii_clk: gmac1m0-rgmii-clk {
>> +			rockchip,pins =
>> +				/* gmac1_rxclkm0 */
>> +				<3 RK_PA7 3 &pcfg_pull_none>,
>> +				/* gmac1_txclkm0 */
>> +				<3 RK_PA6 3 &pcfg_pull_none_drv_level_1>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac1m0_rgmii_bus: gmac1m0-rgmii-bus {
>> +			rockchip,pins =
>> +				/* gmac1_rxd2m0 */
>> +				<3 RK_PA4 3 &pcfg_pull_none>,
>> +				/* gmac1_rxd3m0 */
>> +				<3 RK_PA5 3 &pcfg_pull_none>,
>> +				/* gmac1_txd2m0 */
>> +				<3 RK_PA2 3 &pcfg_pull_none_drv_level_2>,
>> +				/* gmac1_txd3m0 */
>> +				<3 RK_PA3 3 &pcfg_pull_none_drv_level_2>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac1m1_miim: gmac1m1-miim {
>> +			rockchip,pins =
>> +				/* gmac1_mdcm1 */
>> +				<4 RK_PB6 3 &pcfg_pull_none>,
>> +				/* gmac1_mdiom1 */
>> +				<4 RK_PB7 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac1m1_clkinout: gmac1m1-clkinout {
>> +			rockchip,pins =
>> +				/* gmac1_mclkinoutm1 */
>> +				<4 RK_PC1 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac1m1_rx_er: gmac1m1-rx-er {
>> +			rockchip,pins =
>> +				/* gmac1_rxerm1 */
>> +				<4 RK_PB2 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac1m1_rx_bus2: gmac1m1-rx-bus2 {
>> +			rockchip,pins =
>> +				/* gmac1_rxd0m1 */
>> +				<4 RK_PA7 3 &pcfg_pull_none>,
>> +				/* gmac1_rxd1m1 */
>> +				<4 RK_PB0 3 &pcfg_pull_none>,
>> +				/* gmac1_rxdvcrsm1 */
>> +				<4 RK_PB1 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac1m1_tx_bus2: gmac1m1-tx-bus2 {
>> +			rockchip,pins =
>> +				/* gmac1_txd0m1 */
>> +				<4 RK_PA4 3 &pcfg_pull_none_drv_level_2>,
>> +				/* gmac1_txd1m1 */
>> +				<4 RK_PA5 3 &pcfg_pull_none_drv_level_2>,
>> +				/* gmac1_txenm1 */
>> +				<4 RK_PA6 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac1m1_rgmii_clk: gmac1m1-rgmii-clk {
>> +			rockchip,pins =
>> +				/* gmac1_rxclkm1 */
>> +				<4 RK_PA3 3 &pcfg_pull_none>,
>> +				/* gmac1_txclkm1 */
>> +				<4 RK_PA0 3 &pcfg_pull_none_drv_level_1>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac1m1_rgmii_bus: gmac1m1-rgmii-bus {
>> +			rockchip,pins =
>> +				/* gmac1_rxd2m1 */
>> +				<4 RK_PA1 3 &pcfg_pull_none>,
>> +				/* gmac1_rxd3m1 */
>> +				<4 RK_PA2 3 &pcfg_pull_none>,
>> +				/* gmac1_txd2m1 */
>> +				<3 RK_PD6 3 &pcfg_pull_none_drv_level_2>,
>> +				/* gmac1_txd3m1 */
>> +				<3 RK_PD7 3 &pcfg_pull_none_drv_level_2>;
>> +		};
>> +	};
>> +	gpu {
>> +		/omit-if-no-ref/
>> +		gpu_pins: gpu-pins {
>> +			rockchip,pins =
>> +				/* gpu_avs */
>> +				<0 RK_PC0 2 &pcfg_pull_none>,
>> +				/* gpu_pwren */
>> +				<0 RK_PA6 4 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	hdmitx {
>> +		/omit-if-no-ref/
>> +		hdmitxm0_cec: hdmitxm0-cec {
>> +			rockchip,pins =
>> +				/* hdmitxm0_cec */
>> +				<4 RK_PD1 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		hdmitxm1_cec: hdmitxm1-cec {
>> +			rockchip,pins =
>> +				/* hdmitxm1_cec */
>> +				<0 RK_PC7 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		hdmitx_scl: hdmitx-scl {
>> +			rockchip,pins =
>> +				/* hdmitx_scl */
>> +				<4 RK_PC7 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		hdmitx_sda: hdmitx-sda {
>> +			rockchip,pins =
>> +				/* hdmitx_sda */
>> +				<4 RK_PD0 1 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	i2c0 {
>> +		/omit-if-no-ref/
>> +		i2c0_xfer: i2c0-xfer {
>> +			rockchip,pins =
>> +				/* i2c0_scl */
>> +				<0 RK_PB1 1 &pcfg_pull_none_smt>,
>> +				/* i2c0_sda */
>> +				<0 RK_PB2 1 &pcfg_pull_none_smt>;
>> +		};
>> +	};
>> +	i2c1 {
>> +		/omit-if-no-ref/
>> +		i2c1_xfer: i2c1-xfer {
>> +			rockchip,pins =
>> +				/* i2c1_scl */
>> +				<0 RK_PB3 1 &pcfg_pull_none_smt>,
>> +				/* i2c1_sda */
>> +				<0 RK_PB4 1 &pcfg_pull_none_smt>;
>> +		};
>> +	};
>> +	i2c2 {
>> +		/omit-if-no-ref/
>> +		i2c2m0_xfer: i2c2m0-xfer {
>> +			rockchip,pins =
>> +				/* i2c2_sclm0 */
>> +				<0 RK_PB5 1 &pcfg_pull_none_smt>,
>> +				/* i2c2_sdam0 */
>> +				<0 RK_PB6 1 &pcfg_pull_none_smt>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2c2m1_xfer: i2c2m1-xfer {
>> +			rockchip,pins =
>> +				/* i2c2_sclm1 */
>> +				<4 RK_PB5 1 &pcfg_pull_none_smt>,
>> +				/* i2c2_sdam1 */
>> +				<4 RK_PB4 1 &pcfg_pull_none_smt>;
>> +		};
>> +	};
>> +	i2c3 {
>> +		/omit-if-no-ref/
>> +		i2c3m0_xfer: i2c3m0-xfer {
>> +			rockchip,pins =
>> +				/* i2c3_sclm0 */
>> +				<1 RK_PA1 1 &pcfg_pull_none_smt>,
>> +				/* i2c3_sdam0 */
>> +				<1 RK_PA0 1 &pcfg_pull_none_smt>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2c3m1_xfer: i2c3m1-xfer {
>> +			rockchip,pins =
>> +				/* i2c3_sclm1 */
>> +				<3 RK_PB5 4 &pcfg_pull_none_smt>,
>> +				/* i2c3_sdam1 */
>> +				<3 RK_PB6 4 &pcfg_pull_none_smt>;
>> +		};
>> +	};
>> +	i2c4 {
>> +		/omit-if-no-ref/
>> +		i2c4m0_xfer: i2c4m0-xfer {
>> +			rockchip,pins =
>> +				/* i2c4_sclm0 */
>> +				<4 RK_PB3 1 &pcfg_pull_none_smt>,
>> +				/* i2c4_sdam0 */
>> +				<4 RK_PB2 1 &pcfg_pull_none_smt>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2c4m1_xfer: i2c4m1-xfer {
>> +			rockchip,pins =
>> +				/* i2c4_sclm1 */
>> +				<2 RK_PB2 2 &pcfg_pull_none_smt>,
>> +				/* i2c4_sdam1 */
>> +				<2 RK_PB1 2 &pcfg_pull_none_smt>;
>> +		};
>> +	};
>> +	i2c5 {
>> +		/omit-if-no-ref/
>> +		i2c5m0_xfer: i2c5m0-xfer {
>> +			rockchip,pins =
>> +				/* i2c5_sclm0 */
>> +				<3 RK_PB3 4 &pcfg_pull_none_smt>,
>> +				/* i2c5_sdam0 */
>> +				<3 RK_PB4 4 &pcfg_pull_none_smt>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2c5m1_xfer: i2c5m1-xfer {
>> +			rockchip,pins =
>> +				/* i2c5_sclm1 */
>> +				<4 RK_PC7 2 &pcfg_pull_none_smt>,
>> +				/* i2c5_sdam1 */
>> +				<4 RK_PD0 2 &pcfg_pull_none_smt>;
>> +		};
>> +	};
>> +	i2s1 {
>> +		/omit-if-no-ref/
>> +		i2s1m0_lrckrx: i2s1m0-lrckrx {
>> +			rockchip,pins =
>> +				/* i2s1m0_lrckrx */
>> +				<1 RK_PA6 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m0_lrcktx: i2s1m0-lrcktx {
>> +			rockchip,pins =
>> +				/* i2s1m0_lrcktx */
>> +				<1 RK_PA5 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m0_mclk: i2s1m0-mclk {
>> +			rockchip,pins =
>> +				/* i2s1m0_mclk */
>> +				<1 RK_PA2 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m0_sclkrx: i2s1m0-sclkrx {
>> +			rockchip,pins =
>> +				/* i2s1m0_sclkrx */
>> +				<1 RK_PA4 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m0_sclktx: i2s1m0-sclktx {
>> +			rockchip,pins =
>> +				/* i2s1m0_sclktx */
>> +				<1 RK_PA3 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m0_sdi0: i2s1m0-sdi0 {
>> +			rockchip,pins =
>> +				/* i2s1m0_sdi0 */
>> +				<1 RK_PB3 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m0_sdi1: i2s1m0-sdi1 {
>> +			rockchip,pins =
>> +				/* i2s1m0_sdi1 */
>> +				<1 RK_PB2 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m0_sdi2: i2s1m0-sdi2 {
>> +			rockchip,pins =
>> +				/* i2s1m0_sdi2 */
>> +				<1 RK_PB1 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m0_sdi3: i2s1m0-sdi3 {
>> +			rockchip,pins =
>> +				/* i2s1m0_sdi3 */
>> +				<1 RK_PB0 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m0_sdo0: i2s1m0-sdo0 {
>> +			rockchip,pins =
>> +				/* i2s1m0_sdo0 */
>> +				<1 RK_PA7 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m0_sdo1: i2s1m0-sdo1 {
>> +			rockchip,pins =
>> +				/* i2s1m0_sdo1 */
>> +				<1 RK_PB0 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m0_sdo2: i2s1m0-sdo2 {
>> +			rockchip,pins =
>> +				/* i2s1m0_sdo2 */
>> +				<1 RK_PB1 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m0_sdo3: i2s1m0-sdo3 {
>> +			rockchip,pins =
>> +				/* i2s1m0_sdo3 */
>> +				<1 RK_PB2 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m1_lrckrx: i2s1m1-lrckrx {
>> +			rockchip,pins =
>> +				/* i2s1m1_lrckrx */
>> +				<4 RK_PA7 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m1_lrcktx: i2s1m1-lrcktx {
>> +			rockchip,pins =
>> +				/* i2s1m1_lrcktx */
>> +				<3 RK_PD0 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m1_mclk: i2s1m1-mclk {
>> +			rockchip,pins =
>> +				/* i2s1m1_mclk */
>> +				<3 RK_PC6 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m1_sclkrx: i2s1m1-sclkrx {
>> +			rockchip,pins =
>> +				/* i2s1m1_sclkrx */
>> +				<4 RK_PA6 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m1_sclktx: i2s1m1-sclktx {
>> +			rockchip,pins =
>> +				/* i2s1m1_sclktx */
>> +				<3 RK_PC7 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m1_sdi0: i2s1m1-sdi0 {
>> +			rockchip,pins =
>> +				/* i2s1m1_sdi0 */
>> +				<3 RK_PD2 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m1_sdi1: i2s1m1-sdi1 {
>> +			rockchip,pins =
>> +				/* i2s1m1_sdi1 */
>> +				<3 RK_PD3 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m1_sdi2: i2s1m1-sdi2 {
>> +			rockchip,pins =
>> +				/* i2s1m1_sdi2 */
>> +				<3 RK_PD4 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m1_sdi3: i2s1m1-sdi3 {
>> +			rockchip,pins =
>> +				/* i2s1m1_sdi3 */
>> +				<3 RK_PD5 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m1_sdo0: i2s1m1-sdo0 {
>> +			rockchip,pins =
>> +				/* i2s1m1_sdo0 */
>> +				<3 RK_PD1 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m1_sdo1: i2s1m1-sdo1 {
>> +			rockchip,pins =
>> +				/* i2s1m1_sdo1 */
>> +				<4 RK_PB0 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m1_sdo2: i2s1m1-sdo2 {
>> +			rockchip,pins =
>> +				/* i2s1m1_sdo2 */
>> +				<4 RK_PB1 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m1_sdo3: i2s1m1-sdo3 {
>> +			rockchip,pins =
>> +				/* i2s1m1_sdo3 */
>> +				<4 RK_PB5 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m2_lrckrx: i2s1m2-lrckrx {
>> +			rockchip,pins =
>> +				/* i2s1m2_lrckrx */
>> +				<3 RK_PC5 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m2_lrcktx: i2s1m2-lrcktx {
>> +			rockchip,pins =
>> +				/* i2s1m2_lrcktx */
>> +				<2 RK_PD2 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m2_mclk: i2s1m2-mclk {
>> +			rockchip,pins =
>> +				/* i2s1m2_mclk */
>> +				<2 RK_PD0 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m2_sclkrx: i2s1m2-sclkrx {
>> +			rockchip,pins =
>> +				/* i2s1m2_sclkrx */
>> +				<3 RK_PC3 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m2_sclktx: i2s1m2-sclktx {
>> +			rockchip,pins =
>> +				/* i2s1m2_sclktx */
>> +				<2 RK_PD1 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m2_sdi0: i2s1m2-sdi0 {
>> +			rockchip,pins =
>> +				/* i2s1m2_sdi0 */
>> +				<2 RK_PD3 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m2_sdi1: i2s1m2-sdi1 {
>> +			rockchip,pins =
>> +				/* i2s1m2_sdi1 */
>> +				<2 RK_PD4 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m2_sdi2: i2s1m2-sdi2 {
>> +			rockchip,pins =
>> +				/* i2s1m2_sdi2 */
>> +				<2 RK_PD5 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m2_sdi3: i2s1m2-sdi3 {
>> +			rockchip,pins =
>> +				/* i2s1m2_sdi3 */
>> +				<2 RK_PD6 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m2_sdo0: i2s1m2-sdo0 {
>> +			rockchip,pins =
>> +				/* i2s1m2_sdo0 */
>> +				<2 RK_PD7 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m2_sdo1: i2s1m2-sdo1 {
>> +			rockchip,pins =
>> +				/* i2s1m2_sdo1 */
>> +				<3 RK_PA0 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m2_sdo2: i2s1m2-sdo2 {
>> +			rockchip,pins =
>> +				/* i2s1m2_sdo2 */
>> +				<3 RK_PC1 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s1m2_sdo3: i2s1m2-sdo3 {
>> +			rockchip,pins =
>> +				/* i2s1m2_sdo3 */
>> +				<3 RK_PC2 5 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	i2s2 {
>> +		/omit-if-no-ref/
>> +		i2s2m0_lrckrx: i2s2m0-lrckrx {
>> +			rockchip,pins =
>> +				/* i2s2m0_lrckrx */
>> +				<2 RK_PC0 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s2m0_lrcktx: i2s2m0-lrcktx {
>> +			rockchip,pins =
>> +				/* i2s2m0_lrcktx */
>> +				<2 RK_PC3 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s2m0_mclk: i2s2m0-mclk {
>> +			rockchip,pins =
>> +				/* i2s2m0_mclk */
>> +				<2 RK_PC1 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s2m0_sclkrx: i2s2m0-sclkrx {
>> +			rockchip,pins =
>> +				/* i2s2m0_sclkrx */
>> +				<2 RK_PB7 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s2m0_sclktx: i2s2m0-sclktx {
>> +			rockchip,pins =
>> +				/* i2s2m0_sclktx */
>> +				<2 RK_PC2 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s2m0_sdi: i2s2m0-sdi {
>> +			rockchip,pins =
>> +				/* i2s2m0_sdi */
>> +				<2 RK_PC5 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s2m0_sdo: i2s2m0-sdo {
>> +			rockchip,pins =
>> +				/* i2s2m0_sdo */
>> +				<2 RK_PC4 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s2m1_lrckrx: i2s2m1-lrckrx {
>> +			rockchip,pins =
>> +				/* i2s2m1_lrckrx */
>> +				<4 RK_PA5 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s2m1_lrcktx: i2s2m1-lrcktx {
>> +			rockchip,pins =
>> +				/* i2s2m1_lrcktx */
>> +				<4 RK_PA4 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s2m1_mclk: i2s2m1-mclk {
>> +			rockchip,pins =
>> +				/* i2s2m1_mclk */
>> +				<4 RK_PB6 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s2m1_sclkrx: i2s2m1-sclkrx {
>> +			rockchip,pins =
>> +				/* i2s2m1_sclkrx */
>> +				<4 RK_PC1 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s2m1_sclktx: i2s2m1-sclktx {
>> +			rockchip,pins =
>> +				/* i2s2m1_sclktx */
>> +				<4 RK_PB7 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s2m1_sdi: i2s2m1-sdi {
>> +			rockchip,pins =
>> +				/* i2s2m1_sdi */
>> +				<4 RK_PB2 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s2m1_sdo: i2s2m1-sdo {
>> +			rockchip,pins =
>> +				/* i2s2m1_sdo */
>> +				<4 RK_PB3 5 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	i2s3 {
>> +		/omit-if-no-ref/
>> +		i2s3m0_lrck: i2s3m0-lrck {
>> +			rockchip,pins =
>> +				/* i2s3m0_lrck */
>> +				<3 RK_PA4 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s3m0_mclk: i2s3m0-mclk {
>> +			rockchip,pins =
>> +				/* i2s3m0_mclk */
>> +				<3 RK_PA2 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s3m0_sclk: i2s3m0-sclk {
>> +			rockchip,pins =
>> +				/* i2s3m0_sclk */
>> +				<3 RK_PA3 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s3m0_sdi: i2s3m0-sdi {
>> +			rockchip,pins =
>> +				/* i2s3m0_sdi */
>> +				<3 RK_PA6 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s3m0_sdo: i2s3m0-sdo {
>> +			rockchip,pins =
>> +				/* i2s3m0_sdo */
>> +				<3 RK_PA5 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s3m1_lrck: i2s3m1-lrck {
>> +			rockchip,pins =
>> +				/* i2s3m1_lrck */
>> +				<4 RK_PC4 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s3m1_mclk: i2s3m1-mclk {
>> +			rockchip,pins =
>> +				/* i2s3m1_mclk */
>> +				<4 RK_PC2 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s3m1_sclk: i2s3m1-sclk {
>> +			rockchip,pins =
>> +				/* i2s3m1_sclk */
>> +				<4 RK_PC3 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s3m1_sdi: i2s3m1-sdi {
>> +			rockchip,pins =
>> +				/* i2s3m1_sdi */
>> +				<4 RK_PC6 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		i2s3m1_sdo: i2s3m1-sdo {
>> +			rockchip,pins =
>> +				/* i2s3m1_sdo */
>> +				<4 RK_PC5 5 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	isp {
>> +		/omit-if-no-ref/
>> +		isp_pins: isp-pins {
>> +			rockchip,pins =
>> +				/* isp_flashtrigin */
>> +				<4 RK_PB4 4 &pcfg_pull_none>,
>> +				/* isp_flashtrigout */
>> +				<4 RK_PA6 1 &pcfg_pull_none>,
>> +				/* isp_prelighttrig */
>> +				<4 RK_PB1 1 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	jtag {
>> +		/omit-if-no-ref/
>> +		jtag_pins: jtag-pins {
>> +			rockchip,pins =
>> +				/* jtag_tck */
>> +				<1 RK_PD7 2 &pcfg_pull_none>,
>> +				/* jtag_tms */
>> +				<2 RK_PA0 2 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	lcdc {
>> +		/omit-if-no-ref/
>> +		lcdc_ctl: lcdc-ctl {
>> +			rockchip,pins =
>> +				/* lcdc_clk */
>> +				<3 RK_PA0 1 &pcfg_pull_none>,
>> +				/* lcdc_d0 */
>> +				<2 RK_PD0 1 &pcfg_pull_none>,
>> +				/* lcdc_d1 */
>> +				<2 RK_PD1 1 &pcfg_pull_none>,
>> +				/* lcdc_d2 */
>> +				<2 RK_PD2 1 &pcfg_pull_none>,
>> +				/* lcdc_d3 */
>> +				<2 RK_PD3 1 &pcfg_pull_none>,
>> +				/* lcdc_d4 */
>> +				<2 RK_PD4 1 &pcfg_pull_none>,
>> +				/* lcdc_d5 */
>> +				<2 RK_PD5 1 &pcfg_pull_none>,
>> +				/* lcdc_d6 */
>> +				<2 RK_PD6 1 &pcfg_pull_none>,
>> +				/* lcdc_d7 */
>> +				<2 RK_PD7 1 &pcfg_pull_none>,
>> +				/* lcdc_d8 */
>> +				<3 RK_PA1 1 &pcfg_pull_none>,
>> +				/* lcdc_d9 */
>> +				<3 RK_PA2 1 &pcfg_pull_none>,
>> +				/* lcdc_d10 */
>> +				<3 RK_PA3 1 &pcfg_pull_none>,
>> +				/* lcdc_d11 */
>> +				<3 RK_PA4 1 &pcfg_pull_none>,
>> +				/* lcdc_d12 */
>> +				<3 RK_PA5 1 &pcfg_pull_none>,
>> +				/* lcdc_d13 */
>> +				<3 RK_PA6 1 &pcfg_pull_none>,
>> +				/* lcdc_d14 */
>> +				<3 RK_PA7 1 &pcfg_pull_none>,
>> +				/* lcdc_d15 */
>> +				<3 RK_PB0 1 &pcfg_pull_none>,
>> +				/* lcdc_d16 */
>> +				<3 RK_PB1 1 &pcfg_pull_none>,
>> +				/* lcdc_d17 */
>> +				<3 RK_PB2 1 &pcfg_pull_none>,
>> +				/* lcdc_d18 */
>> +				<3 RK_PB3 1 &pcfg_pull_none>,
>> +				/* lcdc_d19 */
>> +				<3 RK_PB4 1 &pcfg_pull_none>,
>> +				/* lcdc_d20 */
>> +				<3 RK_PB5 1 &pcfg_pull_none>,
>> +				/* lcdc_d21 */
>> +				<3 RK_PB6 1 &pcfg_pull_none>,
>> +				/* lcdc_d22 */
>> +				<3 RK_PB7 1 &pcfg_pull_none>,
>> +				/* lcdc_d23 */
>> +				<3 RK_PC0 1 &pcfg_pull_none>,
>> +				/* lcdc_den */
>> +				<3 RK_PC3 1 &pcfg_pull_none>,
>> +				/* lcdc_hsync */
>> +				<3 RK_PC1 1 &pcfg_pull_none>,
>> +				/* lcdc_vsync */
>> +				<3 RK_PC2 1 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	mcu {
>> +		/omit-if-no-ref/
>> +		mcu_pins: mcu-pins {
>> +			rockchip,pins =
>> +				/* mcu_jtagtck */
>> +				<0 RK_PB4 4 &pcfg_pull_none>,
>> +				/* mcu_jtagtdi */
>> +				<0 RK_PC1 4 &pcfg_pull_none>,
>> +				/* mcu_jtagtdo */
>> +				<0 RK_PB3 4 &pcfg_pull_none>,
>> +				/* mcu_jtagtms */
>> +				<0 RK_PC2 4 &pcfg_pull_none>,
>> +				/* mcu_jtagtrstn */
>> +				<0 RK_PC3 4 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	npu {
>> +		/omit-if-no-ref/
>> +		npu_pins: npu-pins {
>> +			rockchip,pins =
>> +				/* npu_avs */
>> +				<0 RK_PC1 2 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pcie20 {
>> +		/omit-if-no-ref/
>> +		pcie20m0_pins: pcie20m0-pins {
>> +			rockchip,pins =
>> +				/* pcie20_clkreqnm0 */
>> +				<0 RK_PA5 3 &pcfg_pull_none>,
>> +				/* pcie20_perstnm0 */
>> +				<0 RK_PB6 3 &pcfg_pull_none>,
>> +				/* pcie20_wakenm0 */
>> +				<0 RK_PB5 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pcie20m1_pins: pcie20m1-pins {
>> +			rockchip,pins =
>> +				/* pcie20_clkreqnm1 */
>> +				<2 RK_PD0 4 &pcfg_pull_none>,
>> +				/* pcie20_perstnm1 */
>> +				<3 RK_PC1 4 &pcfg_pull_none>,
>> +				/* pcie20_wakenm1 */
>> +				<2 RK_PD1 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pcie20m2_pins: pcie20m2-pins {
>> +			rockchip,pins =
>> +				/* pcie20_clkreqnm2 */
>> +				<1 RK_PB0 4 &pcfg_pull_none>,
>> +				/* pcie20_perstnm2 */
>> +				<1 RK_PB2 4 &pcfg_pull_none>,
>> +				/* pcie20_wakenm2 */
>> +				<1 RK_PB1 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pcie20_buttonrstn: pcie20-buttonrstn {
>> +			rockchip,pins =
>> +				/* pcie20_buttonrstn */
>> +				<0 RK_PB4 3 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pcie30x1 {
>> +		/omit-if-no-ref/
>> +		pcie30x1m0_pins: pcie30x1m0-pins {
>> +			rockchip,pins =
>> +				/* pcie30x1_clkreqnm0 */
>> +				<0 RK_PA4 3 &pcfg_pull_none>,
>> +				/* pcie30x1_perstnm0 */
>> +				<0 RK_PC3 3 &pcfg_pull_none>,
>> +				/* pcie30x1_wakenm0 */
>> +				<0 RK_PC2 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pcie30x1m1_pins: pcie30x1m1-pins {
>> +			rockchip,pins =
>> +				/* pcie30x1_clkreqnm1 */
>> +				<2 RK_PD2 4 &pcfg_pull_none>,
>> +				/* pcie30x1_perstnm1 */
>> +				<3 RK_PA1 4 &pcfg_pull_none>,
>> +				/* pcie30x1_wakenm1 */
>> +				<2 RK_PD3 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pcie30x1m2_pins: pcie30x1m2-pins {
>> +			rockchip,pins =
>> +				/* pcie30x1_clkreqnm2 */
>> +				<1 RK_PA5 4 &pcfg_pull_none>,
>> +				/* pcie30x1_perstnm2 */
>> +				<1 RK_PA2 4 &pcfg_pull_none>,
>> +				/* pcie30x1_wakenm2 */
>> +				<1 RK_PA3 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pcie30x1_buttonrstn: pcie30x1-buttonrstn {
>> +			rockchip,pins =
>> +				/* pcie30x1_buttonrstn */
>> +				<0 RK_PB3 3 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pcie30x2 {
>> +		/omit-if-no-ref/
>> +		pcie30x2m0_pins: pcie30x2m0-pins {
>> +			rockchip,pins =
>> +				/* pcie30x2_clkreqnm0 */
>> +				<0 RK_PA6 2 &pcfg_pull_none>,
>> +				/* pcie30x2_perstnm0 */
>> +				<0 RK_PC6 3 &pcfg_pull_none>,
>> +				/* pcie30x2_wakenm0 */
>> +				<0 RK_PC5 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pcie30x2m1_pins: pcie30x2m1-pins {
>> +			rockchip,pins =
>> +				/* pcie30x2_clkreqnm1 */
>> +				<2 RK_PD4 4 &pcfg_pull_none>,
>> +				/* pcie30x2_perstnm1 */
>> +				<2 RK_PD6 4 &pcfg_pull_none>,
>> +				/* pcie30x2_wakenm1 */
>> +				<2 RK_PD5 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pcie30x2m2_pins: pcie30x2m2-pins {
>> +			rockchip,pins =
>> +				/* pcie30x2_clkreqnm2 */
>> +				<4 RK_PC2 4 &pcfg_pull_none>,
>> +				/* pcie30x2_perstnm2 */
>> +				<4 RK_PC4 4 &pcfg_pull_none>,
>> +				/* pcie30x2_wakenm2 */
>> +				<4 RK_PC3 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pcie30x2_buttonrstn: pcie30x2-buttonrstn {
>> +			rockchip,pins =
>> +				/* pcie30x2_buttonrstn */
>> +				<0 RK_PB0 3 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pdm {
>> +		/omit-if-no-ref/
>> +		pdmm0_clk: pdmm0-clk {
>> +			rockchip,pins =
>> +				/* pdm_clk0m0 */
>> +				<1 RK_PA6 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pdmm0_clk1: pdmm0-clk1 {
>> +			rockchip,pins =
>> +				/* pdmm0_clk1 */
>> +				<1 RK_PA4 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pdmm0_sdi0: pdmm0-sdi0 {
>> +			rockchip,pins =
>> +				/* pdmm0_sdi0 */
>> +				<1 RK_PB3 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pdmm0_sdi1: pdmm0-sdi1 {
>> +			rockchip,pins =
>> +				/* pdmm0_sdi1 */
>> +				<1 RK_PB2 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pdmm0_sdi2: pdmm0-sdi2 {
>> +			rockchip,pins =
>> +				/* pdmm0_sdi2 */
>> +				<1 RK_PB1 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pdmm0_sdi3: pdmm0-sdi3 {
>> +			rockchip,pins =
>> +				/* pdmm0_sdi3 */
>> +				<1 RK_PB0 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pdmm1_clk: pdmm1-clk {
>> +			rockchip,pins =
>> +				/* pdm_clk0m1 */
>> +				<3 RK_PD6 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pdmm1_clk1: pdmm1-clk1 {
>> +			rockchip,pins =
>> +				/* pdmm1_clk1 */
>> +				<4 RK_PA0 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pdmm1_sdi0: pdmm1-sdi0 {
>> +			rockchip,pins =
>> +				/* pdmm1_sdi0 */
>> +				<3 RK_PD7 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pdmm1_sdi1: pdmm1-sdi1 {
>> +			rockchip,pins =
>> +				/* pdmm1_sdi1 */
>> +				<4 RK_PA1 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pdmm1_sdi2: pdmm1-sdi2 {
>> +			rockchip,pins =
>> +				/* pdmm1_sdi2 */
>> +				<4 RK_PA2 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pdmm1_sdi3: pdmm1-sdi3 {
>> +			rockchip,pins =
>> +				/* pdmm1_sdi3 */
>> +				<4 RK_PA3 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pdmm2_clk1: pdmm2-clk1 {
>> +			rockchip,pins =
>> +				/* pdmm2_clk1 */
>> +				<3 RK_PC4 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pdmm2_sdi0: pdmm2-sdi0 {
>> +			rockchip,pins =
>> +				/* pdmm2_sdi0 */
>> +				<3 RK_PB3 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pdmm2_sdi1: pdmm2-sdi1 {
>> +			rockchip,pins =
>> +				/* pdmm2_sdi1 */
>> +				<3 RK_PB4 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pdmm2_sdi2: pdmm2-sdi2 {
>> +			rockchip,pins =
>> +				/* pdmm2_sdi2 */
>> +				<3 RK_PB7 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pdmm2_sdi3: pdmm2-sdi3 {
>> +			rockchip,pins =
>> +				/* pdmm2_sdi3 */
>> +				<3 RK_PC0 5 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pmic {
>> +		/omit-if-no-ref/
>> +		pmic_pins: pmic-pins {
>> +			rockchip,pins =
>> +				/* pmic_sleep */
>> +				<0 RK_PA2 1 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pmu {
>> +		/omit-if-no-ref/
>> +		pmu_pins: pmu-pins {
>> +			rockchip,pins =
>> +				/* pmu_debug0 */
>> +				<0 RK_PA5 4 &pcfg_pull_none>,
>> +				/* pmu_debug1 */
>> +				<0 RK_PA6 3 &pcfg_pull_none>,
>> +				/* pmu_debug2 */
>> +				<0 RK_PC4 4 &pcfg_pull_none>,
>> +				/* pmu_debug3 */
>> +				<0 RK_PC5 4 &pcfg_pull_none>,
>> +				/* pmu_debug4 */
>> +				<0 RK_PC6 4 &pcfg_pull_none>,
>> +				/* pmu_debug5 */
>> +				<0 RK_PC7 4 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pwm0 {
>> +		/omit-if-no-ref/
>> +		pwm0m0_pins: pwm0m0-pins {
>> +			rockchip,pins =
>> +				/* pwm0_m0 */
>> +				<0 RK_PB7 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pwm0m1_pins: pwm0m1-pins {
>> +			rockchip,pins =
>> +				/* pwm0_m1 */
>> +				<0 RK_PC7 2 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pwm1 {
>> +		/omit-if-no-ref/
>> +		pwm1m0_pins: pwm1m0-pins {
>> +			rockchip,pins =
>> +				/* pwm1_m0 */
>> +				<0 RK_PC0 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pwm1m1_pins: pwm1m1-pins {
>> +			rockchip,pins =
>> +				/* pwm1_m1 */
>> +				<0 RK_PB5 4 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pwm2 {
>> +		/omit-if-no-ref/
>> +		pwm2m0_pins: pwm2m0-pins {
>> +			rockchip,pins =
>> +				/* pwm2_m0 */
>> +				<0 RK_PC1 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pwm2m1_pins: pwm2m1-pins {
>> +			rockchip,pins =
>> +				/* pwm2_m1 */
>> +				<0 RK_PB6 4 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pwm3 {
>> +		/omit-if-no-ref/
>> +		pwm3_pins: pwm3-pins {
>> +			rockchip,pins =
>> +				/* pwm3_ir */
>> +				<0 RK_PC2 1 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pwm4 {
>> +		/omit-if-no-ref/
>> +		pwm4_pins: pwm4-pins {
>> +			rockchip,pins =
>> +				/* pwm4 */
>> +				<0 RK_PC3 1 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pwm5 {
>> +		/omit-if-no-ref/
>> +		pwm5_pins: pwm5-pins {
>> +			rockchip,pins =
>> +				/* pwm5 */
>> +				<0 RK_PC4 1 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pwm6 {
>> +		/omit-if-no-ref/
>> +		pwm6_pins: pwm6-pins {
>> +			rockchip,pins =
>> +				/* pwm6 */
>> +				<0 RK_PC5 1 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pwm7 {
>> +		/omit-if-no-ref/
>> +		pwm7_pins: pwm7-pins {
>> +			rockchip,pins =
>> +				/* pwm7_ir */
>> +				<0 RK_PC6 1 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pwm8 {
>> +		/omit-if-no-ref/
>> +		pwm8m0_pins: pwm8m0-pins {
>> +			rockchip,pins =
>> +				/* pwm8_m0 */
>> +				<3 RK_PB1 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pwm8m1_pins: pwm8m1-pins {
>> +			rockchip,pins =
>> +				/* pwm8_m1 */
>> +				<1 RK_PD5 4 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pwm9 {
>> +		/omit-if-no-ref/
>> +		pwm9m0_pins: pwm9m0-pins {
>> +			rockchip,pins =
>> +				/* pwm9_m0 */
>> +				<3 RK_PB2 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pwm9m1_pins: pwm9m1-pins {
>> +			rockchip,pins =
>> +				/* pwm9_m1 */
>> +				<1 RK_PD6 4 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pwm10 {
>> +		/omit-if-no-ref/
>> +		pwm10m0_pins: pwm10m0-pins {
>> +			rockchip,pins =
>> +				/* pwm10_m0 */
>> +				<3 RK_PB5 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pwm10m1_pins: pwm10m1-pins {
>> +			rockchip,pins =
>> +				/* pwm10_m1 */
>> +				<2 RK_PA1 2 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pwm11 {
>> +		/omit-if-no-ref/
>> +		pwm11m0_pins: pwm11m0-pins {
>> +			rockchip,pins =
>> +				/* pwm11_irm0 */
>> +				<3 RK_PB6 5 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pwm11m1_pins: pwm11m1-pins {
>> +			rockchip,pins =
>> +				/* pwm11_irm1 */
>> +				<4 RK_PC0 3 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pwm12 {
>> +		/omit-if-no-ref/
>> +		pwm12m0_pins: pwm12m0-pins {
>> +			rockchip,pins =
>> +				/* pwm12_m0 */
>> +				<3 RK_PB7 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pwm12m1_pins: pwm12m1-pins {
>> +			rockchip,pins =
>> +				/* pwm12_m1 */
>> +				<4 RK_PC5 1 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pwm13 {
>> +		/omit-if-no-ref/
>> +		pwm13m0_pins: pwm13m0-pins {
>> +			rockchip,pins =
>> +				/* pwm13_m0 */
>> +				<3 RK_PC0 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pwm13m1_pins: pwm13m1-pins {
>> +			rockchip,pins =
>> +				/* pwm13_m1 */
>> +				<4 RK_PC6 1 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pwm14 {
>> +		/omit-if-no-ref/
>> +		pwm14m0_pins: pwm14m0-pins {
>> +			rockchip,pins =
>> +				/* pwm14_m0 */
>> +				<3 RK_PC4 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pwm14m1_pins: pwm14m1-pins {
>> +			rockchip,pins =
>> +				/* pwm14_m1 */
>> +				<4 RK_PC2 1 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	pwm15 {
>> +		/omit-if-no-ref/
>> +		pwm15m0_pins: pwm15m0-pins {
>> +			rockchip,pins =
>> +				/* pwm15_irm0 */
>> +				<3 RK_PC5 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		pwm15m1_pins: pwm15m1-pins {
>> +			rockchip,pins =
>> +				/* pwm15_irm1 */
>> +				<4 RK_PC3 1 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	refclk {
>> +		/omit-if-no-ref/
>> +		refclk_pins: refclk-pins {
>> +			rockchip,pins =
>> +				/* refclk_ou */
>> +				<0 RK_PA0 1 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	sata {
>> +		/omit-if-no-ref/
>> +		sata_pins: sata-pins {
>> +			rockchip,pins =
>> +				/* sata_cpdet */
>> +				<0 RK_PA4 2 &pcfg_pull_none>,
>> +				/* sata_cppod */
>> +				<0 RK_PA6 1 &pcfg_pull_none>,
>> +				/* sata_mpswitch */
>> +				<0 RK_PA5 2 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	sata0 {
>> +		/omit-if-no-ref/
>> +		sata0_pins: sata0-pins {
>> +			rockchip,pins =
>> +				/* sata0_actled */
>> +				<4 RK_PC6 3 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	sata1 {
>> +		/omit-if-no-ref/
>> +		sata1_pins: sata1-pins {
>> +			rockchip,pins =
>> +				/* sata1_actled */
>> +				<4 RK_PC5 3 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	sata2 {
>> +		/omit-if-no-ref/
>> +		sata2_pins: sata2-pins {
>> +			rockchip,pins =
>> +				/* sata2_actled */
>> +				<4 RK_PC4 3 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	scr {
>> +		/omit-if-no-ref/
>> +		scr_pins: scr-pins {
>> +			rockchip,pins =
>> +				/* scr_clk */
>> +				<1 RK_PA2 3 &pcfg_pull_none>,
>> +				/* scr_det */
>> +				<1 RK_PA7 3 &pcfg_pull_up>,
>> +				/* scr_io */
>> +				<1 RK_PA3 3 &pcfg_pull_up>,
>> +				/* scr_rst */
>> +				<1 RK_PA5 3 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	sdmmc0 {
>> +		/omit-if-no-ref/
>> +		sdmmc0_bus4: sdmmc0-bus4 {
>> +			rockchip,pins =
>> +				/* sdmmc0_d0 */
>> +				<1 RK_PD5 1 &pcfg_pull_up_drv_level_2>,
>> +				/* sdmmc0_d1 */
>> +				<1 RK_PD6 1 &pcfg_pull_up_drv_level_2>,
>> +				/* sdmmc0_d2 */
>> +				<1 RK_PD7 1 &pcfg_pull_up_drv_level_2>,
>> +				/* sdmmc0_d3 */
>> +				<2 RK_PA0 1 &pcfg_pull_up_drv_level_2>;
>> +		};
>> +		/omit-if-no-ref/
>> +		sdmmc0_clk: sdmmc0-clk {
>> +			rockchip,pins =
>> +				/* sdmmc0_clk */
>> +				<2 RK_PA2 1 &pcfg_pull_up_drv_level_2>;
>> +		};
>> +		/omit-if-no-ref/
>> +		sdmmc0_cmd: sdmmc0-cmd {
>> +			rockchip,pins =
>> +				/* sdmmc0_cmd */
>> +				<2 RK_PA1 1 &pcfg_pull_up_drv_level_2>;
>> +		};
>> +		/omit-if-no-ref/
>> +		sdmmc0_det: sdmmc0-det {
>> +			rockchip,pins =
>> +				/* sdmmc0_det */
>> +				<0 RK_PA4 1 &pcfg_pull_up>;
>> +		};
>> +		/omit-if-no-ref/
>> +		sdmmc0_pwren: sdmmc0-pwren {
>> +			rockchip,pins =
>> +				/* sdmmc0_pwren */
>> +				<0 RK_PA5 1 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	sdmmc1 {
>> +		/omit-if-no-ref/
>> +		sdmmc1_bus4: sdmmc1-bus4 {
>> +			rockchip,pins =
>> +				/* sdmmc1_d0 */
>> +				<2 RK_PA3 1 &pcfg_pull_up_drv_level_2>,
>> +				/* sdmmc1_d1 */
>> +				<2 RK_PA4 1 &pcfg_pull_up_drv_level_2>,
>> +				/* sdmmc1_d2 */
>> +				<2 RK_PA5 1 &pcfg_pull_up_drv_level_2>,
>> +				/* sdmmc1_d3 */
>> +				<2 RK_PA6 1 &pcfg_pull_up_drv_level_2>;
>> +		};
>> +		/omit-if-no-ref/
>> +		sdmmc1_clk: sdmmc1-clk {
>> +			rockchip,pins =
>> +				/* sdmmc1_clk */
>> +				<2 RK_PB0 1 &pcfg_pull_up_drv_level_2>;
>> +		};
>> +		/omit-if-no-ref/
>> +		sdmmc1_cmd: sdmmc1-cmd {
>> +			rockchip,pins =
>> +				/* sdmmc1_cmd */
>> +				<2 RK_PA7 1 &pcfg_pull_up_drv_level_2>;
>> +		};
>> +		/omit-if-no-ref/
>> +		sdmmc1_det: sdmmc1-det {
>> +			rockchip,pins =
>> +				/* sdmmc1_det */
>> +				<2 RK_PB2 1 &pcfg_pull_up>;
>> +		};
>> +		/omit-if-no-ref/
>> +		sdmmc1_pwren: sdmmc1-pwren {
>> +			rockchip,pins =
>> +				/* sdmmc1_pwren */
>> +				<2 RK_PB1 1 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	sdmmc2 {
>> +		/omit-if-no-ref/
>> +		sdmmc2m0_bus4: sdmmc2m0-bus4 {
>> +			rockchip,pins =
>> +				/* sdmmc2_d0m0 */
>> +				<3 RK_PC6 3 &pcfg_pull_up_drv_level_2>,
>> +				/* sdmmc2_d1m0 */
>> +				<3 RK_PC7 3 &pcfg_pull_up_drv_level_2>,
>> +				/* sdmmc2_d2m0 */
>> +				<3 RK_PD0 3 &pcfg_pull_up_drv_level_2>,
>> +				/* sdmmc2_d3m0 */
>> +				<3 RK_PD1 3 &pcfg_pull_up_drv_level_2>;
>> +		};
>> +		/omit-if-no-ref/
>> +		sdmmc2m0_clk: sdmmc2m0-clk {
>> +			rockchip,pins =
>> +				/* sdmmc2_clkm0 */
>> +				<3 RK_PD3 3 &pcfg_pull_up_drv_level_2>;
>> +		};
>> +		/omit-if-no-ref/
>> +		sdmmc2m0_cmd: sdmmc2m0-cmd {
>> +			rockchip,pins =
>> +				/* sdmmc2_cmdm0 */
>> +				<3 RK_PD2 3 &pcfg_pull_up_drv_level_2>;
>> +		};
>> +		/omit-if-no-ref/
>> +		sdmmc2m0_det: sdmmc2m0-det {
>> +			rockchip,pins =
>> +				/* sdmmc2_detm0 */
>> +				<3 RK_PD4 3 &pcfg_pull_up>;
>> +		};
>> +		/omit-if-no-ref/
>> +		sdmmc2m0_pwren: sdmmc2m0-pwren {
>> +			rockchip,pins =
>> +				/* sdmmc2m0_pwren */
>> +				<3 RK_PD5 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		sdmmc2m1_bus4: sdmmc2m1-bus4 {
>> +			rockchip,pins =
>> +				/* sdmmc2_d0m1 */
>> +				<3 RK_PA1 5 &pcfg_pull_up_drv_level_2>,
>> +				/* sdmmc2_d1m1 */
>> +				<3 RK_PA2 5 &pcfg_pull_up_drv_level_2>,
>> +				/* sdmmc2_d2m1 */
>> +				<3 RK_PA3 5 &pcfg_pull_up_drv_level_2>,
>> +				/* sdmmc2_d3m1 */
>> +				<3 RK_PA4 5 &pcfg_pull_up_drv_level_2>;
>> +		};
>> +		/omit-if-no-ref/
>> +		sdmmc2m1_clk: sdmmc2m1-clk {
>> +			rockchip,pins =
>> +				/* sdmmc2_clkm1 */
>> +				<3 RK_PA6 5 &pcfg_pull_up_drv_level_2>;
>> +		};
>> +		/omit-if-no-ref/
>> +		sdmmc2m1_cmd: sdmmc2m1-cmd {
>> +			rockchip,pins =
>> +				/* sdmmc2_cmdm1 */
>> +				<3 RK_PA5 5 &pcfg_pull_up_drv_level_2>;
>> +		};
>> +		/omit-if-no-ref/
>> +		sdmmc2m1_det: sdmmc2m1-det {
>> +			rockchip,pins =
>> +				/* sdmmc2_detm1 */
>> +				<3 RK_PA7 4 &pcfg_pull_up>;
>> +		};
>> +		/omit-if-no-ref/
>> +		sdmmc2m1_pwren: sdmmc2m1-pwren {
>> +			rockchip,pins =
>> +				/* sdmmc2m1_pwren */
>> +				<3 RK_PB0 4 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	spdif {
>> +		/omit-if-no-ref/
>> +		spdifm0_tx: spdifm0-tx {
>> +			rockchip,pins =
>> +				/* spdifm0_tx */
>> +				<1 RK_PA4 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spdifm1_tx: spdifm1-tx {
>> +			rockchip,pins =
>> +				/* spdifm1_tx */
>> +				<3 RK_PC5 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spdifm2_tx: spdifm2-tx {
>> +			rockchip,pins =
>> +				/* spdifm2_tx */
>> +				<4 RK_PC4 2 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	spi0 {
>> +		/omit-if-no-ref/
>> +		spi0m0_pins: spi0m0-pins {
>> +			rockchip,pins =
>> +				/* spi0_clkm0 */
>> +				<0 RK_PB5 2 &pcfg_pull_none>,
>> +				/* spi0_misom0 */
>> +				<0 RK_PC5 2 &pcfg_pull_none>,
>> +				/* spi0_mosim0 */
>> +				<0 RK_PB6 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi0m0_cs0: spi0m0-cs0 {
>> +			rockchip,pins =
>> +				/* spi0_cs0m0 */
>> +				<0 RK_PC6 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi0m0_cs1: spi0m0-cs1 {
>> +			rockchip,pins =
>> +				/* spi0_cs1m0 */
>> +				<0 RK_PC4 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi0m1_pins: spi0m1-pins {
>> +			rockchip,pins =
>> +				/* spi0_clkm1 */
>> +				<2 RK_PD3 3 &pcfg_pull_none>,
>> +				/* spi0_misom1 */
>> +				<2 RK_PD0 3 &pcfg_pull_none>,
>> +				/* spi0_mosim1 */
>> +				<2 RK_PD1 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi0m1_cs0: spi0m1-cs0 {
>> +			rockchip,pins =
>> +				/* spi0_cs0m1 */
>> +				<2 RK_PD2 3 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	spi1 {
>> +		/omit-if-no-ref/
>> +		spi1m0_pins: spi1m0-pins {
>> +			rockchip,pins =
>> +				/* spi1_clkm0 */
>> +				<2 RK_PB5 3 &pcfg_pull_none>,
>> +				/* spi1_misom0 */
>> +				<2 RK_PB6 3 &pcfg_pull_none>,
>> +				/* spi1_mosim0 */
>> +				<2 RK_PB7 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi1m0_cs0: spi1m0-cs0 {
>> +			rockchip,pins =
>> +				/* spi1_cs0m0 */
>> +				<2 RK_PC0 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi1m0_cs1: spi1m0-cs1 {
>> +			rockchip,pins =
>> +				/* spi1_cs1m0 */
>> +				<2 RK_PC6 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi1m1_pins: spi1m1-pins {
>> +			rockchip,pins =
>> +				/* spi1_clkm1 */
>> +				<3 RK_PC3 3 &pcfg_pull_none>,
>> +				/* spi1_misom1 */
>> +				<3 RK_PC2 3 &pcfg_pull_none>,
>> +				/* spi1_mosim1 */
>> +				<3 RK_PC1 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi1m1_cs0: spi1m1-cs0 {
>> +			rockchip,pins =
>> +				/* spi1_cs0m1 */
>> +				<3 RK_PA1 3 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	spi2 {
>> +		/omit-if-no-ref/
>> +		spi2m0_pins: spi2m0-pins {
>> +			rockchip,pins =
>> +				/* spi2_clkm0 */
>> +				<2 RK_PC1 4 &pcfg_pull_none>,
>> +				/* spi2_misom0 */
>> +				<2 RK_PC2 4 &pcfg_pull_none>,
>> +				/* spi2_mosim0 */
>> +				<2 RK_PC3 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi2m0_cs0: spi2m0-cs0 {
>> +			rockchip,pins =
>> +				/* spi2_cs0m0 */
>> +				<2 RK_PC4 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi2m0_cs1: spi2m0-cs1 {
>> +			rockchip,pins =
>> +				/* spi2_cs1m0 */
>> +				<2 RK_PC5 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi2m1_pins: spi2m1-pins {
>> +			rockchip,pins =
>> +				/* spi2_clkm1 */
>> +				<3 RK_PA0 3 &pcfg_pull_none>,
>> +				/* spi2_misom1 */
>> +				<2 RK_PD7 3 &pcfg_pull_none>,
>> +				/* spi2_mosim1 */
>> +				<2 RK_PD6 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi2m1_cs0: spi2m1-cs0 {
>> +			rockchip,pins =
>> +				/* spi2_cs0m1 */
>> +				<2 RK_PD5 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi2m1_cs1: spi2m1-cs1 {
>> +			rockchip,pins =
>> +				/* spi2_cs1m1 */
>> +				<2 RK_PD4 3 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	spi3 {
>> +		/omit-if-no-ref/
>> +		spi3m0_pins: spi3m0-pins {
>> +			rockchip,pins =
>> +				/* spi3_clkm0 */
>> +				<4 RK_PB3 4 &pcfg_pull_none>,
>> +				/* spi3_misom0 */
>> +				<4 RK_PB0 4 &pcfg_pull_none>,
>> +				/* spi3_mosim0 */
>> +				<4 RK_PB2 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi3m0_cs0: spi3m0-cs0 {
>> +			rockchip,pins =
>> +				/* spi3_cs0m0 */
>> +				<4 RK_PA6 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi3m0_cs1: spi3m0-cs1 {
>> +			rockchip,pins =
>> +				/* spi3_cs1m0 */
>> +				<4 RK_PA7 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi3m1_pins: spi3m1-pins {
>> +			rockchip,pins =
>> +				/* spi3_clkm1 */
>> +				<4 RK_PC2 2 &pcfg_pull_none>,
>> +				/* spi3_misom1 */
>> +				<4 RK_PC5 2 &pcfg_pull_none>,
>> +				/* spi3_mosim1 */
>> +				<4 RK_PC3 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi3m1_cs0: spi3m1-cs0 {
>> +			rockchip,pins =
>> +				/* spi3_cs0m1 */
>> +				<4 RK_PC6 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi3m1_cs1: spi3m1-cs1 {
>> +			rockchip,pins =
>> +				/* spi3_cs1m1 */
>> +				<4 RK_PD1 2 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	tsadc {
>> +		/omit-if-no-ref/
>> +		tsadcm0_shut: tsadcm0-shut {
>> +			rockchip,pins =
>> +				/* tsadcm0_shut */
>> +				<0 RK_PA1 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		tsadcm1_shut: tsadcm1-shut {
>> +			rockchip,pins =
>> +				/* tsadcm1_shut */
>> +				<0 RK_PA2 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		tsadc_shutorg: tsadc-shutorg {
>> +			rockchip,pins =
>> +				/* tsadc_shutorg */
>> +				<0 RK_PA1 2 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	uart0 {
>> +		/omit-if-no-ref/
>> +		uart0_xfer: uart0-xfer {
>> +			rockchip,pins =
>> +				/* uart0_rx */
>> +				<0 RK_PC0 3 &pcfg_pull_up>,
>> +				/* uart0_tx */
>> +				<0 RK_PC1 3 &pcfg_pull_up>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart0_ctsn: uart0-ctsn {
>> +			rockchip,pins =
>> +				/* uart0_ctsn */
>> +				<0 RK_PC7 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart0_rtsn: uart0-rtsn {
>> +			rockchip,pins =
>> +				/* uart0_rtsn */
>> +				<0 RK_PC4 3 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	uart1 {
>> +		/omit-if-no-ref/
>> +		uart1m0_xfer: uart1m0-xfer {
>> +			rockchip,pins =
>> +				/* uart1_rxm0 */
>> +				<2 RK_PB3 2 &pcfg_pull_up>,
>> +				/* uart1_txm0 */
>> +				<2 RK_PB4 2 &pcfg_pull_up>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart1m0_ctsn: uart1m0-ctsn {
>> +			rockchip,pins =
>> +				/* uart1m0_ctsn */
>> +				<2 RK_PB6 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart1m0_rtsn: uart1m0-rtsn {
>> +			rockchip,pins =
>> +				/* uart1m0_rtsn */
>> +				<2 RK_PB5 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart1m1_xfer: uart1m1-xfer {
>> +			rockchip,pins =
>> +				/* uart1_rxm1 */
>> +				<3 RK_PD7 4 &pcfg_pull_up>,
>> +				/* uart1_txm1 */
>> +				<3 RK_PD6 4 &pcfg_pull_up>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart1m1_ctsn: uart1m1-ctsn {
>> +			rockchip,pins =
>> +				/* uart1m1_ctsn */
>> +				<4 RK_PC1 4 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart1m1_rtsn: uart1m1-rtsn {
>> +			rockchip,pins =
>> +				/* uart1m1_rtsn */
>> +				<4 RK_PB6 4 &pcfg_pull_none>;
>> +		};
>> +	};
>> +	uart2 {
>> +		/omit-if-no-ref/
>> +		uart2m0_xfer: uart2m0-xfer {
>> +			rockchip,pins =
>> +				/* uart2_rxm0 */
>> +				<0 RK_PD0 1 &pcfg_pull_up>,
>> +				/* uart2_txm0 */
>> +				<0 RK_PD1 1 &pcfg_pull_up>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart2m1_xfer: uart2m1-xfer {
>> +			rockchip,pins =
>> +				/* uart2_rxm1 */
>> +				<1 RK_PD6 2 &pcfg_pull_up>,
>> +				/* uart2_txm1 */
>> +				<1 RK_PD5 2 &pcfg_pull_up>;
>> +		};
>> +	};
>> +	uart3 {
>> +		/omit-if-no-ref/
>> +		uart3m0_xfer: uart3m0-xfer {
>> +			rockchip,pins =
>> +				/* uart3_rxm0 */
>> +				<1 RK_PA0 2 &pcfg_pull_up>,
>> +				/* uart3_txm0 */
>> +				<1 RK_PA1 2 &pcfg_pull_up>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart3m0_ctsn: uart3m0-ctsn {
>> +			rockchip,pins =
>> +				/* uart3m0_ctsn */
>> +				<1 RK_PA3 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart3m0_rtsn: uart3m0-rtsn {
>> +			rockchip,pins =
>> +				/* uart3m0_rtsn */
>> +				<1 RK_PA2 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart3m1_xfer: uart3m1-xfer {
>> +			rockchip,pins =
>> +				/* uart3_rxm1 */
>> +				<3 RK_PC0 4 &pcfg_pull_up>,
>> +				/* uart3_txm1 */
>> +				<3 RK_PB7 4 &pcfg_pull_up>;
>> +		};
>> +	};
>> +	uart4 {
>> +		/omit-if-no-ref/
>> +		uart4m0_xfer: uart4m0-xfer {
>> +			rockchip,pins =
>> +				/* uart4_rxm0 */
>> +				<1 RK_PA4 2 &pcfg_pull_up>,
>> +				/* uart4_txm0 */
>> +				<1 RK_PA6 2 &pcfg_pull_up>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart4m0_ctsn: uart4m0-ctsn {
>> +			rockchip,pins =
>> +				/* uart4m0_ctsn */
>> +				<1 RK_PA7 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart4m0_rtsn: uart4m0-rtsn {
>> +			rockchip,pins =
>> +				/* uart4m0_rtsn */
>> +				<1 RK_PA5 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart4m1_xfer: uart4m1-xfer {
>> +			rockchip,pins =
>> +				/* uart4_rxm1 */
>> +				<3 RK_PB1 4 &pcfg_pull_up>,
>> +				/* uart4_txm1 */
>> +				<3 RK_PB2 4 &pcfg_pull_up>;
>> +		};
>> +	};
>> +	uart5 {
>> +		/omit-if-no-ref/
>> +		uart5m0_xfer: uart5m0-xfer {
>> +			rockchip,pins =
>> +				/* uart5_rxm0 */
>> +				<2 RK_PA1 3 &pcfg_pull_up>,
>> +				/* uart5_txm0 */
>> +				<2 RK_PA2 3 &pcfg_pull_up>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart5m0_ctsn: uart5m0-ctsn {
>> +			rockchip,pins =
>> +				/* uart5m0_ctsn */
>> +				<1 RK_PD7 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart5m0_rtsn: uart5m0-rtsn {
>> +			rockchip,pins =
>> +				/* uart5m0_rtsn */
>> +				<2 RK_PA0 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart5m1_xfer: uart5m1-xfer {
>> +			rockchip,pins =
>> +				/* uart5_rxm1 */
>> +				<3 RK_PC3 4 &pcfg_pull_up>,
>> +				/* uart5_txm1 */
>> +				<3 RK_PC2 4 &pcfg_pull_up>;
>> +		};
>> +	};
>> +	uart6 {
>> +		/omit-if-no-ref/
>> +		uart6m0_xfer: uart6m0-xfer {
>> +			rockchip,pins =
>> +				/* uart6_rxm0 */
>> +				<2 RK_PA3 3 &pcfg_pull_up>,
>> +				/* uart6_txm0 */
>> +				<2 RK_PA4 3 &pcfg_pull_up>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart6m0_ctsn: uart6m0-ctsn {
>> +			rockchip,pins =
>> +				/* uart6m0_ctsn */
>> +				<2 RK_PC0 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart6m0_rtsn: uart6m0-rtsn {
>> +			rockchip,pins =
>> +				/* uart6m0_rtsn */
>> +				<2 RK_PB7 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart6m1_xfer: uart6m1-xfer {
>> +			rockchip,pins =
>> +				/* uart6_rxm1 */
>> +				<1 RK_PD6 3 &pcfg_pull_up>,
>> +				/* uart6_txm1 */
>> +				<1 RK_PD5 3 &pcfg_pull_up>;
>> +		};
>> +	};
>> +	uart7 {
>> +		/omit-if-no-ref/
>> +		uart7m0_xfer: uart7m0-xfer {
>> +			rockchip,pins =
>> +				/* uart7_rxm0 */
>> +				<2 RK_PA5 3 &pcfg_pull_up>,
>> +				/* uart7_txm0 */
>> +				<2 RK_PA6 3 &pcfg_pull_up>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart7m0_ctsn: uart7m0-ctsn {
>> +			rockchip,pins =
>> +				/* uart7m0_ctsn */
>> +				<2 RK_PC2 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart7m0_rtsn: uart7m0-rtsn {
>> +			rockchip,pins =
>> +				/* uart7m0_rtsn */
>> +				<2 RK_PC1 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart7m1_xfer: uart7m1-xfer {
>> +			rockchip,pins =
>> +				/* uart7_rxm1 */
>> +				<3 RK_PC5 4 &pcfg_pull_up>,
>> +				/* uart7_txm1 */
>> +				<3 RK_PC4 4 &pcfg_pull_up>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart7m2_xfer: uart7m2-xfer {
>> +			rockchip,pins =
>> +				/* uart7_rxm2 */
>> +				<4 RK_PA3 4 &pcfg_pull_up>,
>> +				/* uart7_txm2 */
>> +				<4 RK_PA2 4 &pcfg_pull_up>;
>> +		};
>> +	};
>> +	uart8 {
>> +		/omit-if-no-ref/
>> +		uart8m0_xfer: uart8m0-xfer {
>> +			rockchip,pins =
>> +				/* uart8_rxm0 */
>> +				<2 RK_PC6 2 &pcfg_pull_up>,
>> +				/* uart8_txm0 */
>> +				<2 RK_PC5 3 &pcfg_pull_up>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart8m0_ctsn: uart8m0-ctsn {
>> +			rockchip,pins =
>> +				/* uart8m0_ctsn */
>> +				<2 RK_PB2 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart8m0_rtsn: uart8m0-rtsn {
>> +			rockchip,pins =
>> +				/* uart8m0_rtsn */
>> +				<2 RK_PB1 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart8m1_xfer: uart8m1-xfer {
>> +			rockchip,pins =
>> +				/* uart8_rxm1 */
>> +				<3 RK_PA0 4 &pcfg_pull_up>,
>> +				/* uart8_txm1 */
>> +				<2 RK_PD7 4 &pcfg_pull_up>;
>> +		};
>> +	};
>> +	uart9 {
>> +		/omit-if-no-ref/
>> +		uart9m0_xfer: uart9m0-xfer {
>> +			rockchip,pins =
>> +				/* uart9_rxm0 */
>> +				<2 RK_PA7 3 &pcfg_pull_up>,
>> +				/* uart9_txm0 */
>> +				<2 RK_PB0 3 &pcfg_pull_up>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart9m0_ctsn: uart9m0-ctsn {
>> +			rockchip,pins =
>> +				/* uart9m0_ctsn */
>> +				<2 RK_PC4 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart9m0_rtsn: uart9m0-rtsn {
>> +			rockchip,pins =
>> +				/* uart9m0_rtsn */
>> +				<2 RK_PC3 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart9m1_xfer: uart9m1-xfer {
>> +			rockchip,pins =
>> +				/* uart9_rxm1 */
>> +				<4 RK_PC6 4 &pcfg_pull_up>,
>> +				/* uart9_txm1 */
>> +				<4 RK_PC5 4 &pcfg_pull_up>;
>> +		};
>> +		/omit-if-no-ref/
>> +		uart9m2_xfer: uart9m2-xfer {
>> +			rockchip,pins =
>> +				/* uart9_rxm2 */
>> +				<4 RK_PA5 4 &pcfg_pull_up>,
>> +				/* uart9_txm2 */
>> +				<4 RK_PA4 4 &pcfg_pull_up>;
>> +		};
>> +	};
>> +	vop {
>> +		/omit-if-no-ref/
>> +		vopm0_pins: vopm0-pins {
>> +			rockchip,pins =
>> +				/* vop_pwmm0 */
>> +				<0 RK_PC3 2 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		vopm1_pins: vopm1-pins {
>> +			rockchip,pins =
>> +				/* vop_pwmm1 */
>> +				<3 RK_PC4 2 &pcfg_pull_none>;
>> +		};
>> +	};
>> +};
>> +
>> +/*
>> + * This part is edited handly.
>> + */
>> +&pinctrl {
>> +	spi0-hs {
>> +		/omit-if-no-ref/
>> +		spi0m0_pins_hs: spi0m0-pins {
>> +			rockchip,pins =
>> +				/* spi0_clkm0 */
>> +				<0 RK_PB5 2 &pcfg_pull_up_drv_level_1>,
>> +				/* spi0_misom0 */
>> +				<0 RK_PC5 2 &pcfg_pull_up_drv_level_1>,
>> +				/* spi0_mosim0 */
>> +				<0 RK_PB6 2 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi0m0_cs0_hs: spi0m0-cs0 {
>> +			rockchip,pins =
>> +				/* spi0_cs0m0 */
>> +				<0 RK_PC6 2 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi0m0_cs1_hs: spi0m0-cs1 {
>> +			rockchip,pins =
>> +				/* spi0_cs1m0 */
>> +				<0 RK_PC4 2 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi0m1_pins_hs: spi0m1-pins {
>> +			rockchip,pins =
>> +				/* spi0_clkm1 */
>> +				<2 RK_PD3 3 &pcfg_pull_up_drv_level_1>,
>> +				/* spi0_misom1 */
>> +				<2 RK_PD0 3 &pcfg_pull_up_drv_level_1>,
>> +				/* spi0_mosim1 */
>> +				<2 RK_PD1 3 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi0m1_cs0_hs: spi0m1-cs0 {
>> +			rockchip,pins =
>> +				/* spi0_cs0m1 */
>> +				<2 RK_PD2 3 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +	};
>> +	spi1-hs {
>> +		/omit-if-no-ref/
>> +		spi1m0_pins_hs: spi1m0-pins {
>> +			rockchip,pins =
>> +				/* spi1_clkm0 */
>> +				<2 RK_PB5 3 &pcfg_pull_up_drv_level_1>,
>> +				/* spi1_misom0 */
>> +				<2 RK_PB6 3 &pcfg_pull_up_drv_level_1>,
>> +				/* spi1_mosim0 */
>> +				<2 RK_PB7 4 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi1m0_cs0_hs: spi1m0-cs0 {
>> +			rockchip,pins =
>> +				/* spi1_cs0m0 */
>> +				<2 RK_PC0 4 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi1m0_cs1_hs: spi1m0-cs1 {
>> +			rockchip,pins =
>> +				/* spi1_cs1m0 */
>> +				<2 RK_PC6 3 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi1m1_pins_hs: spi1m1-pins {
>> +			rockchip,pins =
>> +				/* spi1_clkm1 */
>> +				<3 RK_PC3 3 &pcfg_pull_up_drv_level_1>,
>> +				/* spi1_misom1 */
>> +				<3 RK_PC2 3 &pcfg_pull_up_drv_level_1>,
>> +				/* spi1_mosim1 */
>> +				<3 RK_PC1 3 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi1m1_cs0_hs: spi1m1-cs0 {
>> +			rockchip,pins =
>> +				/* spi1_cs0m1 */
>> +				<3 RK_PA1 3 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +	};
>> +	spi2-hs {
>> +		/omit-if-no-ref/
>> +		spi2m0_pins_hs: spi2m0-pins {
>> +			rockchip,pins =
>> +				/* spi2_clkm0 */
>> +				<2 RK_PC1 4 &pcfg_pull_up_drv_level_1>,
>> +				/* spi2_misom0 */
>> +				<2 RK_PC2 4 &pcfg_pull_up_drv_level_1>,
>> +				/* spi2_mosim0 */
>> +				<2 RK_PC3 4 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi2m0_cs0_hs: spi2m0-cs0 {
>> +			rockchip,pins =
>> +				/* spi2_cs0m0 */
>> +				<2 RK_PC4 4 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi2m0_cs1_hs: spi2m0-cs1 {
>> +			rockchip,pins =
>> +				/* spi2_cs1m0 */
>> +				<2 RK_PC5 4 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi2m1_pins_hs: spi2m1-pins {
>> +			rockchip,pins =
>> +				/* spi2_clkm1 */
>> +				<3 RK_PA0 3 &pcfg_pull_up_drv_level_1>,
>> +				/* spi2_misom1 */
>> +				<2 RK_PD7 3 &pcfg_pull_up_drv_level_1>,
>> +				/* spi2_mosim1 */
>> +				<2 RK_PD6 3 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi2m1_cs0_hs: spi2m1-cs0 {
>> +			rockchip,pins =
>> +				/* spi2_cs0m1 */
>> +				<2 RK_PD5 3 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi2m1_cs1_hs: spi2m1-cs1 {
>> +			rockchip,pins =
>> +				/* spi2_cs1m1 */
>> +				<2 RK_PD4 3 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +	};
>> +	spi3-hs {
>> +		/omit-if-no-ref/
>> +		spi3m0_pins_hs: spi3m0-pins {
>> +			rockchip,pins =
>> +				/* spi3_clkm0 */
>> +				<4 RK_PB3 4 &pcfg_pull_up_drv_level_1>,
>> +				/* spi3_misom0 */
>> +				<4 RK_PB0 4 &pcfg_pull_up_drv_level_1>,
>> +				/* spi3_mosim0 */
>> +				<4 RK_PB2 4 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi3m0_cs0_hs: spi3m0-cs0 {
>> +			rockchip,pins =
>> +				/* spi3_cs0m0 */
>> +				<4 RK_PA6 4 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi3m0_cs1_hs: spi3m0-cs1 {
>> +			rockchip,pins =
>> +				/* spi3_cs1m0 */
>> +				<4 RK_PA7 4 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi3m1_pins_hs: spi3m1-pins {
>> +			rockchip,pins =
>> +				/* spi3_clkm1 */
>> +				<4 RK_PC2 2 &pcfg_pull_up_drv_level_1>,
>> +				/* spi3_misom1 */
>> +				<4 RK_PC5 2 &pcfg_pull_up_drv_level_1>,
>> +				/* spi3_mosim1 */
>> +				<4 RK_PC3 2 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi3m1_cs0_hs: spi3m1-cs0 {
>> +			rockchip,pins =
>> +				/* spi3_cs0m1 */
>> +				<4 RK_PC6 2 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +		/omit-if-no-ref/
>> +		spi3m1_cs1_hs: spi3m1-cs1 {
>> +			rockchip,pins =
>> +				/* spi3_cs1m1 */
>> +				<4 RK_PD1 2 &pcfg_pull_up_drv_level_1>;
>> +		};
>> +	};
>> +	gmac-txd-level3 {
>> +		/omit-if-no-ref/
>> +		gmac0_tx_bus2_level3: gmac0-tx-bus2-level3 {
>> +			rockchip,pins =
>> +				/* gmac0_txd0 */
>> +				<2 RK_PB3 1 &pcfg_pull_none_drv_level_3>,
>> +				/* gmac0_txd1 */
>> +				<2 RK_PB4 1 &pcfg_pull_none_drv_level_3>,
>> +				/* gmac0_txen */
>> +				<2 RK_PB5 1 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac0_rgmii_bus_level3: gmac0-rgmii-bus-level3 {
>> +			rockchip,pins =
>> +				/* gmac0_rxd2 */
>> +				<2 RK_PA3 2 &pcfg_pull_none>,
>> +				/* gmac0_rxd3 */
>> +				<2 RK_PA4 2 &pcfg_pull_none>,
>> +				/* gmac0_txd2 */
>> +				<2 RK_PA6 2 &pcfg_pull_none_drv_level_3>,
>> +				/* gmac0_txd3 */
>> +				<2 RK_PA7 2 &pcfg_pull_none_drv_level_3>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac1m0_tx_bus2_level3: gmac1m0-tx-bus2-level3 {
>> +			rockchip,pins =
>> +				/* gmac1_txd0m0 */
>> +				<3 RK_PB5 3 &pcfg_pull_none_drv_level_3>,
>> +				/* gmac1_txd1m0 */
>> +				<3 RK_PB6 3 &pcfg_pull_none_drv_level_3>,
>> +				/* gmac1_txenm0 */
>> +				<3 RK_PB7 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac1m0_rgmii_bus_level3: gmac1m0-rgmii-bus-level3 {
>> +			rockchip,pins =
>> +				/* gmac1_rxd2m0 */
>> +				<3 RK_PA4 3 &pcfg_pull_none>,
>> +				/* gmac1_rxd3m0 */
>> +				<3 RK_PA5 3 &pcfg_pull_none>,
>> +				/* gmac1_txd2m0 */
>> +				<3 RK_PA2 3 &pcfg_pull_none_drv_level_3>,
>> +				/* gmac1_txd3m0 */
>> +				<3 RK_PA3 3 &pcfg_pull_none_drv_level_3>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac1m1_tx_bus2_level3: gmac1m1-tx-bus2-level3 {
>> +			rockchip,pins =
>> +				/* gmac1_txd0m1 */
>> +				<4 RK_PA4 3 &pcfg_pull_none_drv_level_3>,
>> +				/* gmac1_txd1m1 */
>> +				<4 RK_PA5 3 &pcfg_pull_none_drv_level_3>,
>> +				/* gmac1_txenm1 */
>> +				<4 RK_PA6 3 &pcfg_pull_none>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac1m1_rgmii_bus_level3: gmac1m1-rgmii-bus-level3 {
>> +			rockchip,pins =
>> +				/* gmac1_rxd2m1 */
>> +				<4 RK_PA1 3 &pcfg_pull_none>,
>> +				/* gmac1_rxd3m1 */
>> +				<4 RK_PA2 3 &pcfg_pull_none>,
>> +				/* gmac1_txd2m1 */
>> +				<3 RK_PD6 3 &pcfg_pull_none_drv_level_3>,
>> +				/* gmac1_txd3m1 */
>> +				<3 RK_PD7 3 &pcfg_pull_none_drv_level_3>;
>> +		};
>> +	};
>> +	gmac-txc-level2 {
>> +		/omit-if-no-ref/
>> +		gmac0_rgmii_clk_level2: gmac0-rgmii-clk-level2 {
>> +			rockchip,pins =
>> +				/* gmac0_rxclk */
>> +				<2 RK_PA5 2 &pcfg_pull_none>,
>> +				/* gmac0_txclk */
>> +				<2 RK_PB0 2 &pcfg_pull_none_drv_level_2>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac1m0_rgmii_clk_level2: gmac1m0-rgmii-clk-level2 {
>> +			rockchip,pins =
>> +				/* gmac1_rxclkm0 */
>> +				<3 RK_PA7 3 &pcfg_pull_none>,
>> +				/* gmac1_txclkm0 */
>> +				<3 RK_PA6 3 &pcfg_pull_none_drv_level_2>;
>> +		};
>> +		/omit-if-no-ref/
>> +		gmac1m1_rgmii_clk_level2: gmac1m1-rgmii-clk-level2 {
>> +			rockchip,pins =
>> +				/* gmac1_rxclkm1 */
>> +				<4 RK_PA3 3 &pcfg_pull_none>,
>> +				/* gmac1_txclkm1 */
>> +				<4 RK_PA0 3 &pcfg_pull_none_drv_level_2>;
>> +		};
>> +	};
>> +	gpio {
> tsadc ??
>
>> +		/omit-if-no-ref/
>> +		tsadc_gpio: tsadc-gpio {
> tsadc_pins: tsadc-pins
> nodenames ending on gpio generate notifications
>
>> +			rockchip,pins =
>> +				<0 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
>> +		};
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
>> new file mode 100644
>> index 000000000000..ac8db2f54f2b
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
>> @@ -0,0 +1,795 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
>> + */
>> +
>> +#include <dt-bindings/clock/rk3568-cru.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/pinctrl/rockchip.h>
>> +#include <dt-bindings/soc/rockchip,boot-mode.h>
>> +#include <dt-bindings/phy/phy.h>
>> +#include <dt-bindings/thermal/thermal.h>
> sort includes
>
>> +
>> +/ {
>> +	compatible = "rockchip,rk3568";
>> +
>> +	interrupt-parent = <&gic>;
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>> +
>> +	aliases {
>> +		serial2 = &uart2;
>> +	};
>> +
>> +	cpus {
>> +		#address-cells = <2>;
>> +		#size-cells = <0>;
>> +
>> +		cpu0: cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a55";
>> +			reg = <0x0 0x0>;
>> +			enable-method = "psci";
>> +			clocks = <&scmi_clk 0>;
>> +			operating-points-v2 = <&cpu0_opp_table>;
>> +			#cooling-cells = <2>;
>> +		};
>> +		cpu1: cpu@100 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a55";
>> +			reg = <0x0 0x100>;
>> +			enable-method = "psci";
>> +			operating-points-v2 = <&cpu0_opp_table>;
>> +		};
>> +		cpu2: cpu@200 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a55";
>> +			reg = <0x0 0x200>;
>> +			enable-method = "psci";
>> +			operating-points-v2 = <&cpu0_opp_table>;
>> +		};
>> +		cpu3: cpu@300 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a55";
>> +			reg = <0x0 0x300>;
>> +			enable-method = "psci";
>> +			operating-points-v2 = <&cpu0_opp_table>;
>> +		};
>> +	};
>> +
>> +	cpu0_opp_table: cpu0-opp-table {
>> +		compatible = "operating-points-v2";
>> +		opp-shared;
>> +
>> +		opp-408000000 {
>> +			opp-hz = /bits/ 64 <408000000>;
>> +			opp-microvolt = <825000 825000 1150000>;
>> +			clock-latency-ns = <40000>;
>> +		};
>> +		opp-600000000 {
>> +			opp-hz = /bits/ 64 <600000000>;
>> +			opp-microvolt = <825000 825000 1150000>;
>> +		};
>> +		opp-816000000 {
>> +			opp-hz = /bits/ 64 <816000000>;
>> +			opp-microvolt = <825000 825000 1150000>;
>> +			opp-suspend;
>> +		};
>> +		opp-1104000000 {
>> +			opp-hz = /bits/ 64 <1104000000>;
>> +			opp-microvolt = <825000 825000 1150000>;
>> +		};
>> +		opp-1416000000 {
>> +			opp-hz = /bits/ 64 <1416000000>;
>> +			opp-microvolt = <900000 900000 1150000>;
>> +		};
>> +		opp-1608000000 {
>> +			opp-hz = /bits/ 64 <1608000000>;
>> +			opp-microvolt = <975000 975000 1150000>;
>> +		};
>> +		opp-1800000000 {
>> +			opp-hz = /bits/ 64 <1800000000>;
>> +			opp-microvolt = <1050000 1050000 1150000>;
>> +		};
>> +		opp-1992000000 {
>> +			opp-hz = /bits/ 64 <1992000000>;
>> +			opp-microvolt = <1150000 1150000 1150000>;
>> +		};
>> +	};
>> +
>> +	arm-pmu {
>> +		compatible = "arm,cortex-a55-pmu", "arm,armv8-pmuv3";
>> +		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
>> +	};
>> +
>> +	firmware {
>> +		scmi: scmi {
>> +			compatible = "arm,scmi-smc";
>> +			shmem = <&scmi_shmem>;
>> +			arm,smc-id = <0x82000010>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			scmi_clk: protocol@14 {
>> +				reg = <0x14>;
>> +				#clock-cells = <1>;
>> +			};
>> +		};
>> +
>> +	};
>> +
>> +	psci {
>> +		compatible = "arm,psci-1.0";
>> +		method = "smc";
>> +	};
>> +
>> +	timer {
>> +		compatible = "arm,armv8-timer";
>> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
>> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
>> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
>> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>> +		arm,no-tick-in-suspend;
>> +	};
>> +
>> +	xin24m: xin24m {
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +		clock-frequency = <24000000>;
>> +		clock-output-names = "xin24m";
>> +	};
>> +
>> +	xin32k: xin32k {
>> +		compatible = "fixed-clock";
>> +		clock-frequency = <32768>;
>> +		clock-output-names = "xin32k";
>> +		#clock-cells = <0>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&clk32k_out0>;
>> +	};
>> +
>> +	scmi_shmem: scmi-shmem@10f000 {
>> +		compatible = "arm,scmi-shmem";
>> +		reg = <0x0 0x0010f000 0x0 0x100>;
>> +	};
>> +
>> +	gic: interrupt-controller@fd400000 {
>> +		compatible = "arm,gic-v3";
>> +		#interrupt-cells = <3>;
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +		interrupt-controller;
>> +
>> +		reg = <0x0 0xfd400000 0 0x10000>, /* GICD */
>> +		      <0x0 0xfd460000 0 0xc0000>; /* GICR */
>> +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> sort
>
>> +	};
>> +
>> +	pmugrf: syscon@fdc20000 {
>> +		compatible = "rockchip,rk3568-pmugrf", "syscon", "simple-mfd";
>> +		reg = <0x0 0xfdc20000 0x0 0x10000>;
>> +
>> +		reboot_mode: reboot-mode {
>> +			compatible = "syscon-reboot-mode";
>> +			offset = <0x200>;
>> +			mode-bootloader = <BOOT_BL_DOWNLOAD>;
>> +			mode-loader = <BOOT_BL_DOWNLOAD>;
>> +			mode-normal = <BOOT_NORMAL>;
>> +			mode-recovery = <BOOT_RECOVERY>;
>> +			mode-fastboot = <BOOT_FASTBOOT>;
> sort
>
>> +		};
>> +	};
>> +
>> +	grf: syscon@fdc60000 {
>> +		compatible = "rockchip,rk3568-grf", "syscon", "simple-mfd";
>> +		reg = <0x0 0xfdc60000 0x0 0x10000>;
>> +	};
>> +
>> +	pmucru: clock-controller@fdd00000 {
>> +		compatible = "rockchip,rk3568-pmucru";
>> +		reg = <0x0 0xfdd00000 0x0 0x1000>;
>> +		rockchip,grf = <&grf>;
>> +		rockchip,pmugrf = <&pmugrf>;
>> +		#clock-cells = <1>;
>> +		#reset-cells = <1>;
>> +	};
>> +
>> +	cru: clock-controller@fdd20000 {
>> +		compatible = "rockchip,rk3568-cru";
>> +		reg = <0x0 0xfdd20000 0x0 0x1000>;
>> +		rockchip,grf = <&grf>;
>> +		#clock-cells = <1>;
>> +		#reset-cells = <1>;
>> +
>> +		assigned-clocks =
>> +			<&pmucru CLK_RTC_32K>, <&pmucru PLL_PPLL>,
>> +			<&pmucru PCLK_PMU>, <&cru PLL_CPLL>,
>> +			<&cru PLL_GPLL>, <&cru ACLK_BUS>,
>> +			<&cru PCLK_BUS>, <&cru ACLK_TOP_HIGH>,
>> +			<&cru ACLK_TOP_LOW>, <&cru HCLK_TOP>,
>> +			<&cru PCLK_TOP>, <&cru ACLK_PERIMID>,
>> +			<&cru HCLK_PERIMID>, <&cru PLL_NPLL>,
>> +			<&cru ACLK_PIPE>, <&cru PCLK_PIPE>,
>> +			<&cru ACLK_VOP>;
>> +		assigned-clock-rates =
>> +			<32768>, <200000000>,
>> +			<100000000>, <1000000000>,
>> +			<1188000000>, <150000000>,
>> +			<100000000>, <500000000>,
>> +			<400000000>, <150000000>,
>> +			<100000000>, <300000000>,
>> +			<150000000>, <1200000000>,
>> +			<400000000>, <100000000>,
>> +			<500000000>;
>> +		assigned-clock-parents =
>> +			<&pmucru CLK_RTC32K_FRAC>;
>> +	};
>> +
>> +	i2c0: i2c@fdd40000 {
>> +		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
>> +		reg = <0x0 0xfdd40000 0x0 0x1000>;
>> +		clocks = <&pmucru CLK_I2C0>, <&pmucru PCLK_I2C0>;
>> +		clock-names = "i2c", "pclk";
>> +		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> interrupts below reg
>
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&i2c0_xfer>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		status = "disabled";
>> +	};
>> +
>> +	uart0: serial@fdd50000 {
>> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
>> +		reg = <0x0 0xfdd50000 0x0 0x100>;
>> +		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
>> +		clocks = <&pmucru SCLK_UART0>, <&pmucru PCLK_UART0>;
>> +		clock-names = "baudclk", "apb_pclk";
>> +		reg-shift = <2>;
>> +		reg-io-width = <4>;
>> +		dmas = <&dmac0 0>, <&dmac0 1>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&uart0_xfer>;
> sort all uart nodes
> pinctrl-0 above pinctrl-names in complete dtsi!
>
>> +		status = "disabled";
>> +	};
>> +
>> +	pwm0: pwm@fdd70000 {
>> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
>> +		reg = <0x0 0xfdd70000 0x0 0x10>;
>> +		#pwm-cells = <3>;
>> +		pinctrl-names = "active";
>> +		pinctrl-0 = <&pwm0m0_pins>;
>> +		clocks = <&pmucru CLK_PWM0>, <&pmucru PCLK_PWM0>;
>> +		clock-names = "pwm", "pclk";
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	pwm1: pwm@fdd70010 {
>> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
>> +		reg = <0x0 0xfdd70010 0x0 0x10>;
>> +		#pwm-cells = <3>;
>> +		pinctrl-names = "active";
>> +		pinctrl-0 = <&pwm1m0_pins>;
>> +		clocks = <&pmucru CLK_PWM0>, <&pmucru PCLK_PWM0>;
>> +		clock-names = "pwm", "pclk";
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	pwm2: pwm@fdd70020 {
>> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
>> +		reg = <0x0 0xfdd70020 0x0 0x10>;
>> +		#pwm-cells = <3>;
>> +		pinctrl-names = "active";
>> +		pinctrl-0 = <&pwm2m0_pins>;
>> +		clocks = <&pmucru CLK_PWM0>, <&pmucru PCLK_PWM0>;
>> +		clock-names = "pwm", "pclk";
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	pwm3: pwm@fdd70030 {
>> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
>> +		reg = <0x0 0xfdd70030 0x0 0x10>;
>> +		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>> +		#pwm-cells = <3>;
>> +		pinctrl-names = "active";
>> +		pinctrl-0 = <&pwm3_pins>;
>> +		clocks = <&pmucru CLK_PWM0>, <&pmucru PCLK_PWM0>;
>> +		clock-names = "pwm", "pclk";
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	sdmmc2: dwmmc@fe000000 {
>> +		compatible = "rockchip,rk3568-dw-mshc",
>> +			     "rockchip,rk3288-dw-mshc";
> one line
>
>> +		reg = <0x0 0xfe000000 0x0 0x4000>;
>> +		interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
>> +		max-frequency = <150000000>;
> move below fifo-depth
>
>> +		clocks = <&cru HCLK_SDMMC2>, <&cru CLK_SDMMC2>,
>> +			 <&cru SCLK_SDMMC2_DRV>, <&cru SCLK_SDMMC2_SAMPLE>;
>> +		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
>> +		fifo-depth = <0x100>;
>> +		resets = <&cru SRST_SDMMC2>;
>> +		reset-names = "reset";
>> +		status = "disabled";
>> +	};
>> +
>> +	sdmmc0: dwmmc@fe2b0000 {
>> +		compatible = "rockchip,rk3568-dw-mshc",
>> +			     "rockchip,rk3288-dw-mshc";
> one line
>
>> +		reg = <0x0 0xfe2b0000 0x0 0x4000>;
>> +		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
>> +		max-frequency = <150000000>;
> dito
>
>> +		clocks = <&cru HCLK_SDMMC0>, <&cru CLK_SDMMC0>,
>> +			 <&cru SCLK_SDMMC0_DRV>, <&cru SCLK_SDMMC0_SAMPLE>;
>> +		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
>> +		fifo-depth = <0x100>;
>> +		resets = <&cru SRST_SDMMC0>;
>> +		reset-names = "reset";
>> +		status = "disabled";
>> +	};
>> +
>> +	sdmmc1: dwmmc@fe2c0000 {
>> +		compatible = "rockchip,rk3568-dw-mshc",
>> +			     "rockchip,rk3288-dw-mshc";
> one line
>
>> +		reg = <0x0 0xfe2c0000 0x0 0x4000>;
>> +		interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
>> +		max-frequency = <150000000>;
> dito
>
>> +		clocks = <&cru HCLK_SDMMC1>, <&cru CLK_SDMMC1>,
>> +			 <&cru SCLK_SDMMC1_DRV>, <&cru SCLK_SDMMC1_SAMPLE>;
>> +		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
>> +		fifo-depth = <0x100>;
>> +		resets = <&cru SRST_SDMMC1>;
>> +		reset-names = "reset";
>> +		status = "disabled";
>> +	};
>> +
>> +	sdhci: sdhci@fe310000 {
>> +		compatible = "rockchip,rk3568-dwcmshc", "snps,dwcmshc-sdhci";
> compatible = "rockchip,rk3568-dwcmshc";
>
> See snps,dwcmshc-sdhci.yaml
>
>> +		reg = <0x0 0xfe310000 0x0 0x10000>;
>> +		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
>> +		assigned-clocks = <&cru BCLK_EMMC>, <&cru TCLK_EMMC>;
>> +		assigned-clock-rates = <200000000>, <24000000>;
>> +		clocks = <&cru CCLK_EMMC>, <&cru HCLK_EMMC>,
>> +			 <&cru ACLK_EMMC>, <&cru BCLK_EMMC>,
>> +			 <&cru TCLK_EMMC>;
>> +		clock-names = "core", "bus", "axi", "block", "timer";
>> +		status = "disabled";
>> +	};
>> +
>> +	dmac0: dmac@fe530000 {
>> +		compatible = "arm,pl330", "arm,primecell";
>> +		reg = <0x0 0xfe530000 0x0 0x4000>;
>> +		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
>> +		clocks = <&cru ACLK_BUS>;
>> +		clock-names = "apb_pclk";
>> +		#dma-cells = <1>;
>> +		arm,pl330-periph-burst;
>> +	};
>> +
>> +	dmac1: dmac@fe550000 {
>> +		compatible = "arm,pl330", "arm,primecell";
>> +		reg = <0x0 0xfe550000 0x0 0x4000>;
>> +		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
>> +		clocks = <&cru ACLK_BUS>;
>> +		clock-names = "apb_pclk";
>> +		#dma-cells = <1>;
>> +		arm,pl330-periph-burst;
>> +	};
>> +
>> +	i2c1: i2c@fe5a0000 {
>> +		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
>> +		reg = <0x0 0xfe5a0000 0x0 0x1000>;
>> +		clocks = <&cru CLK_I2C1>, <&cru PCLK_I2C1>;
>> +		clock-names = "i2c", "pclk";
>> +		interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> interrupts below reg for all i2c nodes
>
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&i2c1_xfer>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		status = "disabled";
>> +	};
>> +
>> +	i2c2: i2c@fe5b0000 {
>> +		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
>> +		reg = <0x0 0xfe5b0000 0x0 0x1000>;
>> +		clocks = <&cru CLK_I2C2>, <&cru PCLK_I2C2>;
>> +		clock-names = "i2c", "pclk";
>> +		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> dito
>
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&i2c2m0_xfer>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		status = "disabled";
>> +	};
>> +
>> +	i2c3: i2c@fe5c0000 {
>> +		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
>> +		reg = <0x0 0xfe5c0000 0x0 0x1000>;
>> +		clocks = <&cru CLK_I2C3>, <&cru PCLK_I2C3>;
>> +		clock-names = "i2c", "pclk";
>> +		interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> dito
>
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&i2c3m0_xfer>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		status = "disabled";
>> +	};
>> +
>> +	i2c4: i2c@fe5d0000 {
>> +		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
>> +		reg = <0x0 0xfe5d0000 0x0 0x1000>;
>> +		clocks = <&cru CLK_I2C4>, <&cru PCLK_I2C4>;
>> +		clock-names = "i2c", "pclk";
>> +		interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> dito
>
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&i2c4m0_xfer>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		status = "disabled";
>> +	};
>> +
>> +	i2c5: i2c@fe5e0000 {
>> +		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
>> +		reg = <0x0 0xfe5e0000 0x0 0x1000>;
>> +		clocks = <&cru CLK_I2C5>, <&cru PCLK_I2C5>;
>> +		clock-names = "i2c", "pclk";
>> +		interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> dito
>
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&i2c5m0_xfer>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		status = "disabled";
>> +	};
>> +
>> +	wdt: watchdog@fe600000 {
>> +		compatible = "snps,dw-wdt";
> "rockchip,rk3568-wdt", "snps,dw-wdt"
>
>> +		reg = <0x0 0xfe600000 0x0 0x100>;
>> +		clocks = <&cru TCLK_WDT_NS>, <&cru PCLK_WDT_NS>;
>> +		clock-names = "tclk", "pclk";
>> +		interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
>> +		status = "okay";
> remove
>
>> +	};
>> +
>> +	uart1: serial@fe650000 {
>> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
>> +		reg = <0x0 0xfe650000 0x0 0x100>;
>> +		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
>> +		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
>> +		clock-names = "baudclk", "apb_pclk";
>> +		reg-shift = <2>;
>> +		reg-io-width = <4>;
>> +		dmas = <&dmac0 2>, <&dmac0 3>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&uart1m0_xfer>;
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	uart2: serial@fe660000 {
>> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
>> +		reg = <0x0 0xfe660000 0x0 0x100>;
>> +		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
>> +		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
>> +		clock-names = "baudclk", "apb_pclk";
>> +		reg-shift = <2>;
>> +		reg-io-width = <4>;
>> +		dmas = <&dmac0 4>, <&dmac0 5>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&uart2m0_xfer>;
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	uart3: serial@fe670000 {
>> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
>> +		reg = <0x0 0xfe670000 0x0 0x100>;
>> +		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
>> +		clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
>> +		clock-names = "baudclk", "apb_pclk";
>> +		reg-shift = <2>;
>> +		reg-io-width = <4>;
>> +		dmas = <&dmac0 6>, <&dmac0 7>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&uart3m0_xfer>;
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	uart4: serial@fe680000 {
>> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
>> +		reg = <0x0 0xfe680000 0x0 0x100>;
>> +		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
>> +		clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
>> +		clock-names = "baudclk", "apb_pclk";
>> +		reg-shift = <2>;
>> +		reg-io-width = <4>;
>> +		dmas = <&dmac0 8>, <&dmac0 9>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&uart4m0_xfer>;
>> +		status = "disabled";
>> +	};
>> +
>> +	uart5: serial@fe690000 {
>> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
>> +		reg = <0x0 0xfe690000 0x0 0x100>;
>> +		interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
>> +		clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
>> +		clock-names = "baudclk", "apb_pclk";
>> +		reg-shift = <2>;
>> +		reg-io-width = <4>;
>> +		dmas = <&dmac0 10>, <&dmac0 11>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&uart5m0_xfer>;
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	uart6: serial@fe6a0000 {
>> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
>> +		reg = <0x0 0xfe6a0000 0x0 0x100>;
>> +		interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
>> +		clocks = <&cru SCLK_UART6>, <&cru PCLK_UART6>;
>> +		clock-names = "baudclk", "apb_pclk";
>> +		reg-shift = <2>;
>> +		reg-io-width = <4>;
>> +		dmas = <&dmac0 12>, <&dmac0 13>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&uart6m0_xfer>;
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	uart7: serial@fe6b0000 {
>> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
>> +		reg = <0x0 0xfe6b0000 0x0 0x100>;
>> +		interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
>> +		clocks = <&cru SCLK_UART7>, <&cru PCLK_UART7>;
>> +		clock-names = "baudclk", "apb_pclk";
>> +		reg-shift = <2>;
>> +		reg-io-width = <4>;
>> +		dmas = <&dmac0 14>, <&dmac0 15>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&uart7m0_xfer>;
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	uart8: serial@fe6c0000 {
>> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
>> +		reg = <0x0 0xfe6c0000 0x0 0x100>;
>> +		interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
>> +		clocks = <&cru SCLK_UART8>, <&cru PCLK_UART8>;
>> +		clock-names = "baudclk", "apb_pclk";
>> +		reg-shift = <2>;
>> +		reg-io-width = <4>;
>> +		dmas = <&dmac0 16>, <&dmac0 17>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&uart8m0_xfer>;
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	uart9: serial@fe6d0000 {
>> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
>> +		reg = <0x0 0xfe6d0000 0x0 0x100>;
>> +		interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
>> +		clocks = <&cru SCLK_UART9>, <&cru PCLK_UART9>;
>> +		clock-names = "baudclk", "apb_pclk";
>> +		reg-shift = <2>;
>> +		reg-io-width = <4>;
>> +		dmas = <&dmac0 18>, <&dmac0 19>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&uart9m0_xfer>;
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	pwm4: pwm@fe6e0000 {
>> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
>> +		reg = <0x0 0xfe6e0000 0x0 0x10>;
>> +		#pwm-cells = <3>;
>> +		pinctrl-names = "active";
>> +		pinctrl-0 = <&pwm4_pins>;
>> +		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
>> +		clock-names = "pwm", "pclk";
> sort
> move things with "#" below as possible
>
>> +		status = "disabled";
>> +	};
>> +
>> +	pwm5: pwm@fe6e0010 {
>> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
>> +		reg = <0x0 0xfe6e0010 0x0 0x10>;
>> +		#pwm-cells = <3>;
>> +		pinctrl-names = "active";
>> +		pinctrl-0 = <&pwm5_pins>;
>> +		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
>> +		clock-names = "pwm", "pclk";
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	pwm6: pwm@fe6e0020 {
>> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
>> +		reg = <0x0 0xfe6e0020 0x0 0x10>;
>> +		#pwm-cells = <3>;
>> +		pinctrl-names = "active";
>> +		pinctrl-0 = <&pwm6_pins>;
>> +		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
>> +		clock-names = "pwm", "pclk";
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	pwm7: pwm@fe6e0030 {
>> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
>> +		reg = <0x0 0xfe6e0030 0x0 0x10>;
>> +		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
> Remove.
> Mainline has no interrupt support.
>
>> +		#pwm-cells = <3>;
>> +		pinctrl-names = "active";
>> +		pinctrl-0 = <&pwm7_pins>;
>> +		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
>> +		clock-names = "pwm", "pclk";
>> +		status = "disabled";
>> +	};
>> +
>> +	pwm8: pwm@fe6f0000 {
>> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
>> +		reg = <0x0 0xfe6f0000 0x0 0x10>;
>> +		#pwm-cells = <3>;
>> +		pinctrl-names = "active";
>> +		pinctrl-0 = <&pwm8m0_pins>;
>> +		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
>> +		clock-names = "pwm", "pclk";
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	pwm9: pwm@fe6f0010 {
>> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
>> +		reg = <0x0 0xfe6f0010 0x0 0x10>;
>> +		#pwm-cells = <3>;
>> +		pinctrl-names = "active";
>> +		pinctrl-0 = <&pwm9m0_pins>;
>> +		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
>> +		clock-names = "pwm", "pclk";
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	pwm10: pwm@fe6f0020 {
>> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
>> +		reg = <0x0 0xfe6f0020 0x0 0x10>;
>> +		#pwm-cells = <3>;
>> +		pinctrl-names = "active";
>> +		pinctrl-0 = <&pwm10m0_pins>;
>> +		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
>> +		clock-names = "pwm", "pclk";
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	pwm11: pwm@fe6f0030 {
>> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
>> +		reg = <0x0 0xfe6f0030 0x0 0x10>;
>> +		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
> remove
>
>> +		#pwm-cells = <3>;
>> +		pinctrl-names = "active";
>> +		pinctrl-0 = <&pwm11m0_pins>;
>> +		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
>> +		clock-names = "pwm", "pclk";
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	pwm12: pwm@fe700000 {
>> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
>> +		reg = <0x0 0xfe700000 0x0 0x10>;
>> +		#pwm-cells = <3>;
>> +		pinctrl-names = "active";
>> +		pinctrl-0 = <&pwm12m0_pins>;
>> +		clocks = <&cru CLK_PWM3>, <&cru PCLK_PWM3>;
>> +		clock-names = "pwm", "pclk";
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	pwm13: pwm@fe700010 {
>> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
>> +		reg = <0x0 0xfe700010 0x0 0x10>;
>> +		#pwm-cells = <3>;
>> +		pinctrl-names = "active";
>> +		pinctrl-0 = <&pwm13m0_pins>;
>> +		clocks = <&cru CLK_PWM3>, <&cru PCLK_PWM3>;
>> +		clock-names = "pwm", "pclk";
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	pwm14: pwm@fe700020 {
>> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
>> +		reg = <0x0 0xfe700020 0x0 0x10>;
>> +		#pwm-cells = <3>;
>> +		pinctrl-names = "active";
>> +		pinctrl-0 = <&pwm14m0_pins>;
>> +		clocks = <&cru CLK_PWM3>, <&cru PCLK_PWM3>;
>> +		clock-names = "pwm", "pclk";
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	pwm15: pwm@fe700030 {
>> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
>> +		reg = <0x0 0xfe700030 0x0 0x10>;
>> +		interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> remove
>
>> +		#pwm-cells = <3>;
>> +		pinctrl-names = "active";
>> +		pinctrl-0 = <&pwm15m0_pins>;
>> +		clocks = <&cru CLK_PWM3>, <&cru PCLK_PWM3>;
>> +		clock-names = "pwm", "pclk";
> sort
>
>> +		status = "disabled";
>> +	};
>> +
>> +	pinctrl: pinctrl {
>> +		compatible = "rockchip,rk3568-pinctrl";
>> +		rockchip,grf = <&grf>;
>> +		rockchip,pmu = <&pmugrf>;
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		gpio0: gpio0@fdd60000 {
> gpio@...
>
> Use generic nodenames see comment by rob+dt on the "rockchip,gpio-bank"
> YAML document.
> This is however not supported by mainline driver yet.
> They are working on that hopefully...
>
>> +			compatible = "rockchip,gpio-bank";
>> +			reg = <0x0 0xfdd60000 0x0 0x100>;
>> +			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&pmucru PCLK_GPIO0>, <&pmucru DBCLK_GPIO0>;
>> +
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +
>> +		gpio1: gpio1@fe740000 {
> dito
>
>> +			compatible = "rockchip,gpio-bank";
>> +			reg = <0x0 0xfe740000 0x0 0x100>;
>> +			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;
>> +
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +
>> +		gpio2: gpio2@fe750000 {
> dito
>
>> +			compatible = "rockchip,gpio-bank";
>> +			reg = <0x0 0xfe750000 0x0 0x100>;
>> +			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&cru PCLK_GPIO2>, <&cru DBCLK_GPIO2>;
>> +
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +
>> +		gpio3: gpio3@fe760000 {
> dito
>
>> +			compatible = "rockchip,gpio-bank";
>> +			reg = <0x0 0xfe760000 0x0 0x100>;
>> +			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&cru PCLK_GPIO3>, <&cru DBCLK_GPIO3>;
>> +
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +
>> +		gpio4: gpio4@fe770000 {
> dito
>
>> +			compatible = "rockchip,gpio-bank";
>> +			reg = <0x0 0xfe770000 0x0 0x100>;
>> +			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&cru PCLK_GPIO4>, <&cru DBCLK_GPIO4>;
>> +
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +	};
>> +};
>> +
>> +#include "rk3568-pinctrl.dtsi"
>> diff --git a/arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi b/arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi
>> new file mode 100644
>> index 000000000000..0c292ef8a87a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi
>> @@ -0,0 +1,346 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
>> + */
>> +
>> +&pinctrl {
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_up: pcfg-pull-up {
>> +		bias-pull-up;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_down: pcfg-pull-down {
>> +		bias-pull-down;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_none: pcfg-pull-none {
>> +		bias-disable;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_none_drv_level_0: pcfg-pull-none-drv-level-0 {
>> +		bias-disable;
>> +		drive-strength = <0>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_none_drv_level_1: pcfg-pull-none-drv-level-1 {
>> +		bias-disable;
>> +		drive-strength = <1>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_none_drv_level_2: pcfg-pull-none-drv-level-2 {
>> +		bias-disable;
>> +		drive-strength = <2>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_none_drv_level_3: pcfg-pull-none-drv-level-3 {
>> +		bias-disable;
>> +		drive-strength = <3>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_none_drv_level_4: pcfg-pull-none-drv-level-4 {
>> +		bias-disable;
>> +		drive-strength = <4>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_none_drv_level_5: pcfg-pull-none-drv-level-5 {
>> +		bias-disable;
>> +		drive-strength = <5>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_none_drv_level_6: pcfg-pull-none-drv-level-6 {
>> +		bias-disable;
>> +		drive-strength = <6>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_none_drv_level_7: pcfg-pull-none-drv-level-7 {
>> +		bias-disable;
>> +		drive-strength = <7>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_none_drv_level_8: pcfg-pull-none-drv-level-8 {
>> +		bias-disable;
>> +		drive-strength = <8>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_none_drv_level_9: pcfg-pull-none-drv-level-9 {
>> +		bias-disable;
>> +		drive-strength = <9>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_none_drv_level_10: pcfg-pull-none-drv-level-10 {
>> +		bias-disable;
>> +		drive-strength = <10>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_none_drv_level_11: pcfg-pull-none-drv-level-11 {
>> +		bias-disable;
>> +		drive-strength = <11>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_none_drv_level_12: pcfg-pull-none-drv-level-12 {
>> +		bias-disable;
>> +		drive-strength = <12>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_none_drv_level_13: pcfg-pull-none-drv-level-13 {
>> +		bias-disable;
>> +		drive-strength = <13>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_none_drv_level_14: pcfg-pull-none-drv-level-14 {
>> +		bias-disable;
>> +		drive-strength = <14>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_none_drv_level_15: pcfg-pull-none-drv-level-15 {
>> +		bias-disable;
>> +		drive-strength = <15>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_up_drv_level_0: pcfg-pull-up-drv-level-0 {
>> +		bias-pull-up;
>> +		drive-strength = <0>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_up_drv_level_1: pcfg-pull-up-drv-level-1 {
>> +		bias-pull-up;
>> +		drive-strength = <1>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_up_drv_level_2: pcfg-pull-up-drv-level-2 {
>> +		bias-pull-up;
>> +		drive-strength = <2>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_up_drv_level_3: pcfg-pull-up-drv-level-3 {
>> +		bias-pull-up;
>> +		drive-strength = <3>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_up_drv_level_4: pcfg-pull-up-drv-level-4 {
>> +		bias-pull-up;
>> +		drive-strength = <4>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_up_drv_level_5: pcfg-pull-up-drv-level-5 {
>> +		bias-pull-up;
>> +		drive-strength = <5>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_up_drv_level_6: pcfg-pull-up-drv-level-6 {
>> +		bias-pull-up;
>> +		drive-strength = <6>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_up_drv_level_7: pcfg-pull-up-drv-level-7 {
>> +		bias-pull-up;
>> +		drive-strength = <7>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_up_drv_level_8: pcfg-pull-up-drv-level-8 {
>> +		bias-pull-up;
>> +		drive-strength = <8>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_up_drv_level_9: pcfg-pull-up-drv-level-9 {
>> +		bias-pull-up;
>> +		drive-strength = <9>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_up_drv_level_10: pcfg-pull-up-drv-level-10 {
>> +		bias-pull-up;
>> +		drive-strength = <10>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_up_drv_level_11: pcfg-pull-up-drv-level-11 {
>> +		bias-pull-up;
>> +		drive-strength = <11>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_up_drv_level_12: pcfg-pull-up-drv-level-12 {
>> +		bias-pull-up;
>> +		drive-strength = <12>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_up_drv_level_13: pcfg-pull-up-drv-level-13 {
>> +		bias-pull-up;
>> +		drive-strength = <13>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_up_drv_level_14: pcfg-pull-up-drv-level-14 {
>> +		bias-pull-up;
>> +		drive-strength = <14>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_up_drv_level_15: pcfg-pull-up-drv-level-15 {
>> +		bias-pull-up;
>> +		drive-strength = <15>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_down_drv_level_0: pcfg-pull-down-drv-level-0 {
>> +		bias-pull-down;
>> +		drive-strength = <0>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_down_drv_level_1: pcfg-pull-down-drv-level-1 {
>> +		bias-pull-down;
>> +		drive-strength = <1>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_down_drv_level_2: pcfg-pull-down-drv-level-2 {
>> +		bias-pull-down;
>> +		drive-strength = <2>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_down_drv_level_3: pcfg-pull-down-drv-level-3 {
>> +		bias-pull-down;
>> +		drive-strength = <3>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_down_drv_level_4: pcfg-pull-down-drv-level-4 {
>> +		bias-pull-down;
>> +		drive-strength = <4>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_down_drv_level_5: pcfg-pull-down-drv-level-5 {
>> +		bias-pull-down;
>> +		drive-strength = <5>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_down_drv_level_6: pcfg-pull-down-drv-level-6 {
>> +		bias-pull-down;
>> +		drive-strength = <6>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_down_drv_level_7: pcfg-pull-down-drv-level-7 {
>> +		bias-pull-down;
>> +		drive-strength = <7>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_down_drv_level_8: pcfg-pull-down-drv-level-8 {
>> +		bias-pull-down;
>> +		drive-strength = <8>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_down_drv_level_9: pcfg-pull-down-drv-level-9 {
>> +		bias-pull-down;
>> +		drive-strength = <9>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_down_drv_level_10: pcfg-pull-down-drv-level-10 {
>> +		bias-pull-down;
>> +		drive-strength = <10>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_down_drv_level_11: pcfg-pull-down-drv-level-11 {
>> +		bias-pull-down;
>> +		drive-strength = <11>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_down_drv_level_12: pcfg-pull-down-drv-level-12 {
>> +		bias-pull-down;
>> +		drive-strength = <12>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_down_drv_level_13: pcfg-pull-down-drv-level-13 {
>> +		bias-pull-down;
>> +		drive-strength = <13>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_down_drv_level_14: pcfg-pull-down-drv-level-14 {
>> +		bias-pull-down;
>> +		drive-strength = <14>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_down_drv_level_15: pcfg-pull-down-drv-level-15 {
>> +		bias-pull-down;
>> +		drive-strength = <15>;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_up_smt: pcfg-pull-up-smt {
>> +		bias-pull-up;
>> +		input-schmitt-enable;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_down_smt: pcfg-pull-down-smt {
>> +		bias-pull-down;
>> +		input-schmitt-enable;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_none_smt: pcfg-pull-none-smt {
>> +		bias-disable;
>> +		input-schmitt-enable;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_pull_none_drv_level_0_smt: pcfg-pull-none-drv-level-0-smt {
>> +		bias-disable;
>> +		drive-strength = <0>;
>> +		input-schmitt-enable;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_output_high: pcfg-output-high {
>> +		output-high;
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	pcfg_output_low: pcfg-output-low {
>> +		output-low;
>> +	};
>> +};
>> +
>>
>
>
>


