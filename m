Return-Path: <linux-i2c+bounces-14951-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD96CFC1FD
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 06:56:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB84C302818A
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 05:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B675D2641E3;
	Wed,  7 Jan 2026 05:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MVSQ6MxO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CDm3kqhH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B61253958
	for <linux-i2c@vger.kernel.org>; Wed,  7 Jan 2026 05:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767765339; cv=none; b=dffIqUVtTUns3WT/jWIu4JzEDdfXWeydEfglcfq+PQuwfcMlGKCa9b2vTjPbLppR8w6tB8HQIVifq7YBy3BnGNn0WfxJt3EWf8cWOmeRjJVZw2cv//ysDlblFG6zeH9xwNtU6Hll892feP4fhfXZbpN3iSKO11tfW8+ZgiqR3Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767765339; c=relaxed/simple;
	bh=ajQwZ/LzxLqpctIDxzAewFSle0iQFzYAz8P0hw0+13M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=myVEUWWpQMWCba8eHKpGA1I0OWLEEdDXhVZ1j6wwKP+U+ESLOCMMyt3QH0i31TAK/beSayZJbysREnWRKzJcScDR4A6CIxAQROofi80z2dBePHe/AJuhc+qtYyN7bqRReYMW/oYgNHzRzKXdv0sG2aXptnXU/YpMsfnsPOyJFE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MVSQ6MxO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDm3kqhH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6070AOZu322873
	for <linux-i2c@vger.kernel.org>; Wed, 7 Jan 2026 05:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	er1TnH0vnBAkpPLGNXZ6F8aqsczeGg4g5uAkB5IxfcI=; b=MVSQ6MxO6sZovrEx
	oc5LIrGX1/59PN9ymXw3IICyQcNFaXRrSgYZv8H0ie3Y8JqY+WScbckHthUxWHXh
	BPKwNJlexiztd+uQmFtYk7PrQJs3KYzkzaGBxb2JzcYD6itW/wYhjkvWqFi5sROZ
	gK0bTpV8EKmoPCvlSmu2N4vfFY0EwvRxBNqD459n8OFA9KReDSAmq6Piu2bxv4yb
	wE+Y6AYX3lHCG75z5bEaSsw+iADJH7obtRgf/VrBxqa6M7ZDyOaXJ+d5BdlP8l0D
	Pus3kRVw6Xm37UlFcPGYFE6vOAdOVly8T5cM/ttsvizwKXcmhHiHCBhibjMH0LTD
	BDGtpg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh4crjd66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 07 Jan 2026 05:55:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8804b991976so44203386d6.2
        for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 21:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767765336; x=1768370136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=er1TnH0vnBAkpPLGNXZ6F8aqsczeGg4g5uAkB5IxfcI=;
        b=CDm3kqhHhJugEWKuJCCISecNd+JjXxXJNDpK6zAVEn7JNkIN+aZt5spvY+9o1mnKVb
         fG4AiYKIR/C/UC9x96QvgsHbUIeS+yK8f10MqKBXI/k1B3gwlc249HsNCPBoIBidyzTO
         f3gP0qDgiTE+docMOrTJLsCflNEFhr7+sTGqylQYcOPLrkpa3IXnmyWlo8ivec/POrzy
         iaIKS2ZOhliEID91W+okf1xsN+NKISQjEGVGRhFwQt7yvFm9KPjPOiRE9SeELHgy9brr
         KeAN6ODKGLbTJl60gPj9DprSbSn0ilGSbjBBHA+xrFz4a3AB8/wMe1QOAKbTYpDl++Ny
         P+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767765336; x=1768370136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=er1TnH0vnBAkpPLGNXZ6F8aqsczeGg4g5uAkB5IxfcI=;
        b=W6y6JiIXt2r2RgPjmCI0KO8LttDO67XqeLJdlWvzdvf8HkG1u/gA8+Y45J+zHhVD8m
         Kkkjb1WQ5YuyQmOVIrgFx/spRD7nKrH+2JG+6zD3vwJpdCvNXrw5330hCvco/DO35fPG
         hAYEOrYKiCQJ+54uK/8//mUgFTq4wbE34KWq2slnnkgSZCCBbriRCoXiVfLCuGS8wMnQ
         HNnmxWDXnkHSIRuMALGpKJiJGH0//61yyOTMIR8mXz08VE3REgWpzYbFi0zjPBMlODMQ
         rDy59HHZRoeZufYx66c0AhhjnMB4FEw102v4J1xz6bBG/wO0xwg+jfxojzW/f7mleAVm
         tWjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3K++nmkldx9dqLePpi/EgV9pNUUGHC42NZlpBHqOyPHI06j9jk/wav9jrGcKSgkYMQvXXbEzy7ZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJwdk2ePNB4f6UK6MGJPrL3kapMv5tCb6C5nJ5hjXaOso0Tbf0
	5YqkjrI2LNbHqXgJziRdNkvSEZD3+mEnKuJa0PWrbFX7R2tXFoP5iVqMmhczRwaslvKkxlWnOLq
	g81ehS6/6qKFcjxQKZ0TH5KUS+IAm0nZNV1yA8x8n9QeVDWz+/DR+Xjx8t4tsJCU=
