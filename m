Return-Path: <linux-i2c+bounces-12295-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B7BB265B4
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Aug 2025 14:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F27F7BDD73
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Aug 2025 12:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571942FD1B5;
	Thu, 14 Aug 2025 12:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lw+cFdY7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC6E2FC87F;
	Thu, 14 Aug 2025 12:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755175468; cv=none; b=RGgJPAUf9uW9jpfnOBHtI9infNrWJBuzWbkx+zdyJENggp/J+G51TtPUdOzFGT72EP1uOnh9bPa8qpOz1aZwSJZd4he+Q6V1tmQxM96srhKQ3VR2Kkg2s0ginHWrk5X4xnvZUG8WaZBOa97XVarjXqxXYiGH1BSCu1Q7OlMWdJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755175468; c=relaxed/simple;
	bh=kXIaBaS873y2D2WXihUjEr0NqSIM4mdvtSZEJ3LSO6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X2V6mKrJsNwW2+N2iESF1uYTk6pXb9AJPHtUpUi01GIu9k+6+2/uoG9XanKu5Zc9NY37/0wY/MVglbpgZevSgD0uB1mz+o/LBza35Hn1GJ3GugENt7bYeHhQTd8vnsbrhluCeIrmcJxJX8FTyFLkVZOZ2HdXYCnyp6K52NZdEVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lw+cFdY7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9MGUr020907;
	Thu, 14 Aug 2025 12:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eK/EYKVAg9GYGjtoxhSJ2Pz91r7M+ysqSVbKi+C+dqk=; b=lw+cFdY7oJabiN8x
	mMBc24E+tEQU6t7KzLdDQWRezybyYaGK0lfN+wp0gQBH80uLI58FuLFQGRO5d6WT
	1yMaqQxqX63XnZECTSukOwtnOiGK0o80x7izdai3J0D1Vai7iVYdG+f+Xw5ZuWVa
	Ukrl5AWYvUXOMYr4vDfrjMKJa8rErGAcUog4tsLJRocWctkb2+JJ2TPY6mAVMuHs
	QGev10wuKhXYPg5QfEVzaHUaHnJLqbfV0IsBi1iIW1otj8YW/RNo2+XTcw7c2NeL
	Rf5ts+SUQQBEFjFjBq7N73GwrpW7+0bdbPYABfUZKBHp9V+/VmFbMi/2jCjtPfxi
	jypuMg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sywj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 12:44:15 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57ECiE3G027496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 12:44:15 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 14 Aug
 2025 05:44:10 -0700
Message-ID: <f71d0c56-13fa-49d5-859b-0f9b5891f2a4@quicinc.com>
Date: Thu, 14 Aug 2025 18:14:07 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
To: Vinod Koul <vkoul@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        "Mukesh Kumar
 Savaliya" <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya
	<quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <quic_vtanuku@quicinc.com>
References: <CAO9ioeVuAO6mYpBSpiTW0jhFRPtkubZ5eEskd1yLBHVdR8_YMA@mail.gmail.com>
 <1b55d9d4-f3ff-4cd9-8906-5f370da55732@quicinc.com>
 <28d26c70-178f-413b-b7f8-410c508cfdd7@quicinc.com>
 <CAO9ioeXBwFYL8q7x7_fHvx5YO+qyAXk4wpnfPrku4iY9yBsk0Q@mail.gmail.com>
 <cac5e84b-fbdb-47a9-860d-16a7fa4dc773@quicinc.com>
 <4q3vlydi5xgltd3pcez54alxgrehhfn4pppg47ngwp6y5k7n33@d4d4htntj64k>
 <53dd18ec-9a65-4bf7-8490-ca3eb56ce2a5@quicinc.com>
 <iang2jpe4s6wmbypmtq5uswcm6n6xntqdulyhekcz5k6zxddu3@re3rrr4dso5p>
 <aICMDROkyjzBZFHo@vaman> <8a149580-5044-4744-b432-9f0eef0a0d31@quicinc.com>
 <aJorE6bL2d8se6E4@vaman>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <aJorE6bL2d8se6E4@vaman>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689dda1f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=h3vWmju1XmatY8WNfY0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 1bHcCNvjIt6uhEaOSXKV5_It0Lpgiufb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX98pAXez6L9LL
 ZmshEQGiz0lwHoE6oHRDmOoXGiMurv3bvpzlufVgMpK7CHp+9z0UTNRFr6rPsCz8GdSRp4WnBSz
 hf0dpSmzpQ6RSdAPHb7AXAF7BI1th434uCulTauew9Ad5PEczE0mz29AlNqS1FeHmejWoZS3+Kn
 mI17RSAk65USCv5+z5P7dU0GiUM6MhcZP56fPbXWpyLvMRzqe04ajJvGAZXP38E3ybdB3am+K7t
 NhBr9Ux9CLn+K6VS0Q6fVOkEZwqXekaANFD3QlHr9SwFL2GCZRe/AYvD9XOUqvdMXTk/pstkdJJ
 mQk/SEqo3AlRrlRRu86+B++Vx4G8ODurnbu4uqafqY/TABVZgvEBSRCvnilyXwkBSpyYC34pLU+
 yIk1Dzo/
