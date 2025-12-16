Return-Path: <linux-i2c+bounces-14580-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCFACC362F
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 15:01:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9E2E305D7BA
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 13:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21AF83B75F7;
	Tue, 16 Dec 2025 13:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H0sQo4tQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CO9OZs40"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B8D3901EF
	for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 13:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765893081; cv=none; b=ZwIVL4/T0u6rsCJvl0FZgm2yBsglSKTJt1fiUrM+Hry72u1CaZlsBsKoPlz9VIoMQr9RQqFBPRP88jsA5iGjKNkQCLbJzUuXury8jYZgLHGSwsXhUuT3WFSO4dD2tl4hD6mufMM1Dr9nIRwpZfjWrzK+h1gMEecpxIJQ8TIWb5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765893081; c=relaxed/simple;
	bh=kqefaEAINqf9ddsXkYYvoPTUSPTPMuBy/+O6QH0DNwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCS3nlNDP6FGlC0fT0tHWsYC/13mnISzHDFtkO7w14xOtVSfdapgpp2QM/jB/iaJRtQ0D0A+GuXBW0D2aK9N8ntze9/DdUv+I/bzOScVz1hVVGcKuACa32vWrydIYXY5owbbEgRGofxuyZEAVm+LkvNoSCoVFmaMms7LjvhWRVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H0sQo4tQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CO9OZs40; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGC3WtD2810423
	for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 13:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	INRsKK1zePcdI3MxN+3hX4QLQffn2295G25DNvsrZrk=; b=H0sQo4tQVbc15Jgy
	yzUdm3FiOBzttSL2D2BWVJ6qw4i7YROcnjirWnndq6pqHGRb2wcAL2Gei+B3Ie0S
	B3xm3J9goHoZQItQV9zI4EZvge14K0NKCO7u/YWgzCW3RXSnIQmed0G4xxsfdDoU
	wrKHXFfl5KZUFPPPNs0X9ahAx1kDH64W4GaThUk9KlkGlG/SjPYDL1UmcVsZ3pld
	MVCwEHzyyHRBDvQ+C8EhgWXmNZuiu19arpnx15B27OM6KEX9YTGkE0sBbZuFJKmH
	jxjxChkn4W5xuUg5/S+YW5o/gs44PpGW+NJ4M89oFdrOEDVNv+b71fQkq5vtZys9
	jM6thQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b32gasnht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 13:51:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0891f819aso12907965ad.3
        for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 05:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765893079; x=1766497879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=INRsKK1zePcdI3MxN+3hX4QLQffn2295G25DNvsrZrk=;
        b=CO9OZs40IhrDCiqIU6Ag94dSmI1yLMQ2oRY3xSb8Ct1r+bNgtvqfXKGaUs148f1AnV
         mEkCE3rxQsoFQZcIaE7IUmLfnOiXEcS/bIDM2Cg9A26D6dSsDaP4AdbOIphfAQjKtglk
         Xh0SMM9zzfD42UFdhAlN6o9FStO/JwqUcQ/eYOuNc4ohuvTT5JvLjUPQhlCMauoWgmfg
         s9k+wiQdi6PHBRhT2t6vqqwbIxzqVIRJ0rMYQASdMh6+ZNMKcOo6tbXnZmVTP2CtZij/
         nHPBrz57OCXvKHpJgP122xjiL14v+x4/w0w8Due3aBY4MPtvmWNwY9I9m1yTF0jrTskG
         cQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765893079; x=1766497879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INRsKK1zePcdI3MxN+3hX4QLQffn2295G25DNvsrZrk=;
        b=RRPEsBqyTjwoOjdvzfexQ/k0RE8+4V0MiIXrPychWMhJKi5GhE1Rn1oFvPVrLmdYjK
         bIP22EGbJUzI8IajvlDRm6COEuguwzA9GujLlY9HKyITj1sN5uJvTMlm9RBvmc9MZ47d
         J0BI+CXnzQbyNmbBFXR1ERnaW5SiNoED+F+sOPrfu3oqZCSY8XC0apT1qT0gx6MYXxbh
         QxFR5fZaFsDAzLaR4MpLQos07e6FdmsI0eP4v3ndMG/d+z0LNH+XOFte8OmLbajVCxcv
         rB74/fOHYqQXwaRZZau8dr+Qw8ETZkSa9j++LefB7EnMO7MiGDIM3jC1edxJ4dUukwvg
         2nIg==
