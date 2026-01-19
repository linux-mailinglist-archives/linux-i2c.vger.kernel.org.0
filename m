Return-Path: <linux-i2c+bounces-15262-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A30F0D3A58F
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 11:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 538C93091875
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 10:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F0630E0F4;
	Mon, 19 Jan 2026 10:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNNCX05P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c8V9canc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A36C30C62D
	for <linux-i2c@vger.kernel.org>; Mon, 19 Jan 2026 10:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819351; cv=none; b=ba1hfiGG+t5IkcE1U8qqI/wOQMFdqBkKpVGL01uSd5eZCe+aC09ggTW+1pUNPMJ/XPP54R/U7YMabeoeMnOZTBzXZBkjgP5VCaC8H9RFJMSL5Tz9Z6UzKjTSvsHShlDFO6M0BFydxW4QE2U8r8JnJwKGBybkhuGu4HI0DPcHLTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819351; c=relaxed/simple;
	bh=2R641ZIy/0ksPVXsny3MynG5oLz92O5+Nn1C1IcdByY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cGwqTmRNz9TYd7AWAVs+wd49vXShYVOIhhuKZYKoqcXk4u1+Ri1gFoCgHYS91V/j4OoFCPJ3ar0hzLYCxzVKRbwOHVLJFnZdfjhV4/jW/9JzWXVAiDMMOvmADxZVVyRJul37yCASasauVDmDG+EptMnYaiCclyJOQ290+E+wfNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNNCX05P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c8V9canc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JAJp481531330
	for <linux-i2c@vger.kernel.org>; Mon, 19 Jan 2026 10:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuIe22kbHwk+OgnXV6yFQ/rH7TlMnfgjZttzcIdG1kk=; b=KNNCX05PXmPfDvV4
	SbmxKwqUv6U1TxpOf8r9OVfaPy/RcWM3YF9LGK1DknFBtWSxnUU6G8lQ0+zcUSO8
	bhT22rG5Hn2txX3TKwC0KtlbxARhRkDafc4+XsntZ+wof+h0K5x93zZOGC0F47oU
	Z8YMlDoPnr2vJRh+nVFoc4jVGuq8gWa5XYd7h6gTOpiIapEusDIDWaqzigih0lUO
	LdtEgWzgRdJCZUrrYuH1mCSYoEX20eDFPlXz+9blbKMZTvv97rDZT/td47KMvhDt
	X57HtZvDItglc83Fk6sl8bVWbgQ/IiSXiuT6UScXCU2XN2liII66NziXWJj5ovPs
	F0kb+Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjrxr27y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 19 Jan 2026 10:42:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a182d4e1so105168385a.0
        for <linux-i2c@vger.kernel.org>; Mon, 19 Jan 2026 02:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819347; x=1769424147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JuIe22kbHwk+OgnXV6yFQ/rH7TlMnfgjZttzcIdG1kk=;
        b=c8V9cancPElSNuexoSVGuHbN6baUQEmPSfK6Cvy3DbNlih4zBvUOcM9WTLLASFcKfi
         Uqxc7dP+2biU0Rc4e7b0/HJ0o4XFyO7yP9F8ji6+Mkv3NMp3jGhATCETKdtENXZ02snr
         gmUXWJfwo0kD+lBkt5wdROH9mJe7Z2qIUsbOb+3SwDXqMF5y1YVUE6J/TNxEUQqjAoaY
         9FUp81tzAQuSgTVeCZ93V6Ix5ksS7WvgeVwBB76OXkMs4vrQzE/W9fd03VTufDH+e1Xg
         Xv5QDZGU+F2U75nWuYfYgmoDkRG2hHxQtKQJvasKd9YdrJbu9+cs2Rojo0RA9KCcsnw+
         TV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819347; x=1769424147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuIe22kbHwk+OgnXV6yFQ/rH7TlMnfgjZttzcIdG1kk=;
        b=vV+f8FtT9W1m7eIafU5zEznVl7s4imuvZGSMTDXaiLd/Hhd3qpZWRVFiDsgrxdxN5J
         36UaU4vObuWqieLj2TXiLw/ZEtNWOYcmhPGI9yfKxdoZfgya6VFFBwUc0F9lcCSU5y4Q
         8mscn/a/D2GpmzUtGM7mijj6YlSztZLaZAJxkbiIF1TiswjC4LqVHBj5e8OCbPrM+SKA
         mVjTukLy856KWCfx4wNOtxufq3unvReRuQQ1BH/1F1ohSo9Rvc5hyP/mY+yLki9iJeaJ
         VjMGsAiJON5Xw6aT97fBgvlb2rIvJGTVGnyA/TPydUFPUSmsdQmXFHUqVQHFTXCKDREA
         c9zg==
