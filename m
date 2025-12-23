Return-Path: <linux-i2c+bounces-14686-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8B9CD7D8B
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 03:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CA28301B835
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 02:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9323E21CFFD;
	Tue, 23 Dec 2025 02:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5n4TvGK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NawkIe5Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB0A225762
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766456197; cv=none; b=q0rc5Cf8e7n17vAwfW9FrsY1trKOApNPNndjRraZXGqQPi4I+nDcjmOj7r5WlloxCACCF2q6elkPdcUVf37iSQElKjXbTteuniRT9XbzrIzhzoHzxhHfyQfQls+puNHnk5WaO+s9NanOh4GMU3tE/jdrPrtpxKt3/ADeL/SLuS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766456197; c=relaxed/simple;
	bh=HxRjEvF5S+Bn8nhnzL0lUBRx86h41CIniVPwPvbrutE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IyPeOhR4TBkA2173aFAF7iPNqsVK1c9XVSifvaL5p25mCOSkKyouGcwJG3lMtSoUzAYELrrIf3Gzb3p/i84eo1nl8+QuX7MfIGIz1xB6uejECTzu9cOVRiFJBgZ8pHtamMT4hlih8WXAUuffw5aj2wuPwkcEbrEMSJ1/xh4sVyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5n4TvGK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NawkIe5Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMMIFBE2570004
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BX4kp00cUTIqF2+i+oRIlkTaKl5Y4bXuMsl9PQdcnrA=; b=V5n4TvGKfrx2W/50
	QtA4lZwOgutgCnA/1UrPUlpstQ1Nr6FfDFjAGRamQ+t7oOqyKRWYXwJ/3+nmr+za
	7ChOErFQ7J1PNYgG7f5pFu5/nWagSTuGUfegR1C1xXQl5hLenSgTGPT5OyPf3vh/
	GxPyeF0PunAmjLT+Bvx1YSbfdXIgfgSiKSllAh5V3MhIkP+FhWtxbFZcmgdOCtRr
	X0rSvKE9cU+QGEn7IZRZFlKeHAXwZXNBwisIZLwYJAnfh7B6uSqNFhMFOJPqpqMt
	5cZfXppH1wNWNP2Z1hb8FwDLlnnDjKiSBoF5b9+4OqOxgXXfQwW8NnshwQbNhR7C
	/hYRaw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8h6xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:16:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b6a9c80038so435532085a.2
        for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 18:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766456194; x=1767060994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BX4kp00cUTIqF2+i+oRIlkTaKl5Y4bXuMsl9PQdcnrA=;
        b=NawkIe5Y88zycOOv/46qO4aGxoITxH/88fuZiIbZKJ5wxB83vd+vAYhHeG+ZMD0vhY
         ONUxJhKAVkuZKfJH64ZhgggsPBxIBUSEG2vGYulLD5sWJJwGTtxI+1qOvXBuSNMq7d7D
         qeWo8dmAO1eQh15YK/t8JzpRBn2EziiScmRe0h4icrkpckTmEn1zIbXF0wpgaxWK1aW8
         easPX4fluCaW1Rc1ZmB/rvzHW7u6d7mBiNbJfYR/UuOuVZOYfiW2G3HnTKPREJXDKLT1
         sFHtb7uYE7rgybe+FieJ2BuOVC7gqqTHrqs5MDlinMvuTQQicOnutOOCnzgf7gdedkm2
         +kfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766456194; x=1767060994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BX4kp00cUTIqF2+i+oRIlkTaKl5Y4bXuMsl9PQdcnrA=;
        b=Xgjl133w89hkppZ71orZzZgooeQtjOo544gXLuYbImAJBxwzbs8k3FqrmgRc5d4Jc5
         j1sIOV+0zYr1WXFonCh7jQf6ffFwyIo51bqFbRmgdpRdPXWIkRacoiU4f/crSVbQJ8Bq
         4ZD6yXByiK87uqXAUAHohnY8/R3dQQila6o/WU19/uV/K3sVBtjV94k94DcDtaC5yEnP
         KnqBXtdiFv97yUPlTeE/4Z1CNMXFCBzZUbGl4lYcSAdACScGGryNPz/jZxHxEp4KMRz7
         9LuZIhktdv04lzaB9S9KkRGMyZ6AF8zOm8mAbpPjvfIzkLKR+QMbKWReh9pY8mKe315z
         uT+w==
