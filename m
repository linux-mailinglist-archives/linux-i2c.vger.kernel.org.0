Return-Path: <linux-i2c+bounces-14759-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 60613CDB231
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Dec 2025 03:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67BB93011AB2
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Dec 2025 02:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FBD2BE643;
	Wed, 24 Dec 2025 02:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gf1h1UMB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KCLerXio"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3242459C6
	for <linux-i2c@vger.kernel.org>; Wed, 24 Dec 2025 02:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766542336; cv=none; b=httIWuRGx2UMEkD6dG/N62HEF3JWJQwY77oyxz2otC7qHCMdAqO04MU81h9hj2OpBYMjnVVYF83HSRYuBVdESKQOWiPhnpAyCIa147nSgYcCYsRWkoHx+pPAZqvTu/3y/MgHx7H2lI+y51M4VnDXr/24kbHAmzgLiJbD5wuge1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766542336; c=relaxed/simple;
	bh=37z/owpX5jfxrYEHklbiOeTahWQfH6uG0Auq7XulCIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kabmQgcD0TrPWUPDU60qkf0JGoRJy77Tq2sBgi+Y8OcoNakponMIWn+pIaD4myz3vVZk2E6pxKOsDFcHApcAbtEeUVTe4jWITnv+hE/1nQ1ma3RuPKRQibwj6SGip/quZA7kmNPXnD8fptkcze0+YQ3Akqx7JAs0OQgOg4Qjb2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gf1h1UMB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KCLerXio; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO180qk1598800
	for <linux-i2c@vger.kernel.org>; Wed, 24 Dec 2025 02:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	35S/WHqipbDYewb3d4hGu+2ig6o+3xLs6XWJlU23x8Y=; b=gf1h1UMBXUVCcEaW
	arSRd5gfyjau6zyWQcWi5uC0Zmng2GGjvp227BDdv3vdyeLv+jvsG4ElYFRkSBcY
	05bDJ9G8XdQOyoqhYvtJbJlu/0S7jLCAwToGDFdMNOBMm+8SMV114OFCyJQr88py
	Miz1FqxV+4OZxdO8DmEwDqedrWuoI/tn6vuUyOU7yfT25nbd5S1kBM139IHL1Rmn
	jHVKkZ4YuCO9wN/TinO139Fw6Oratz0WM4sp4FYsIpLTPRYFOHZN+aBotK1xx3XM
	q5MgkZgGcdzh42CIA6hcKtb1WJq/tiIZ+GyfPzQVjOshkTuMkVu/vu+7joCWkvzN
	Yzu97g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683g48n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 24 Dec 2025 02:12:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee21a0d326so31325481cf.3
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 18:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766542333; x=1767147133; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=35S/WHqipbDYewb3d4hGu+2ig6o+3xLs6XWJlU23x8Y=;
        b=KCLerXioRgeWRJjiJ3PQfJA3boEzMIABxPIhBRNHfBX8SlSnKp/owxFfe457EnIi1S
         x8y8p70G/xsE5LaXSh37HsKfMwz92/oZ8L9xjBper1s3gFS2+nTTUDckcBOcYLysNGf2
         vtnia4k7YrmsOMISSC3+FCSRsJiRSK1LGpMmwmbTkJX3YPW+10m20BL2o2sDz8bOY5B5
         uFYZtXj8mGBZ0Jx9l/7QZPbcpNpIISz6UmdFiJMHrl5sLya4qmil3lzl29z21lXAikAC
         +p1XVi/kbTAFLnKxKCi58ApBWydkXM1T/QBls2vcrl3SGVgzVdv/UzcxbToo5GZ7ucbn
         sMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766542333; x=1767147133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35S/WHqipbDYewb3d4hGu+2ig6o+3xLs6XWJlU23x8Y=;
        b=XbYBh/Mf5TgL0ux3rPo67amntUeHjcs66JGiC4n+hEvjfrNLiQhKOCUtPoWKMPBrfm
         4dOVk64BEEerby0lZKfljxiuaBO8wxbYwFch3YAhofNKHmG/fKUVspKxsuFcKN0qKhiQ
         /qcpWCcYwF9INZtNUSS4D4m+lHvNsug7d+QQUOvmp3D+GQcgTbgoJjhvRpbe4MnCn3g8
         QBMmhdrAuYzEF2MHRmn+9tWATwmVatsZ1n4WxxlkJM82kWmg5gPGdw+GL3DiEEGTeceu
         lgnZLd+7lY7czjEltNCG2V6tUFaV4xeDg3/V90w2i/QX4qG4Fw6CrMTw4RB9SzHvH2DF
         8hzA==
