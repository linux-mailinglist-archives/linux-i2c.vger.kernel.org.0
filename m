Return-Path: <linux-i2c+bounces-5966-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A34C29664CE
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 16:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C89AD1C23F88
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 14:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C5D1B3B1C;
	Fri, 30 Aug 2024 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JW+UgMY0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B695A1917E2;
	Fri, 30 Aug 2024 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725029978; cv=none; b=nRhW74K60H1ldr8B+RAl+gUxhCI9/AOWuASXzcBvr/45aIT+nS6nkRZwSNCyk42QB9GPzSebvh98yXt0xk/uXbRaidbHek0grvdVnEIF0cObo6G1pAargzpD2T9HZcy09Wt42hKh+b/r9eNmn5RGQzK3IxBXJle3YHji6CommO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725029978; c=relaxed/simple;
	bh=ZNinG2P8QRlT1ahrPp1CbuKepet2IrmxrveZ7JQJiWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Wt0JXrLRnlmCSj3rpJfLkuKsXT9b6x4ZC6X2JkEwqkHmeSpJ/sc70WLgb++oNsPhQxeqZ/V/NF9HM9ildOweM9hnNrhZPZjVKOTq5h604F9NMZHakehxFaEgx+8BiYGDwS5vAfuqqHB9ep9hZJbIdG20fsYcytFccZC6PCzhAls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JW+UgMY0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U80U5h017955;
	Fri, 30 Aug 2024 14:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LgF5ZYD5IR1SwpOQJWoYZ0vhtIBCV/uVX/Uy6jMvB+U=; b=JW+UgMY0WG7cYPxh
	h5qbUmrcF7dtTxFEkfIeAqxlqBgxYcB+3CZny67trU3LOtF+0U4HIpspMGfzcOhq
	msC1wvhSlwj8bpmjQ/Tx+Gmc2P2XwrixJ2abHLWGTV2V+mjBVoNI4jPgIB84/6F9
	25Az8Tx0hT92YLi3vrSd2cTMoSUyzlfR+w7D5Q9y82On5OgO9C4F4VkLGgoi89xc
	DhYo9p18OVlaEX4o56acMPom2eulqSSvGMtkGCvBAiWSOMs6zao8l0CHKTmVcMyq
	RHawE0M2mn2qdcjMXxSqmkWQFSpRi6RsTP31Dv58UYgGmZptMM7CpgAhaCGnDrDu
	e/jQsg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puts9dj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 14:58:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47UEwwPD011056
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 14:58:58 GMT
Received: from [10.110.28.107] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 Aug
 2024 07:58:55 -0700
Message-ID: <9befe692-a05d-4fa0-9ff9-8d6030e4cb66@quicinc.com>
Date: Fri, 30 Aug 2024 07:58:54 -0700
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
 <57eee144-cdc4-48e7-838b-103cda6ec1dd@quicinc.com>
 <095f5048-5c39-438d-b5a9-7519199a8e9f@kernel.org>
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <095f5048-5c39-438d-b5a9-7519199a8e9f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SkQErJ6yG1XnlEy5h9kGSvc-Bpyu79A9
X-Proofpoint-ORIG-GUID: SkQErJ6yG1XnlEy5h9kGSvc-Bpyu79A9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_09,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300114


On 8/30/2024 2:51 AM, Krzysztof Kozlowski wrote:
> On 29/08/2024 21:06, Nikunj Kela wrote:
>> On 8/29/2024 12:49 AM, Krzysztof Kozlowski wrote:
>>> On 28/08/2024 22:37, Nikunj Kela wrote:
>>>> SA8255p Ride platform is an automotive virtual platform. This platform
>>>> abstracts resources such as clocks, regulators etc. in the firmware VM.
>>>> The device drivers request resources operations over SCMI using power,
>>>> performance, reset and sensor protocols.
>>>>
>>>> Multiple virtual SCMI instances are being employed for greater parallelism.
>>>> These instances are tied to devices such that devices can have dedicated
>>>> SCMI channel. Firmware VM (runs SCMI platform stack) is SMP enabled and
>>>> can process requests from agents in parallel. Qualcomm smc transport is
>>>> used for communication between SCMI agent and platform.
>>>>
>>>> Let's add the reduced functional support for SA8255p Ride board.
>>>> Subsequently, the support for PCIe, USB, UFS, Ethernet will be added.
>>>>
>>>> Co-developed-by: Shazad Hussain <quic_shazhuss@quicinc.com>
>>>> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
>>>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/Makefile           |    1 +
>>>>  arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi |   80 +
>>>>  arch/arm64/boot/dts/qcom/sa8255p-ride.dts   |  149 ++
>>>>  arch/arm64/boot/dts/qcom/sa8255p-scmi.dtsi  | 2312 ++++++++++++++++++
>>>>  arch/arm64/boot/dts/qcom/sa8255p.dtsi       | 2405 +++++++++++++++++++
>>>>  5 files changed, 4947 insertions(+)
>>>>  create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi
>>>>  create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-ride.dts
>>>>  create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-scmi.dtsi
>>>>  create mode 100644 arch/arm64/boot/dts/qcom/sa8255p.dtsi
>>>>
>>> ...
>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
>>>> new file mode 100644
>>>> index 000000000000..1dc03051ad92
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
>>>> @@ -0,0 +1,149 @@
>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>> +/*
>>>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + */
>>>> +
>>>> +/dts-v1/;
>>>> +
>>>> +#include <dt-bindings/gpio/gpio.h>
>>>> +
>>>> +#include "sa8255p.dtsi"
>>>> +#include "sa8255p-pmics.dtsi"
>>>> +#include "sa8255p-scmi.dtsi"
>>>> +
>>>> +/ {
>>>> +	model = "Qualcomm Technologies, Inc. SA8255P Ride";
>>>> +	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
>>>> +
>>>> +	aliases {
>>>> +		i2c11 = &i2c11;
>>>> +		i2c18 = &i2c18;
>>>> +		serial0 = &uart10;
>>>> +		serial1 = &uart4;
>>>> +		spi16 = &spi16;
>>>> +		scmichannels = &scmichannels;
>>> Nothing parses this.
>>>
>> We are using this alias in bootloader to speed up the parsing. Since we
> Then please provide link to the bindings in this open-source upstream
> bootloader.
>
> Otherwise it is a clear no-go for me. We don't add properties because
> some downstream wants them. Imagine what would happen if we opened that
> can of worms...

Point taken! I will remove this alias and label from DT in next version.
We can add it back if/once the bootloader changes are upstreamed. Thanks!


>> are using 64 SCMI instances and SCMI smc transport driver for
>> Qualcomm(drivers/firmware/arm_scmi/transports/smc.c) expects
>> cap-id(created by hypervisor at boot time), our bootloader gets those
>> cap-id for each channel and populate them. This alias is an optimization
>> to save boottime as in automotive, boot KPIs are critical.
> I will refrain about commenting on KPIs...
>
>
>
> Best regards,
> Krzysztof
>

