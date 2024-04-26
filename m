Return-Path: <linux-i2c+bounces-3216-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 073D68B3844
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 15:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ACE91F22791
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 13:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2A8147C6C;
	Fri, 26 Apr 2024 13:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="e1NpjMIX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ADE1474BC;
	Fri, 26 Apr 2024 13:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714137792; cv=none; b=OR6ATYIlMFYNeEFWZ1eP+KoI6xXLRBqE9/L53T6taS47Oj6mt4IimZtH0f3Aui6jLvxM4yIs0K4g9xUAP3rQanoUJrn0nZfQ2pDwrpLuN1GP3m7c+zuwF837p/fUMHrTuAMi48X75iQKOJK77YINvaGhEO0GZla3h6HrBDElPT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714137792; c=relaxed/simple;
	bh=s5rjh2pkj4coWMASwLmnQkHDOqv7JQtCljSF9r/i0dc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Zk/kdfHmIuUgWZt3Tnk6CLBZrIEZUD6Bzc+OH7K8Pv6cIUKtyjCRXASKo8twi8OkSUVqvWOyoJqIe9/umD35GON7EfFH4n8DS3RClLOhzx3pe8icwuJFX7KNX+AojWJaJYlo6qNWRq+4p+w2E+FvaXJWNZ35On+cGm9Me2srd9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=e1NpjMIX; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43QD4OkI021284;
	Fri, 26 Apr 2024 13:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=5sPoxtulQ7cFa0vgq7qqWjU5XaiBnaPCViXmi0y4pFs=;
 b=e1NpjMIXGH4nNJU1Xi6PnEs7Lp7vblsGhT2gw2Kik2zYLo9kPoBFFWZaJQic3uiAtlKy
 JfGy8kkDx3Mr5RUo5Sf5rZX2SX8NzZtqqbIVBitAGCVW8cx1HuyIzVuuLnGQqStpTSgU
 nE6wTSg/YVJotjGCt4K22BnsBrJVDQE2hP48YmxgtxE9YpG3QQn6GL7+TPf1zgmtm7q4
 fLqTXej3A/hAFFXzxCn9An1AV2av1TSCRf4ke85/oijJPqhh8TOvjyUM6S/FVlfwzrcS
 Cu4uQkzjUQg8WW/97Guo8L3DFV1M2rSWosl9ztzSiBrw7gvN155mnDFEztrNP8FdrVKQ Gw== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xrctg817j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 13:22:49 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43QBGxuU028315;
	Fri, 26 Apr 2024 13:22:48 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xmtr2ye9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 13:22:48 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43QDMjnf37028298
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Apr 2024 13:22:47 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 978D558059;
	Fri, 26 Apr 2024 13:22:45 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49AC358043;
	Fri, 26 Apr 2024 13:22:45 +0000 (GMT)
Received: from [9.61.156.17] (unknown [9.61.156.17])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Apr 2024 13:22:45 +0000 (GMT)
Message-ID: <1d236c82-f335-43ad-878d-20a1cafccf81@linux.ibm.com>
Date: Fri, 26 Apr 2024 08:22:45 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/14] ARM: dts: aspeed: Add IBM P11 Blueridge BMC
 system
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-14-eajames@linux.ibm.com>
 <b6c54d2e-9906-4607-bc19-e0de077c25b9@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <b6c54d2e-9906-4607-bc19-e0de077c25b9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: huckSBBMeBLdF50cFa6Degttx0zdQ3Qp
X-Proofpoint-GUID: huckSBBMeBLdF50cFa6Degttx0zdQ3Qp
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2404260089


