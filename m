Return-Path: <linux-i2c+bounces-8379-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F059E9A0B
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2024 16:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 851002823F3
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2024 15:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B2C1BEF6D;
	Mon,  9 Dec 2024 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CGP7wulN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F741B422E;
	Mon,  9 Dec 2024 15:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733756872; cv=none; b=ezd0v1tdGzOyVJm5kATB8aITaFJSanMysmlR0HpW7gvbujiXwDvh+K/1+l9Zom2yzz3wqD98YWsRxxL+S5uJj3fza+wNqc3Jl0GCq+NzXgTHFoi+jc/2IuqwoZnDENAKkrS4G+9jRg0hGOXXf4iEeyHBOHRa21X6hnYJEe7bcZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733756872; c=relaxed/simple;
	bh=uk/0UdEMXtESb27s2FPly12gPgWEWDNT9EA+JVxL4ng=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IzsdBwDVJIkNLeQ78OoOdXSnkzr51SF38DMudm1HY611CYw/mPv5tsdYlBpN3nxnscCe2yC/97WoVFBaH6uohYGuRGLcLQAkUWuKKlDIGNLR97RJ33OMRotygqwOfjMLRboPiZvquVMzI0HE5o3vFkj1AlKfqp7eJan+tTQWr5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CGP7wulN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9AEdLR031613;
	Mon, 9 Dec 2024 15:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zcXxgrlJj9QA/6b1Wp+0cE8SmamP7uL7/ApWHq7oe+o=; b=CGP7wulNN5n/6q6H
	r8xgH0M+U9KK+h3pC1izXwe9njH9VUjNx13EI2v5TcySk22qzbCrs+zkyIXcdPLc
	UL6G6q95KCPpq25NJL3zeK1XZ6LNT6AMox5+IecULWJDy4lNF01kK4bxzyYtrvlt
	z06xGE7h4Wy1no9KZOlryLwUyYJqbnwXpa++TUJ7i8OVEEvfq78VhL4Kgi7vFTFd
	BQVrpgBLK8pPzcyEgMfdhMvm0d8kNXwBgnNfxR24opREPlHt4yyQXbF6cZlOD0jb
	OFYgnlCT5m7XpRgw6hfuKm4R/jUy4j/k+c4x+6fjwWTK6sEwMbHzCN024HFYNAGb
	qavmkQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdxxd6ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 15:07:42 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9F7f9H008342
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 15:07:41 GMT
Received: from [10.50.34.16] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 07:07:32 -0800
Message-ID: <c275cf76-0335-4b01-8d07-86d38e6d27e0@quicinc.com>
Date: Mon, 9 Dec 2024 20:37:27 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
To: Krzysztof Kozlowski <krzk@kernel.org>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <conor+dt@kernel.org>, <agross@kernel.org>,
        <devicetree@vger.kernel.org>, <vkoul@kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>
CC: <quic_vdadhani@quicinc.com>
References: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
 <20241129144357.2008465-2-quic_msavaliy@quicinc.com>
 <db428697-a9dc-46e1-abbe-73341306403f@kernel.org>
 <a8b1ccd2-c37b-4a6f-b592-caf1a53be02c@quicinc.com>
 <fc33c4ed-32e5-46cc-87d6-921f2e58b4ff@kernel.org>
 <75f2cc08-e3ab-41fb-aa94-22963c4ffd82@quicinc.com>
 <904ae8ea-d970-4b4b-a30a-cd1b65296a9b@kernel.org>
 <fa3ee895-5353-44f5-b816-9d17b6a7d199@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <fa3ee895-5353-44f5-b816-9d17b6a7d199@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4p6cn0PN7oKNSSsHKWihQNEvHKrwDQg7
X-Proofpoint-GUID: 4p6cn0PN7oKNSSsHKWihQNEvHKrwDQg7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=622 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090118

Hi Krzysztof ,

On 12/2/2024 4:43 PM, Krzysztof Kozlowski wrote:
> On 02/12/2024 12:04, Krzysztof Kozlowski wrote:
>> On 02/12/2024 11:38, Mukesh Kumar Savaliya wrote:
>>>>
>>>> Come with one flag or enum, if needed, covering all your cases like this.
Please review below comment which was about other cores. I think we can 
go with single flag naming qcom,shared-corename, for similar features 
for any core.
>>>>
>>> Let me explain, this feature is one of the additional software case
>>> adding on base protocol support. if we dont have more than one usecase
>>> or repurposing this feature, why do we need to add enums ? I see one
>>> flag gpi_mode but it's internal to driver not exposed to user or expose
>>> any usecase/feature.
>>>
>>> Below was our earlier context, just wanted to add for clarity.
>>> --
>>>   > Is sharing of IP blocks going to be also for other devices? If yes, then
>>>   > this should be one property for all Qualcomm devices. If not, then be
>>>   > sure that this is the case because I will bring it up if you come with
>>>   > one more solution for something else.
>>
>>
>> You keep repeating the same. You won't receive any other answer.
>>
>>>   >
>>> IP blocks like SE can be shared. Here we are talking about I2C sharing.
>>> In future it can be SPI sharing. But design wise it fits better to add
>>> flag per SE node. Same we shall be adding for SPI too in future.
>>
>>
>> How flag per SE node is relevant? I did not ask to move the property.
>>
>>>
>>> Please let me know your further suggestions.
>> We do not talk about I2C or SPI here only. We talk about entire SoC.
>> Since beginning. Find other patch proposals and align with rest of
>> Qualcomm developers so that you come with only one definition for this
>> feature/characteristic. Or do you want to say that I am free to NAK all
>> further properties duplicating this one?
>>
>> Please confirm that you Qualcomm engineers understand the last statement
>> and that every block will use se-shared, even if we speak about UFS for
>> example.
>>
> 
> I think I was pretty clear also 2 months ago what do I expect from this:
> 
> https://lore.kernel.org/all/52f83419-cc5e-49f3-90a7-26a5b4ddd5a0@kernel.org/
> 
> 
> I do not see this addressing qcom-wide way at all. Four new versions of
> patch and you still did not address first fedback you got.
> 

To answer the comment @ 
https://lore.kernel.org/all/52f83419-cc5e-49f3-90a7-26a5b4ddd5a0@kernel.org/ 


Sorry for not replying straight to this query. Let me, sort out here 
being in agreement with you. I queried internally, no USB OR UFS OR PCIe 
having this case. BAM (sps driver) has such usecase, and if it's comes 
up in future, we should give similar name like shared-xxx if it's 
similar in nature.

"qcom,shared-xxx" is what i think a better option. Can it be renamed per 
core and let individual HW core use it when required ? Just my thought, 
you may please suggest better and simplified way.

clock controllers, TLMMs, MMUs  etc should also should add similar name 
if it's best suiting to the needs and similar feature.

> 
> Best regards,
> Krzysztof


