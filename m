Return-Path: <linux-i2c+bounces-8293-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA6A9E028F
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 13:56:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B17AF283577
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 12:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571DA1FECCF;
	Mon,  2 Dec 2024 12:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EJys/Oln"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13A11FDE05;
	Mon,  2 Dec 2024 12:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733144154; cv=none; b=chg2WzF9lx7r+kI8zNE7nLbmUoiWG6zpXDXMJS0VZ+wXig42uG+vkxgtMsMAJ4nA3dsFRWFREFGE81mDQ0x2X0iICwVKLyyylu0UlIxkbU5giK3NCklBoBYxVITiitfHZekfd4hJTY5DITJGhWF5kG3xG4gH1dGMMD+/fwCVDBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733144154; c=relaxed/simple;
	bh=vd13ZkzEmnU5zASTA5DJf0GZ3dPvQMRCej5XzVRFx20=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hzOr9gBA1ZrFOC496nAKR/RhYnWp4ozKOLsRXk1UPoHNM50Rv+AmJR3a4mNq0HHCD+AUCxKp8eTmZiQ6DGIl3ARJ8UpVpFgxw+FpZXjem9iY1orDwwbUxNmTZrp3MCwPmGGCmueqvg6q/kjw4q4y85SMusK2zTCh/HMqNUqMOVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EJys/Oln; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B29fHfI010836;
	Mon, 2 Dec 2024 12:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UaL9rDM7akT1qiyQz0TMbTWhesPFrPNHkY8MNQHniqg=; b=EJys/OlnfBmSMPl3
	eVncF0OwWPXJ+l1L3unjd2MugM6CRSZTRFVDRzMpv2ff56+KXWqWkyrNLWLKtaPh
	RhrdOM6c95S6McCJjCx/k9HsObTNFubrNAApNG9OhlzbfUUkSBgcHtf8nL+CextJ
	irPRi8G+UG0vPn8udM6++Y4nHnXJK4j/cHIn5znXGdZnNbQL/0XDcyvgyBk+8RKM
	hLxaj2+5DoF2P13J66iB9xycvsT1QfQrS7q4P5Ji7hdkC7sL4e0Cmw5x0ZYEwV3J
	589CSkUooUrOdCBwp3cBq+1U8RevYd/45mTxIEhCyZQUOawP42kwNuwALIWxwUw1
	vgUJpQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4393mp9rf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 12:55:44 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B2CthV7021626
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 12:55:43 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 04:55:38 -0800
Message-ID: <da2ba3df-eb47-4b55-a0c9-e038a3b9da30@quicinc.com>
Date: Mon, 2 Dec 2024 18:25:35 +0530
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
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <904ae8ea-d970-4b4b-a30a-cd1b65296a9b@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XA6PMkdLBdJuYQISwDC-dpgvldnzt9NW
X-Proofpoint-GUID: XA6PMkdLBdJuYQISwDC-dpgvldnzt9NW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=974
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020113



On 12/2/2024 4:34 PM, Krzysztof Kozlowski wrote:
> On 02/12/2024 11:38, Mukesh Kumar Savaliya wrote:
>>>
>>> Come with one flag or enum, if needed, covering all your cases like this.
>>>
>> Let me explain, this feature is one of the additional software case
>> adding on base protocol support. if we dont have more than one usecase
>> or repurposing this feature, why do we need to add enums ? I see one
>> flag gpi_mode but it's internal to driver not exposed to user or expose
>> any usecase/feature.
>>
>> Below was our earlier context, just wanted to add for clarity.
>> --
>>   > Is sharing of IP blocks going to be also for other devices? If yes, then
>>   > this should be one property for all Qualcomm devices. If not, then be
>>   > sure that this is the case because I will bring it up if you come with
>>   > one more solution for something else.
> 
> 
> You keep repeating the same. You won't receive any other answer.
> 
So far i was in context to SEs. I am not sure in qualcomm SOC all cores 
supporting this feature and if it at all it supports, it may have it's 
own mechanism then what is followed in SE IP. I was probably thinking on 
my owned IP core hence i was revolving around.

Hope this dt-binding i can conclude somewhere by seeking answer from 
other IP core owners within qualcomm.
>>   >
>> IP blocks like SE can be shared. Here we are talking about I2C sharing.
>> In future it can be SPI sharing. But design wise it fits better to add
>> flag per SE node. Same we shall be adding for SPI too in future.
> 
> 
> How flag per SE node is relevant? I did not ask to move the property.
> 
>>
>> Please let me know your further suggestions.
> We do not talk about I2C or SPI here only. We talk about entire SoC.
> Since beginning. Find other patch proposals and align with rest of
> Qualcomm developers so that you come with only one definition for this
> feature/characteristic. Or do you want to say that I am free to NAK all
> further properties duplicating this one?
> 
> Please confirm that you Qualcomm engineers understand the last statement
> and that every block will use se-shared, even if we speak about UFS for
> example.
This UFS word atleast makes me understand and gave me clarity that i 
need to talk to different IP owners within qualcomm and get an agreement 
for my i2c feature. I am not sure if there exist an usecase the way we 
are sharing for i2c. Also i don't know how we can make similar 
description if different cores and functionality are different.  If you 
have heard from any other IP core, please keep some usecases/IP names.

Since This demands internal discussion, so give me time to conclude how 
the IPs are shared and is it the similar to what i have developed here 
for I2C. (sorry that so far i was in context to my SE protocols/ IPs only).
> 
> Best regards,
> Krzysztof

