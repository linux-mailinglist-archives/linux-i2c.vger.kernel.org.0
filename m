Return-Path: <linux-i2c+bounces-11162-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD01BAC912F
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 16:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 490B17A36C9
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 14:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8CA233D8E;
	Fri, 30 May 2025 14:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oop1juP3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D8523236D;
	Fri, 30 May 2025 14:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613983; cv=none; b=WADkq17Nzk+FRM1FcJEj4ClkpCUPKE+jLiUWNn0hpfOl4iRarlIfNR7dMf8NTZyVS5JG4kQPWhjLO84/TNNuaYoBR4znlhAjAEbVcZDrE+6sVF79nMV3X++uYRU9viIbCxDAVZAemvUJ3SVbiAW06spiLUIotYfoMHi5WFjsL0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613983; c=relaxed/simple;
	bh=nIXwFdbhG2IyCNiR3RRFnNCHLHylK7UGPpD0ZSR2JuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TN9fSfZA6mCw5I3j2Cnj7lB9MVXXRykdl+oWWgI9q7PGZbxmIn7jhwEpWc2yUnBsgyrRK9IqwMUPxbaUdsZjQmYL6OFy+B++LLgjCE7FpWZHEyNWo8xsbYBbftSTIbJ2fERP4m19SjmM6Ozld5y5hcbna0hRnN7uYM+B1tMaMIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oop1juP3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBnW5N016093;
	Fri, 30 May 2025 14:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQYZWeIIBAE+eqH1hYBy5QCANHbuBmJ+jiTF7okFXSE=; b=oop1juP3iK/oJMeT
	yZI611vr+vehd8NrFHXAgGMxWiw7jVRk4iFZcIemacZjLW6/WYx2CvScPJVEp5/d
	Q/etZMBwCqG7LjmNJwtAvaTTs/r9OVcNIT+LlPG9TTqoCyuamj+SLbQl4TpyZMrF
	MGAL/esxqxNUvmquAg8SsrkqlY123VqBe6DPh4CFkIrElh4j24Im8hv3eGfLx3eG
	SVoDvYuAN8pdX/e0+dfd9yvwXr0BD+RjihJIeEcv9AQ9Y2w3DWeDSPzzdo3RbLr3
	MD1UWvAb+YOyvlnLhHVTw30XxEucbtJuygDqcvQVJ8Q1SSjFXvlRh2nPUMv6kfbk
	aKrAPA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yc4yrcx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 14:06:13 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54UE6CZA003098
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 14:06:12 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 May
 2025 07:06:08 -0700
Message-ID: <5ed77f6d-14d7-4b62-9505-ab988fa43bf2@quicinc.com>
Date: Fri, 30 May 2025 19:36:05 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Vinod Koul <vkoul@kernel.org>,
        Mukesh Kumar Savaliya
	<quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <quic_vtanuku@quicinc.com>
References: <20250506111844.1726-1-quic_jseerapu@quicinc.com>
 <20250506111844.1726-3-quic_jseerapu@quicinc.com>
 <qizkfszruwcny7f3g3i7cjst342s6ma62k5sgc6pg6yfoti7b3@fo2ssj7jvff2>
 <3aa92123-e43e-4bf5-917a-2db6f1516671@quicinc.com>
 <a98f0f1a-d814-4c6a-9235-918091399e4b@oss.qualcomm.com>
 <ba7559c8-36b6-4628-8fc4-26121f00abd5@quicinc.com>
 <w6epbao7dwwx65crst6md4uxi3iivkcj55mhr2ko3z5olezhdl@ffam3xif6tmh>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <w6epbao7dwwx65crst6md4uxi3iivkcj55mhr2ko3z5olezhdl@ffam3xif6tmh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDEyNCBTYWx0ZWRfX6mopTBZ3SY4n
 jtwe3BYDMpVyxvij4opEuklIBJtAzZKLSXCDpYv5WXeGt4mcikaz5eYWTEtbofIwk/ovaRhr7kv
 ZgVzQPwL/LwP6E+VJsOXFR5B2kiaMinhaO/wdk5an077ZJdSJDjThp+QnW0rvLRSyMCinLQ9idF
 jOIRALQDHoO0fOd2+p5/3w1DueJT9jijYlqg1joxrlVobrrrc8S5f/4yLSI0tNonaSe0wXdWQJv
 BMsMBcDc10cX8aZY0VEaRGAkuMIQa45lQWvOXq0kYCE3RrR+fayKjnYBzwGDBjP0dFXK7wAI9Hw
 CEj4utklAcbmax3nJUKtOGvaRLHsVewhDHpqNwg9YGeGhelS3cFScwZK23jZh4bKhvP8A4fTiMk
 y8bWmkV+zsOB7/iIie8d1k7x0hv0YLhur77eLXv89QAVsXFceD6ErVoBZWBAK6sDzc8+94eA
X-Authority-Analysis: v=2.4 cv=Ybe95xRf c=1 sm=1 tr=0 ts=6839bb55 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=0dzRBygV2XmgNQc9eD4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 9WWcgn3h1dr3-M0fnf9FJwiT8I77t4n1
X-Proofpoint-ORIG-GUID: 9WWcgn3h1dr3-M0fnf9FJwiT8I77t4n1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_06,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300124



