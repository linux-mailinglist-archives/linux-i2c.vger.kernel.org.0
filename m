Return-Path: <linux-i2c+bounces-13652-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D65BEF2F4
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 05:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B9B03E285C
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 03:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C862BD031;
	Mon, 20 Oct 2025 03:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bxEBhXs/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7127F29B777
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 03:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760930599; cv=none; b=cDwsv+1eYCfqpnbM6/KVYl3YkdhpO2o2wijEqnlW5loJhJiRw6LETzbbRua1bYHcWwAAEMKeYh2eCDXQQEMSYMTGGFRYnyQ954+EPLnzXDkIC5cCqVmzm0tZz7kbzCZZEqP9TAGlOlVZFw0w7ewKNlqCY1xc5JveKh5iX9PjEcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760930599; c=relaxed/simple;
	bh=al8+YONBhG2K0jRHRVifybv1Z6NPQiebH5U+vVbxWbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lhYA1E5yH2xvzNiCpNlJYBl3hhds+4lw40GpkQNaZrZdAAqeHcK+pMYNZFiuIcDBU+7RR9UQ6Fk1nQt/hVywwTKR4hr5jvwCGLXVbSIQWoLqcrRvSb2j04Ogu/q1HAMHPn2t1ChsiF6bmKwmU/+vUZqLPeMBnSBVExLAo4Oc9W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bxEBhXs/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JMIqJm028857
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 03:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5vxEAGKk22m0X7ILOt+O5zdpKy7zzuPx9aZvAOYq5kA=; b=bxEBhXs/KAZ/nfcC
	Bu/59yVu7eWeUmwbn7lSAq39SGPWOnPb15b2C5Z7ogBJUh9ZJyD0aH39CchxPCTL
	6XJY9HbimNwrnCqHDQ0/tIq52pifKRF6chyqwVSwYgJvw1+nS2FiBomWCxvWcc+R
	FfeD3vAPgF2h0987cBn3md7YBhs37y1mADD0Asx9JGfBaF+qItvCqmZhUStyt1W8
	qpnA697jOYr4l+5QCSjYGGqfUl4bDm+zGYkb+c89haOeRAOpXcSkuCs15W6Ro0UE
	PQIm6qMEhpbBWKFVffU2XUSpuNqLuorsd8uXstuO5sqTghD/Ewz3IzP0dw1oOEik
	vFiZTg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfber9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 03:23:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33bba464b08so3537267a91.0
        for <linux-i2c@vger.kernel.org>; Sun, 19 Oct 2025 20:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760930595; x=1761535395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5vxEAGKk22m0X7ILOt+O5zdpKy7zzuPx9aZvAOYq5kA=;
        b=UErJ/rTdBypVLWFIsb+rzmy8t5spmHfPUeSoGjp6OcBcG08QSBGTtL+VItWKHMJt4G
         jzHvQ/e4PygvDN6zFh/jJArxIpzlQkJO1Zdtjjz4rXgTKMS8p8hBJ/lQbWlmLz3VGnCU
         7J80stSoG+ouIFMVik2qLgkv+v8svRsDZ9xeSsaLOg0Sxr7c3kv1iLeyB8cYDp4VBxoi
         k9toryep1V+mC/H6ezQrXYfbMJkXPQM5nVephEuRxkOGM4ht2wvm1Th0R2u2F3JPooPT
         ofp7gA/Y1lLevP5n7tIcfqLlp+DZN9q/cnfSMPtkq5SJ8fyg/X1hhqME1suuBGs3EMEt
         wILA==
X-Forwarded-Encrypted: i=1; AJvYcCVjMrvFKQ1tSSzOW3G/TfWIoFSHdumYhxsseaD3tROZVuoqS8tBkF4fI7nT+zPtMxwhZfHmeqkXi+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLlpspXV3vcVPBRGE3rzeyWgs8r5aGhskoVRM1mFEgaekrN9SF
	7LTcHrIDTjtPXC25SAAi9nhtCgzlNJrtWxa+jQ3aGbNsm6qtIZcNkWrjO0QZxOFK+eIPb5p6mdg
	geLvIjT+RahxYP81goTsNN9zHN8Xbac3gUr5sPaGoAaaTSbluoY3uFLrWwUgeVuk=