X-Forwarded-Encrypted: i=1; AJvYcCVtdpnT869lTV0Q9Uc8kQbe1duL5sll+VnsxHqYDHAJXEwc8rw4fast9LR7o3dBlyuoAhty5rI4Nhk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMY/lmacB/iMudaFU/ir5NXB925XRuShDNJJziipUoySCQp4xo
	EGV5dAScF0PJCUGrWrCsWxjGXJmNgsAAmCJACFN8LdIAh34cEpo2lb9l41EsWCddCFzeyRK97EE
	AMCakvyk73cfhbzK6fuGACP95VH7O4tE7M9drxBeu/oJvlI6fBQ/xQhNoOfGHe44=
X-Gm-Gg: AY/fxX7oKFtJt9tP08ViFP/Cc+vdlU1+YQQFbwqyJ2G89b8hV5WhlmPdayiGmX6VjPT
	I65Iephg0KrUXB/o+2CcgBwZKgLQ/rodHytC3n2rXnus++Ph2ceNVPGEUaw+HsNcfO3Cacm5pps
	JmAl+u5Jy6qQ7LKfl5MRLCkpmsk48LdUJSv6AVmsVUoKBrKI6TngmOoJOn5wJ42EIfDvH9Isc6C
	YyZkU4LmWTCpmiDwk14rP79Z+WDnvyq3ZFKHWo8GQtJfvw3f6Ab+SzTro8mZBZg8CKvOAWsWU17
	cxkZSml73PaFxDeDLTgUb7JGI2DyEMP6eX7UucjEhMY5LDDKng2G8ZRgoN56qU9P0743weJm0MV
	v32P1dXdUv1Du5eYteymcIhJXHppdDLGtUD9FegrakE7k7gg3UyV/syqSDuiBMYC8nIyySv2s
X-Received: by 2002:a05:620a:46a2:b0:8b4:3ea8:b30e with SMTP id af79cd13be357-8c08fd27810mr2018995485a.46.1766456193562;
        Mon, 22 Dec 2025 18:16:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqmopzBn8u2ezviYQp0qX7PRJlQCatO8SpKZPJ+5gMcp5GLL0l9H2hCgGmEX3VBIdmbU0FCw==
X-Received: by 2002:a05:620a:46a2:b0:8b4:3ea8:b30e with SMTP id af79cd13be357-8c08fd27810mr2018992685a.46.1766456193092;
        Mon, 22 Dec 2025 18:16:33 -0800 (PST)
Received: from [10.38.247.176] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9623fdd8sm93756866d6.4.2025.12.22.18.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 18:16:32 -0800 (PST)
Message-ID: <a767acb3-8bb9-45f7-99a6-68a595e4ebb5@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 10:16:25 +0800
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
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <091b863b-fa0a-4d3c-8461-60cdc4970992@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDAxNyBTYWx0ZWRfX+yYgg+QcrD1o
 b+w4wWBcIbmHIo/utcqXQ5iI3A+gTJZTjtwOxljm9cUHQi85MYrrj288n3S/qA7MaY43qV+skZ/
 pYLXwTxNoh8EQRPkixnPZStN+fAfnyAsN9kFPxXIowBk8rrKE2rPHoXpUwT/5FnhsCz+kbYZk0j
 MLvB57uliXlyBZoAmhab7sC6GiEDsPO12XWwKWmr2VHKZC8Go4nCEb+GniQo8JlH6q0EfAGC5HK
 4T8PTYRGGljE60F52UWWWg+5uNcuA4CGg+uAu7uVMx4FCqNJT6qFbt7X9uBlkGPDNAJMdQ80YBU
 wT0g+eUQal/2A8eH9zgri3TLv+bIrTP/J4yzo2rbATbJ4LbFM1COmumaZbReiQVqyvp5o8Eefyj
 2865TsU2YTTGSuhpulAgSw1kgk+hS3DKLr1gp+C1UtCittyMpkUQpkvOI//eG9Mo1eiEKqfw86r
 ZNdCokLWw0OUD56Jk/g==
X-Proofpoint-GUID: eJoMFYC9w4Hb7LbAAOUkLvtsgmlvx4wY
X-Proofpoint-ORIG-GUID: eJoMFYC9w4Hb7LbAAOUkLvtsgmlvx4wY
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=6949fb82 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kW7qbXk8jYSkC2qDlpcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230017