X-Forwarded-Encrypted: i=1; AJvYcCWlGBoMin4/LglrnPHLQhkg7RzIrXFSdKuozWxkxGFnuw+g23mcEE/RDRby27vZbvvKPKnPJYgChfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIvWerDzXNVkZxbPTYvxvV5LXi0SgwXBW37VSE752TQS3TgkBT
	0bre2W5lnHszyFuH9gVvUH4WtPLVh2Rp/msbS+ZN5Ku1j2IGHPlvJHMA/imlf5GjRW5uYNDDWLk
	2AbQA76L9qdo0SnVJ5RSEFcO7MnS3DTN4c+3x5AqNNzjUeI/SNcJZCMlW7oLZedo=
X-Gm-Gg: AY/fxX7Y7/y5RNntX7Ur3VMQFSPQnMPgbka7wNKcrmFDcsIOSlLnYDgBwLjdfVKxJmt
	9672kXFQTvSuCz+dhAVb3QqGLGESk4TqGkr03O7/dHpVk7AiJ+hv/yXfaMYLkAbhG9H5ReZHPOO
	EL+nwg4MLXKtNa86dUpR+2+sm/g9ZFks5fC38o7d/wcHhcJeNl/YcW7SaIsTObSKmxa3hZHRMAF
	Rvv9EIzoiVC30SSNW5SYnQZ/OqYIQzqQHjcM/pD29GVWn7GcdhanJZtcrrVykdASAEdrAc6ujXW
	DzYVdVJJ+0yqyd/OxgJbqlBH1fuOiQYZNvs5AGKYFfoNtHuA6gLa5jhygwvZ9MMcaxDSDG6LVAL
	nSBloH1A1mntTPxB2xSm/92ciCu/KpS/PcsRkkaNnCVmNsdGK2FMD92GjYPYf8+M65A8=
X-Received: by 2002:a05:620a:700d:b0:8c5:305e:ea16 with SMTP id af79cd13be357-8c6a67ab9d5mr1086075485a.8.1768819347432;
        Mon, 19 Jan 2026 02:42:27 -0800 (PST)
X-Received: by 2002:a05:620a:700d:b0:8c5:305e:ea16 with SMTP id af79cd13be357-8c6a67ab9d5mr1086073885a.8.1768819346978;
        Mon, 19 Jan 2026 02:42:26 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9f8dsm1062421166b.36.2026.01.19.02.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 02:42:26 -0800 (PST)
Message-ID: <44f65bb6-616c-4dd9-a7a1-ee62d5d217cb@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:42:23 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: milos-fairphone-fp6: Add camera
 EEPROMs on CCI busses
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-4-28e01128da9c@fairphone.com>
 <ae73eac1-4e27-404d-af73-88eed699db0b@oss.qualcomm.com>
 <DFQ3MBO2EAYF.1PRF2111N0U1I@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DFQ3MBO2EAYF.1PRF2111N0U1I@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfX0XjpI9f9F8Mh
 tnntyWz+t8d3n2AY2lQnwhUxxxgRG1a+rO4KooLX6/cTV4PonFXiyRtla2bh8Eqzk9BPVuPmfys
 k3+c5FZG+A8ef3iZtF0tiW8N6kK4bubtcwNU4MfO9MktbD6NDp5BPd7SJdF4bOu8d5sCCcQdsXW
 Zz1owkOMStcE4cbzBXGlt5Wvmq9Rl0SG+BeX158YXwV+FJPI4K6DzpBYI57GjP7IJhdy+KO1cyh
 F5CpsNxkGJHGaTj0Y7wXddJX7doM/4mqyZrYPVLjx50AT+SDuRAicDHpyqmJfCs0T5ry/DD61Jl
 LgzJ5ppQMmG3cTAT/+csTtKe3mMjQO14pt0TUaPNjZqFUO/uOEwqSL9PnXstpdNi6BDH8LRjJrK
 wRNN0tlA4jT73B+kF0IYNVky8nkJZRt3QdgI2i4bPEqM6ZTKtBF7DhXLASdjjGKDDtR2fgATY5K
 l+95FCAhcCHtdeldW7Q==