X-Gm-Gg: AY/fxX5lpkSZROW0vyXr7rqxDkSKZhWqwj/Q+d9e7tOABcKeWdBU+bwTbjePtcHpgZI
	Ktmacw0WYIvqEAdnXlEjeVRYSW+CYBRvk3iNLWmQ6KvUe1Df1+caJEKgfad8a6p9rgRCr/8Ajwa
	MNaSshMT39otJI7I/11RJwvB8wnXmttULQPy4EqEzsuAFi+xVjBHCBR/NUrW9FO0SyBoim5rhW+
	FLu2cQGFECpEKwNfMBN+lqwT0CgjbA6CFAeykbqSXxJ8CrLFD7qcdG/fXEz829O3zO4yqu5pT0m
	iggWO4/V4oSG+sVAoWrLKoKNpADult0BjWL1iqKChSNrPMmBajqUGuH8hqQjahRFp6Ybj5A00SG
	fJulCL/ZaAXc97fgMwNGizE33VaQ0ttBdNn+sA+fIiMyN9Zl7/ei5fuhvjoe+molbLnGduTwN
X-Received: by 2002:a05:6214:3109:b0:880:5851:3c49 with SMTP id 6a1803df08f44-890840e46afmr18081936d6.0.1767765335830;
        Tue, 06 Jan 2026 21:55:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGId3S6qgfVCmVX9I4t7HNwXWrG8zNNbcqsDGTUcKogjqRiedSS4NBeYruM6dqNkd9MGNhRbQ==
X-Received: by 2002:a05:6214:3109:b0:880:5851:3c49 with SMTP id 6a1803df08f44-890840e46afmr18081696d6.0.1767765335437;
        Tue, 06 Jan 2026 21:55:35 -0800 (PST)
Received: from [10.38.247.225] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e91d8sm27388856d6.22.2026.01.06.21.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 21:55:34 -0800 (PST)
Message-ID: <3a8e8327-1a55-4822-885a-86fec029952d@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 13:55:27 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
 <ndexzb5bo2rxjsj7jkf3bevbb6vmtjpuuhxbonpf3v5csxnjtu@sotufkkvfc4r>
 <f09670ed-1aba-4622-94b2-85ade831f7fa@oss.qualcomm.com>
 <e91414c6-fc89-4b38-a5be-f282c8601b5f@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <e91414c6-fc89-4b38-a5be-f282c8601b5f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V9FwEOni c=1 sm=1 tr=0 ts=695df559 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FqtGTYOm0bbIGPRGAl4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: Hg-aRm4fI_tL7E0K1R3XlDolFgDQE78q
X-Proofpoint-GUID: Hg-aRm4fI_tL7E0K1R3XlDolFgDQE78q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA0NiBTYWx0ZWRfX9MqzwHz+v0mc
 Ka+EwHEWWz1pRfef4m8CRxQoF9Tv8Y3OD0cF5zTok1g/9ryPMKq+Ixvg+uWSyC2gb6Co32vAoGi
 B5QvzgSw4+BCkt7XTMdBsnaMqmbd5jj1xIb0tpnfQJpq5Octgm6E+u0ELOXB3gj4eptC99hQjDl
 Rp8p6A0eGyVNHU3Z0lDUu1KDcd+A6QFZyYJTTA40jnHR6Yk7KHqGPipQdN3AdlGPqQCXf8cjzae
 +nm5wEPPWkn6fAi+hFCie9RMbTimnRHs8EpOe6X5J6CXI8XDNE4Bx0fDDoJyD1ZuIbtFPWb1tKA
 yZFGaz/SuIM0SuGVKuvSfbeRi+zNqebWDG2DsxFFDDF4tIWtc8zYC5/NthLUZ6egq1/eCzUPUeF
 inLzCGnHgHg3IaKIHyLNZMNyFZGX4lgf09+WnPTBpRCXjLItzrUIOkGZYT7iuw/gkA7ls1rxCK1
 lWYNcF3SEmrfOuND8Kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070046



On 1/7/2026 1:16 PM, Vladimir Zapolskiy wrote:
> On 1/7/26 05:05, Wenmeng Liu wrote:
>> On 1/7/2026 2:23 AM, Dmitry Baryshkov wrote:
>>> On Tue, Jan 06, 2026 at 05:39:56PM +0800, Wenmeng Liu wrote:
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
>>>>    arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 63 +++++++++++++ 
>>>> +++++++++++++
>>>
>>> Is it possible to attach other sensors? If so, overlay name should
>>> depicit which sensors are attached (compare this to the RBn boards where
>>> specifying "vision kit" defines all sensors attached to the device).
>>
>> Okay, we previously had a discussion on this. I will rename the file to
>> talos-evk-camera-imx577.dtso.
>>
> 
> Other camera or display .dtso names commonly repeat the name given by
> the vendor, and the bare minimum is to name it the commit message or in
> the code. Is it Arducam 12.3MP IMX577 Mini Camera Module or something else?
> 

I believe that modifications for the sensor do not need to include 
Arducam descriptions, because this DTS is intended to support this 
sensor module. Even if it is replaced with another vendor`s IMX577 
sensor, it should still work.

Thanks,
Wenmeng

