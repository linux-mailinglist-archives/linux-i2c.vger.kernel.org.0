Return-Path: <linux-i2c+bounces-11504-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E16F5ADCF96
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 16:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2CCF189EA6F
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 14:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5914A2E3B16;
	Tue, 17 Jun 2025 14:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JIKyLmom"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F284236A99;
	Tue, 17 Jun 2025 14:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169514; cv=none; b=PhzywegDV3TmAAjytgsE+2nINyXwhVJB5hk0p7ejO+uhAQhd6/mBQLnP9kchvwM7lfEidng2mop77kPU+SOEgsdxXI3U2s7qXWmOTXiD10sl6jxaYlzJ4KmRtkIdhtb9U4OX29GZggiBPWZ51+ZFeWTaF6rG2NDL9AEMN2ABPX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169514; c=relaxed/simple;
	bh=FlpT4mSnskv7dw1+BpUTd2fv+q+ZZUHkItf8LExXoX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qqIiD1SQGXMabTzXrUZ7dJtEFmhmNUi5g+Pgb5U6QIaCxw34kCo7UqgtH32TV4HosE+H8ywkVvCIHvrwRWPju3pTEavhony1+Ii3cY8DT0kAg1VorSnd+cUnKlNSTHPYfoNecD3DQlQQlPDsOgWldadimX71iKCE8FSjxk8VQUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JIKyLmom; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7wc8g014442;
	Tue, 17 Jun 2025 14:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ifkXAcVLvQpNJRJEgIpDZf0Mg9P6CL8tC8Po4cRO0LU=; b=JIKyLmome0qxDDYW
	gO4chYUKOI4Lj0arNspoZ2xFlYcVU6vnu4PEnfpBy5TNswTKK1Wm+0wr/iW8Vy/d
	j8Cet/8+2K4SQ6dgop7xqoUNkEfduPQDHqaS8AswUWIFPNgJkGssOCPtr0QdnaTb
	yxm8QXgRIxyLxMLw9zQKXs8z6zYEVhLp01ka86CHej0Cvhfc0EPTD3+uARtmuESk
	lsn+6N1g3XjwkwD7O6snmuDICJeArHdD8NE5RZyLt+zA50MtR/f9xqMmsrytzgWM
	zXg37CkFunI7MQcoxG9kUBhC3pihAPZUBT5XkE3oHP6ZmVLvlDLtw8qc2jjni5bH
	R098yg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47akuwc1fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 14:11:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55HEBgTb013489
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 14:11:42 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Jun
 2025 07:11:38 -0700
Message-ID: <dc7358a1-ddc5-402e-9024-283f8e46e3b6@quicinc.com>
Date: Tue, 17 Jun 2025 19:41:35 +0530
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
 <5ed77f6d-14d7-4b62-9505-ab988fa43bf2@quicinc.com>
 <644oygj43z2um42tmmldp3feemgzrdoirzfw7pu27k4zi76bwg@wfxbtgqqgh4p>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <644oygj43z2um42tmmldp3feemgzrdoirzfw7pu27k4zi76bwg@wfxbtgqqgh4p>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rC0ari-Li_pF2kZj154HFxX8R1HQ_rji
X-Authority-Analysis: v=2.4 cv=He0UTjE8 c=1 sm=1 tr=0 ts=6851779f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=BcHELEONEp7jDoDfLvUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: rC0ari-Li_pF2kZj154HFxX8R1HQ_rji
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDEwOSBTYWx0ZWRfX2Lco3J5gqTV8
 5wndbDs4HBTbgbA8t4NSX6tDVPAg8eGGCaPIC0swObhtdlXmJNqhDWkGbdpbXWslW1NPgFu4z7b
 CO20vgdChxOvf6wFPukbVWvZCbLH9inUdWniKqKnmzDK+/UFy1UXWcoL33w3GVCHsoH7OJYohPb
 NuYz78k8NcxnIC0AzJUf6Vsb5+W+XXsqLnyVqBFplVYiQvlLfVRriszcBjvXHv6kfkeMTOLNmq+
 erPuDtkuLkGsnFy3FD42UgGpfl2+4UIPz520rhSlnzTkdyDulsIqMfGJ5Tv2LBSB2GHp8B+Ny+B
 Y5Hvjehjsnr2hLhr5IyjVh61RprjzPTOK0iwzXpMes8qiFcYV7Ktb12+PlzdbYRs0H6qprFZJWP
 tdsE10V/JScrIKfufFXzzOuSn/acLsn6xMXlyAQuW8mnIbsE2ozWJ0WkvV7MMRjehmvgWafa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170109