X-Proofpoint-GUID: T6LCx-dgGEuC9skNrsx9Gzx2sL85niFF
X-Authority-Analysis: v=2.4 cv=PPUCOPqC c=1 sm=1 tr=0 ts=696e0a94 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=nLAr1RRQX0DeaXQ0ftAA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: T6LCx-dgGEuC9skNrsx9Gzx2sL85niFF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190088

On 1/16/26 3:54 PM, Luca Weiss wrote:
> On Fri Jan 16, 2026 at 2:59 PM CET, Konrad Dybcio wrote:
>> On 1/16/26 2:38 PM, Luca Weiss wrote:
>>> Enable the CCI I2C busses and add nodes for the EEPROMs found on the
>>> camera that are connected there.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 50 ++++++++++++++++++++++++
>>>  1 file changed, 50 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> index 7629ceddde2a..c4a706e945ba 100644
>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> @@ -529,6 +529,56 @@ vreg_l11f: ldo11 {
>>>  	};
>>>  };
>>>  
>>> +&cci0 {
>>> +	status = "okay";
>>> +};
>>> +
>>> +&cci0_i2c0 {
>>> +	/* Main cam: Sony IMX896 @ 0x1a */
>>> +
>>> +	eeprom@50 {
>>> +		compatible = "puya,p24c128f", "atmel,24c128";
>>> +		reg = <0x50>;
>>> +		vcc-supply = <&vreg_l6p>;
>>> +		read-only;
>>> +	};
>>> +
>>> +	/* Dongwoon DW9784 VCM/OIS @ 0x72 */
>>> +};
>>> +
>>> +
>>> +&cci0_i2c1 {
>>> +	/* Awinic AW86017 VCM @ 0x0c */
>>> +	/* UW cam: OmniVision OV13B10 @ 0x36 */
>>
>> There's a driver for this one!
> 
> Yep! Already got patches to add the required regulators & devicetree
> support to the driver, but since I've got zero on CAMSS so far, I
> couldn't test it more than reading chip ID.

That means the digital part works.. I'd say it's a good enough
indicator

>>> +
>>> +	eeprom@52 {
>>> +		compatible = "puya,p24c128f", "atmel,24c128";
>>> +		reg = <0x52>;
>>> +		vcc-supply = <&vreg_l6p>;
>>> +		read-only;
>>> +	};
>>> +};
>>> +
>>> +&cci1 {
>>> +	/* cci1_i2c0 is not used for CCI */
>>> +	pinctrl-0 = <&cci1_1_default>;
>>> +	pinctrl-1 = <&cci1_1_sleep>;
>>
>> Let's keep them per-bus-subnode so we don't have to override it
> 
> I don't see any upstream example of that, would the pinctrl work
> correctly with that?

Hmm.. I assumed it would.. and I assumed we do have examples but
ma-a-aybe they got stuck somewhere in the review purgatory?

If you'd be inclined to test that, you can add a pr_err() to e.g.
msm_pinmux_set_mux() and observe whether that changes as you
interact with the sensor over i2c

> While this isn't necessarily pretty like that, it does work :)

It's the right thing from the hw description standpoint.. we have
a huuuge amount of peripherals that fight for the same sets of pins
(which is part of the reason why you can't turn on all 30-some QUPs
by default, and depending on the function+QUPindex combo the pin
requirements differ)

Konrad

