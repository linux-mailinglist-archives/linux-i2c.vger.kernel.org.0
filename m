Return-Path: <linux-i2c+bounces-6483-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3742D9738CE
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 15:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC93D2834DF
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 13:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15175192D67;
	Tue, 10 Sep 2024 13:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iOdcX/YE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3E4191F7A;
	Tue, 10 Sep 2024 13:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725975578; cv=none; b=PKBVuluvO3h44XKV6f79cXw4MIJPWxWyJBgutvsBXin9oMm1Xd+u0k/LPHe2YkcVr4cdlGuNQ91HH5Sch5I1GvtA7zOrD274R8IjOzdnPd2G3DdvaJLNyI12ZbNZNUAi996AwFjSaF5yJEcgdUJv6GvkRNGcDxoZn3aYmjTWD8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725975578; c=relaxed/simple;
	bh=QXyvEAk/cM+x55T9IMXbHsoQMZkO0Tn2sSBHc44PPDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IJQ3Xl2cf2KKnIQG1+9S3uYpcUmZ1cKS6CJOL7hL5Sh/jYnx2gioyiypDSD+0ywF1B/jTfvffr07vSP+3M7nRb0fEgQnzAQXTlzA3fV3T/lgQafnP/lyYigDH+/3VLWQ23gNATn5VRRIzLvskCLZZk0Bd6k86Lv/Pt8eikqj6Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iOdcX/YE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48A3wwAd024930;
	Tue, 10 Sep 2024 13:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H8hd3rqyvNycpRRE6sRIvQIqxOWu1rykj22fxwMKNxA=; b=iOdcX/YEKHLnNfs3
	CG/734I8DgSqErECzMEmqP+9wJ0tK/MY2nyaBUm4FFegGZne+T3RuR2iDvOYG4wA
	/o9vVSVvDOPkYrAVFhWuX6iqi+yfGEd58zgIUbcFYegXQ4BGPuMey7m2BtUS/bLE
	pD4D7+FRtX5TWRDAV568PAPps5Sh8a/5w4uVe25uZC8fLDCBaJJZityda6alWQ93
	LDYBwRWN+gi68Krkox3xgJNs5z0QADwB6PILkJg3v0H0kTvmRIm90Zhv7ZWKVhYN
	78A9Qk7d2hXgtxb0HlrlJ7Rbf+j3oEwqUaV8LCQ3BkFxsw1FeFI2XKpDKOK7ElbB
	IO9pTQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy72x2p4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 13:39:25 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48ADdOMu005514
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 13:39:24 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Sep
 2024 06:39:19 -0700
Message-ID: <aa5f6e95-4fb4-4ee3-b255-fb6a899b572b@quicinc.com>
Date: Tue, 10 Sep 2024 19:09:16 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing
 between two subsystems
To: Andi Shyti <andi.shyti@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: <neil.armstrong@linaro.org>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <conor+dt@kernel.org>,
        <agross@kernel.org>, <devicetree@vger.kernel.org>, <vkoul@kernel.org>,
        <linux@treblig.org>, <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <quic_vdadhani@quicinc.com>
References: <20240906191438.4104329-1-quic_msavaliy@quicinc.com>
 <20240906191438.4104329-5-quic_msavaliy@quicinc.com>
 <b3a5dd54-90ba-4d75-9650-efbff12cddeb@linaro.org>
 <3bd27b6d-74b8-4f7b-b3eb-64682442bbda@quicinc.com>
 <3fa58f58-c1d2-41ac-b85b-c86bce5c06b9@kernel.org>
 <fhojgh44bcqhpbdffclop75uq2m32txvkwlht3sipiq2kdfr27@6gv7gpaaybhv>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <fhojgh44bcqhpbdffclop75uq2m32txvkwlht3sipiq2kdfr27@6gv7gpaaybhv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: u_Tsz0pat1TEaunfZa5I_ICWD9-xznZN
X-Proofpoint-GUID: u_Tsz0pat1TEaunfZa5I_ICWD9-xznZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409100101

Hi Andi,

On 9/9/2024 6:23 PM, Andi Shyti wrote:
> Thank you guys for your reviews,
> 
> On Mon, Sep 09, 2024 at 01:37:00PM GMT, Konrad Dybcio wrote:
>> On 9.09.2024 11:18 AM, Mukesh Kumar Savaliya wrote:
>>> Hi Neil,
>>>
>>> On 9/9/2024 2:24 PM, neil.armstrong@linaro.org wrote:
>>>> Hi,
>>>>
>>>> On 06/09/2024 21:14, Mukesh Kumar Savaliya wrote:
>>>>> Add support to share I2C SE by two Subsystems in a mutually exclusive way.
>>>>> Use  "qcom,shared-se" flag in a particular i2c instance node if the
>>>>> usecase requires i2c controller to be shared.
>>>>>
>>>>> I2C driver just need to mark first_msg and last_msg flag to help indicate
>>>>> GPI driver to  take lock and unlock TRE there by protecting from concurrent
>>>>> access from other EE or Subsystem.
>>>>>
>>>>> gpi_create_i2c_tre() function at gpi.c will take care of adding Lock and
>>>>> Unlock TRE for the respective transfer operations.
>>>>>
>>>>> Since the GPIOs are also shared for the i2c bus between two SS, do not
>>>>> touch GPIO configuration during runtime suspend and only turn off the
>>>>> clocks. This will allow other SS to continue to transfer the data
>>>>> without any disturbance over the IO lines.
>>>>
>>>> This doesn't answer my question about what would be the behavior if one
>>>> use uses, for example, GPI DMA, and the Linux kernel FIFO mode or SE DMA ?
>>>>
>>> Shared usecase is not supported for non GSI mode (FIFO and DMA), it should be static usecase. Dynamic sharing from two clients of two subsystems is only for GSI mode. Hope this helps ?
>>
>> This should very much be explained in commit message and perhaps in code
>>
>> And since it can't work with FIFO mode, there should be checks in code
>> to disallow such invalid configurations
> 
> it would be nice if, along with all these open questions and
> clarifications on the commit message, we could add some good
> comments to the code as well.
> 
Agree, i realized it's good to add comment around code changes too.
In V3 i am incorporating all the suggestions and comments.
> Thanks,
> Andi

