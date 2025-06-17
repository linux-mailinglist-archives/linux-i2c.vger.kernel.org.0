Return-Path: <linux-i2c+bounces-11505-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A5ADCFBF
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 16:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB40B3AFC87
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 14:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F45E2E7F38;
	Tue, 17 Jun 2025 14:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Dv4rnZ4M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE322E54A0;
	Tue, 17 Jun 2025 14:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169835; cv=none; b=XF99OnVm2AmikSp1zDhbgNNadE4d+Mn1VfZJT1aONOmbNkC7ZjP9C6yCkj5lUMFT+PUAwH0VttLpQK+JwBym0YL7Ri5b+T3WMm9AsE1bnn+FwiDUttMese0LGtd5nMojVcp2z+WVocRi0sd9h9WlTMz2z51W2hxy5rXrG2G6fmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169835; c=relaxed/simple;
	bh=nKf4kiz3gkj96eDUS/E9GKO+Cp6HTAu2vUqpViPbqA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VUzmEn28DKFQl70oaOhlii0ich33iEi+tmrIdhWNzJ42e98dNJ/OecoMKsOlrinb4MUusfWEibE4H3u2wEcf8JuYqIi5+Ve1yXrtuDZunnG77DMkkV2QLofPmH1Cz04LfAjsQHFch+16IOOYBe2ca4vLVEkTr8zJRrrEiqs44KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Dv4rnZ4M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HDTBOa010361;
	Tue, 17 Jun 2025 14:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kvylzx5njgdJJXERfy/aqJInKEarqf+wNdWiuUSUJV4=; b=Dv4rnZ4Mo2h487yE
	15PhvsU8ZbrVdCuRvKvDBz260aAcY6t4xgK1qsmCa6JAnh0p+m5ams7v7zlOWAnZ
	KtjPYooBHQJip7I7Bdu3DRwaY5pd8bFdeezbLudOPxAS5XAfClRfmQ7c1uuL9Cxt
	YRVhvyReSHTqG5ly/NLH4mUABIRT42acLfeTB0SVChSfpm0e7WdTI5wt1f6omEnP
	6npGKpXrd8E4aqPNsT9D0mMpgVq0l73LjPlyO42f/RAqN6VHMSljmkC2SeothKA9
	6klAeznGbHa8KzWtiqHkpTFFJ6oQl2aV6Zd7zy67wMhMaN3dYHfTfNYtyPiwM1wr
	lgUUBg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792ca0pd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 14:17:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55HEH5eC011275
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 14:17:05 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Jun
 2025 07:17:00 -0700
Message-ID: <f04b5912-8e1c-47fe-8d0e-3bef72ae393d@quicinc.com>
Date: Tue, 17 Jun 2025 19:46:58 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
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
 <20250506111844.1726-2-quic_jseerapu@quicinc.com>
 <ze5y6llgo2qx4nvilaqcmkam5ywqa76d6uetn34iblz4nefpeu@ozbgzwbyd54u>
 <4456d0e2-3451-4749-acda-3b75ae99e89b@quicinc.com>
 <de00809a-2775-4417-b987-5f557962ec31@quicinc.com>
 <CAO9ioeUW9-7N2Ptu_p=XKzeb02RsXx8V3CzarPOD4EWy4QrnsA@mail.gmail.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <CAO9ioeUW9-7N2Ptu_p=XKzeb02RsXx8V3CzarPOD4EWy4QrnsA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7849VFfCynm0RwCxyFVVopjy9CDouI6e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDExMSBTYWx0ZWRfXxXam36pE1f5g
 BAlpojhrYEiEvg8zLz3I4dmrvGSuTCwNOxzPBzi5hu6ZmadroSfGk9yAJGCQdeLNXF+x4ip2HYh
 U13zlXddjb5QZFjyVR26/pAfBM74cN2oiqZUHk0kU2/ZIGwDqwYMCUor96qNSjRi+d+OQ8eLhVa
 f4ZmMz1UUGssyEsjpbBFtnFPZc5KBts1NsJDIcJ31ZG+HH2Nw8s7iqhmOMAsyJJ5U0kOcCeuoOU
 YPpuVAJWIWLaVNsnILm01n+9urJ4mPsmIiI3rD1IPFQnYSbZDkDq4CdpwywTVdmYUlLGSXAQJ7k
 a7rhVgTUa6bJds2j7pMqDHYsqWH+WRYwPlTqh+8xz2iLbIAkd8+W37QezyARzFKwVLjthRRcQw+
 ddHOYqndbx0UBWwfEW4g1EgvFDFpoTCnFI8sR/cFskhDEuQ5pMRz0RSODaxS7klpUC/gfqKY
X-Proofpoint-ORIG-GUID: 7849VFfCynm0RwCxyFVVopjy9CDouI6e
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=685178e2 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=Q71dxAOmp9mF6df1qtUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170111