X-Forwarded-Encrypted: i=1; AJvYcCUQT1KPVM2wuFcbp5nhrD/yBp7z+PDh2ZSWJMeCZRwNPjBuyDIQ5Z+A2ikbGZVpDaidoza71XSDyrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze9IZYdcBVxlPzj12HDllbJB/eFScPIMiKLoPgCirZWaUIo5yL
	afbdlgyuIF2z0XI0Eg5StzvwJ/cnPZw7B957yWLljTqkkR0jsMS8cyvstfqJ81URVeXm6hecI6K
	WM3WfXzWX9VimXHxvjI6/yMun6xIXh2TZbogp65hvjLlmQl6gNxsi+K5NHaKtyw8=
X-Gm-Gg: AY/fxX6x6QwcGhFpKsqkyq/cN/Z1qMzTYOsDmhMdjuhEmHAAAptWfkuRu1MOYo2CkSN
	HAvYjNbNrY+ljzCQ0naICPUKrUfLtrwmpeFw1YHigKsjp4yWcmv/evaCicuMUTcQTCWBsswxmxA
	YdoJ+vWqTBoi05GCTB/N6+MmJWWcPcz2u5ksEOPBOYInEDZyQGFzDXA4mdxHsRbj60lodJBmmPn
	4ZrY0V/YkSi+0bQs5iJEY5XHfz2BMszReBOjr9JkMOMUoWnDhLr5YOp0ipHccGJw+Lkg4k0Z8Tt
	MbDhcqqGwcv1QFMSZxVprx/yoaBU26yy8nDE0JMZdA7nbxxD2hTnigVgIlqcKY3rqH572nbIisE
	39UMXurExbP/i4b/tbHGH5pBIevQaWhtgx6y6MatVZBKXOrAS8GawN5QaKWVzEdDzFnR+dTjnXw
	==
X-Received: by 2002:a05:622a:1e96:b0:4ee:1dd0:5a51 with SMTP id d75a77b69052e-4f4abcf632fmr212572751cf.2.1766542332870;
        Tue, 23 Dec 2025 18:12:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXXNTnPitVDMJVOsCBUeJpenK/gHnhoi7SLokwYZjACPve2gmLZdKA88zpHtCRpH41wfINfg==
X-Received: by 2002:a05:622a:1e96:b0:4ee:1dd0:5a51 with SMTP id d75a77b69052e-4f4abcf632fmr212572531cf.2.1766542332317;
        Tue, 23 Dec 2025 18:12:12 -0800 (PST)
