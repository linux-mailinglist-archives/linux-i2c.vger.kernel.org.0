Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0431336B073
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Apr 2021 11:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232648AbhDZJWh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Apr 2021 05:22:37 -0400
Received: from regular1.263xmail.com ([211.150.70.205]:59360 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbhDZJWg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Apr 2021 05:22:36 -0400
Received: from localhost (unknown [192.168.167.235])
        by regular1.263xmail.com (Postfix) with ESMTP id 6A2857D3;
        Mon, 26 Apr 2021 17:21:37 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.151] (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P2752T140649347385088S1619428893484164_;
        Mon, 26 Apr 2021 17:21:35 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <0b6518d01a4b44141c73aba3d00c4597>
X-RL-SENDER: cl@rock-chips.com
X-SENDER: cl@rock-chips.com
X-LOGIN-NAME: cl@rock-chips.com
X-FST-TO: linux-watchdog@vger.kernel.org
X-RCPT-COUNT: 30
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
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        wim@linux-watchdog.org, linux@roeck-us.net, jamie@jamieiles.com,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: rockchip: add core dtsi for RK3568 SoC
To:     Marc Zyngier <maz@kernel.org>
References: <20210425094216.25724-1-cl@rock-chips.com>
 <20210425094439.25895-1-cl@rock-chips.com> <87mttmslni.wl-maz@kernel.org>
From:   =?UTF-8?B?6ZmI5Lqu?= <cl@rock-chips.com>
Message-ID: <ee4172da-13a4-2a94-446f-cfdd937574c3@rock-chips.com>
Date:   Mon, 26 Apr 2021 17:21:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87mttmslni.wl-maz@kernel.org>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Marc,

ÔÚ 2021/4/25 ÏÂÎç6:28, Marc Zyngier Ð´µÀ:
> As I reviewed a previous version of this series, please have the
> courtesy of cc'ing me on further revisions of this series.
I am really sorry, i will add you to the cc list on further revisions.
>
> On Sun, 25 Apr 2021 10:44:39 +0100,
> <cl@rock-chips.com> wrote:
>> From: Liang Chen <cl@rock-chips.com>
>>
>> RK3568 is a high-performance and low power quad-core application processor
>> designed for personal mobile internet device and AIoT equipments. This patch
>> add basic core dtsi file for it.
>>
>> We use scmi_clk for cortex-a55 instead of standard ARMCLK, so that
>> kernel/uboot/rtos can change cpu clk with the same code in ATF, and we will
>> enalbe a special high-performacne PLL when high frequency is required. The
>> smci_clk code is in ATF, and clkid for cpu is 0, as below:
>>
>>      cpu0: cpu@0 {
>>          device_type = "cpu";
>>          compatible = "arm,cortex-a55";
>>          reg = <0x0 0x0>;
>>          clocks = <&scmi_clk 0>;
>>      };
>>
>> Signed-off-by: Liang Chen <cl@rock-chips.com>
>> ---
>>   .../boot/dts/rockchip/rk3568-pinctrl.dtsi     | 3119 +++++++++++++++++
>>   arch/arm64/boot/dts/rockchip/rk3568.dtsi      |  812 +++++
>>   2 files changed, 3931 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3568.dtsi
> [...]
>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
>> new file mode 100644
>> index 000000000000..66cb50218ca1
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
>> @@ -0,0 +1,812 @@
> [...]
>
>> +	timer {
>> +		compatible = "arm,armv8-timer";
>> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
>> +		arm,no-tick-in-suspend;
> My questions on this property still stand [1].

Yes, rk3568 will lose the system counter in suspend mode, we must 
retrieve system time from RTC.

rk3588 will fix this issue.

>
>> +	};
>> +
>> +	xin24m: xin24m {
>> +		compatible = "fixed-clock";
>> +		clock-frequency = <24000000>;
>> +		clock-output-names = "xin24m";
>> +		#clock-cells = <0>;
>> +	};
>> +
>> +	xin32k: xin32k {
>> +		compatible = "fixed-clock";
>> +		clock-frequency = <32768>;
>> +		clock-output-names = "xin32k";
>> +		pinctrl-0 = <&clk32k_out0>;
>> +		pinctrl-names = "default";
>> +		#clock-cells = <0>;
>> +	};
>> +
>> +	gic: interrupt-controller@fd400000 {
>> +		compatible = "arm,gic-v3";
>> +		reg = <0x0 0xfd400000 0 0x10000>, /* GICD */
>> +		      <0x0 0xfd460000 0 0xc0000>; /* GICR */
>> +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupt-controller;
>> +		#interrupt-cells = <3>;
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
> My request for a full description of the GICA region still stands [1].
Thanks, i will test MSIs with "mbi-alias", then add relative property in 
the next version.
>
> Thanks,
>
> 	M.
>
> [1] https://lore.kernel.org/r/87o8e2sm1u.wl-maz@kernel.org
>