X-Forwarded-Encrypted: i=1; AJvYcCWYlPv+JVyRVCuaudYzeXcBee7IVhM2sfk0Bjzxn9FQDakxpzYpwbpXlePV6ZXT141jaalJ1wU2WPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJFSSlwVgeHvYpVJb51uSh2Am5BqUxBUetPtwldlW1wRml4/HJ
	k6m0mV8dmY9Ds+nY5drLFSsfVDJGziMAUg8UguWIMqEBKybIHAheiaeQKo/2FWGjjDxvXqC4ZsG
	uzz6aOoOJXV5dpoUH6864Z2pIG5Yj6hoW45ROCgwYdfAbfcLLuGu/HJ7F+vh1al4=
X-Gm-Gg: AY/fxX77Puw+WDM3lJqG3cfgUm+sXDMqqGpcKtqbirThgMYZPBmeCQWrLmS/7KFimaV
	m6+T3JfwyaNui4gyblbQTnvZbJSXEx3eaI/8h5TBsH4F9YSyE0mgIvaZmvTtxbW6Rfti4TCjvQu
	QVOVccbHmclsKhywH0BBEsl33yHu34Da/o+CXa0rqyJnWBv8HHHecrqJbUqiWNU1/6h3WQ4SudH
	rEQeSBmxaKXyAghHkjhJ+UEl1zJHnyWHhJek52IBi3ovxpaYvZvNDMnyH1nORkQgVw0UNFbvDVO
	LDhEIUf7P6Ni1bA6nsSvfL4M5mOvA4I0+QghtTTMLuxeArEl18RjYZDcQ51fFgVNS3OLEPadYfo
	p/0HhIsofayXoy9Qwqj8dAKH0AXjQ53MetrwMd0XrykdiWqZ2wOjOUqAJQWHcb4pMSA==
X-Received: by 2002:a17:903:2bcc:b0:29d:7e23:629 with SMTP id d9443c01a7336-29f23807a27mr108321825ad.0.1765893079187;
        Tue, 16 Dec 2025 05:51:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBOq5l2eisqWzuziHOLKqJEQPy0Brj00XHCZuNMqzhum37I6UYsbBPPvOquk5iaGRcXQavjw==
X-Received: by 2002:a17:903:2bcc:b0:29d:7e23:629 with SMTP id d9443c01a7336-29f23807a27mr108321695ad.0.1765893078766;
        Tue, 16 Dec 2025 05:51:18 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2ea57csm1688588866b.22.2025.12.16.05.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 05:51:18 -0800 (PST)
Message-ID: <932a87de-ab2d-4a60-a188-04cc2c00898c@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 14:51:15 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add camera
 fixed regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
 <20251210-fp4-cam-prep-v1-3-0eacbff271ec@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251210-fp4-cam-prep-v1-3-0eacbff271ec@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vcb6/Vp9 c=1 sm=1 tr=0 ts=694163d7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=7PjLcmBxODYuNRU7m5cA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: clTe84e6FdHpSYsEmlT_IHXgjHRZMcWi
X-Proofpoint-ORIG-GUID: clTe84e6FdHpSYsEmlT_IHXgjHRZMcWi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDExOSBTYWx0ZWRfX+ydNC3aPKxVr
 yj7pMYlGTwETGxsN92B+vDIkpHwqd3ukMfzL6swtd5m13yXUmm/2m5NbIR0u4hbjtSKgpeGTfXh
 HI67QBfqvQIbc8Gz33gvafhcS6/MXLtp8jdfOM//gtLDnjPHCt3cx5mWIYAq8NiShvv2MPDt0pc
 2MrdcOkztOuwVMQPVkc4Y+cCNko3SnB3uCNawRXGrXXtQCOE0mGMHvA+/7FWStP3OxqmdVI9HrI
 MJLURqMD0rtN7AEi6X9aJ7x3S1FZCBN5ydr++VugRminU49AgZ/tY8uAFITjbeV/kQHRSAWHWSL
 ffCylze7clRE27nAfFPoF5D6Q8wcZquduExtD35CT1ICGquH6xPZeTZ7W2dVKdEqFOFcZ6uzPmc
 PLoQEcn/rqIdcsPe/XQK5QqvYBhd4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160119

On 12/10/25 2:05 AM, Luca Weiss wrote:
> Add multiple fixed regulators that are found on the phone, which provide
> power to the cameras.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 40 +++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index c2f856a56b2b..0cfb24e3941d 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -246,6 +246,46 @@ active-config0 {
>  			};
>  		};
>  	};
> +
> +	vreg_32m_cam_dvdd_1p05: regulator-32m-cam-dvdd-1p05 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "32M_CAM_DVDD_1P05";
> +		regulator-min-microvolt = <1050000>;
> +		regulator-max-microvolt = <1050000>;
> +		gpio = <&pm6150l_gpios 2 GPIO_ACTIVE_HIGH>;

It'd be useful to also explicitly describe the pinmux/cfg states
of the PMIC pins, since these can be a little surprising at boot

Konrad