X-Proofpoint-GUID: 1bHcCNvjIt6uhEaOSXKV5_It0Lpgiufb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015



On 8/11/2025 11:10 PM, Vinod Koul wrote:
> On 25-07-25, 16:20, Jyothi Kumar Seerapu wrote:
>>
>>
>> On 7/23/2025 12:45 PM, Vinod Koul wrote:
>>> On 22-07-25, 15:46, Dmitry Baryshkov wrote:
>>>> On Tue, Jul 22, 2025 at 05:50:08PM +0530, Jyothi Kumar Seerapu wrote:
>>>>> On 7/19/2025 3:27 PM, Dmitry Baryshkov wrote:
>>>>>> On Mon, Jul 07, 2025 at 09:58:30PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>>> On 7/4/2025 1:11 AM, Dmitry Baryshkov wrote:
>>>>>>>> On Thu, 3 Jul 2025 at 15:51, Jyothi Kumar Seerapu
>>>
>>> [Folks, would be nice to trim replies]
>>>
>>>>>>> Could you please confirm if can go with the similar approach of unmap the
>>>>>>> processed TREs based on a fixed threshold or constant value, instead of
>>>>>>> unmapping them all at once?
>>>>>>
>>>>>> I'd still say, that's a bad idea. Please stay within the boundaries of
>>>>>> the DMA API.
>>>>>>
>>>>> I agree with the approach you suggested—it's the GPI's responsibility to
>>>>> manage the available TREs.
>>>>>
>>>>> However, I'm curious whether can we set a dynamic watermark value perhaps
>>>>> half the available TREs) to trigger unmapping of processed TREs ? This would
>>>>> allow the software to prepare the next set of TREs while the hardware
>>>>> continues processing the remaining ones, enabling better parallelism and
>>>>> throughput.
>>>>
>>>> Let's land the simple implementation first, which can then be improved.
>>>> However I don't see any way to return 'above the watermark' from the DMA
>>>> controller. You might need to enhance the API.
>>>
>>> Traditionally, we set the dma transfers for watermark level and we get a
>>> interrupt. So you might want to set the callback for watermark level
>>> and then do mapping/unmapping etc in the callback. This is typical model
>>> for dmaengines, we should follow that well
>>>
>>> BR
>>
>> Thanks Dmitry and Vinod, I will work on V7 patch for submitting the I2C
>> messages until they fit and and unmap all processed messages together for
>> now.
>>
>> Regarding the watermark mechanism, looks GENI SE DMA supports watermark
>> interrupts but it appears that GPI DMA doesn't have such provision of
>> watermark.
> 
> What is the mechanism to get interrupts from the GPI? If you submit 10
> txn, can you ask it to interrupt when half of them are done?

GPI interrupts are triggered upon each transaction completion or when 
error conditions occur.

Using the Block Event Interrupt (BEI) mechanism, we can control when 
interrupts are generated.
For example, if there are 10 transactions (i.e., 10 I2C messages in a 
transfer), it's possible to configure the GSI to generate an interrupt 
after the completion of the 5th transaction.

However, with the new design discussed above, I2C messages are submitted 
dynamically based on available TREs.
BEI is configured to generate interrupts either:
   - After the last I2C message, if sufficient TREs are available, or
   - After a specific I2C message, when no further TREs are available.
	
In this dynamic setup, there is no static way to configure BEI to 
trigger interrupts at a fixed transaction count.
The interrupt behavior is instead determined by runtime resource 
availability.



> 


