Return-Path: <linux-i2c+bounces-8724-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 673A49FCAF0
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 13:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70335162D43
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 12:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF20D1D5170;
	Thu, 26 Dec 2024 12:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XJ3Q9hRy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AE81CEAC3;
	Thu, 26 Dec 2024 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735215783; cv=none; b=gaKAcJbl94Cpw9Hwk2qkYud/79aA/8NNkJojwdMvzNOELdJG9B58hfK9U9N1Q8fXNAuj8tl2MtAz/gPga1bdLb+H6BS8Q2r0iThiXYswIEIZUjjloM88olcXrxbFBuRboUsAIMGnbJydqYrQ5Vm1aClZcQraBX6G/Jn8sqvqjpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735215783; c=relaxed/simple;
	bh=wFPXn7MHjtxqsHEhLSJcJw84wiC+W7NlVaCgCY0eGOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Yb4S22HSZM21hf2lhJUIlUyg4cJTyiQlsplh/Xguk7SljNNDRBwJGNEA/SFCOGAv53nziAyLFbJ/P5s2WZuo5BErShZBSCXeaHz8i2/8qbAlRWpYZsXeSK/MDXi/OPTFF7HBC8gU3HFdvwp0m46UElpV8ku6955l43/QJRsXpBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XJ3Q9hRy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQBS32n006176;
	Thu, 26 Dec 2024 12:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uhc0QCeVfya9CHRzXbT0FjgqaijVpwM0UrsmbWPL9T0=; b=XJ3Q9hRybNp7K5BE
	QGC9vEWgP1YEeLFsosjH71f04uQJMvm5EqUNMiG36FwqvBRd9jP/nf4BgmeMF25n
	NnjAL7x3FcvE5gK0ybAqcA/nbG58Bqqa2+onxU0dZjZR39BMNCi7uDG3BbOnzWiC
	QnXjDG9f9prKTNrAmmgA2saidTFR5da59mxWNZ0kHd+xDAFsg4E1VphK1Rb+KvmG
	rmGLR9D86q+6SydghIaZiIb0z1QRearVNXIGW57Ab6L7+dmtvuXSJIptHQKvfiL/
	idvVpDa5PPxeoEQAzLI55IuU2vUmq53UQ2ViLZjX0DhkP3jJIc5KLmvSGJBZduEg
	msBRaA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43s69ug7v9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 12:22:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQCMqBW017815
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 12:22:52 GMT
Received: from [10.216.14.233] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 26 Dec
 2024 04:22:44 -0800
Message-ID: <b34e3ac0-70b4-491c-a807-dc13fac41d06@quicinc.com>
Date: Thu, 26 Dec 2024 17:52:39 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] dmaengine: gpi: Add Lock and Unlock TRE support to
 access I2C exclusively
To: Vinod Koul <vkoul@kernel.org>, Md Sadre Alam <quic_mdalam@quicinc.com>
CC: <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <conor+dt@kernel.org>,
        <agross@kernel.org>, <devicetree@vger.kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>, <quic_vdadhani@quicinc.com>
References: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
 <20241129144357.2008465-3-quic_msavaliy@quicinc.com> <Z01YBLcxDXI2UwXR@vaman>
 <d49b16b2-95e5-42b4-9bc1-40cb0bfa15b1@quicinc.com> <Z1BJSbf+1G8ojTib@vaman>
 <5ef44277-6739-4e1e-af62-0f40ae081ec1@quicinc.com> <Z2qFyQFFjiHy+FvY@vaman>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <Z2qFyQFFjiHy+FvY@vaman>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _GYmprYkN3lXb8PR0u4aPLnm9YPxPRQZ
X-Proofpoint-GUID: _GYmprYkN3lXb8PR0u4aPLnm9YPxPRQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412260110



On 12/24/2024 3:28 PM, Vinod Koul wrote:
> On 18-12-24, 18:04, Mukesh Kumar Savaliya wrote:
>> Hi Vinod, Thanks !  I just saw your comments now as somehow it was going in
>> some other folder and didn't realize.
>>
>> On 12/4/2024 5:51 PM, Vinod Koul wrote:
>>> On 02-12-24, 16:13, Mukesh Kumar Savaliya wrote:
>>>> Thanks for the review comments Vinod !
>>>>
>>>> On 12/2/2024 12:17 PM, Vinod Koul wrote:
>>>>> On 29-11-24, 20:13, Mukesh Kumar Savaliya wrote:
>>>>>> GSI DMA provides specific TREs(Transfer ring element) namely Lock and
>>>>>> Unlock TRE. It provides mutually exclusive access to I2C controller from
>>>>>> any of the processor(Apps,ADSP). Lock prevents other subsystems from
>>>>>> concurrently performing DMA transfers and avoids disturbance to data path.
>>>>>> Basically for shared I2C usecase, lock the SE(Serial Engine) for one of
>>>>>> the processor, complete the transfer, unlock the SE.
>>>>>>
>>>>>> Apply Lock TRE for the first transfer of shared SE and Apply Unlock
>>>>>> TRE for the last transfer.
>>>>>>
>>>>>> Also change MAX_TRE macro to 5 from 3 because of the two additional TREs.
>>>>>>
>>>>>
>>>>> ...
>>>>>
>>>>>> @@ -65,6 +65,9 @@ enum i2c_op {
>>>>>>      * @rx_len: receive length for buffer
>>>>>>      * @op: i2c cmd
>>>>>>      * @muli-msg: is part of multi i2c r-w msgs
>>>>>> + * @shared_se: bus is shared between subsystems
>>>>>> + * @bool first_msg: use it for tracking multimessage xfer
>>>>>> + * @bool last_msg: use it for tracking multimessage xfer
>>>>>>      */
>>>>>>     struct gpi_i2c_config {
>>>>>>     	u8 set_config;
>>>>>> @@ -78,6 +81,9 @@ struct gpi_i2c_config {
>>>>>>     	u32 rx_len;
>>>>>>     	enum i2c_op op;
>>>>>>     	bool multi_msg;
>>>>>> +	bool shared_se;
>>>>>
>>>>> Looking at this why do you need this field? It can be internal to your
>>>>> i2c driver... Why not just set an enum for lock and use the values as
>>>>> lock/unlock/dont care and make the interface simpler. I see no reason to
>>>>> use three variables to communicate the info which can be handled in
>>>>> simpler way..?
>>>>>
>>>> Below was earlier reply to [PATCH V3, 2/4], please let me know if you have
>>>> any additional comment and need further clarifications.
>>>
>>> Looks like you misunderstood, the question is why do you need three
>>> variables to convey this info..? Use a single variable please
>> Yes, I think so. Please let me clarify.
>> First variable is a feature flag and it's required to be explicitly
>> mentioned by client (i2c/spi/etc) to GSI driver.
>>
>> Second and third, can be optimized to boolean so either first or last can be
>> passed.
>>
>> Please correct me or add simple change where you would like to make, i can
>> add that.
> 
> I though we could do with a single and derive
> 
Sure, so as mentioned in the other crypto BAM patch probably dmaengine.h 
can hold flag and that can add support for lock/unlock similar to that 
patch.
I just realized it from your shared patch. let me work internally with 
Md sadre and review. Thanks for the comment.
> Also, please see 20241212041639.4109039-3-quic_mdalam@quicinc.com, folks
> from same company should talk together on same solutions, please
> converge and come up with a single proposal which works for both drivers
> 
Sure



