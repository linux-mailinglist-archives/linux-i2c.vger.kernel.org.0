Return-Path: <linux-i2c+bounces-13582-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8CCBE3158
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 13:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7E0C04EC233
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 11:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FCD31A7F3;
	Thu, 16 Oct 2025 11:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JxQ/3mQo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E5D32145B
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 11:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760614262; cv=none; b=lLiIJ0Rmm4W1ZIee42JS1HAGav1hcmAIw/eMsxgjULeVUe+cXtQ79v3RU9mPFuqbU64YhPsyNRf9at574ZZ8YaepWvSOT5rqagGoPw1G3TKrylws43d0Jl7PzT8MIs+SrDW8Ohxj/PFQ6mW1QNyOcrla307bIvz/6ExXjgnsHEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760614262; c=relaxed/simple;
	bh=MQYL3NqvOxkDXPW1F/Y50YQmsakcGgmXXf7C3SN+7uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2mRqzQwpSdCPmsQZKMXf5tcC3/XCNLi7LjRVSf/6SgpagitIXqZNcQ7wxf/5BVSUQMDEWg96vaLIFWuWw0TZVV+uwb96ve7ksRGkCmuAtCz2cWK9OTCSbtg04rKYZWJIhImBVtRdB464VLGcH4OfRm7t7urivkYGG7MJqJ66IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JxQ/3mQo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G6m9j5002544
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 11:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3r81d4YusFHYu/ym3wjxA+mceYkkZtl0xDn0GBFN3Ls=; b=JxQ/3mQoBcIzo8mK
	p6Ok8qLnoc1XZ9YE5BT4jmfoSVq6re4PEShhVnRr4Ju/s8wpf7EYtBhqKpIrOban
	AaM2xnO6OwV/mDdZ8/FdzQ5lwkYihps/Ojb3YO19LPWVTsaDokPgjr7+UB1JuXuB
	xMTWcaGeA5dOzfUsrk2qBw1oF74r4oCGF6gO+T4+HBUDrPLFdx5Hg5Es54q3eKky
	b46iRn4mVru0IOO3OLc6qvhFuu14Iyrj4Fb8VKkmYP2YW+GRVK5SynFHt3hD4Pfj
	av8+ZOC5qAPTzFCsr5Fx8wurffVysXWvlmHlFXvcYwmS13+BTi8rXSZ/1p2nmfES
	sIqBSQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8g563-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 11:30:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8572f379832so19087885a.3
        for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 04:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760614258; x=1761219058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3r81d4YusFHYu/ym3wjxA+mceYkkZtl0xDn0GBFN3Ls=;
        b=hEFy9IMsFDDLosdYAgQv3jbuqOvJtjsJ/QY/aNYHiknzsIqrsXqpcrCiesaittH7Pp
         mNstAlyY/ZKiSKkVDuehVSII6ZG2EuD708b9+GKHuNB8MiNRjiQIvEoqbrl7Yeb0U0z7
         eK1MbAPRh4RKY7XAvvSC73irGtu/aiqzVhrq/T9FarKz7bd30j6/is8EfYpvnT0WFGlE
         +BbE/N+KYGyqLmDwh9xIJrSWoB/pwF0YN/fJd+gBkKNwt0SX4WB+1AImUyuSZuh0R21F
         k9t9o1O52r1P5T5PjgrrP3KGUXerPKnT17IdH9buITrY2Oz3p6KazLi33At95rSChqmx
         W09w==
X-Gm-Message-State: AOJu0Yz51OvPzYMYojCfNLAwJ2gpmy84+vqiCCkx54lMzjscx9tgk9rn
	KOK5VUIQ6PCY5ndTa+n/2eyms7cdjd/b/RY17TumCm6Hf23sM35YJTReS5SaahFuhuIUeq3oY2o
	JHi23z0K6oVJa4rKj4yMtcK1VDAjye2rEWIHEr77EDGmlICwq39HQFhL9f3xufso=
