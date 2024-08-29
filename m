Return-Path: <linux-i2c+bounces-5937-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF60964E81
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 21:13:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3474B1C2263E
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 19:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F731B9B2B;
	Thu, 29 Aug 2024 19:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hfyPmOCI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5B51B6540;
	Thu, 29 Aug 2024 19:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724958752; cv=none; b=XwTaPVcqEy9skf7/rEw1CFNRtz7Nyyr+jDNXlRvJxS1gWVLrZ63gea0VEGcK/hhmm4YshllRW6myEEa2o9q7A+uZXwTJwpVNDyMxSQL9jPv45nZLbpZTM7oU99Gv7tOzyR6clVyS239dhpiA95YeEgTnCOSAh1K4GPZZacTIvgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724958752; c=relaxed/simple;
	bh=IccCRubsZkcY5u3qNEH7PHyogwGX+dXPNc8wVEM5Uj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IlLtOW19GE2cic94oRBopDM6Cj7jo0T6VlM/0aGOtZ7HZEO+COHxw13XZhAcSmZ57499h4CtzRdkyqYpPClolcDXbtvKnyTcCmTLbhmv0rNe1NGgUiFk7G137m/UMeh9fsM0VvDv0rCCzs3Cs7UZLwIZa7gY8DFbywsdd6UkYjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hfyPmOCI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TGK93O024486;
	Thu, 29 Aug 2024 19:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XDi8cWM8np1l+qyak2upQZYRIHORj4j79K4H6ISldk8=; b=hfyPmOCIbJzySDql
	OmdQD12Zz2sJREaZberhLneflE/hOKYVZZofyBK6QxUqr+18/e7B2woskKUH04yX
	P9M6Vu7XCzs0Sw1UkxkCGUDZsLS2J/ybso0t3LyLX392wvtW70b21D/3qIl5LXMA
	moO9LAh5TzBMpGjBBvPoAERhy5GgXTVGwzuYgryZAtMF714InpSKXglhAg/IpGDL
	onNsTohtbQclmqE+Ke7mTlocsMoR/YNkSWUnZwb0lG3imy41+HiXq8RBvXvyElo7
	Sz/h8Nr/0cTtOzqvqIu0+E1ab50ffotira891aDv2XBw5h9QpcpLs73DzIoO7eBM
	PC1l5w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puvedfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:06:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TJ6ppS019360
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:06:51 GMT
Received: from [10.110.28.107] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 29 Aug
 2024 12:06:47 -0700
Message-ID: <57eee144-cdc4-48e7-838b-103cda6ec1dd@quicinc.com>
Date: Thu, 29 Aug 2024 12:06:46 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/22] arm64: dts: qcom: Add reduced functional DT for
 SA8255p Ride platform
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <rafael@kernel.org>, <viresh.kumar@linaro.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <sudeep.holla@arm.com>, <andi.shyti@kernel.org>, <tglx@linutronix.de>,
        <will@kernel.org>, <joro@8bytes.org>, <jassisinghbrar@gmail.com>,
        <lee@kernel.org>, <linus.walleij@linaro.org>, <amitk@kernel.org>,
        <thara.gopinath@gmail.com>, <broonie@kernel.org>,
        <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: <robin.murphy@arm.com>, <cristian.marussi@arm.com>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <vkoul@kernel.org>, <quic_gurus@quicinc.com>,
        <agross@kernel.org>, <bartosz.golaszewski@linaro.org>,
        <quic_rjendra@quicinc.com>, <robimarko@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <iommu@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_shazhuss@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-23-quic_nkela@quicinc.com>
 <746be896-8798-44b0-aa86-e77cf34655e1@kernel.org>
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <746be896-8798-44b0-aa86-e77cf34655e1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1DMGIf9YfzGAwuDSquaVObGA-TL4ZKmm
X-Proofpoint-GUID: 1DMGIf9YfzGAwuDSquaVObGA-TL4ZKmm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290136


