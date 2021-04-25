Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 195EC36A60B
	for <lists+linux-i2c@lfdr.de>; Sun, 25 Apr 2021 11:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbhDYJYm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 25 Apr 2021 05:24:42 -0400
Received: from regular1.263xmail.com ([211.150.70.199]:60256 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbhDYJYm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 25 Apr 2021 05:24:42 -0400
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Sun, 25 Apr 2021 05:24:41 EDT
Received: from localhost (unknown [192.168.167.70])
        by regular1.263xmail.com (Postfix) with ESMTP id 0E2FB1175;
        Sun, 25 Apr 2021 17:16:54 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.151] (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P26234T140422479345408S1619342210060169_;
        Sun, 25 Apr 2021 17:16:51 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <1eed35af59979b8940d3107cc52244b9>
X-RL-SENDER: cl@rock-chips.com
X-SENDER: cl@rock-chips.com
X-LOGIN-NAME: cl@rock-chips.com
X-FST-TO: huangtao@rock-chips.com
X-RCPT-COUNT: 26
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Cc:     cl@rock-chips.com, heiko@sntech.de, robh+dt@kernel.org,
        jagan@amarulasolutions.com, wens@csie.org, uwe@kleine-koenig.org,
        mail@david-bauer.net, jbx6244@gmail.com,
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
To:     Marc Zyngier <maz@kernel.org>
References: <20210421065921.23917-1-cl@rock-chips.com>
 <20210421065921.23917-5-cl@rock-chips.com> <87zgxrpxo5.wl-maz@kernel.org>
From:   =?UTF-8?B?6ZmI5Lqu?= <cl@rock-chips.com>
Message-ID: <ec556a6c-e950-d152-c878-986e2616ddcd@rock-chips.com>
Date:   Sun, 25 Apr 2021 17:16:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87zgxrpxo5.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Marc，

     Thanks for reply.

     See below.

在 2021/4/21 下午9:36, Marc Zyngier 写道:
> On Wed, 21 Apr 2021 07:59:20 +0100,
> <cl@rock-chips.com> wrote:
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
> [...]
>
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
> This doesn't match the GICv3 binding for PPIs.
fixed in V2.
>
>> +		arm,no-tick-in-suspend;
> Oh, really? :-(
yes, arm arch timer will stop in suspend mode on rk3568.
>
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
> Please add the 'mbi-alias' property, which should map onto the GICA
> range that GIC600 provides. At least this could be useful to have MSIs
> despite the lack of a working ITS. We can work out the usable ranges
> on a per-board basis.

Thanks, we will try mbi-alias later, but we are afraid that the number 
of SPI is not enough.


>
> Thanks,
>
> 	M.
>