On 12/22/2025 11:45 PM, Vladimir Zapolskiy wrote:
> On 12/22/25 13:41, Wenmeng Liu wrote:
>>
>>
>> On 12/22/2025 7:19 PM, Vladimir Zapolskiy wrote:
>>> On 12/22/25 10:44, Wenmeng Liu wrote:
>>>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>>>
>>>> The Talos EVK board does not include a camera sensor
>>>> by default, this overlay reflects the possibility of
>>>> attaching an optional camera sensor.
>>>> For this reason, the camera sensor configuration is
>>>> placed in talos-evk-camera.dtso, rather than
>>>> modifying the base talos-evk.dts.
>>>>
>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/Makefile              |  2 +
>>>>    arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 64 ++++++++++++++++
>>>> ++++++++++
>>>>    arch/arm64/boot/dts/qcom/talos.dtsi            | 21 +++++++++
>>>
>>> Please split QCS615 MCLK definitions change into a separate commit.
>> ACK.>
>>>>    3 files changed, 87 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/
>>>> qcom/Makefile
>>>> index
>>>> 60121f133078b2754f98e6f45a3db4031b478cc8..b1d85b1f4a94714f2a5c976d162482d70ae920f2 100644
>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>> @@ -325,7 +325,9 @@ dtb-$(CONFIG_ARCH_QCOM)    += sm8650-qrd.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)    += sm8750-mtp.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)    += sm8750-qrd.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)    += talos-evk.dtb
>>>> +talos-evk-camera-dtbs        := talos-evk.dtb talos-evk-camera.dtbo
>>>>    talos-evk-lvds-auo,g133han01-dtbs    := talos-evk.dtb talos-evk-
>>>> lvds-auo,g133han01.dtbo
>>>> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-camera.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-lvds-auo,g133han01.dtb
>>>>    x1e001de-devkit-el2-dtbs    := x1e001de-devkit.dtb x1-el2.dtbo
>>>>    dtb-$(CONFIG_ARCH_QCOM)    += x1e001de-devkit.dtb x1e001de-devkit-
>>>> el2.dtb
>>>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso b/arch/
>>>> arm64/boot/dts/qcom/talos-evk-camera.dtso
>>>> new file mode 100644
>>>> index
>>>> 0000000000000000000000000000000000000000..ae1a02295b4dc48212aad40980a329ff458fe69a
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso
>>>> @@ -0,0 +1,64 @@
>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>> +/*
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>
>>> Please add a missing year of the change.
>> Now our requirement is a yearless copyright.>
> 
> Ack. It's a lawyers' domain anyway.
> 
>>>> + */
>>>> +
>>>> +/dts-v1/;
>>>> +/plugin/;
>>>> +
>>>> +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
>>>> +#include <dt-bindings/gpio/gpio.h>
>>>> +
>>>> +&camss {
>>>> +    vdd-csiphy-1p2-supply = <&vreg_l11a>;
>>>> +    vdd-csiphy-1p8-supply = <&vreg_l12a>;
>>>> +
>>>> +    status = "okay";
>>>> +
>>>> +    ports {
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <0>;
>>>> +
>>>> +        port@1 {
>>>> +            reg = <1>;
>>>> +
>>>> +            csiphy1_ep: endpoint {
>>>> +                clock-lanes = <7>;
>>>
>>> Please remove 'clock-lanes' property.
>> ACK.>
>>>> +                data-lanes = <0 1 2 3>;
>>>> +                remote-endpoint = <&imx577_ep1>;
>>>> +            };
>>>> +        };
>>>> +    };
>>>> +};
>>>> +
>>>> +&cci {
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&cci_i2c1 {
>>>> +    #address-cells = <1>;
>>>> +    #size-cells = <0>;
>>>> +
>>>> +    camera@1a {
>>>> +        compatible = "sony,imx577";
>>>> +        reg = <0x1a>;
>>>> +
>>>> +        reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
>>>> +        pinctrl-0 = <&cam2_default>;
>>>> +        pinctrl-names = "default";
>>>> +
>>>> +        clocks = <&camcc CAM_CC_MCLK2_CLK>;
>>>> +        assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
>>>> +        assigned-clock-rates = <24000000>;
>>>> +
>>>> +        avdd-supply = <&vreg_s4a>;
>>>
>>> Just one voltage supply?
>> yes, 22pin camera module only have one pin for power.>
> 
> It's common that mezzanine boards are supplied with power from S4A or VBAT,
> I've never seen a camera module supplied with just one voltage regulator,
> that's why it attracts attention.
> 
> What is a camera module here, is it on an attachable vision mezzanine like
> on RBx series or a part of Talos EVK PCB like on QRD series?
> 
> If it is a mezzanine, the support of mezzanine boards should be done as
> a DT overlay.
> 

It`s like RBx series, does not include a camera sensor
by default.

Thanks,
Wenmeng