X-Gm-Gg: ASbGncu562pSDQn68BqpoBRqGI7OLa0aKSP6sCgzoEyJIYweJ1kN0ojpholHZghRBAI
	6jprreS8i2VfX411SQqjym/P3CaxxibFzEd+ieluEssrAUNjjjU2SV7FNmJY/95fV1WAksxbZsE
	z0YGHbKhzGbLKleLU4z2aUcXSMCMO3F4sRw9i/7iJ5WqySDZ0pM5W4VhVJCoXwVArIk98lgRdPI
	yD+EszWqb7PQXg/gKnkJxi1w2ZNQ3of2KobftuGDv43GtILMIEEhgjQv53LbLQp12Teh723p69l
	6X0Gu5xmiFSWtgP84o0d+YG2MwVC48h9oL5yVIKs7mxvUoTb22UAgdEVyeyHJNXQu2gXI6jFif+
	4Xh7gSwxEB87q1V3XeoCrjl4oCNAx4MSWhhEIl+YmGgYbc8PSw1Lt9VSg
X-Received: by 2002:a05:622a:14ce:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4e6ead2c674mr300272841cf.9.1760614258049;
        Thu, 16 Oct 2025 04:30:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQWo8LtrsilfoDkj8zqUn2LLSGLFdpY5oWuNZtrX6Xq2eIwSXcZU7XpjJTwnWEYu+0reTT4g==
X-Received: by 2002:a05:622a:14ce:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4e6ead2c674mr300272231cf.9.1760614257381;
        Thu, 16 Oct 2025 04:30:57 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd39f1fbsm487237966b.70.2025.10.16.04.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 04:30:56 -0700 (PDT)
Message-ID: <bc0caeb8-c99b-4bef-a69e-5ce433e6b890@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 13:30:54 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Enable setting the rate to
 camnoc_rt_axi clock
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
 <9984bc23-05ef-4d46-aeb8-feb0a18e5762@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9984bc23-05ef-4d46-aeb8-feb0a18e5762@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3Tlscg4iwmGin0xfNQROc-NwGhxfzgNH
X-Proofpoint-ORIG-GUID: 3Tlscg4iwmGin0xfNQROc-NwGhxfzgNH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX3MAYbLA5+ZkK
 kSy9QK2ASclr1ONarsOhkP/foL6zkWympCup+VrzhrTWGcJbXd4lVCo/2i2m3eYBLncnmtXBF7y
 XZxYtWwK8ecpn2a9dY1qFCYmeJ1unY+sREBgcWkTvL3IL4rRavWXOkgsuuhkZsQTs1CKJHjpluB
 6mK1d8AgINcVuZ+Bxzm8YPUSqxD3u3dh3MiosQMwhpt/rsLjuk1XPrxul0tQ2+ocHNCmz0M2CmA
 V1cbHcPmTQWpfNfvs3DIoimeRFMH1uIUKtQAfCUl2ttuOo384KZhXEy3SAl8WKabXWIGEU5Sb/P
 BozU/pPCxwFF5jkxeUfMqfteODazCBPMYOkuEOCsp3a3fpgtB6gGfJ0uFyUB9jqHEv05i1NxZKk
 p02K9widq7RHymNi7JIpJLp1Fx8Aig==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68f0d773 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_kPKrX3CkssKu2g54qAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

On 10/16/25 7:54 AM, Krzysztof Kozlowski wrote:
> On 15/10/2025 04:43, Hangxiang Ma wrote:
>> On hardware architectures where a single CAMNOC module is split into
>> two, one for each of the real time (RT) and non real time (NRT) modules
>> within camera sub system, processing VFE output over the AXI bus
>> requires enabling and setting the appropriate clock rate for the RT
>> CAMNOC. This change lays the groundwork for supporting such
>> configurations.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>> This change lays the groundwork for supporting configurations for
>> hardware architectures that split a single CAMNOC module into real time
>> (RT) and non real time (NRT).
>> ---
>>  drivers/media/platform/qcom/camss/camss-vfe.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index ee08dbbddf88..09b29ba383f1 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -914,7 +914,8 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
>>  	return (!strcmp(clock->name, vfe_name) ||
>>  		!strcmp(clock->name, vfe_lite_name) ||
>>  		!strcmp(clock->name, "vfe_lite") ||
>> -		!strcmp(clock->name, "camnoc_axi"));
>> +		!strcmp(clock->name, "camnoc_axi") ||
>> +		!strcmp(clock->name, "camnoc_rt_axi"));
> 
> Just use camnoc_axi for both. Look at your bindings - why do you keep
> different names for same signal?

I think the correct question to ask is:

Is camnoc_axi going to represent the other (NRT) clock in this
setting?

Konrad