On 8/29/2024 12:49 AM, Krzysztof Kozlowski wrote:
> On 28/08/2024 22:37, Nikunj Kela wrote:
>> SA8255p Ride platform is an automotive virtual platform. This platform
>> abstracts resources such as clocks, regulators etc. in the firmware VM.
>> The device drivers request resources operations over SCMI using power,
>> performance, reset and sensor protocols.
>>
>> Multiple virtual SCMI instances are being employed for greater parallelism.
>> These instances are tied to devices such that devices can have dedicated
>> SCMI channel. Firmware VM (runs SCMI platform stack) is SMP enabled and
>> can process requests from agents in parallel. Qualcomm smc transport is
>> used for communication between SCMI agent and platform.
>>
>> Let's add the reduced functional support for SA8255p Ride board.
>> Subsequently, the support for PCIe, USB, UFS, Ethernet will be added.
>>
>> Co-developed-by: Shazad Hussain <quic_shazhuss@quicinc.com>
>> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile           |    1 +
>>  arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi |   80 +
>>  arch/arm64/boot/dts/qcom/sa8255p-ride.dts   |  149 ++
>>  arch/arm64/boot/dts/qcom/sa8255p-scmi.dtsi  | 2312 ++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/sa8255p.dtsi       | 2405 +++++++++++++++++++
>>  5 files changed, 4947 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi
>>  create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-ride.dts
>>  create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-scmi.dtsi
>>  create mode 100644 arch/arm64/boot/dts/qcom/sa8255p.dtsi
>>
> ...
>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
>> new file mode 100644
>> index 000000000000..1dc03051ad92
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
>> @@ -0,0 +1,149 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +#include "sa8255p.dtsi"
>> +#include "sa8255p-pmics.dtsi"
>> +#include "sa8255p-scmi.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. SA8255P Ride";
>> +	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
>> +
>> +	aliases {
>> +		i2c11 = &i2c11;
>> +		i2c18 = &i2c18;
>> +		serial0 = &uart10;
>> +		serial1 = &uart4;
>> +		spi16 = &spi16;
>> +		scmichannels = &scmichannels;
> Nothing parses this.
>
We are using this alias in bootloader to speed up the parsing. Since we
are using 64 SCMI instances and SCMI smc transport driver for
Qualcomm(drivers/firmware/arm_scmi/transports/smc.c) expects
cap-id(created by hypervisor at boot time), our bootloader gets those
cap-id for each channel and populate them. This alias is an optimization
to save boottime as in automotive, boot KPIs are critical.


>
>> +
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +&firmware {
>> +	scmi0: scmi0 {
> scmi-0
>
ACK!
>> +		compatible = "qcom,scmi-smc";
>> +		arm,smc-id = <0xc6008012>;
>> +		shmem = <&shmem0>;
>> +
>> +		interrupts = <GIC_SPI 963 IRQ_TYPE_EDGE_RISING>;
>> +		interrupt-names = "a2p";
>> +
>> +		max-rx-timeout-ms = <3000>;
>> +
>> +		status = "disabled";
> status is the last property (from properties)
>
ACK!
> ...
>
>> +
>> +&soc {
>> +	scmichannels: sram@d0000000 {
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		compatible = "mmio-sram";
>> +		reg = <0x0 0xd0000000 0x0 0x40000>;
>> +		ranges = <0x0 0x0 0x0 0xffffffff>;
>> +
>> +		shmem0: scmi-sram@d0000000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0000000 0x1000>;
>> +		};
>> +
>> +		shmem1: scmi-sram@d0001000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0001000 0x1000>;
>> +		};
>> +
>> +		shmem2: scmi-sram@d0002000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0002000 0x1000>;
>> +		};
>> +
>> +		shmem3: scmi-sram@d0003000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0003000 0x1000>;
>> +		};
>> +
>> +		shmem4: scmi-sram@d0004000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0004000 0x1000>;
>> +		};
>> +
>> +		shmem5: scmi-sram@d0005000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0005000 0x1000>;
>> +		};
>> +
>> +		shmem6: scmi-sram@d0006000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0006000 0x1000>;
>> +		};
>> +
>> +		shmem7: scmi-sram@d0007000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0007000 0x1000>;
>> +		};
>> +
>> +		shmem8: scmi-sram@d0008000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0008000 0x1000>;
>> +		};
>> +
>> +		shmem9: scmi-sram@d0009000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0009000 0x1000>;
>> +		};
>> +
>> +		shmem10: scmi-sram@d000a000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd000a000 0x1000>;
>> +		};
>> +
>> +		shmem11: scmi-sram@d000b000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd000b000 0x1000>;
>> +		};
>> +
>> +		shmem12: scmi-sram@d000c000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd000c000 0x1000>;
>> +		};
>> +
>> +		shmem13: scmi-sram@d000d000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd000d000 0x1000>;
>> +		};
>> +
>> +		shmem14: scmi-sram@d000e000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd000e000 0x1000>;
>> +		};
>> +
>> +		shmem15: scmi-sram@d000f000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd000f000 0x1000>;
>> +		};
>> +
>> +		shmem16: scmi-sram@d0010000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0010000 0x1000>;
>> +		};
>> +
>> +		shmem17: scmi-sram@d0011000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0011000 0x1000>;
>> +		};
>> +
>> +		shmem18: scmi-sram@d0012000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0012000 0x1000>;
>> +		};
>> +
>> +		shmem19: scmi-sram@d0013000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0013000 0x1000>;
>> +		};
>> +
>> +		shmem20: scmi-sram@d0014000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0014000 0x1000>;
>> +		};
>> +
>> +		shmem21: scmi-sram@d0015000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0015000 0x1000>;
>> +		};
>> +
>> +		shmem22: scmi-sram@d0016000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0016000 0x1000>;
>> +		};
>> +
>> +		shmem23: scmi-sram@d0017000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0017000 0x1000>;
>> +		};
>> +
>> +		shmem24: scmi-sram@d0018000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0018000 0x1000>;
>> +		};
>> +
>> +		shmem25: scmi-sram@d0019000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0019000 0x1000>;
>> +		};
>> +
>> +		shmem26: scmi-sram@d001a000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd001a000 0x1000>;
>> +		};
>> +
>> +		shmem27: scmi-sram@d001b000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd001b000 0x1000>;
>> +		};
>> +
>> +		shmem28: scmi-sram@d001c000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd001c000 0x1000>;
>> +		};
>> +
>> +		shmem29: scmi-sram@d001d000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd001d000 0x1000>;
>> +		};
>> +
>> +		shmem30: scmi-sram@d001e000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd001e000 0x1000>;
>> +		};
>> +
>> +		shmem31: scmi-sram@d001f000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd001f000 0x1000>;
>> +		};
>> +
>> +		shmem32: scmi-sram@d0020000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0020000 0x1000>;
>> +		};
>> +
>> +		shmem33: scmi-sram@d0021000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0021000 0x1000>;
>> +		};
>> +
>> +		shmem34: scmi-sram@d0022000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0022000 0x1000>;
>> +		};
>> +
>> +		shmem35: scmi-sram@d0023000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0023000 0x1000>;
>> +		};
>> +
>> +		shmem36: scmi-sram@d0024000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0024000 0x1000>;
>> +		};
>> +
>> +		shmem37: scmi-sram@d0025000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0025000 0x1000>;
>> +		};
>> +
>> +		shmem38: scmi-sram@d0026000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0026000 0x1000>;
>> +		};
>> +
>> +		shmem39: scmi-sram@d0027000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0027000 0x1000>;
>> +		};
>> +
>> +		shmem40: scmi-sram@d0028000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0028000 0x1000>;
>> +		};
>> +
>> +		shmem41: scmi-sram@d0029000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0029000 0x1000>;
>> +		};
>> +
>> +		shmem42: scmi-sram@d002a000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd002a000 0x1000>;
>> +		};
>> +
>> +		shmem43: scmi-sram@d002b000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd002b000 0x1000>;
>> +		};
>> +
>> +		shmem44: scmi-sram@d002c000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd002c000 0x1000>;
>> +		};
>> +
>> +		shmem45: scmi-sram@d002d000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd002d000 0x1000>;
>> +		};
>> +
>> +		shmem46: scmi-sram@d002e000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd002e000 0x1000>;
>> +		};
>> +
>> +		shmem47: scmi-sram@d002f000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd002f000 0x1000>;
>> +		};
>> +
>> +		shmem48: scmi-sram@d0030000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0030000 0x1000>;
>> +		};
>> +
>> +		shmem49: scmi-sram@d0031000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0031000 0x1000>;
>> +		};
>> +
>> +		shmem50: scmi-sram@d0032000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0032000 0x1000>;
>> +		};
>> +
>> +		shmem51: scmi-sram@d0033000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0033000 0x1000>;
>> +		};
>> +
>> +		shmem52: scmi-sram@d0034000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0034000 0x1000>;
>> +		};
>> +
>> +		shmem53: scmi-sram@d0035000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0035000 0x1000>;
>> +		};
>> +
>> +		shmem54: scmi-sram@d0036000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0036000 0x1000>;
>> +		};
>> +
>> +		shmem55: scmi-sram@d0037000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0037000 0x1000>;
>> +		};
>> +
>> +		shmem56: scmi-sram@d0038000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0038000 0x1000>;
>> +		};
>> +
>> +		shmem57: scmi-sram@d0039000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd0039000 0x1000>;
>> +		};
>> +
>> +		shmem58: scmi-sram@d003a000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd003a000 0x1000>;
>> +		};
>> +
>> +		shmem59: scmi-sram@d003b000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd003b000 0x1000>;
>> +		};
>> +
>> +		shmem60: scmi-sram@d003c000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd003c000 0x1000>;
>> +		};
>> +
>> +		shmem61: scmi-sram@d003d000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd003d000 0x1000>;
>> +		};
>> +
>> +		shmem62: scmi-sram@d003e000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd003e000 0x1000>;
>> +		};
>> +
>> +		shmem63: scmi-sram@d003f000 {
>> +			compatible = "arm,scmi-shmem";
>> +			reg = <0xd003f000 0x1000>;
>> +		};
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/sa8255p.dtsi b/arch/arm64/boot/dts/qcom/sa8255p.dtsi
>> new file mode 100644
>> index 000000000000..c354f76ffa5e
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sa8255p.dtsi
>> @@ -0,0 +1,2405 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/mailbox/qcom-ipcc.h>
>> +
>> +/ {
>> +	interrupt-parent = <&intc>;
>> +
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>> +
>> +	clocks {
>> +		xo_board_clk: xo-board-clk {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		sleep_clk: sleep-clk {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		gpll0_board_clk: gpll0-board-clk {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		bi_tcxo_div2: bi-tcxo-div2-clk {
>> +			compatible = "fixed-factor-clock";
>> +			clocks = <&xo_board_clk>;
>> +			clock-mult = <1>;
>> +			clock-div = <2>;
>> +			#clock-cells = <0>;
>> +		};
>> +	};
>> +
>> +	cpus {
>> +		#address-cells = <2>;
>> +		#size-cells = <0>;
>> +
>> +		CPU0: cpu@0 {
> Lowercase label.
ACK!
>
> ...
>
> Best regards,
> Krzysztof
>

