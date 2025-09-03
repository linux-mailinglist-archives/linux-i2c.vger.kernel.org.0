Return-Path: <linux-i2c+bounces-12576-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7915DB41A49
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 11:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C16F1BA432D
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 09:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506B92ED845;
	Wed,  3 Sep 2025 09:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kHRzDjt8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B88D2DBF4B;
	Wed,  3 Sep 2025 09:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756892593; cv=none; b=faIFvV6GaxsFG3WEPB0HnXrv9a26jIxp3/mWGeqxo4nmRoAlDLBZuRSA7hJ5GNwst6RAUDQdX4PUS7QWWW9R97kUI5n5D35YvTOiwwDbKa5ovsZ+3R7v4GB/H2jkLywJf6g6CS9+IdryLHk69OqK+ncJzmWfyQX24cqpmaKb9yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756892593; c=relaxed/simple;
	bh=bfgyIsZ47VIamS1ntkZ4mgB9kGJOYlZoocfdYMTCOVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=r42ugq8prxYkh3qnDzYo2OOBWofy87+wl0eOYgxg+/gAhu8du0sUuJiRNa+F1qWJ+tRgAn+BcFROcEAzTzHeksspaTuKbTCEHv4sY4/L0QCWurddNKYEnjhrztkI/EnolrjGj8H9FBplJc/OSIuGiFpPQwo3LelH3Y4pj5wQQR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kHRzDjt8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58324FZT012188;
	Wed, 3 Sep 2025 09:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6lu15kYphEF4zj/NAL+Q6XVrkdncw0iE1vxKGIr075w=; b=kHRzDjt8BxBEBB6G
	RrBFwON6ywWeRu7wvj1iBLSq9PQaoBbdhm2YqaYjK3PuuXTifYJZKCjy3uZwVQ+6
	nCY5l2rlaNx2HwTkZ/KU67jVZps8L0bDiBYkCniQcWvtFw0m69s/QwpQU3/lHra5
	EbumeYhe1Kl+cVU0qZXNtAskTSLoNNMG8ri+BOaF9wW1AShgbaAu4HJqREIeizzi
	uM1m0neo9LDF1yGqnYBs039Ey8nmhICEG8RxZ5w1LVbHCCUYLxdr55nfP90HZYl4
	yc6cbiAQSyEd9cIlovPRYCXvOFbWi1c/akC5BXrN7fbnKfG23qdcaRHkiBbfzWQU
	iX3sQQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fjysh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 09:43:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5839h541019544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Sep 2025 09:43:05 GMT
Received: from [10.217.218.181] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 3 Sep
 2025 02:43:01 -0700
Message-ID: <d4b297f8-82d7-465f-b691-f723087675d4@quicinc.com>
Date: Wed, 3 Sep 2025 15:12:58 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] dmaengine: qcom: gpi: Add GPI Block event
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
References: <20250903073059.2151837-1-quic_jseerapu@quicinc.com>
 <20250903073059.2151837-2-quic_jseerapu@quicinc.com>
 <xy2jgnearfsoln7tmjbb7l6zuwm7sq74wohsxj77eeval5wig5@kisng4ufgbuo>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <xy2jgnearfsoln7tmjbb7l6zuwm7sq74wohsxj77eeval5wig5@kisng4ufgbuo>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX5OOqX+rFnXYQ
 IDylBA2Nf78rHsfMLv8PyLIQfzn/q/Hx1sjWZvXbJddDjJ60cLn8qe/lq0hbBGfSuf9JMXJtgQN
 UKZyhEA5cq4K9fslV9tzj6Ky7h8QCQWBWMTwWsyc9oSuGQSQaOvvusO2hRIFiX2W/QCGLiyEdta
 GQWmcCjPs0rVemTwEJEhDGDXy51xv+Bq3Ukz2O/D0WoUyoaDb0KxQP5mQpK24f/bURYdDy/kUC7
 CdTOHEjyqTwwSoGwUqGaHA13gAY7Z88QUkzwsTQu+NL6LJLzCeiD9BcxQn/toOqmpPhdUvV9t2p
 BOYlGzt9e6IKdipvM4YfyqnigFezuODJdiTcK6j4YDkCZoQKRfSkfS3m7UjoFNprfTwYths8sf6
 ywMbtNxj
X-Proofpoint-ORIG-GUID: 7CDOPaNJPI3XjP1hrXx2fqv0rIlyGsh0
X-Proofpoint-GUID: 7CDOPaNJPI3XjP1hrXx2fqv0rIlyGsh0
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b80daa cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=LAjslmrBFw-AA7XcVLMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038