X-Gm-Gg: ASbGncuKMsx76kJwqI3l5vAEWlptoJIREgT1oc027626RSBGs+47qQ5Vx0F+492ad2V
	yBrqYBFRRk/RisWEry9D1Mh0BZA0t41xcH2+DRRm51t671xbrPELuM5bJu22F8tjDVg2Hj8yBoF
	32/68eaOVBAGdJTXShWdl1y3VTvU9CvNjcCBU/NIybXWjbdfIuSgTRHlMkPSSnq2ug9XRCTD2Tj
	qDPI3uG5l/aSLj34quTshkHaDkBXyxr5ejNxvPJoCIznJfij2i7oZHbIOhrKDzpiaQKFslOoJyT
	yxzP2G3lD7SnS4hTrFRQuVQXPs9TTLzosUWvJb0xJPQ/AUXP03YEXV5g+ec6in1xsfzrj632Zfy
	K7/8C3bPj2k7dL63yMDHKCDpWNUbILniz6DNE97c6I9R/x3jNu02OudgcfXDxLXxgs9vagA==
X-Received: by 2002:a17:90b:39cd:b0:332:3515:3049 with SMTP id 98e67ed59e1d1-33bcf85acb9mr17403136a91.4.1760930595350;
        Sun, 19 Oct 2025 20:23:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IES39tE/Di3MmwGwTYwN/xeXnDCJXXVgvh9xe8MLyTfqwPZoTQnofwIPkkLhV47dTPyhpVL/g==
X-Received: by 2002:a17:90b:39cd:b0:332:3515:3049 with SMTP id 98e67ed59e1d1-33bcf85acb9mr17403084a91.4.1760930594773;
        Sun, 19 Oct 2025 20:23:14 -0700 (PDT)
Received: from [10.133.33.77] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5df5c288sm6593924a91.15.2025.10.19.20.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 20:23:14 -0700 (PDT)
Message-ID: <2c0011d3-a692-457c-9ac0-a445fc82df37@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 11:23:07 +0800
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
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
 <9984bc23-05ef-4d46-aeb8-feb0a18e5762@kernel.org>
 <bc0caeb8-c99b-4bef-a69e-5ce433e6b890@oss.qualcomm.com>
 <c4fd6bfc-cc9a-4f37-99b3-f36466691a1e@linaro.org>
 <CAFEp6-2=GJL-gc+PSyAL4=prp_sXdZJS=Ewg5nP2kcp_Gu85Fw@mail.gmail.com>
 <33513b43-f6d1-4c76-887b-39611a75e1f4@kernel.org>
 <WnfCknsSyJK68PQZkE2q7COZHRpsLOFlr3dcbwiVR6SBWtF9iRQ4MGzp_9q31O0kyhZwoncQWfHjJQvpz7nyfw==@protonmail.internalid>
 <ab43c5c9-edc5-459e-8ef7-2aa8bec559c0@oss.qualcomm.com>
 <0e6e1b8a-d9ae-42d1-b1ad-4314e0d76ab7@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <0e6e1b8a-d9ae-42d1-b1ad-4314e0d76ab7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WNcYkIeo0GKJR4ms1t5NkFyC4C4TGhic
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX4kebRRp//Ezp
 vJWz6jfS9PqW9/vQo1Z5pma07F+7yWJAS4b43Tg/0S0dDxvTD+4ZRP8YDFsyJNCYLFeHBS2kLKD
 gZxzUgYuwb6yGBZMCOPYD3ct7rFmG9NVxnGQFPBW4ttD49QJdfxeApXec7poMuvVyO1iemlwo13
 u8JAFG/zNyEKvzaPiKiSCFGxfc1o5Tmvyqh9uNF5t8SlKyIHYmoJHs2+YT7+vf2pbmSxgkOJE0e
 KmxrZpwAWjk+6KFyOPRIoXUPz/S/8NKc/PQFF4C4k5U9f5XR88yLn1BV5ddiLJ94dxRQAIZB/bM
 Q2BzqDBE29nbmBLqcu94Y46LxzKXPsCK9v+PgYJ82UJxKFrUAMWau/0HJJeyHSWFy/BKLzY+hQ2
 Hp2vHVzOjZcS0CSETZKidYkMiXHpZw==
