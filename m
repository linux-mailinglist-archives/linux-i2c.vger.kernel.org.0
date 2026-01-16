Return-Path: <linux-i2c+bounces-15221-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A8CD2F41F
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 11:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7370A306D283
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 10:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9995D35FF46;
	Fri, 16 Jan 2026 10:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8h9QWn/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LLB0kJfI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A3123BCF3
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 10:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768558008; cv=none; b=JRW0WWE/autS2Q4idykcuskubqjsv9JNz0gjYl6zr0PWu1+pwoGHvfYos+bh20GLcc44ktEjUXWTQv3fpC/BXvMZFtW7XhFtTPh3VRJVAG+HjKaG4jINHUcBhmxw+pguMctWPtl0+l6cruPgrc+DOruTNzsAbM8xSlWqln/FIF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768558008; c=relaxed/simple;
	bh=igkt8fixT/8eDhWnZxamzrdyWD6tcE1hvaTJJ3Tckkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b4QBF1l6ZGMpkCAEXwv81jZ2bZn4Vqs9nYpD1n7GhssWqBrcLZgxfwW7jfwJW9VTEDLzXTK6yxwTTpJzAAzk4rCB+UsBM2IHQm+C971limG84OyWp2R39Zg8kRieOziQZO5JNE1wYzeVSLdKtprOg+OyYz5OnVn3yzG4vCVez2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8h9QWn/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LLB0kJfI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G7uvYd2819062
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 10:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V4oVVsla4+xBFjzBi0ugNP6lImplJ8evffrnYHm8c7Y=; b=b8h9QWn/IvMr34f8
	hkWLUbJrG+X8xdGywFSRk9UyiXZbk2XhJu2NAg74C3AY4l2fOkILpp+gpTYkvNeD
	izb1a1ShnfbJYtYaRfjlIen2YGQLpCLExTuvab4lzNpXaR72bLkMCvKI+6Nf0HZO
	aW1acb3Y2wWTDFNNJDwugPl1TyyXg6EpexjcaCh7PWvC/qAfmAfy4fCzmCLAOcJn
	fDbRcDMk2TPa8nVVsq2FMt5q60dqkNlPJwF8yN9QLdgnHPC7q69+NC6woHFVhwIq
	Z/Jv8WItIK0nEjIcVRTsOJf28pbBxKTrTy+gO0rPCdhaUm8oqu6Odu4TN2pYPTkh
	PalPXA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq99ahr4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 10:06:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a7fb4421so116341385a.3
        for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 02:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768558004; x=1769162804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V4oVVsla4+xBFjzBi0ugNP6lImplJ8evffrnYHm8c7Y=;
        b=LLB0kJfIUJIbe0TP7aOYzgWOY9qMFGfr0xYmoorB7GplEmslMs5JaSuPnyIQt+r21p
         jKAM4DXoodKFjI7qnwBoSFfgmLTS36jCoFkHMwEVmiDOG3/wGsAA/Gm82Cfn2oBe13Bo
         WfRJMSiwnOH26516LyPG/PHO42R/uraj+DRRaFh39Q7j2RuHY3fQ/TxMhsHvyZOz7rA/
         XGK76pzucJq2dH+0GOlfV6MpxUqyFiymTOxvVejhxrSjbwAQ+yBO6MryNM9ZQQqllVY/
         MhrAGpDkWOQG7kjL/8yL2cExgOVWKNveCfSV3JL4zwW3GJEcs1UV0XNcSzFYu/7o6nJJ
         2U4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768558004; x=1769162804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V4oVVsla4+xBFjzBi0ugNP6lImplJ8evffrnYHm8c7Y=;
        b=gZ/RvKf9DKL+MBhjrG5SzJ8lBFA3Y6VRT9X4VztYSpQtSmbuauIdXTqZdgrPevQnvf
         3WqOnNFRbDiSk8KNjjDGJePiz5DG8LgDQBMfCgBfWDD6oL1Puckal6ksyGkIv81uQxZH
         Acg4BjVh7FX0FnDR2PgNTAcY9a1AeuaoH0pL1+v65Woh7y/n7KI6AGj3gZ69pNUQkmfC
         nkdxDX23Gpk8oJrZyly/6WpAJnolZfsjCncMsqtmBDRdvii7DYJJ8BnwvLIfgrNcPK76
         sKbD2lGoQIMjFSwx+d66fbevziyHhAair44KQUvk48groEx56LHv3veB1/8YGUSiNFT6
         axtA==
X-Gm-Message-State: AOJu0YzEe2dbxQDWkwXPiMVYVs7tVgeHhxyvAXvCAzc7UdCsVp/8OeB3
	lZjm/T22K3uT+aIa/9Uzkvff7UOiBsccSFpwrCE95+h8G5Yhazo9wlkb4C7lzA8IqAm/pmaypr5
	WHUa55Zd/PCj73VQTRPJ8ApMkuLf82AKG2waMkZD1oEQsq4W8v3QQ4VJOhnV1Ons=
X-Gm-Gg: AY/fxX5Fu3OfDcTvCyJNMaVoDvxtIauxicxQLw+JADYbsJVKkuoyztqX5C71G/0fSin
	FXkHxfpd3EBcHK0gqb68+UlnJQirNsWGjghJkplHQHbHwLBFbdwdfoj0cheHG7mmniLq4MtnQ/V
	j4XtCa9u5Cj9+QqMz29FZ1q6rU+KwWLbZNeUj5J6QL1Qzs0Ux9rcPrTD6KIQKNNcRdG4TflWSmQ
	nNnBwVpYMMM3wZJ8Qdtjf1hnnbYjyGnCjWb0cPaq1YYSgEaZOm8gilRxcjIWw5a3hD4OkKWaei2
	iWhbMd/5EOnluI+U7uBQ9lhtjLxFTy5CfebN70ZK/ZolxEVCR98MH/meh0Yscv74giQ6oQXg1XU
	LR0cM59bxsKTUCK9asFBJ0K+gzA75aTH7cBmEFvJJvS7OFyMJa6+d3wLuSwfuOeFG+VCfijEj8A
	==
