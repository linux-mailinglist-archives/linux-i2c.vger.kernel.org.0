Return-Path: <linux-i2c+bounces-9074-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF22A102DB
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 10:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB1E51887A28
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 09:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A1F191F89;
	Tue, 14 Jan 2025 09:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bgrxjFHy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0D822DC49;
	Tue, 14 Jan 2025 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736846302; cv=none; b=bNcZS/cGkK3mrLpylERIgPLl/Fz9c9PytumGPry/5kRAGLBIqXnOaXiUr/iha7q+adpERMem7pHPXAqKveIe07j97+3pDs3wVhjY10NKer5QIQA80lQYfKSlSibGuWp+2E8AGfiZFVLg2r2QpKUR95zMB6qxDoPfZS1NZVN4eWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736846302; c=relaxed/simple;
	bh=Yy0eIwnOSh6G3GWKBNkJQj10YUu8tYJe0B2qTW0mQEI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=nTR4a+h+8gCJDFCDjAayyXRYBWD/kUKRMtfMlv3k1WRmeYiwnjvknG+Ep6PdqsBqKEIOjJiM0bWEmzHYDjmJqzqC4KJWhPNRF3T0R52EEInzRrvAl4ETXnSLhFTHCAb3mDJ3VDWW4iFJZqySFI+XzAPP7X3N9+HZ8khfK80MD3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bgrxjFHy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E7cZIt019694;
	Tue, 14 Jan 2025 09:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ez/MatY4ncetVheu42gjWT0fmCQoTLlhYeLYizkO/aU=; b=bgrxjFHyiiDvaC5n
	DwQrTn/dW3/Lc2gYKjpKXVXEziH49nrEs32dBHtDkI+AdKH0HM+iOkijmy4xEBNG
	6GOikmZeR8ARTl3nzCsE5fkvfTGtOif34XB2AWCnyRGhi3Cv23i7ftvdKAL3VR1x
	Kn8b76Mm6X1DHxK89zIJYPgQX5Ruh9ckWY4ATMcUur1sjT9Lzf6t7VRlGKbVExXo
	xUWf6euDFMyoejTXgcx2vep4QsdgMtcudSgWKFs8jJGQpII4phrhepwq4MZ1Nt0e
	K4tRGGY1v0R55SG/uBuiz/DDpRJ2AMyYDxnRanSwbhbWTAuUuDPkj81cJWWn3+NE
	Nv77bw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445kqc071r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 09:18:12 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E9IC0X008885
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 09:18:12 GMT
Received: from [10.216.21.195] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 Jan
 2025 01:18:04 -0800
Message-ID: <1566eafb-7286-4f27-922d-0bbaaab8120b@quicinc.com>
Date: Tue, 14 Jan 2025 14:48:01 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] dmaengine: gpi: Add Lock and Unlock TRE support to
 access I2C exclusively
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
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
 <b34e3ac0-70b4-491c-a807-dc13fac41d06@quicinc.com>
Content-Language: en-US
In-Reply-To: <b34e3ac0-70b4-491c-a807-dc13fac41d06@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: H5KyG2jT57WlKMZNDFeUMgpS4lFEtgp0
X-Proofpoint-ORIG-GUID: H5KyG2jT57WlKMZNDFeUMgpS4lFEtgp0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501140075

Hi Vinod,

