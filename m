Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF33C117DEB
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2019 03:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbfLJCqL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Dec 2019 21:46:11 -0500
Received: from mail-sz.amlogic.com ([211.162.65.117]:48644 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbfLJCqL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Dec 2019 21:46:11 -0500
Received: from [10.28.39.99] (10.28.39.99) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 10 Dec
 2019 10:46:42 +0800
Subject: Re: [PATCH] arm64: dts: meson-a1: add I2C nodes
To:     Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
CC:     Rob Herring <robh@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        <linux-amlogic@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20191202111253.94872-1-jian.hu@amlogic.com>
 <7hsgltqfdx.fsf@baylibre.com>
From:   Jian Hu <jian.hu@amlogic.com>
Message-ID: <e90e00e1-c868-ce09-6f79-deb62da72b43@amlogic.com>
Date:   Tue, 10 Dec 2019 10:46:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7hsgltqfdx.fsf@baylibre.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.28.39.99]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Kevin

Thanks for your review

On 2019/12/10 6:54, Kevin Hilman wrote:
> Hi Jian,
> 
> Jian Hu <jian.hu@amlogic.com> writes:
> 
>> There are four I2C controllers in A1 series,
>> Share the same comptible with AXG.The I2C nodes
>> depend on pinmux and clock controller.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 149 ++++++++++++++++++++++
>>   1 file changed, 149 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> index eab2ecd36aa8..d0a73d953f5e 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> @@ -16,6 +16,13 @@
>>   	#address-cells = <2>;
>>   	#size-cells = <2>;
>>   
>> +	aliases {
>> +		i2c0 = &i2c0;
>> +		i2c1 = &i2c1;
>> +		i2c2 = &i2c2;
>> +		i2c3 = &i2c3;
>> +	};
>> +
>>   	cpus {
>>   		#address-cells = <2>;
>>   		#size-cells = <0>;
>> @@ -117,6 +124,46 @@
>>   				};
>>   			};
>>   
>> +			i2c0: i2c@1400 {
>> +				compatible = "amlogic,meson-axg-i2c";
>> +				reg = <0x0 0x1400 0x0 0x24>;
> 
> The AXG DT files use 0x20 for the length.  You are using 0x24.  I don't
> see any additional registers added to the driver, so this doesn't look right.
In fact, For G12 series and A1, the length should be 0x24. A new 
register is added, And it is for IRQ handler timeout. If the 
transmission is exceeding a limited time, it will abort the 
transmission.Now the function is not used, There is completion to deal 
the timeout in the driver. I will set the length 0x20 becouse of the new 
register is not used.
> 
>> +				interrupts = <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +				clocks = <&clkc_periphs CLKID_I2C_M_A>;
>> +				status = "disabled";
>> +			};
>> +
>> +			i2c1: i2c@5c00 {
>> +				compatible = "amlogic,meson-axg-i2c";
>> +				reg = <0x0 0x5c00 0x0 0x24>;
>> +				interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +				clocks = <&clkc_periphs CLKID_I2C_M_B>;
>> +				status = "disabled";
>> +			};
>> +
>> +			i2c2: i2c@6800 {
>> +				compatible = "amlogic,meson-axg-i2c";
>> +				reg = <0x0 0x6800 0x0 0x24>;
>> +				interrupts = <GIC_SPI 76 IRQ_TYPE_EDGE_RISING>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +				clocks = <&clkc_periphs CLKID_I2C_M_C>;
>> +				status = "disabled";
>> +			};
>> +
>> +			i2c3: i2c@6c00 {
>> +				compatible = "amlogic,meson-axg-i2c";
>> +				reg = <0x0 0x6c00 0x0 0x24>;
>> +				interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +				clocks = <&clkc_periphs CLKID_I2C_M_D>;
>> +				status = "disabled";
>> +			};
>> +
>>   			uart_AO: serial@1c00 {
>>   				compatible = "amlogic,meson-gx-uart",
>>   					     "amlogic,meson-ao-uart";
>> @@ -171,3 +218,105 @@
>>   		#clock-cells = <0>;
>>   	};
>>   };
>> +
>> +&periphs_pinctrl {
>> +	i2c0_f11_pins:i2c0-f11 {
>> +		mux {
>> +			groups = "i2c0_sck_f11",
>> +				"i2c0_sda_f12";
>> +			function = "i2c0";
>> +			bias-pull-up;
>> +			drive-strength-microamp = <3000>;
> 
> Can you also add some comment to the changelog about the need for
> drive-strength compared to AXG.
OK, Drive strength function is added for GPIO pins from G12 series.
So does A1 series.
> 
>> +		};
>> +	};
> 
> Kevin
> 
> .
> 