On 9/3/2025 2:55 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 03, 2025 at 01:00:58PM +0530, Jyothi Kumar Seerapu wrote:
>> GSI hardware generates an interrupt for each transfer completion.
>> For multiple messages within a single transfer, this results in
>> N interrupts for N messages, leading to significant software
>> interrupt latency.
>>
>> To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
>> Enabling BEI instructs the GSI hardware to prevent interrupt generation
>> and BEI is disabled when an interrupt is necessary.
>>
>> Large I2C transfer can be divided into chunks of messages internally.
>> Interrupts are not expected for the messages for which BEI bit set,
>> only the last message triggers an interrupt, indicating the completion of
>> N messages. This BEI mechanism enhances overall transfer efficiency.
>>
>> This BEI mechanism enhances overall transfer efficiency.
> 
> Duplicate phrase.
Thanks, I will remove the duplicate phrase 'This BEI mechanism enhances 
overall transfer efficiency.' in the later patchset.

> 
>>
>> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
>> ---
>>
>> v6 -> v7:
>>     - The design has been modified to configure BEI for interrupt
>>       generation either:
>>       After the last I2C message, if sufficient TREs are available, or
>>       After a specific I2C message, when no further TREs are available.
>>     - In the GPI driver, passed the flags argumnetr to the gpi_create_i2c_tre function
>>       and so avoided using external variables for DMA_PREP_INTERRUPT status.
>>
>> v5 ->v6:
>>    - For updating the block event interrupt bit, instead of relying on
>>      bei_flag, decision check is moved with DMA_PREP_INTERRUPT flag.
>>
>> v4 -> v5:
>>    - BEI flag naming changed from flags to bei_flag.
>>    - QCOM_GPI_BLOCK_EVENT_IRQ macro is removed from qcom-gpi-dma.h
>>      file, and Block event interrupt support is checked with bei_flag.
>>
>> v3 -> v4:
>>    - API's added for Block event interrupt with multi descriptor support for
>>      I2C is moved from qcom-gpi-dma.h file to I2C geni qcom driver file.
>>    - gpi_multi_xfer_timeout_handler function is moved from GPI driver to
>>      I2C driver.
>>
>> v2-> v3:
>>     - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handler
>>     - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
>>     - Added documentation for newly added changes in "qcom-gpi-dma.h" file
>>     - Updated commit description.
>>
>> v1 -> v2:
>>     - Changed dma_addr type from array of pointers to array.
>>     - To support BEI functionality with the TRE size of 64 defined in GPI driver,
>>       updated QCOM_GPI_MAX_NUM_MSGS to 16 and NUM_MSGS_PER_IRQ to 4.
>>
>>   drivers/dma/qcom/gpi.c | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>> index 8e87738086b2..66bfea1f156d 100644
>> --- a/drivers/dma/qcom/gpi.c
>> +++ b/drivers/dma/qcom/gpi.c
>> @@ -1619,7 +1619,8 @@ gpi_peripheral_config(struct dma_chan *chan, struct dma_slave_config *config)
>>   }
>>   
>>   static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>> -			      struct scatterlist *sgl, enum dma_transfer_direction direction)
>> +			      struct scatterlist *sgl, enum dma_transfer_direction direction,
>> +			      unsigned long flags)
>>   {
>>   	struct gpi_i2c_config *i2c = chan->config;
>>   	struct device *dev = chan->gpii->gpi_dev->dev;
>> @@ -1684,6 +1685,9 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>>   
>>   		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
>>   		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
>> +
>> +		if (!(flags & DMA_PREP_INTERRUPT))
>> +			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
>>   	}
>>   
>>   	for (i = 0; i < tre_idx; i++)
>> @@ -1827,6 +1831,9 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
>>   		return NULL;
>>   	}
>>   
>> +	if (!(flags & DMA_PREP_INTERRUPT) && (nr - nr_tre < 2))
>> +		return NULL;
> 
> Comment in the source file.
> 
>> +
>>   	gpi_desc = kzalloc(sizeof(*gpi_desc), GFP_NOWAIT);
>>   	if (!gpi_desc)
>>   		return NULL;
>> @@ -1835,7 +1842,7 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
>>   	if (gchan->protocol == QCOM_GPI_SPI) {
>>   		i = gpi_create_spi_tre(gchan, gpi_desc, sgl, direction);
>>   	} else if (gchan->protocol == QCOM_GPI_I2C) {
>> -		i = gpi_create_i2c_tre(gchan, gpi_desc, sgl, direction);
>> +		i = gpi_create_i2c_tre(gchan, gpi_desc, sgl, direction, flags);
>>   	} else {
>>   		dev_err(dev, "invalid peripheral: %d\n", gchan->protocol);
>>   		kfree(gpi_desc);
>> -- 
>> 2.34.1
>>
> 