X-Proofpoint-GUID: WNcYkIeo0GKJR4ms1t5NkFyC4C4TGhic
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f5ab24 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KDWtGc0jIIkTB6t2Zz4A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

On 10/17/2025 7:41 PM, Bryan O'Donoghue wrote:
> On 16/10/2025 21:53, Vijay Kumar Tumati wrote:
>>
>> On 10/16/2025 8:31 AM, Bryan O'Donoghue wrote:
>>> On 16/10/2025 13:22, Loic Poulain wrote:
>>>>> I'm - perhaps naively - assuming this clock really is required ... and
>>>>> that both will be needed concurrently.
>>>> AFAIU, the NRT clock is not in use for the capture part, and only
>>>> required for the offline processing engine (IPE, OPE), which will
>>>> likely be described as a separated node.
>>>
>>> Maybe yeah though we already have bindings.
>>>
>>> @Hangxiang I thought we had discussed this clock was required for your
>>> setup.
>>>
>>> Can you confirm with a test and then
>>>
>>> 1. Repost with my RB - I assume you included this on purpose
>>> 2. Respond that you can live without it.
>>>
>>> ---
>>> bod
>>>
>> @Bryan and others, sorry, I am just trying to understand the exact ask
>> here. Just to add a bit more detail here, On certain architectures,
>> there is one CAMNOC module that connects all of the camera modules (RT
>> and NRT) to MMNOC. In these, there is one 'camnoc_axi' clock that needs
>> to be enabled for it's operation. However, on the newer architectures,
>> this single CAMNOC is split into two, one for RT modules (TFEs and IFE
>> Lites) and the other for NRT (IPE and OFE). So, on a given architecture,
>> we either require 'camnoc_axi' or 'camnoc_rt_axi' for RT operation, not
>> both. And yes, one of them is a must. As you know, adding the support
>> for the newer clock in "vfe_match_clock_names" will only enable the
>> newer chip sets to define this in it's resource information and set the
>> rate to it based on the pixel clock. In kaanapali vfe resources, we do
>> not give the 'camnoc_axi_clk'. Hopefully we are all on the same page
>> now, is it the suggestion to use 'camnoc_axi_clk' name for
>> CAM_CC_CAMNOC_RT_AXI_CLK ? We thought it would be clearer to use the
>> name the matches the exact clock. Please advise and thank you.
> 
> The ask is to make sure this clock is needed @ the same time as the 
> other camnoc clock.
> 
> If so then update the commit log on v2 to address the concerns given 
> that it may not be necessary.
> 
> If not then just pining back to this patch "we checked and its not 
> needed" will do.
> 
> ---
> bod

@Bryan, I test two scenarios individually that also consider @Vladimir's 
concern. I confirm this clock rate setting is necessary.
1. Remove 'camnoc_rt_axi' from the vfe clock matching function.
2. Remove 'camnoc_nrt_axi' from the vfe clock resources in camss.c.
Both of them block the image buffer write operation. More clearly, we 
will stuck at the stage when all buffers acquired but CAMSS takes no action.

I agree with @Vijay to keep 'camnoc_rt_axi' to distinguish between the 
new one and 'camnoc_axi'. The disagreement concerns how to standardize 
the camnoc clock name or how to differentiate between RT and NRT clock 
names if a new RT clock name is introduced. Other chips like sm8550, 
sm8775p depend on 'camnoc_axi'. Meanwhile, 'camnoc_rt_axi' and 
'camnoc_nrt_axi' are both necessary for QCM2290 and X1E80100. But chips 
like QCM2290 and X1E80100 may not need to set the clock rate but 
Kaanapali needs. @Vladimir

We now prefer to add 'camnoc_rt_axi' (Right?). Maybe its better to add 
comment lines to remove the ambiguity whether 'camnoc_axi' denotes to RT 
or NRT. Please advise and correct me. Willing to receive feedback and 
suggestions. Thanks you for all.

---
Hangxiang