On 5/30/2025 10:12 PM, Dmitry Baryshkov wrote:
> On Fri, May 30, 2025 at 07:36:05PM +0530, Jyothi Kumar Seerapu wrote:
>>
>>
>> On 5/21/2025 6:15 PM, Dmitry Baryshkov wrote:
>>> On Wed, May 21, 2025 at 03:58:48PM +0530, Jyothi Kumar Seerapu wrote:
>>>>
>>>>
>>>> On 5/9/2025 9:31 PM, Dmitry Baryshkov wrote:
>>>>> On 09/05/2025 09:18, Jyothi Kumar Seerapu wrote:
>>>>>> Hi Dimitry, Thanks for providing the review comments.
>>>>>>
>>>>>> On 5/6/2025 5:16 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, May 06, 2025 at 04:48:44PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>>>> The I2C driver gets an interrupt upon transfer completion.
>>>>>>>> When handling multiple messages in a single transfer, this
>>>>>>>> results in N interrupts for N messages, leading to significant
>>>>>>>> software interrupt latency.
>>>>>>>>
>>>>>>>> To mitigate this latency, utilize Block Event Interrupt (BEI)
>>>>>>>> mechanism. Enabling BEI instructs the hardware to prevent interrupt
>>>>>>>> generation and BEI is disabled when an interrupt is necessary.
>>>>>>>>
>>>>>>>> Large I2C transfer can be divided into chunks of 8 messages internally.
>>>>>>>> Interrupts are not expected for the first 7 message completions, only
>>>>>>>> the last message triggers an interrupt, indicating the completion of
>>>>>>>> 8 messages. This BEI mechanism enhances overall transfer efficiency.
>>>>>>>
>>>>>>> Why do you need this complexity? Is it possible to set the
>>>>>>> DMA_PREP_INTERRUPT flag on the last message in the transfer?
>>>>>>
>>>>>> If i undertsand correctly, the suggestion is to get the single
>>>>>> intetrrupt for last i2c message only.
>>>>>>
>>>>>> But With this approach, we can't handle large number of i2c messages
>>>>>> in the transfer.
>>>>>>
>>>>>> In GPI driver, number of max TREs support is harcoded to 64 (#define
>>>>>> CHAN_TRES   64) and for I2C message, we need Config TRE, GO TRE and
>>>>>> DMA TREs. So, the avilable TREs are not sufficient to handle all the
>>>>>> N messages.
>>>>>
>>>>> It sounds like a DMA driver issue. In other words, the DMA driver can
>>>>> know that it must issue an interrupt before exausting 64 TREs in order
>>>>> to
>>>>>
>>>>>>
>>>>>> Here, the plan is to queue i2c messages (QCOM_I2C_GPI_MAX_NUM_MSGS
>>>>>> or 'num' incase for less messsages), process and unmap/free upon the
>>>>>> interrupt based on QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
>>>>>
>>>>> Why? This is some random value which has no connection with CHAN_TREs.
>>>>> Also, what if one of the platforms get a 'liter' GPI which supports less
>>>>> TREs in a single run? Or a super-premium platform which can use 256
>>>>> TREs? Please don't workaround issues from one driver in another one.
>>>>
>>>> We are trying to utilize the existing CHAN_TRES mentioned in the GPI driver.
>>>> With the following approach, the GPI hardware can process N number of I2C
>>>> messages, thereby improving throughput and transfer efficiency.
>>>>
>>>> The main design consideration for using the block event interrupt is as
>>>> follows:
>>>>
>>>> Allow the hardware to process the TREs (I2C messages), while the software
>>>> concurrently prepares the next set of TREs to be submitted to the hardware.
>>>> Once the TREs are processed, they can be freed, enabling the software to
>>>> queue new TREs. This approach enhances overall optimization.
>>>>
>>>> Please let me know if you have any questions, concerns, or suggestions.
>>>
>>> The question was why do you limit that to QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
>>> What is the reason for that limit, etc. If you think about it, The GENI
>>> / I2C doesn't impose any limit on the number of messages processed in
>>> one go (if I understand it correctly). Instead the limit comes from the
>>> GPI DMA driver. As such, please don't add extra 'handling' to the I2C
>>> driver. Make GPI DMA driver responsible for saying 'no more for now',
>>> then I2C driver can setup add an interrupt flag and proceed with
>>> submitting next messages, etc.
>>>
>>
>> For I2C messages, we need to prepare TREs for Config, Go and DMAs. However,
>> if a large number of I2C messages are submitted then may may run out of
>> memory for serving the TREs. The GPI channel supports a maximum of 64 TREs,
>> which is insufficient to serve 32 or even 16 I2C messages concurrently,
>> given the multiple TREs required per message.
>>
>> To address this limitation, a strategy has been implemented to manage how
>> many messages can be queued and how memory is recycled. The constant
>> QCOM_I2C_GPI_MAX_NUM_MSGS is set to 16, defining the upper limit of
>> messages that can be queued at once. Additionally,
>> QCOM_I2C_GPI_NUM_MSGS_PER_IRQ is set to 8, meaning that
>> half of the queued messages are expected to be freed or deallocated per
>> interrupt.
>> This approach ensures that the driver can efficiently manage TRE resources
>> and continue queuing new I2C messages without exhausting memory.
>>> I really don't see a reason for additional complicated handling in the
>>> geni driver that you've implemented. Maybe I misunderstand something. In
>>> such a case it usually means that you have to explain the design in the
>>> commit message / in-code comments.
>>>
>>
>>
>> The I2C Geni driver is designed to prepare and submit descriptors to the GPI
>> driver one message at a time.
>> As a result, the GPI driver does not have visibility into the current
>> message index or the total number of I2C messages in a transfer. This lack
>> of context makes it challenging to determine when to set the block event
>> interrupt, which is typically used to signal the completion of a batch of
>> messages.
>>
>> So, the responsibility for deciding when to set the BEI should lie with the
>> I2C driver.
>>
>> If this approach is acceptable, I will proceed with updating the relevant
>> details in the commit message.
>>
>> Please let me know if you have any concerns or suggestions.
>
Hi Dmitry, Sorry for the delayed response, and thank you for the 
suggestions.

