Return-Path: <linux-i2c+bounces-7074-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E901989345
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2024 08:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BECDD1C2214D
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2024 06:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6986A332;
	Sun, 29 Sep 2024 06:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UO+S7uDU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA73BE4E;
	Sun, 29 Sep 2024 06:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727591532; cv=none; b=mgdr0q9QhC/bepd37q6BloWFskTQHUJ8oqAuWEcviRoUYrD6NzM31gv/1QPRvxUuPMlZPWF19CFKYHydwsw9KKjemZ55Cb7v2gk+e4lrQmB90F2DWOL98OH2Is0OxDHxooxT66D9h948FmFMe9CE6Ap0JZkmsVaOsm8JxYz6/tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727591532; c=relaxed/simple;
	bh=ltc+vieAlwI7N1jOV+wsDjVH5AjyEuAavHroHn1x3Lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pWEdeEtg21gFpBVYNlt0T4V9qlrcnnkvVsS54l7BpzOtdH9oa9BUoBwFsbEVfX6y2CpnQdwXl0uNbYsrYgi0b1v1lqyXrhYK34i79f/B96eEnJOiG89zMk2LM0tK7kKaiG1T6anHmt3Z6X/kcctWvUKUsvlSF0sMt9blviXZm3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UO+S7uDU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48T0E5hx027354;
	Sun, 29 Sep 2024 06:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qNQnRNp7z2TCyH6YZnB39qtdnzhvh6eGjKjd1ZtcPpg=; b=UO+S7uDUN2D5Vfgy
	ez+rvOHBpGQbA+5yLuAQzokEcIzEmeghJiBSr9S3QGzJ9aCtNMKi6Wq9XP8XX/1L
	YzJQ0b45KYjabMjtZpp3PSz8NmGQFHl/X1yvO/GDVePIVxGpo6dGGHJQB2h2GEcR
	5aG40vdc6bMEa5KQuV0SpFJMEjSPS34R4xSzGv8UdZv16VoG7akfy6fOoxXMlgVV
	2uPfa8NGrhgmR43AC9jJ1gtf18uMRc49NKbLmbKjqUkoA2zWobFnqaki2hE1fuEq
	/1Vexa1v3dama6pCOarO5qXyn/gKYQiZoQIabMmz6nvxqGA+yLvLyD5TokWYu0lU
	eAiRfg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x9vu1ty4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Sep 2024 06:32:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48T6W3qX006675
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Sep 2024 06:32:03 GMT
Received: from [10.50.42.35] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 28 Sep
 2024 23:32:00 -0700
Message-ID: <12048540-9d29-48e8-8442-e0f736067d9f@quicinc.com>
Date: Sun, 29 Sep 2024 12:02:03 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] i2c: qcom-geni: Support systems with 32MHz serial
 engine clock
To: Bjorn Andersson <andersson@kernel.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
CC: <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240926034304.3565278-1-quic_mmanikan@quicinc.com>
 <def1c338-8e41-4622-83d5-7a377d780d76@linaro.org>
 <wfm2xgyf67erkl57d4ztnj7t7cezkeohne2bcz42crtjwmjp5j@wfakrtwjizkq>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <wfm2xgyf67erkl57d4ztnj7t7cezkeohne2bcz42crtjwmjp5j@wfakrtwjizkq>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oRHO9_PNbSHtAXf356lufL4Wk8x4omAC
X-Proofpoint-ORIG-GUID: oRHO9_PNbSHtAXf356lufL4Wk8x4omAC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1011 spamscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409290047



On 9/26/2024 6:18 PM, Bjorn Andersson wrote:
> On Thu, Sep 26, 2024 at 01:28:37PM GMT, Vladimir Zapolskiy wrote:
>> On 9/26/24 06:43, Manikanta Mylavarapu wrote:
>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> [..]
>>> +
>>>   static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>>>   {
>>>   	int i;
>>> -	const struct geni_i2c_clk_fld *itr = geni_i2c_clk_map;
>>> +	const struct geni_i2c_clk_fld *itr;
>>> +
>>> +	if (clk_get_rate(gi2c->se.clk) == 32 * HZ_PER_MHZ)
>>> +		itr = geni_i2c_clk_map_32mhz;
>>> +	else
>>> +		itr = geni_i2c_clk_map_19p2mhz;
>>> -	for (i = 0; i < ARRAY_SIZE(geni_i2c_clk_map); i++, itr++) {
>>> +	for (i = 0; i < ARRAY_SIZE(geni_i2c_clk_map_19p2mhz); i++, itr++) {
>>
>> Struct/data organization here is so weak, that here it's implicitly assumed
>> that sizes of two arrays are equal. It could be kept as is of course, just
>> pointing to it.
>>
> 
> Thanks for pointing this out, Vladimir.
> 
> I'd prefer we fix it by adding a sentinel value to the arrays - because
> this was only spotted due to the rename, the next guy will not be so
> lucky.
> 
> Regards,
> Bjorn
> 

Okay, sure.

Thanks & Regards,
Manikanta.

