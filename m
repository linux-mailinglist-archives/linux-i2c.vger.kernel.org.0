Return-Path: <linux-i2c+bounces-13599-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A06BE5783
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 22:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F207F356BDE
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 20:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B23B2E1C56;
	Thu, 16 Oct 2025 20:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WoSA+VSd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B995827464F
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 20:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760648039; cv=none; b=ZslLpJnHEgsmJAlEuab7FWiO0L75ee6tOxXqzh4idQuAxQWl9beRG6E/eiAZZ7SpO6iJheyLcDN725ZxoHqzIpFLxXQHC/FQ20ZCozYyh4usda5svyVJwG11t9UerS674gfoX5XsjK3w5DOO9HQD3qIJn6556df15l/L/tBlQx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760648039; c=relaxed/simple;
	bh=Udrnr7zsByH6KLjxhsN87MtBRxRelXCMBoWGB9rkoA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nLU/+ANxGKwNS7pZSnvB/sEHkIWQaF+dgTxSKa+xI9EskI3XPD7o6lPeQgk4/WJWleqU4zzVAeLoWT5w1MrtyyhiMdUvOWLOUpT6uxmGuOSf8QVmG/QGJ98JgMA8Ud9s+f7fvRj+eCg6RTk3yyoRCiymOCIriD2T7WMGhafpSFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WoSA+VSd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLiBR020629
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 20:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgCMtCx/K6Kh3F2qwSWRg2l/1DtLN3DnQEQF5tPebn4=; b=WoSA+VSdSjUJHnHp
	LjcPcFFX1wSHqk2aoYJUEQP7lqW9pIDqIup+8BYFRJM1NSOpU6iE0TDKrIXIYi0w
	Iwue59i5og604ngqx+vRxzLlREltlDMjI0Pj3j7Vc/GICCBCNA2BRITIz6NGy8mE
	X4hXDjABRaudRVl7ZNBRPpEyqTc2Tyr0Df7IBJZAxaOmlqMRI1GZxp6AnyJZgHGT
	mk+PyMjPlWBI4SoRR4zD0FKnZzTFtG2lZWJVQ3L01jfvz4zUd4q0oNKzbQJh7zZi
	schHlzb2VgvHN0aAKDeiGsWIkZrI+pmcPLMzdC3RMVVDy/EfhPBD1HpGe8UNDVEU
	fTfTQA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8rer3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 20:53:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b55443b4114so803979a12.2
        for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 13:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760648035; x=1761252835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qgCMtCx/K6Kh3F2qwSWRg2l/1DtLN3DnQEQF5tPebn4=;
        b=AyNzsiOnOQFVMButQWrYfQXHSJG5oNXH5Kk59npX75yqqzbyKHHrC7MRuUNtJRGOXg
         0lkxEdnLwgElqvdbWTRDtP4iNJTPksD2m32OsCEdjMZTAPdHg1G0DVTdmmMHYXtLxsRm
         x/xI5/VoVruNkHCyTnu5/DkxZvYX8XO6GwmxVN5vbwSxTe9bE2Znn+boNXOyHON5PiOi
         ZNTOjslwpfJrBupG0DAQJHEfYZ4oaoMiWL/0W5mPpSHtXGXqTRPIXSlcwElWIwepRzEw
         TFmGwoEd5J06+vACh0KYi/42UnP222oMF/401mOneCZuwYqOpndLqEoHJyCylxFcq1ma
         WTdg==
X-Forwarded-Encrypted: i=1; AJvYcCXaZO+nefQ/+A/IHA4mVmyQDcZAEMJ6xysIMBMoj5qCE9lJPGyVUCsgZBEQkiEg6rfQMYJnDPLrKBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRZEC7wFQ8Ju9Jbzc6I2uEJjr+zE/td7Gc/8sz3dzoCpnmS29A
	cmWC7zzD2xyRpqWLfIpiV6ELgekYIS8uuiLkEijcCzcAEnmsK3HCIQeJfAsor0dyXcTVJPfSHzn
	Siz9UECAjzuWfYKdnjLhuSrZt5OJsB3oDsmaXQs3IF5gLOaz0YkWrfmJBowZNopY=
X-Gm-Gg: ASbGncvTTCtXQKTC31VkNFcLsmlHo+p2I6rpj7HMXeFmk7XfUBZqyxedHkqtl4TIUz5
	DqY53PBmM966MuCMjdkpJJExl9SqY9HjZZmxIrxl+3yCgzooHrp5rKcEXNKA0qOOlkXRGAURiyi
	e0zr5S7Oax+UZyDGwRiSAtIwpyc3EQstCo+wUXruLAYfx12jidBlPPLOQXLB7VXWtiJ1J64uy7Q
	SpTisN+Ht3gbrz++vWNPh4tzsRDf94WbZ0eFwHjTkWAjFHoPYsxOKacFVBOp7zmhrCj0+DjYzoE
	d9fy2jsgzqCFztnsSiShCd66jQUIx9+993TShxHruoMnT8cCntcvseGI3T06PPNGN31NLEWdOvi
	YCeHdmlr3rVa2pZ8cy6hre4uJTacvUch2bhRlsOPY1KQxvbVnn+hV1Q==
