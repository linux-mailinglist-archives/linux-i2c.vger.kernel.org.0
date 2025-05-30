Return-Path: <linux-i2c+bounces-11161-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1825AC911E
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 16:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D2F1502B8E
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 14:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D09B22FAF8;
	Fri, 30 May 2025 14:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dMc4ePrL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D14622D7AC;
	Fri, 30 May 2025 14:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613935; cv=none; b=e6DOCJl28xpA2VNz7U9r2QZXbl4GebeVJqq8G8g5fy8BkgcGKkRlVJX7algjtjp4/zHRu6zSQBaxAWjst8DMAKDS+7gpinxD+ESq2cXx4pa7U++AF9vnKa+QkoSV8znHmj9WEcDRfHd140ewnAXJhI7z/24OahmMiywS8fB9hmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613935; c=relaxed/simple;
	bh=4gkgjY5kGR6zQCrqpo0+hFqLbpk3iPh4aMlab+1tfiU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=iVj6TgK/kjvXhfpWQ8AUlR+weAgXWlYZk6UQ+UaLA3QGCR3RG/cGb56SUFfpkw/rqyjnVhyCuaqAtI6tQY6pLNg0dDcAKqpitd8q/v6PD/sPV4yrXigz7HAFMoufZtIN6NZvjWuzcqvUoYJEfsTPLZsPPYsOhSNu3bDOtDnDsqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dMc4ePrL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAWXnH008272;
	Fri, 30 May 2025 14:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4iVEmPMyZopwyfXJVjKqstdsuW2AD1p5Y2D0gUSNpEw=; b=dMc4ePrL76kNx+9n
	My70cNWd/sP9JsoWAOv45q6M+2OYDHgBI5CBMoUcYFhBd1aSb60ufxk+VyJwyu8K
	c37PZxSr6IZ5FVzxDF4ZXWaFlamwYQMCcY/dvnyOOLe1f31j4hXXESvcqMMDqkpJ
	UJfIMYHYJxrUcL0SOZWDDlVMXxlgfCik6khXQmEM3MSLA/fyJDZ3kCk4x43haruL
	zMHRdORwR6Ft+9Z8kpWoNFDAy7NL7ZJS+ZvNaq7rlXhc/AGbN1j9OkCyo3N5Iajh
	ldOvnqowz2h2O4hvjKmkAAiQ0gZx92PRzIQaPHMhVFCns5s5fTnRjb5eFf1g5YGp
	w2glDg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992uetx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 14:05:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54UE5HKX001222
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 14:05:17 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 May
 2025 07:05:12 -0700
Message-ID: <de00809a-2775-4417-b987-5f557962ec31@quicinc.com>
Date: Fri, 30 May 2025 19:35:10 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
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
Content-Language: en-US
In-Reply-To: <4456d0e2-3451-4749-acda-3b75ae99e89b@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDEyNCBTYWx0ZWRfX+HFHJqP6AUQh
 /F7kIWa/YYSTMBf+9sF8PbIxkXJ2TGSP6218m4NSYH0l3bn/6/kk+MM5wxOXJF1c6hNA9U5H956
 XUGqLTH7KtUNW+PXf0GlAAYt9o6fQ+AGwsGWsciTdTNRxIbasz8boxUF1Ch24gw/rJf5QqmS3Km
 fpqoUdRLu4U9ETmDNSAn3G4WcLmIRmLe0eRuFa46+dSl7RfKmkY1ICAXZfp1fPPzY3l6/aYrwdf
 3t2EE3VM154j9J7eYpPC/riJlJ61/TYI5QnpCVgxLvCk68OGk+RyDFZcENc1DIY2SwmHj/t7vhW
 Ex+r5AsExKFqytrNh1IkLVn8uXj5FphgdNVt9o/fc2hDJcJxJ1ywZXAuOioWhEvMY8Lnlil1s8L
 tkhyWoT5VnUyjR0wWjU1C84lpNPuVnL2oYi6q2xurLqra2EnWP75ohGUVKHXCz6C6ch86a/7
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=6839bb1d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=ABChF0pPfgsoSLu0HJQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Jal4qF9HP_k9GDbkw8uB1H7T2eq9ttJO
X-Proofpoint-ORIG-GUID: Jal4qF9HP_k9GDbkw8uB1H7T2eq9ttJO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_06,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300124



