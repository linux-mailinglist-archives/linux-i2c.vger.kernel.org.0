Return-Path: <linux-i2c+bounces-6467-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3DF972D1C
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 11:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A52F1F26109
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 09:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A546E188003;
	Tue, 10 Sep 2024 09:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ODmDPNLj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194FB187FF1;
	Tue, 10 Sep 2024 09:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725959587; cv=none; b=OgF9kztJ+Cd/NskW4bi5zGFsdYDQK4LA7R9YfwBOS3yP4PGxNaG11cpK9HQs8vO92/CToLOiwSQnol1BehYnOWcmi6HvfXbj1wZ9Aa1dPntS0IorP7Y+f3Gks+dMUhm8ty3JdS4uuHs1jikn0eP8ZpemP04aairBlnM1mMOvK/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725959587; c=relaxed/simple;
	bh=Lezq+U3H887inOfyy3V1Me75JuHcQiTlIihEXv/5Fbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Fzf3auY46obGn5heDiZHRwjdARRK3OCOYn8/SQ0naAhChYk5dG/CHIm7b//q6eZJTe7YV1OXxHF60w9d9Y4E40nKi3i0TcOZfEFxXV0qvV+y6KA7G7JAr5/WnO8/2rQs2aAaOq/q8mocZQuu/f6p4UJCsAUEa0G8JswxMDceOJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ODmDPNLj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48A3vB6k021155;
	Tue, 10 Sep 2024 09:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FmH+zB6/GPs4UaIX/qXAiBvZoKZi8FD1npayW8UUFd0=; b=ODmDPNLjBjtU+EgL
	lsRfBrFYo2miY7LhNXUe1VaO/fJqW7O5HWiXoZGbf80oHGyGJlxnSaTBNYhn0VlW
	h8urQTrUU8JWNPtUu+43cBby/MyMmqqUidM/zJIO/HIJbaEEwFYygdSTYIEBHEv1
	+4in2EmA1+bwEmsTiG36BOgu9hRxEzebJfTJL1pQVVnczhJqpuuc2rNVwF2OyovE
	4XKx5ndyyWL8P62qVOH12B2M9jqrJ7UxjJRuX+FA+hx2Q1uK7WuFmc2GcJKpXC4p
	RMydJYYIcDjU7Sil8ka7oQjQ0HmvcObaFDeZhfcPKfsgu8I21oGYUjhRhm5xzkcT
	FazflA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy59wdtg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 09:12:56 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48A9CuvV010001
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 09:12:56 GMT
Received: from [10.218.13.83] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Sep
 2024 02:12:50 -0700
Message-ID: <76f9f086-583f-4f5b-b5f8-04f0a53e0b1d@quicinc.com>
Date: Tue, 10 Sep 2024 14:42:47 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing
 between two subsystems
To: Konrad Dybcio <konradybcio@kernel.org>, <neil.armstrong@linaro.org>,
        <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <conor+dt@kernel.org>,
        <agross@kernel.org>, <devicetree@vger.kernel.org>, <vkoul@kernel.org>,
        <linux@treblig.org>, <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>
CC: <quic_vdadhani@quicinc.com>
References: <20240906191438.4104329-1-quic_msavaliy@quicinc.com>
 <20240906191438.4104329-5-quic_msavaliy@quicinc.com>
 <b3a5dd54-90ba-4d75-9650-efbff12cddeb@linaro.org>
 <3bd27b6d-74b8-4f7b-b3eb-64682442bbda@quicinc.com>
 <3fa58f58-c1d2-41ac-b85b-c86bce5c06b9@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <3fa58f58-c1d2-41ac-b85b-c86bce5c06b9@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rwKpTtjDbrB3nDd67LIhzauXPhVEcnZH
X-Proofpoint-ORIG-GUID: rwKpTtjDbrB3nDd67LIhzauXPhVEcnZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409100069

Thanks Konrad !

On 9/9/2024 5:07 PM, Konrad Dybcio wrote:
> On 9.09.2024 11:18 AM, Mukesh Kumar Savaliya wrote:
>> Hi Neil,
>>
>> On 9/9/2024 2:24 PM, neil.armstrong@linaro.org wrote:
>>> Hi,
>>>
>>> On 06/09/2024 21:14, Mukesh Kumar Savaliya wrote:
>>>> Add support to share I2C SE by two Subsystems in a mutually exclusive way.
>>>> Use  "qcom,shared-se" flag in a particular i2c instance node if the
>>>> usecase requires i2c controller to be shared.
>>>>
>>>> I2C driver just need to mark first_msg and last_msg flag to help indicate
>>>> GPI driver to  take lock and unlock TRE there by protecting from concurrent
>>>> access from other EE or Subsystem.
>>>>
>>>> gpi_create_i2c_tre() function at gpi.c will take care of adding Lock and
>>>> Unlock TRE for the respective transfer operations.
>>>>
>>>> Since the GPIOs are also shared for the i2c bus between two SS, do not
>>>> touch GPIO configuration during runtime suspend and only turn off the
>>>> clocks. This will allow other SS to continue to transfer the data
>>>> without any disturbance over the IO lines.
>>>
>>> This doesn't answer my question about what would be the behavior if one
>>> use uses, for example, GPI DMA, and the Linux kernel FIFO mode or SE DMA ?
>>>
>> Shared usecase is not supported for non GSI mode (FIFO and DMA), it should be static usecase. Dynamic sharing from two clients of two subsystems is only for GSI mode. Hope this helps ?
> 
> This should very much be explained in commit message and perhaps in code
> 
Noted,  will add in commit message and cover letter.
> And since it can't work with FIFO mode, there should be checks in code
> to disallow such invalid configurations
> 
Agree, will add in next patch.
> Konrad