X-Received: by 2002:a05:6a20:a10d:b0:334:96ed:7a75 with SMTP id adf61e73a8af0-334a857d68fmr1493407637.24.1760648035340;
        Thu, 16 Oct 2025 13:53:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5mRGSF6MOY+KE8kOcpaayw5EGAYOyEe+RBAIZ8AS1gA8vmlY9wRA8SywCGt3c/wiwBmt+Gg==
X-Received: by 2002:a05:6a20:a10d:b0:334:96ed:7a75 with SMTP id adf61e73a8af0-334a857d68fmr1493364637.24.1760648034883;
        Thu, 16 Oct 2025 13:53:54 -0700 (PDT)
Received: from [10.62.37.19] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a22bd473esm3767155a12.41.2025.10.16.13.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 13:53:54 -0700 (PDT)
Message-ID: <ab43c5c9-edc5-459e-8ef7-2aa8bec559c0@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 13:53:53 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Enable setting the rate to
 camnoc_rt_axi clock
To: Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
 <9984bc23-05ef-4d46-aeb8-feb0a18e5762@kernel.org>
 <bc0caeb8-c99b-4bef-a69e-5ce433e6b890@oss.qualcomm.com>
 <c4fd6bfc-cc9a-4f37-99b3-f36466691a1e@linaro.org>
 <CAFEp6-2=GJL-gc+PSyAL4=prp_sXdZJS=Ewg5nP2kcp_Gu85Fw@mail.gmail.com>
 <33513b43-f6d1-4c76-887b-39611a75e1f4@kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <33513b43-f6d1-4c76-887b-39611a75e1f4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DFvHK97ehbAgd8g1BCxF5_aPEuQlCeSt
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68f15b64 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GlW_DMp2rsBEHzm2z1QA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfXyoz9LdwjTNAn
 cWH/LG53VaG1UXep9H1Pd8k/TgQKpUdG7KD3uR6fxkly7pA5lXEMa/Xinvh66tOApcxG1JxvnU0
 EaT8a/nFvPNr9xr/hmnEap+XiT0y6RyXbLxuGvJtE+cpewz2a/Osy6Gh9v0S9Z/f/PydPFi3eeE
 X7WsO0CpAtB+JtJi7uSURm/OPhZGQjIvL7G+QSN/eBGx4iXocCJgpl2szD+3AWNOArEje4ApQLZ
 6Ka44GbaIrIoT5vNvE7TbSUzy4id6orv8MuHogzWEEmeODHgEcNxyDXZxF1Ns0ETfYMmLLy/QG6
 m/RqVdU6HqjG9iHoqB/wk3AK/Ss3ysecdy99LyHPuHhMHQA45eNLOZVHa8PaESRTh+uXCZMQ6CT
 int21wOHvO2QMXm8ij0tu/yAe6AfBQ==
X-Proofpoint-ORIG-GUID: DFvHK97ehbAgd8g1BCxF5_aPEuQlCeSt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134


On 10/16/2025 8:31 AM, Bryan O'Donoghue wrote:
> On 16/10/2025 13:22, Loic Poulain wrote:
>>> I'm - perhaps naively - assuming this clock really is required ... and
>>> that both will be needed concurrently.
>> AFAIU, the NRT clock is not in use for the capture part, and only
>> required for the offline processing engine (IPE, OPE), which will
>> likely be described as a separated node.
>
> Maybe yeah though we already have bindings.
>
> @Hangxiang I thought we had discussed this clock was required for your 
> setup.
>
> Can you confirm with a test and then
>
> 1. Repost with my RB - I assume you included this on purpose
> 2. Respond that you can live without it.
>
> ---
> bod
>
@Bryan and others, sorry, I am just trying to understand the exact ask 
here. Just to add a bit more detail here, On certain architectures, 
there is one CAMNOC module that connects all of the camera modules (RT 
and NRT) to MMNOC. In these, there is one 'camnoc_axi' clock that needs 
to be enabled for it's operation. However, on the newer architectures, 
this single CAMNOC is split into two, one for RT modules (TFEs and IFE 
Lites) and the other for NRT (IPE and OFE). So, on a given architecture, 
we either require 'camnoc_axi' or 'camnoc_rt_axi' for RT operation, not 
both. And yes, one of them is a must. As you know, adding the support 
for the newer clock in "vfe_match_clock_names" will only enable the 
newer chip sets to define this in it's resource information and set the 
rate to it based on the pixel clock. In kaanapali vfe resources, we do 
not give the 'camnoc_axi_clk'. Hopefully we are all on the same page 
now, is it the suggestion to use 'camnoc_axi_clk' name for 
CAM_CC_CAMNOC_RT_AXI_CLK ? We thought it would be clearer to use the 
name the matches the exact clock. Please advise and thank you.