On 5/9/2025 11:48 AM, Jyothi Kumar Seerapu wrote:
> 
> 
> On 5/6/2025 5:02 PM, Dmitry Baryshkov wrote:
>> On Tue, May 06, 2025 at 04:48:43PM +0530, Jyothi Kumar Seerapu wrote:
>>> GSI hardware generates an interrupt for each transfer completion.
>>> For multiple messages within a single transfer, this results in
>>> N interrupts for N messages, leading to significant software
>>> interrupt latency.
>>>
>>> To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
>>> Enabling BEI instructs the GSI hardware to prevent interrupt generation
>>> and BEI is disabled when an interrupt is necessary.
>>>
>>> When using BEI, consider splitting a single multi-message transfer into
>>> chunks of 8 messages internally and so interrupts are not expected for
>>> the first 7 message completions, only the last message triggers
>>> an interrupt, indicating the completion of 8 messages.
>>>
>>> This BEI mechanism enhances overall transfer efficiency.
>>>
>>> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
>>> ---
>>> v5 ->v6:
>>>    - For updating the block event interrupt bit, instead of relying on
>>>      bei_flag, decision check is moved with DMA_PREP_INTERRUPT flag.
>>> v4 -> v5:
>>>    - BEI flag naming changed from flags to bei_flag.
>>>    - QCOM_GPI_BLOCK_EVENT_IRQ macro is removed from qcom-gpi-dma.h
>>>      file, and Block event interrupt support is checked with bei_flag.
>>>
>>> v3 -> v4:
>>>    - API's added for Block event interrupt with multi descriptor 
>>> support for
>>>      I2C is moved from qcom-gpi-dma.h file to I2C geni qcom driver file.
>>>    - gpi_multi_xfer_timeout_handler function is moved from GPI driver to
>>>      I2C driver.
>>>
>>> v2-> v3:
>>>     - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handler
>>>     - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
>>>     - Added documentation for newly added changes in "qcom-gpi-dma.h" 
>>> file
>>>     - Updated commit description.
>>>
>>> v1 -> v2:
>>>     - Changed dma_addr type from array of pointers to array.
>>>     - To support BEI functionality with the TRE size of 64 defined in 
>>> GPI driver,
>>>       updated QCOM_GPI_MAX_NUM_MSGS to 16 and NUM_MSGS_PER_IRQ to 4.
>>>
>>>   drivers/dma/qcom/gpi.c           | 3 +++
>>>   include/linux/dma/qcom-gpi-dma.h | 2 ++
>>>   2 files changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>>> index b1f0001cc99c..7e511f54166a 100644
>>> --- a/drivers/dma/qcom/gpi.c
>>> +++ b/drivers/dma/qcom/gpi.c
>>> @@ -1695,6 +1695,9 @@ static int gpi_create_i2c_tre(struct gchan 
>>> *chan, struct gpi_desc *desc,
>>>           tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
>>>           tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
>>> +
>>> +        if (!(i2c->dma_flags & DMA_PREP_INTERRUPT))
>>> +            tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
>>>       }
>>>       for (i = 0; i < tre_idx; i++)
>>> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/ 
>>> qcom-gpi-dma.h
>>> index 6680dd1a43c6..ebac0d3edff2 100644
>>> --- a/include/linux/dma/qcom-gpi-dma.h
>>> +++ b/include/linux/dma/qcom-gpi-dma.h
>>> @@ -65,6 +65,7 @@ enum i2c_op {
>>>    * @rx_len: receive length for buffer
>>>    * @op: i2c cmd
>>>    * @muli-msg: is part of multi i2c r-w msgs
>>> + * @dma_flags: Flags indicating DMA capabilities
>>>    */
>>>   struct gpi_i2c_config {
>>>       u8 set_config;
>>> @@ -78,6 +79,7 @@ struct gpi_i2c_config {
>>>       u32 rx_len;
>>>       enum i2c_op op;
>>>       bool multi_msg;
>>> +    unsigned int dma_flags;
>>
>> Why do you need extra field instead of using
>> dma_async_tx_descriptor.flags?
> 
> In the original I2C QCOM GENI driver, using the local variable (unsigned 
> in flags) and updating the "DMA_PREP_INTERRUPT" flag.
> 
> Sure, i will review if "dma_async_tx_descriptor.flags" can be retrieved 
> in GPI driver for DMA_PREP_INTERRUPT flag status.

Hi Dmitry,

In the I2C Geni driver, the dma flags are primarily used in the 
dmaengine_prep_slave_single() function, which expects the argument type 
to be unsigned int. Therefore, the flags should be defined either as
enum dma_ctrl_flags, or unsigned int.

In the GPI driver, specifically within the gpi_prep_slave_sg() function, 
the flags are correctly received from the I2C driver. However, these 
flags are not currently passed to the gpi_create_i2c_tre() function.

If we pass the existing flags variable to the gpi_create_i2c_tre() 
function, we can retrieve the DMA flags information without introducing 
any additional or external variables.

Please confirm if this approach—reusing the existing flags argument in 
the GPI driver—is acceptable and good to proceed with.

>>
>>>   };
>>>   #endif /* QCOM_GPI_DMA_H */
>>> -- 
>>> 2.17.1
>>>
>>
> 
> 