On 4/26/24 01:35, Krzysztof Kozlowski wrote:
> On 25/04/2024 23:37, Eddie James wrote:
>> Add the device tree for the new BMC system. The Blueridge is a
>> P11 system with four processors.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   .../dts/aspeed/aspeed-bmc-ibm-blueridge.dts   | 1711 +++++++++++++++++
>>   1 file changed, 1711 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts
>>
>> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts
>> new file mode 100644
>> index 000000000000..8503ce2480b5
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts
>> @@ -0,0 +1,1711 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +// Copyright 2024 IBM Corp.
>> +/dts-v1/;
>> +
>> +#include "aspeed-g6.dtsi"
>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>> +#include <dt-bindings/i2c/i2c.h>
>> +#include <dt-bindings/leds/leds-pca955x.h>
>> +
>> +/ {
>> +	model = "Blueridge";
>> +	compatible = "ibm,blueridge-bmc", "aspeed,ast2600";
>> +
>> +	aliases {
>> +		serial4 = &uart5;
>> +		i2c16 = &i2c2mux0;
>> +		i2c17 = &i2c2mux1;
>> +		i2c18 = &i2c2mux2;
>> +		i2c19 = &i2c2mux3;
>> +		i2c20 = &i2c4mux0chn0;
>> +		i2c21 = &i2c4mux0chn1;
>> +		i2c22 = &i2c4mux0chn2;
>> +		i2c23 = &i2c5mux0chn0;
>> +		i2c24 = &i2c5mux0chn1;
>> +		i2c25 = &i2c6mux0chn0;
>> +		i2c26 = &i2c6mux0chn1;
>> +		i2c27 = &i2c6mux0chn2;
>> +		i2c28 = &i2c6mux0chn3;
>> +		i2c29 = &i2c11mux0chn0;
>> +		i2c30 = &i2c11mux0chn1;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = &uart5;
>> +		bootargs = "console=ttyS4,115200n8 earlycon";
> Drop bootargs. ALWAYS.
>
>
>> +	};
>> +
>> +	memory@80000000 {
>> +		device_type = "memory";
>> +		reg = <0x80000000 0x40000000>;
>> +	};
>> +
>> +	reserved-memory {
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges;
>> +
>> +		event_log: tcg_event_log@b3d00000 {
> No underscores.
>
> Didn't you already received such basic review?


Thanks for your detailed review Krzysztof. These device trees are based 
off 5 year old device trees that were merged when the rules were much 
less strict. I will attempt to address all of your comments for these 
new dts.


Thanks,

Eddie


>
>
>> +			no-map;
>> +			reg = <0xb3d00000 0x100000>;
>> +		};
>> +
>> +		ramoops@b3e00000 {
>> +			compatible = "ramoops";
>> +			reg = <0xb3e00000 0x200000>; /* 16 * (4 * 0x8000) */
>> +			record-size = <0x8000>;
>> +			console-size = <0x8000>;
>> +			ftrace-size = <0x8000>;
>> +			pmsg-size = <0x8000>;
>> +			max-reason = <3>; /* KMSG_DUMP_EMERG */
>> +		};
>> +
>> +		/* LPC FW cycle bridge region requires natural alignment */
>> +		flash_memory: region@b4000000 {
>> +			no-map;
>> +			reg = <0xb4000000 0x04000000>; /* 64M */
>> +		};
>> +
>> +		/* VGA region is dictated by hardware strapping */
>> +		vga_memory: region@bf000000 {
>> +			no-map;
>> +			compatible = "shared-dma-pool";
>> +			reg = <0xbf000000 0x01000000>;  /* 16M */
>> +		};
>> +	};
>> +
>> +	i2c2mux: i2cmux {
>> +		compatible = "i2c-mux-gpio";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		status = "okay";
> ??? Drop
>
>
>> +
>> +		i2c-parent = <&i2c2>;
>> +		mux-gpios = <&gpio0 ASPEED_GPIO(G, 4) GPIO_ACTIVE_HIGH>,
>> +			    <&gpio0 ASPEED_GPIO(G, 5) GPIO_ACTIVE_HIGH>;
>> +		idle-state = <0>;
>> +
>> +		i2c2mux0: i2c@0 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0>;
>> +		};
>> +
>> +		i2c2mux1: i2c@1 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <1>;
>> +		};
>> +
>> +		i2c2mux2: i2c@2 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <2>;
>> +		};
>> +
>> +		i2c2mux3: i2c@3 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <3>;
>> +		};
>> +	};
>> +
>> +	leds {
>> +		compatible = "gpio-leds";
>> +
>> +		/* BMC Card fault LED at the back */
>> +		led-bmc-ingraham0 {
>> +			gpios = <&gpio0 ASPEED_GPIO(H, 1) GPIO_ACTIVE_LOW>;
>> +		};
>> +
>> +		/* Enclosure ID LED at the back */
>> +		led-rear-enc-id0 {
>> +			gpios = <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
>> +		};
>> +
>> +		/* Enclosure fault LED at the back */
>> +		led-rear-enc-fault0 {
>> +			gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
>> +		};
>> +
>> +		/* PCIE slot power LED */
>> +		led-pcieslot-power {
>> +			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_LOW>;
>> +		};
>> +	};
>> +
>> +	gpio-keys-polled {
>> +		compatible = "gpio-keys-polled";
>> +		poll-interval = <1000>;
>> +
>> +		event-fan0-presence {
>> +			label = "fan0-presence";
>> +			gpios = <&pca0 6 GPIO_ACTIVE_LOW>;
>> +			linux,code = <6>;
>> +		};
>> +
>> +		event-fan1-presence {
>> +			label = "fan1-presence";
>> +			gpios = <&pca0 7 GPIO_ACTIVE_LOW>;
>> +			linux,code = <7>;
>> +		};
>> +
>> +		event-fan2-presence {
>> +			label = "fan2-presence";
>> +			gpios = <&pca0 8 GPIO_ACTIVE_LOW>;
>> +			linux,code = <8>;
>> +		};
>> +
>> +		event-fan3-presence {
>> +			label = "fan3-presence";
>> +			gpios = <&pca0 9 GPIO_ACTIVE_LOW>;
>> +			linux,code = <9>;
>> +		};
>> +
>> +		event-fan4-presence {
>> +			label = "fan4-presence";
>> +			gpios = <&pca0 10 GPIO_ACTIVE_LOW>;
>> +			linux,code = <10>;
>> +		};
>> +
>> +		event-fan5-presence {
>> +			label = "fan5-presence";
>> +			gpios = <&pca0 11 GPIO_ACTIVE_LOW>;
>> +			linux,code = <11>;
>> +		};
>> +	};
>> +
>> +	iio-hwmon {
>> +		compatible = "iio-hwmon";
>> +		io-channels = <&adc1 7>;
>> +	};
>> +};
>> +
>> +&adc1 {
>> +	status = "okay";
>> +	aspeed,int-vref-microvolt = <2500000>;
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
>> +		&pinctrl_adc10_default &pinctrl_adc11_default
>> +		&pinctrl_adc12_default &pinctrl_adc13_default
>> +		&pinctrl_adc14_default &pinctrl_adc15_default>;
>> +};
>> +
>> +&ehci1 {
>> +	status = "okay";
>> +};
>> +
>> +&uhci {
>> +	status = "okay";
>> +};
>> +
>> +&gpio0 {
>> +	gpio-line-names =
>> +	/*A0-A7*/	"","","","","","","","",
>> +	/*B0-B7*/	"","","","","","","checkstop","",
>> +	/*C0-C7*/	"","","","","","","","",
>> +	/*D0-D7*/	"","","","","","","","",
>> +	/*E0-E7*/	"","","","","","","","",
>> +	/*F0-F7*/	"","","rtc-battery-voltage-read-enable","reset-cause-pinhole","","","factory-reset-toggle","",
>> +	/*G0-G7*/	"","","","","","","","",
>> +	/*H0-H7*/	"","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
>> +	/*I0-I7*/	"","","","","","","bmc-secure-boot","",
>> +	/*J0-J7*/	"","","","","","","","",
>> +	/*K0-K7*/	"","","","","","","","",
>> +	/*L0-L7*/	"","","","","","","","",
>> +	/*M0-M7*/	"","","","","","","","",
>> +	/*N0-N7*/	"","","","","","","","",
>> +	/*O0-O7*/	"","","","usb-power","","","","",
>> +	/*P0-P7*/	"","","","","pcieslot-power","","","",
>> +	/*Q0-Q7*/	"cfam-reset","","regulator-standby-faulted","","","","","",
>> +	/*R0-R7*/	"bmc-tpm-reset","power-chassis-control","power-chassis-good","","","","","",
>> +	/*S0-S7*/	"presence-ps0","presence-ps1","presence-ps2","presence-ps3",
>> +	"power-ffs-sync-history","","","",
>> +	/*T0-T7*/	"","","","","","","","",
>> +	/*U0-U7*/	"","","","","","","","",
>> +	/*V0-V7*/	"","","","","","","","",
>> +	/*W0-W7*/	"","","","","","","","",
>> +	/*X0-X7*/	"","","","","","","","",
>> +	/*Y0-Y7*/	"","","","","","","","",
>> +	/*Z0-Z7*/	"","","","","","","","";
>> +
>> +	i2c3_mux_oe_n-hog {
>> +		gpio-hog;
>> +		gpios = <ASPEED_GPIO(G, 6) GPIO_ACTIVE_LOW>;
>> +		output-high;
>> +		line-name = "I2C3_MUX_OE_N";
>> +	};
>> +
>> +	usb_power-hog {
>> +		gpio-hog;
>> +		gpios = <ASPEED_GPIO(O, 3) GPIO_ACTIVE_LOW>;
>> +		output-high;
>> +	};
>> +};
>> +
>> +&emmc_controller {
>> +	status = "okay";
>> +};
>> +
>> +&pinctrl_emmc_default {
>> +	bias-disable;
>> +};
>> +
>> +&emmc {
>> +	status = "okay";
>> +	clk-phase-mmc-hs200 = <180>, <180>;
>> +};
>> +
>> +&ibt {
>> +	status = "okay";
>> +};
>> +
>> +&i2c0 {
>> +	status = "okay";
>> +
>> +	eeprom@51 {
>> +		compatible = "atmel,24c64";
>> +		reg = <0x51>;
>> +	};
>> +
>> +	tca_pres1: tca9554@20{
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>
> Also missing space before {
>
>
>> +		compatible = "ti,tca9554";
>> +		reg = <0x20>;
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +
>> +		gpio-line-names = "",
>> +			"RUSSEL_FW_I2C_ENABLE_N",
>> +			"RUSSEL_OPPANEL_PRESENCE_N",
>> +			"BLYTH_OPPANEL_PRESENCE_N",
>> +			"CPU_TPM_CARD_PRESENT_N",
>> +			"DASD_BP2_PRESENT_N",
>> +			"DASD_BP1_PRESENT_N",
>> +			"DASD_BP0_PRESENT_N";
>> +	};
>> +};
>> +
>> +&i2c1 {
>> +	status = "okay";
>> +};
>> +
>> +&i2c2 {
>> +	status = "okay";
>> +};
>> +
>> +&i2c3 {
>> +	status = "okay";
>> +
>> +	power-supply@68 {
>> +		compatible = "ibm,cffps";
>> +		reg = <0x68>;
>> +	};
>> +
>> +	power-supply@69 {
>> +		compatible = "ibm,cffps";
>> +		reg = <0x69>;
>> +	};
>> +
>> +	pca_pres1: pca9552@61 {
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>
>
>> +		compatible = "nxp,pca9552";
>> +		reg = <0x61>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +
>> +		gpio-line-names =
>> +			"SLOT0_PRSNT_EN_RSVD", "SLOT1_PRSNT_EN_RSVD",
>> +			"SLOT2_PRSNT_EN_RSVD", "SLOT3_PRSNT_EN_RSVD",
>> +			"SLOT4_PRSNT_EN_RSVD", "SLOT0_EXPANDER_PRSNT_N",
>> +			"SLOT1_EXPANDER_PRSNT_N", "SLOT2_EXPANDER_PRSNT_N",
>> +			"SLOT3_EXPANDER_PRSNT_N", "SLOT4_EXPANDER_PRSNT_N",
>> +			"", "", "", "", "", "";
>> +	};
>> +};
>> +
>> +&i2c4 {
>> +	status = "okay";
>> +
>> +	tmp275@48 {
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>
>
>
>> +		compatible = "ti,tmp275";
>> +		reg = <0x48>;
>> +	};
>> +
>> +	tmp275@49 {
> So it's everywhere...
>
>> +		compatible = "ti,tmp275";
>> +		reg = <0x49>;
>> +	};
>> +
>> +	tmp275@4a {
>> +		compatible = "ti,tmp275";
>> +		reg = <0x4a>;
>> +	};
>> +
>> +	i2c-mux@70 {
>> +		compatible = "nxp,pca9546";
>> +		reg = <0x70>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		status = "okay";
> Why? Drop
>
>> +		i2c-mux-idle-disconnect;
>> +
>> +		i2c4mux0chn0: i2c@0 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0>;
>> +
>> +			eeprom@50 {
>> +				compatible = "atmel,24c64";
>> +				reg = <0x50>;
>> +			};
>> +
>> +			pca9551@60 {
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>
>
>> +				compatible = "nxp,pca9551";
>> +				reg = <0x60>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				gpio-controller;
>> +				#gpio-cells = <2>;
>> +
>> +				led@0 {
>> +					label = "cablecard0-cxp-top";
>> +					reg = <0>;
>> +					retain-state-shutdown;
>> +					default-state = "keep";
>> +					type = <PCA955X_TYPE_LED>;
>> +				};
>> +
>> +				led@1 {
>> +					label = "cablecard0-cxp-bot";
>> +					reg = <1>;
>> +					retain-state-shutdown;
>> +					default-state = "keep";
>> +					type = <PCA955X_TYPE_LED>;
>> +				};
>> +			};
>> +		};
>> +
>> +		i2c4mux0chn1: i2c@1 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <1>;
> reg is after compatible, which means if there is no compatible, reg is
> always first. This applies you all your DTS patches. This patchset and
> future.
>
>
>> +
>> +			eeprom@51 {
>> +				compatible = "atmel,24c64";
>> +				reg = <0x51>;
>> +			};
>> +		};
>> +
>> +		i2c4mux0chn2: i2c@2 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <2>;
>> +
>> +			eeprom@52 {
>> +				compatible = "atmel,24c64";
>> +				reg = <0x52>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&i2c5 {
>> +	status = "okay";
>> +
>> +	tmp275@48 {
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>
>
>> +		compatible = "ti,tmp275";
>> +		reg = <0x48>;
>> +	};
>> +
>> +	tmp275@49 {
>> +		compatible = "ti,tmp275";
>> +		reg = <0x49>;
>> +	};
>> +
>> +	i2c-mux@70 {
>> +		compatible = "nxp,pca9546";
>> +		reg = <0x70>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		status = "okay";
> Drop
>
>
>> +		i2c-mux-idle-disconnect;
>> +
>> +		i2c5mux0chn0: i2c@0 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0>;
>> +
>> +			eeprom@50 {
>> +				compatible = "atmel,24c64";
>> +				reg = <0x50>;
>> +			};
>> +
>> +			pca9551@60 {
>> +				compatible = "nxp,pca9551";
>> +				reg = <0x60>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				gpio-controller;
>> +				#gpio-cells = <2>;
>> +
>> +				led@0 {
>> +					label = "cablecard3-cxp-top";
>> +					reg = <0>;
>> +					retain-state-shutdown;
>> +					default-state = "keep";
>> +					type = <PCA955X_TYPE_LED>;
>> +				};
>> +
>> +				led@1 {
>> +					label = "cablecard3-cxp-bot";
>> +					reg = <1>;
>> +					retain-state-shutdown;
>> +					default-state = "keep";
>> +					type = <PCA955X_TYPE_LED>;
>> +				};
>> +			};
>> +		};
>> +
>> +		i2c5mux0chn1: i2c@1 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <1>;
>> +
>> +			eeprom@51 {
>> +				compatible = "atmel,24c64";
>> +				reg = <0x51>;
>> +			};
>> +
>> +			pca9551@61 {
>> +				compatible = "nxp,pca9551";
>> +				reg = <0x61>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>
> And here you have correct order of properties...
>
>
>
> Best regards,
> Krzysztof
>