X-Received: by 2002:a05:620a:2913:b0:8c5:f67c:ce34 with SMTP id af79cd13be357-8c6a6700a5emr282383685a.39.1768558004440;
        Fri, 16 Jan 2026 02:06:44 -0800 (PST)
X-Received: by 2002:a05:620a:2913:b0:8c5:f67c:ce34 with SMTP id af79cd13be357-8c6a6700a5emr282379785a.39.1768558003879;
        Fri, 16 Jan 2026 02:06:43 -0800 (PST)
Received: from [10.111.171.115] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71c149esm191212785a.18.2026.01.16.02.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 02:06:43 -0800 (PST)
Message-ID: <f84d7a9e-2925-46ee-91a5-eca3ee68f478@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 18:06:34 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <20260115-sm6150_evk-v3-5-81526dd15543@oss.qualcomm.com>
 <3b16ffa2-1580-426c-aa9c-f377d913d49c@linaro.org>
 <e27deffc-bbcc-48bc-9e4e-ce52698d98f3@oss.qualcomm.com>
 <e081fa74-9e0b-4e54-a51d-eee97ae6f4fa@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <e081fa74-9e0b-4e54-a51d-eee97ae6f4fa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Eb11muhObShPUD6bNsnvIDWhsCXoMs3-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3NSBTYWx0ZWRfX1drV6Akqb7pu
 t7a7oZHglAC9osLyMmLflEMQrlkr3O3tGRm9X5CrTIs4PWhHiu0mw5tYlPlgzndXdlqSix/R34N
 ceGKHDFurU029ATEXpsg8r71ZzTQ1NSrmHdaYL9xms3+QnYIi9QvA17MM/2lV/BVZGYyM5F8eFo
 lJ4tRF17uA7ZqEqUYrDjABAsuvQmqYeOJn31lNJwhmoVjGD3+9J1OA8vcXm1TRMWkVIIxnD6hWK
 WNOMH2OroKJZxbvVuuMnl6Gf8gHiS5jOJ113Sr/rwz5z1Ge8k6AJ66gu2ZbmJS8oH9LuNj83u53
 ut4/BCYY4Rbw9++Z4KJ09IG4H8jBxt3TPyWvQrBSBgt9rca2NC0XqpXoPoLxPEmOsrGD3MOmovz
 w9O9QGH3Cgb5Rlp37qheKYFKMXsPWBsKt+BH0bIf5Mw/z7Ri0azxlvIwtOLIw10ilavkVYesAwg
 GdmGWDNo+olz6ydnzPw==
X-Proofpoint-GUID: Eb11muhObShPUD6bNsnvIDWhsCXoMs3-
X-Authority-Analysis: v=2.4 cv=f5ZFxeyM c=1 sm=1 tr=0 ts=696a0db5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=XwWqFBnoW6hE9qul-A8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160075



On 1/16/2026 5:42 PM, Vladimir Zapolskiy wrote:
> On 1/16/26 11:32, Wenmeng Liu wrote:
>>
>>
>> On 1/16/2026 5:12 PM, Vladimir Zapolskiy wrote:
>>> On 1/15/26 12:12, Wenmeng Liu wrote:
>>>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>>>
>>>> The Talos EVK board does not include a camera sensor
>>>> by default, this DTSO has enabled the Arducam 12.3MP
>>>> IMX577 Mini Camera Module on the CSI-1 interface.
>>>>
>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
>>>>    .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++
>>>> ++++++++++
>>>>    2 files changed, 66 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/
>>>> qcom/Makefile
>>>> index
>>>> 00652614e73582fa9bd5fbeff4836b9496721d2d..be9aeff2cd1555bc436e1b8eb78d8e1c9b84f9c4 100644
>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>> @@ -339,8 +339,11 @@ dtb-$(CONFIG_ARCH_QCOM)    += sm8650-qrd.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)    += sm8750-mtp.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)    += sm8750-qrd.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)    += talos-evk.dtb
>>>> +dtbo-$(CONFIG_ARCH_QCOM)    += talos-evk-camera-imx577.dtbo
>>>
>>> Please remind me, what does dtbo-y Makefile target serve for?
>> Rob mentioned:
>> https://lore.kernel.org/all/20260106192609.GA2581379-robh@kernel.org/
> 
> It'd be better to ask Rob about it, I suppose that the concern may be about
> a missing in the qcom/Makefile mechanism to build standalone .dtbo 
> artefacts.

As i checked other platform,
dtb-$(CONFIG_ARCH_QCOM) += talos-evk-camera-imx577.dtbo is ok.

talos-evk-camera-imx577-dtbs	:= talos-evk.dtb talos-evk-camera-imx577.dtbo
this compile only, will not install *.dtbo.

> 
>> I checked, dtbo- is not an upstream usage, it will be updated form
> 
> Right, that's why it attracted the attention.
> 
>> dtbo-$(CONFIG_ARCH_QCOM) to dtb-$(CONFIG_ARCH_QCOM) in the next version.
>>
> 
> But...
> 
>>>> +talos-evk-camera-imx577-dtbs    := talos-evk.dtb talos-evk-camera-
>>>> imx577.dtbo
>>>>    talos-evk-lvds-auo,g133han01-dtbs    := \
>>>>        talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
>>>> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-camera-imx577.dtb
> 
> it's already here and it was here in the previous version.
> 