On 5/30/2025 9:23 PM, Dmitry Baryshkov wrote:
> On Fri, 30 May 2025 at 17:05, Jyothi Kumar Seerapu
> <quic_jseerapu@quicinc.com> wrote:
>>
>>
>>
>> On 5/9/2025 11:48 AM, Jyothi Kumar Seerapu wrote:
>>>
>>>
>>> On 5/6/2025 5:02 PM, Dmitry Baryshkov wrote:
>>>> On Tue, May 06, 2025 at 04:48:43PM +0530, Jyothi Kumar Seerapu wrote:
>>>>> GSI hardware generates an interrupt for each transfer completion.
>>>>> For multiple messages within a single transfer, this results in
>>>>> N interrupts for N messages, leading to significant software
>>>>> interrupt latency.
>>>>>
>>>>> To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
>>>>> Enabling BEI instructs the GSI hardware to prevent interrupt generation
>>>>> and BEI is disabled when an interrupt is necessary.
>>>>>
>>>>> When using BEI, consider splitting a single multi-message transfer into
>>>>> chunks of 8 messages internally and so interrupts are not expected for
>>>>> the first 7 message completions, only the last message triggers
>>>>> an interrupt, indicating the completion of 8 messages.
>>>>>
>>>>> This BEI mechanism enhances overall transfer efficiency.
>>>>>
>>>>> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
>>>>> ---
>>>>> v5 ->v6:
>>>>>     - For updating the block event interrupt bit, instead of relying on
>>>>>       bei_flag, decision check is moved with DMA_PREP_INTERRUPT flag.
>>>>> v4 -> v5:
>>>>>     - BEI flag naming changed from flags to bei_flag.
>>>>>     - QCOM_GPI_BLOCK_EVENT_IRQ macro is removed from qcom-gpi-dma.h
>>>>>       file, and Block event interrupt support is checked with bei_flag.
>>>>>
>>>>> v3 -> v4:
>>>>>     - API's added for Block event interrupt with multi descriptor
>>>>> support for
>>>>>       I2C is moved from qcom-gpi-dma.h file to I2C geni qcom driver file.
>>>>>     - gpi_multi_xfer_timeout_handler function is moved from GPI driver to
>>>>>       I2C driver.
>>>>>
>>>>> v2-> v3:
>>>>>      - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handler
>>>>>      - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
>>>>>      - Added documentation for newly added changes in "qcom-gpi-dma.h"
>>>>> file
>>>>>      - Updated commit description.
>>>>>
>>>>> v1 -> v2:
>>>>>      - Changed dma_addr type from array of pointers to array.
>>>>>      - To support BEI functionality with the TRE size of 64 defined in
>>>>> GPI driver,
>>>>>        updated QCOM_GPI_MAX_NUM_MSGS to 16 and NUM_MSGS_PER_IRQ to 4.
>>>>>
>>>>>    drivers/dma/qcom/gpi.c           | 3 +++
>>>>>    include/linux/dma/qcom-gpi-dma.h | 2 ++
>>>>>    2 files changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>>>>> index b1f0001cc99c..7e511f54166a 100644
>>>>> --- a/drivers/dma/qcom/gpi.c
>>>>> +++ b/drivers/dma/qcom/gpi.c
>>>>> @@ -1695,6 +1695,9 @@ static int gpi_create_i2c_tre(struct gchan
>>>>> *chan, struct gpi_desc *desc,
>>>>>            tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
>>>>>            tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
>>>>> +
>>>>> +        if (!(i2c->dma_flags & DMA_PREP_INTERRUPT))
>>>>> +            tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
>>>>>        }
>>>>>        for (i = 0; i < tre_idx; i++)
>>>>> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/
>>>>> qcom-gpi-dma.h
>>>>> index 6680dd1a43c6..ebac0d3edff2 100644
>>>>> --- a/include/linux/dma/qcom-gpi-dma.h
>>>>> +++ b/include/linux/dma/qcom-gpi-dma.h
>>>>> @@ -65,6 +65,7 @@ enum i2c_op {
>>>>>     * @rx_len: receive length for buffer
>>>>>     * @op: i2c cmd
>>>>>     * @muli-msg: is part of multi i2c r-w msgs
>>>>> + * @dma_flags: Flags indicating DMA capabilities
>>>>>     */
>>>>>    struct gpi_i2c_config {
>>>>>        u8 set_config;
>>>>> @@ -78,6 +79,7 @@ struct gpi_i2c_config {
>>>>>        u32 rx_len;
>>>>>        enum i2c_op op;
>>>>>        bool multi_msg;
>>>>> +    unsigned int dma_flags;
>>>>
>>>> Why do you need extra field instead of using
>>>> dma_async_tx_descriptor.flags?
>>>
>>> In the original I2C QCOM GENI driver, using the local variable (unsigned
>>> in flags) and updating the "DMA_PREP_INTERRUPT" flag.
>>>
>>> Sure, i will review if "dma_async_tx_descriptor.flags" can be retrieved
>>> in GPI driver for DMA_PREP_INTERRUPT flag status.
>>
>> Hi Dmitry,
>>
>> In the I2C Geni driver, the dma flags are primarily used in the
>> dmaengine_prep_slave_single() function, which expects the argument type
>> to be unsigned int. Therefore, the flags should be defined either as
>> enum dma_ctrl_flags, or unsigned int.
>>
>> In the GPI driver, specifically within the gpi_prep_slave_sg() function,
>> the flags are correctly received from the I2C driver. However, these
>> flags are not currently passed to the gpi_create_i2c_tre() function.
>>
>> If we pass the existing flags variable to the gpi_create_i2c_tre()
>> function, we can retrieve the DMA flags information without introducing
>> any additional or external variables.
>>
>> Please confirm if this approach—reusing the existing flags argument in
>> the GPI driver—is acceptable and good to proceed with.
> 
> Could you please check how other drivers use the DMA_PREP_INTERRUPT
> flag? That will answer your question.
Sure, thanks.


> 
>>
>>>>
>>>>>    };
>>>>>    #endif /* QCOM_GPI_DMA_H */
>>>>> --
>>>>> 2.17.1
>>>>>
>>>>
>>>
>>>
>>
> 
> 