> - Make gpi_prep_slave_sg() return NULL if flags don't have
>    DMA_PREP_INTERRUPT flag and there are no 3 empty TREs for the
>    interrupt-enabled transfer.
"there are no 3 empty TREs for the interrupt-enabled transfer."
Could you please help me understand this a bit better?
> 
> - If I2C driver gets NULL from dmaengine_prep_slave_single(), retry
>    again, adding DMA_PREP_INTERRUPT. Make sure that the last one always
>    gets DMA_PREP_INTERRUPT.
Does this mean we need to proceed to the next I2C message and ensure 
that the DMA_PREP_INTERRUPT flag is set for the last I2C message in each 
chunk? And then, should we submit the chunk of messages to the GSI 
hardware for processing?

> 
> - In geni_i2c_gpi_xfer() split the loop to submit messages until you
>    can, then call wait_for_completion_timeout() and then
>    geni_i2c_gpi_unmap() for submitted messages, then continue with a new
>    portion of messages.
Since the GPI channel supports a maximum of 64 TREs, should we consider 
submitting a smaller number of predefined messages — perhaps fewer than 
32, such as 16?
This is because handling 32 messages would require one TRE for config 
and 64 TREs for the Go and DMA preparation steps, which exceeds the 
channel's TRE capacity of 64.

We designed the approach to submit a portion of the messages — for 
example, 16 at a time. Once 8 messages are processed and freed, the 
hardware can continue processing the TREs, while the software 
simultaneously prepares the next set of TREs. This parallelism helps in 
efficiently utilizing the hardware and enhances overall system 
optimization.


> 


