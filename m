Return-Path: <linux-i2c+bounces-10812-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFC5AABF0A
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 11:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DF501C4038F
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 09:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14DE926B2B1;
	Tue,  6 May 2025 09:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j+NOS8aU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A21F267709;
	Tue,  6 May 2025 09:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523082; cv=none; b=NmD8sI38x/vhLxzRV1TxiNbtIDRi3Ia0h80Eglai6pr0fRPSkdn4zALJh87uEDddLlMo889bRqCUhoEzrja8HWc6uljO5qMxsVVfRlZkrUdoVV7upYJTiPxgCQTbdmPpdmsh1n2u1Zfgtdvmyp37dFTJ4LjQZxdSiVqAJyAkcHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523082; c=relaxed/simple;
	bh=vaStXvVTH57RGFjkd58B8TnlgxAfHk3sZF8GDs6h1iQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LpDNhsdxG6NDt/EVxLsXlQ/7TJcVuIWjrXy5VswahM3nSNlfuU60yPGWc2Ofua0aQNr+Y9ysyB8ozXKoPyZWQw/GzdjSGRKXUeXkSRi1vay8km3OBEcqPxhNzyIs5+vEcFCp2TK49kIkFQ0mQP8vblx7ubXrsS5WuAtXLTgqR+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j+NOS8aU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468r5sQ013949;
	Tue, 6 May 2025 09:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tIVehaM4um1sGZFCaMHKsi5sDekljpiBO26H2plk8zk=; b=j+NOS8aUtgx253JX
	90tbRNUXkERtnME+in+IZkO7b9s5ypWz9Hcdkcrp6QnDuPW3F72VrlqGGZaNDST1
	HZFd9nrA6h8+nzVMxaPWyGV4KSptj8WAeASavThJgUMlLBkVUHdSk4/iE5Hjb2C6
	2Wzf936PuK/eRW4TX/7iwiLCfA9GUtSTfE3hFVEeXaPzhlqx2cWMOJaEip+QuCWy
	yYri5vkLei5WHNHDq8iAOIlLczZ2TlL3YPKGVv/wODXdZ7mCvDqUqpU7fLJydMe2
	uTvgvQeXm6gF88+7Uuo7l9gfQG0PrIoYpVI1p1WnS6ql2RsWkr0/25Az8d0FxsIn
	9iDlLw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5u41p92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 09:17:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5469Htlk008010
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 09:17:55 GMT
Received: from [10.216.1.69] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 May 2025
 02:17:49 -0700
Message-ID: <97cba4b6-2966-4356-888f-b7e4e091b8ee@quicinc.com>
Date: Tue, 6 May 2025 14:47:45 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] soc: qcom: geni-se: Add support to load QUP SE
 Firmware via Linux subsystem
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andi.shyti@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <johan+linaro@kernel.org>, <dianders@chromium.org>,
        <agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <quic_msavaliy@quicinc.com>,
        <quic_anupkulk@quicinc.com>
References: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>
 <20250303124349.3474185-7-quic_vdadhani@quicinc.com>
 <58f46660-a17a-4e20-981a-53cad7320e5a@oss.qualcomm.com>
 <9cc6bdf8-ba4c-4561-962a-74ceb09b72a8@quicinc.com>
 <vpm4ee4bjuqje7zrpay3pllvcghh547yce4nbqgbeujgdbu3lk@fahrgwfjbrzy>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <vpm4ee4bjuqje7zrpay3pllvcghh547yce4nbqgbeujgdbu3lk@fahrgwfjbrzy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KcfSsRYD c=1 sm=1 tr=0 ts=6819d3c4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=D34P7LM_aV9bT36-NOIA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: UUlPaJvvvm2i-xCJTxZWEKCEcDLqTmVU
X-Proofpoint-ORIG-GUID: UUlPaJvvvm2i-xCJTxZWEKCEcDLqTmVU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA4OCBTYWx0ZWRfX4gH4doa8q82y
 yfJZpFhzExnrhU0ChAKIhKwvxswWvjvUsLRwHhFAM5qU3i9cxJkCbtQ/7Amk6Xg548kvwb0F4Vn
 tGlTu1OQ0X3rJ5LYdNNYh0znNocahAl7prZdbpl1yrtTYAB2EPiegsv2Af2fGHZK1tutAr1vSSm
 AiGCMxdy0yJJmNdjCYJQSOtr3WQj5h1/fFKCeRuOrNO6HjCo1xMqASmiJaIRc8IMPoI+0gR/ICd
 m8A8Pu41NJuRMujdoGn9elMxH7Tw1EiuZtK4IzLbSPnOyK2xi6aymi7uuUpZqgq1CDDD2Lf70EX
 RhxTWWj6lJ6rfxWQt9XDd8fzjzjsGOzmbRSudmFehb013W+tMA1CrOcisUh2YfxAevWIhvVlwzu
 GDz4jZ06pQ6jH86VL9TnJTZ793wnT1pcE5kLp0lGlcTiynn53iRcSZm9zFwKJhZ50eKTvTc+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_04,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060088



On 5/3/2025 10:51 PM, Dmitry Baryshkov wrote:
> On Sat, May 03, 2025 at 04:47:52PM +0530, Viken Dadhaniya wrote:
>>
>>
>> On 3/8/2025 11:36 PM, Konrad Dybcio wrote:
>>> On 3.03.2025 1:43 PM, Viken Dadhaniya wrote:
>>>> Load the firmware to QUP SE based on the 'firmware-name' property specified
>>>> in devicetree. Populate Serial engine and base address details in the probe
>>>> function of the protocol driver and pass to firmware load routine.
>>>>
>>>> Skip the firmware loading if the firmware is already loaded in Serial
>>>> Engine's firmware memory area.
>>>>
>>>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +		break;
>>>> +
>>>> +	default:
>>>> +		dev_err(rsc->se->dev, "invalid se mode: %d\n", rsc->mode);
>>>> +		return -EINVAL;
>>>
>>> I wouldn't expect this to ever fail..
>>
>> Yes, that's correct. But including a default case helps handle unexpected or
>> invalid input gracefully.
>>
>> Please let me know if you would like me to remove it.
> 
> If you are asking for additional comments, please refrain from sending
> the next iteration until you actally resolve all the open questions.
> 

Sure, I will take care of it in future patches.