On 12/26/2024 5:52 PM, Mukesh Kumar Savaliya wrote:
> 
> 
> On 12/24/2024 3:28 PM, Vinod Koul wrote:
>> On 18-12-24, 18:04, Mukesh Kumar Savaliya wrote:
>>> Hi Vinod, Thanks !  I just saw your comments now as somehow it was 
>>> going in
>>> some other folder and didn't realize.
>>>
>>> On 12/4/2024 5:51 PM, Vinod Koul wrote:
>>>> On 02-12-24, 16:13, Mukesh Kumar Savaliya wrote:
>>>>> Thanks for the review comments Vinod !
>>>>>
>>>>> On 12/2/2024 12:17 PM, Vinod Koul wrote:
>>>>>> On 29-11-24, 20:13, Mukesh Kumar Savaliya wrote:
>>>>>>> GSI DMA provides specific TREs(Transfer ring element) namely Lock 
>>>>>>> and
>>>>>>> Unlock TRE. It provides mutually exclusive access to I2C 
>>>>>>> controller from
>>>>>>> any of the processor(Apps,ADSP). Lock prevents other subsystems from
>>>>>>> concurrently performing DMA transfers and avoids disturbance to 
>>>>>>> data path.
>>>>>>> Basically for shared I2C usecase, lock the SE(Serial Engine) for 
>>>>>>> one of
>>>>>>> the processor, complete the transfer, unlock the SE.
>>>>>>>
>>>>>>> Apply Lock TRE for the first transfer of shared SE and Apply Unlock
>>>>>>> TRE for the last transfer.
>>>>>>>
>>>>>>> Also change MAX_TRE macro to 5 from 3 because of the two 
>>>>>>> additional TREs.
>>>>>>>
>>>>>>
>>>>>> ...
>>>>>>
>>>>>>> @@ -65,6 +65,9 @@ enum i2c_op {
>>>>>>>      * @rx_len: receive length for buffer
>>>>>>>      * @op: i2c cmd
>>>>>>>      * @muli-msg: is part of multi i2c r-w msgs
>>>>>>> + * @shared_se: bus is shared between subsystems
>>>>>>> + * @bool first_msg: use it for tracking multimessage xfer
>>>>>>> + * @bool last_msg: use it for tracking multimessage xfer
>>>>>>>      */
>>>>>>>     struct gpi_i2c_config {
>>>>>>>         u8 set_config;
>>>>>>> @@ -78,6 +81,9 @@ struct gpi_i2c_config {
>>>>>>>         u32 rx_len;
>>>>>>>         enum i2c_op op;
>>>>>>>         bool multi_msg;
>>>>>>> +    bool shared_se;
>>>>>>
>>>>>> Looking at this why do you need this field? It can be internal to 
>>>>>> your
>>>>>> i2c driver... Why not just set an enum for lock and use the values as
>>>>>> lock/unlock/dont care and make the interface simpler. I see no 
>>>>>> reason to
>>>>>> use three variables to communicate the info which can be handled in
>>>>>> simpler way..?
>>>>>>
>>>>> Below was earlier reply to [PATCH V3, 2/4], please let me know if 
>>>>> you have
>>>>> any additional comment and need further clarifications.
>>>>
>>>> Looks like you misunderstood, the question is why do you need three
>>>> variables to convey this info..? Use a single variable please
>>> Yes, I think so. Please let me clarify.
>>> First variable is a feature flag and it's required to be explicitly
>>> mentioned by client (i2c/spi/etc) to GSI driver.
>>>
>>> Second and third, can be optimized to boolean so either first or last 
>>> can be
>>> passed.
>>>
>>> Please correct me or add simple change where you would like to make, 
>>> i can
>>> add that.
>>
>> I though we could do with a single and derive
>>
> Sure, so as mentioned in the other crypto BAM patch probably dmaengine.h 
> can hold flag and that can add support for lock/unlock similar to that 
> patch.
> I just realized it from your shared patch. let me work internally with 
> Md sadre and review. Thanks for the comment.
>> Also, please see 20241212041639.4109039-3-quic_mdalam@quicinc.com, folks
>> from same company should talk together on same solutions, please
>> converge and come up with a single proposal which works for both drivers
>>
I have discussed with Md Sadre and tried to understand and utilize the 
enum of lock and unlock in my changes. Below is the summary.

I can't use those lock and unlock enums here because it's required for 
first and last message respectively. intermediate transfers will not use 
anything. So we need to define one more enum like dma_ctrl_none.

if i create another internal parent structure having required 3 members, 
then also it will need 3 child members. So i think current one looks 
good to me.

Please help review and suggest if anything can be better here.

> Sure
> 
> 