On 5/21/2025 6:15 PM, Dmitry Baryshkov wrote:
> On Wed, May 21, 2025 at 03:58:48PM +0530, Jyothi Kumar Seerapu wrote:
>>
>>
>> On 5/9/2025 9:31 PM, Dmitry Baryshkov wrote:
>>> On 09/05/2025 09:18, Jyothi Kumar Seerapu wrote:
>>>> Hi Dimitry, Thanks for providing the review comments.
>>>>
>>>> On 5/6/2025 5:16 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, May 06, 2025 at 04:48:44PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>> The I2C driver gets an interrupt upon transfer completion.
>>>>>> When handling multiple messages in a single transfer, this
>>>>>> results in N interrupts for N messages, leading to significant
>>>>>> software interrupt latency.
>>>>>>
>>>>>> To mitigate this latency, utilize Block Event Interrupt (BEI)
>>>>>> mechanism. Enabling BEI instructs the hardware to prevent interrupt
>>>>>> generation and BEI is disabled when an interrupt is necessary.
>>>>>>
>>>>>> Large I2C transfer can be divided into chunks of 8 messages internally.
>>>>>> Interrupts are not expected for the first 7 message completions, only
>>>>>> the last message triggers an interrupt, indicating the completion of
>>>>>> 8 messages. This BEI mechanism enhances overall transfer efficiency.
>>>>>
>>>>> Why do you need this complexity? Is it possible to set the
>>>>> DMA_PREP_INTERRUPT flag on the last message in the transfer?
>>>>
>>>> If i undertsand correctly, the suggestion is to get the single
>>>> intetrrupt for last i2c message only.
>>>>
>>>> But With this approach, we can't handle large number of i2c messages
>>>> in the transfer.
>>>>
>>>> In GPI driver, number of max TREs support is harcoded to 64 (#define
>>>> CHAN_TRES   64) and for I2C message, we need Config TRE, GO TRE and
>>>> DMA TREs. So, the avilable TREs are not sufficient to handle all the
>>>> N messages.
>>>
>>> It sounds like a DMA driver issue. In other words, the DMA driver can
>>> know that it must issue an interrupt before exausting 64 TREs in order
>>> to
>>>
>>>>
>>>> Here, the plan is to queue i2c messages (QCOM_I2C_GPI_MAX_NUM_MSGS
>>>> or 'num' incase for less messsages), process and unmap/free upon the
>>>> interrupt based on QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
>>>
>>> Why? This is some random value which has no connection with CHAN_TREs.
>>> Also, what if one of the platforms get a 'liter' GPI which supports less
>>> TREs in a single run? Or a super-premium platform which can use 256
>>> TREs? Please don't workaround issues from one driver in another one.
>>
>> We are trying to utilize the existing CHAN_TRES mentioned in the GPI driver.
>> With the following approach, the GPI hardware can process N number of I2C
>> messages, thereby improving throughput and transfer efficiency.
>>
>> The main design consideration for using the block event interrupt is as
>> follows:
>>
>> Allow the hardware to process the TREs (I2C messages), while the software
>> concurrently prepares the next set of TREs to be submitted to the hardware.
>> Once the TREs are processed, they can be freed, enabling the software to
>> queue new TREs. This approach enhances overall optimization.
>>
>> Please let me know if you have any questions, concerns, or suggestions.
> 
> The question was why do you limit that to QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
> What is the reason for that limit, etc. If you think about it, The GENI
> / I2C doesn't impose any limit on the number of messages processed in
> one go (if I understand it correctly). Instead the limit comes from the
> GPI DMA driver. As such, please don't add extra 'handling' to the I2C
> driver. Make GPI DMA driver responsible for saying 'no more for now',
> then I2C driver can setup add an interrupt flag and proceed with
> submitting next messages, etc.
> 

For I2C messages, we need to prepare TREs for Config, Go and DMAs. 
However, if a large number of I2C messages are submitted then may may 
run out of memory for serving the TREs. The GPI channel supports a 
maximum of 64 TREs, which is insufficient to serve 32 or even 16 I2C 
messages concurrently, given the multiple TREs required per message.

To address this limitation, a strategy has been implemented to manage 
how many messages can be queued and how memory is recycled. The constant 
QCOM_I2C_GPI_MAX_NUM_MSGS is set to 16, defining the upper limit of
messages that can be queued at once. Additionally, 
QCOM_I2C_GPI_NUM_MSGS_PER_IRQ is set to 8, meaning that
half of the queued messages are expected to be freed or deallocated per 
interrupt.
This approach ensures that the driver can efficiently manage TRE 
resources and continue queuing new I2C messages without exhausting memory.
> I really don't see a reason for additional complicated handling in the
> geni driver that you've implemented. Maybe I misunderstand something. In
> such a case it usually means that you have to explain the design in the
> commit message / in-code comments.
> 


The I2C Geni driver is designed to prepare and submit descriptors to the 
GPI driver one message at a time.
As a result, the GPI driver does not have visibility into the current 
message index or the total number of I2C messages in a transfer. This 
lack of context makes it challenging to determine when to set the block 
event interrupt, which is typically used to signal the completion of a 
batch of messages.

So, the responsibility for deciding when to set the BEI should lie with 
the I2C driver.

If this approach is acceptable, I will proceed with updating the 
relevant details in the commit message.

Please let me know if you have any concerns or suggestions.