Received: from [10.111.161.169] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997aeef5sm121407036d6.27.2025.12.23.18.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 18:12:11 -0800 (PST)
Message-ID: <45aa9656-dbbd-4c1e-89c4-a24ea5996ff1@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 10:12:04 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
 <20251222-sm6150_evk-v1-3-4d260a31c00d@oss.qualcomm.com>
 <cfb8f192-b327-4bb9-993e-a28184571712@linaro.org>
 <703a502c-883d-434a-8bcf-f785080f5102@oss.qualcomm.com>
 <091b863b-fa0a-4d3c-8461-60cdc4970992@linaro.org>
 <a767acb3-8bb9-45f7-99a6-68a595e4ebb5@oss.qualcomm.com>
 <f5df62d0-6b93-4630-92d0-d8af35432178@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <f5df62d0-6b93-4630-92d0-d8af35432178@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VUcJ_dmfDa5x4i8uPGZuatuhuijoxIWl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAxNSBTYWx0ZWRfX7bWJDLYJvUrB
 aQSbZ/+xW3aIM+E/aYYOhoegKdu1gAe0POj/9xQWsy4vl1S67qG/fZOC3Ll1pTIYV+aTpw9fl1k
 ighvdOWxYDEFC7gIPCxl12/0caNJGgSjuv1g6DTGzuNilAqADXyu0NQm6SlcATmaZ8Nk366OpFr
 N0txIsO9T1+5oz3qKdlxzI2Sn08JK9JDu9DetWf9US9tMR3llJEQcCkXyQzuXxpvMtpP2bCr7sz
 yBSnof8I8dtE6gh9cTj4et8tSIkUeY6WbGjJa+bZZKGBBtsqKJ+I0eUBIbGDSCt793oxSRFXfRz
 YrceQ2SYffzQz/ik5VB6v961eFZvzVWpt3sy9EL0LDpCqJx+oRLpJxpE0T/pQoeX2KVixpJUaw4
 zoFl7+SsEV0Gid8NVC7ytdCdCiVTYBlQJXsjdWOv04rVCuGM5wUYkQq50r1Ybh2i3fnLZug4onQ
 tTGIwHccs5DFZBoaXRQ==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694b4bfd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3HrGEc0Bd40ySK1zDqwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: VUcJ_dmfDa5x4i8uPGZuatuhuijoxIWl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240015



On 12/24/2025 12:36 AM, Vladimir Zapolskiy wrote:
> On 12/23/25 04:16, Wenmeng Liu wrote:
>>
>>
>> On 12/22/2025 11:45 PM, Vladimir Zapolskiy wrote:
>>> On 12/22/25 13:41, Wenmeng Liu wrote:
>>>>
>>>>
>>>> On 12/22/2025 7:19 PM, Vladimir Zapolskiy wrote:
>>>>> On 12/22/25 10:44, Wenmeng Liu wrote:
>>>>>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>>>>>
>>>>>> The Talos EVK board does not include a camera sensor
>>>>>> by default, this overlay reflects the possibility of
>>>>>> attaching an optional camera sensor.
>>>>>> For this reason, the camera sensor configuration is
>>>>>> placed in talos-evk-camera.dtso, rather than
>>>>>> modifying the base talos-evk.dts.
>>>>>>
>>>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/Makefile              |  2 +
>>>>>>     arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 64 ++++++++++ 
>>>>>> ++++++
>>>>>> ++++++++++
>>>>>>     arch/arm64/boot/dts/qcom/talos.dtsi            | 21 +++++++++
>>>>>
>>>>> Please split QCS615 MCLK definitions change into a separate commit.
>>>> ACK.>
>>>>>>     3 files changed, 87 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/
>>>>>> qcom/Makefile
>>>>>> index
>>>>>> 60121f133078b2754f98e6f45a3db4031b478cc8..b1d85b1f4a94714f2a5c976d162482d70ae920f2 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>>>> @@ -325,7 +325,9 @@ dtb-$(CONFIG_ARCH_QCOM)    += sm8650-qrd.dtb
>>>>>>     dtb-$(CONFIG_ARCH_QCOM)    += sm8750-mtp.dtb
>>>>>>     dtb-$(CONFIG_ARCH_QCOM)    += sm8750-qrd.dtb
>>>>>>     dtb-$(CONFIG_ARCH_QCOM)    += talos-evk.dtb
>>>>>> +talos-evk-camera-dtbs        := talos-evk.dtb talos-evk-camera.dtbo
>>>>>>     talos-evk-lvds-auo,g133han01-dtbs    := talos-evk.dtb talos-evk-
>>>>>> lvds-auo,g133han01.dtbo
>>>>>> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-camera.dtb
>>>>>>     dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-lvds-auo,g133han01.dtb
>>>>>>     x1e001de-devkit-el2-dtbs    := x1e001de-devkit.dtb x1-el2.dtbo
>>>>>>     dtb-$(CONFIG_ARCH_QCOM)    += x1e001de-devkit.dtb x1e001de- 
>>>>>> devkit-
>>>>>> el2.dtb
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso b/arch/
>>>>>> arm64/boot/dts/qcom/talos-evk-camera.dtso
>>>>>> new file mode 100644
>>>>>> index
>>>>>> 0000000000000000000000000000000000000000..ae1a02295b4dc48212aad40980a329ff458fe69a
>>>>>> --- /dev/null
>>>>>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso
>>>>>> @@ -0,0 +1,64 @@
>>>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>>>> +/*
>>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its 
>>>>>> subsidiaries.
>>>>>
>>>>> Please add a missing year of the change.
>>>> Now our requirement is a yearless copyright.>
>>>
>>> Ack. It's a lawyers' domain anyway.
>>>
>>>>>> + */
>>>>>> +
>>>>>> +/dts-v1/;
>>>>>> +/plugin/;
>>>>>> +
>>>>>> +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
>>>>>> +#include <dt-bindings/gpio/gpio.h>
>>>>>> +
>>>>>> +&camss {
>>>>>> +    vdd-csiphy-1p2-supply = <&vreg_l11a>;
>>>>>> +    vdd-csiphy-1p8-supply = <&vreg_l12a>;
>>>>>> +
>>>>>> +    status = "okay";
>>>>>> +
>>>>>> +    ports {
>>>>>> +        #address-cells = <1>;
>>>>>> +        #size-cells = <0>;
>>>>>> +
>>>>>> +        port@1 {
>>>>>> +            reg = <1>;
>>>>>> +
>>>>>> +            csiphy1_ep: endpoint {
>>>>>> +                clock-lanes = <7>;
>>>>>
>>>>> Please remove 'clock-lanes' property.
>>>> ACK.>
>>>>>> +                data-lanes = <0 1 2 3>;
>>>>>> +                remote-endpoint = <&imx577_ep1>;
>>>>>> +            };
>>>>>> +        };
>>>>>> +    };
>>>>>> +};
>>>>>> +
>>>>>> +&cci {
>>>>>> +    status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&cci_i2c1 {
>>>>>> +    #address-cells = <1>;
>>>>>> +    #size-cells = <0>;
>>>>>> +
>>>>>> +    camera@1a {
>>>>>> +        compatible = "sony,imx577";
>>>>>> +        reg = <0x1a>;
>>>>>> +
>>>>>> +        reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
>>>>>> +        pinctrl-0 = <&cam2_default>;
>>>>>> +        pinctrl-names = "default";
>>>>>> +
>>>>>> +        clocks = <&camcc CAM_CC_MCLK2_CLK>;
>>>>>> +        assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
>>>>>> +        assigned-clock-rates = <24000000>;
>>>>>> +
>>>>>> +        avdd-supply = <&vreg_s4a>;
>>>>>
>>>>> Just one voltage supply?
>>>> yes, 22pin camera module only have one pin for power.>
>>>
>>> It's common that mezzanine boards are supplied with power from S4A or 
>>> VBAT,
>>> I've never seen a camera module supplied with just one voltage 
>>> regulator,
>>> that's why it attracts attention.
>>>
>>> What is a camera module here, is it on an attachable vision mezzanine 
>>> like
>>> on RBx series or a part of Talos EVK PCB like on QRD series?
>>>
>>> If it is a mezzanine, the support of mezzanine boards should be done as
>>> a DT overlay.
>>>
>>
>> It`s like RBx series, does not include a camera sensor
>> by default.
>>
> 
> Then to add the image sensor support please follow the model with DT 
> overlays,
> and it means you shall get a schematics of the mezzanine to describe the
> attachable board.
> 
> When you get the schematics, you will get a valid view on voltage 
> distribution,
> sensor supplies will be derivatives from VBAT or S4A anyway, I believe.
> 
> See sm8550-hdk-rear-camera-card.dtso or qrb5165-rb5-vision- 
> mezzanine.dtso as
> the references.
> 

yes, I think the module will distribute the supplies of S4A.

Thanks,
Wenmeng


