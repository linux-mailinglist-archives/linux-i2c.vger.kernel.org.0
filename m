Return-Path: <linux-i2c+bounces-8118-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E374C9D4D36
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 13:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A4C5B22369
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 12:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EE91D5CD4;
	Thu, 21 Nov 2024 12:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X2BOziNW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEE61CB322;
	Thu, 21 Nov 2024 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732193676; cv=none; b=ceUK9vlBinrrRaDUHKNADUYS0lWHQ9U6M1hcNgozhmc5QcIKFT173rhm+HLF7DYUR9KRIFh8RSU9KZDpK20MRuuFM/avpnMVT5rltlvFZKQgYH0VU9unj22q+cWKvTHBO6ZMoSmENi70HAP0s1GuWGCDdYD1KpBsps5K7R9cXKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732193676; c=relaxed/simple;
	bh=5sNXOwVf6jBwPUkARSc34gWi1qi8OIGmSs8Z0Z7sjRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MXSpYUJIUaOULHaNxt8g/Inyp3EcKNRVd4XQh4/HGmlAAjxS6w46gfzD7jobUHid/Em4kZJO8v0TAicLek6t96J1OWcOOopxFL8m9FZMUCMsD8hirSxz+fr8wW/lDCwcxpeHSv1XnkCtBeQ/SRIlrl0u+LnsfE3PpZAYQGnNgUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X2BOziNW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL8jMR8003948;
	Thu, 21 Nov 2024 12:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bqS/iaYgdR17X/Y2RHiyvra0wOVCOJV6dlh+RR2XUI4=; b=X2BOziNWaDzukoO0
	BQE3h47EWiP0ox6ZDsYD9lFNnY/hdTcHQXehPeyTG0AzmVWm7gYY2FAXOEyPz1HD
	dLyoX33pnToMs+2u+o5vBcvG4W+arAqezIfH5xo/xD8fO+TCznmqYnnqimJK/fc6
	xYdekZ9fEYTd/8YOgiowS9di+1ictU1DeUGVkCP8Z8gu7i8wKWdcaDPYxnFtoJ+7
	GYOMeEanYlDr0PhkO5H+SPEFviiKYyMjQ6FaWd6PH8cjtMGqWXPzhP3osMjLS7rB
	/wIr39nDbN6ECJ75ITWjKNAV6YILRpzjYdMLJQN5tWxN9wbTwG8aZ+ngT/+Bg7yz
	q6Hd7g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ce3c2us-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 12:54:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ALCsROT031809
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 12:54:27 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 04:54:23 -0800
Message-ID: <9d40113c-3edc-44f9-b051-71a894c68ddc@quicinc.com>
Date: Thu, 21 Nov 2024 18:24:20 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND 1/3] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
To: Bjorn Andersson <andersson@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        "Sumit
 Semwal" <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>
References: <20241111140244.13474-1-quic_jseerapu@quicinc.com>
 <20241111140244.13474-2-quic_jseerapu@quicinc.com>
 <dpbultuqz3xjwchhlghzg7ih7v2zal2rzumdpgblx66h3ynhal@ypd75s7x73ie>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <dpbultuqz3xjwchhlghzg7ih7v2zal2rzumdpgblx66h3ynhal@ypd75s7x73ie>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iPvcK5hQqBCNSXwPJRvDKNemk34uBinA
X-Proofpoint-ORIG-GUID: iPvcK5hQqBCNSXwPJRvDKNemk34uBinA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210101



On 11/12/2024 10:26 AM, Bjorn Andersson wrote:
> On Mon, Nov 11, 2024 at 07:32:42PM +0530, Jyothi Kumar Seerapu wrote:
>> GSI hardware generates an interrupt for each transfer completion.
>> For multiple messages within a single transfer, this results
>> in receiving N interrupts for N messages, which can introduce
>> significant software interrupt latency.
> 
> Here's an excellent opportunity for splitting your problem description
> and solution description in two easy to read paragraphs by adding some
> newlines.
Thanks, Done.
> 
>> To mitigate this latency,
>> utilize Block Event Interrupt (BEI) only when an interrupt is necessary.
>> When using BEI, consider splitting a single multi-message transfer into
>> chunks of 8. This approach can enhance overall transfer time and
> 
> The reason for the number 8 must be documented.
Its documented in "qcom-gpi-dma.h" file.

> 
> "This approach..." wouldn't hurt from having it's own paragraph once
> again.

Done
> 
>> efficiency.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
>> ---
>>
>> v1 -> v2:
>>     - Changed dma_addr type from array of pointers to array.
>>     - To support BEI functionality with the TRE size of 64 defined in GPI driver,
>>       updated QCOM_GPI_MAX_NUM_MSGS to 16 and NUM_MSGS_PER_IRQ to 8.
>>   
>>   drivers/dma/qcom/gpi.c           | 49 ++++++++++++++++++++++++++++++++
>>   include/linux/dma/qcom-gpi-dma.h | 37 ++++++++++++++++++++++++
>>   2 files changed, 86 insertions(+)
>>
>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>> index 52a7c8f2498f..a98de3178764 100644
>> --- a/drivers/dma/qcom/gpi.c
>> +++ b/drivers/dma/qcom/gpi.c
>> @@ -1693,6 +1693,9 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>>   
>>   		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
>>   		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
>> +
>> +		if (i2c->flags & QCOM_GPI_BLOCK_EVENT_IRQ)
>> +			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
>>   	}
>>   
>>   	for (i = 0; i < tre_idx; i++)
>> @@ -2098,6 +2101,52 @@ static int gpi_find_avail_gpii(struct gpi_dev *gpi_dev, u32 seid)
>>   	return -EIO;
>>   }
>>   
>> +/**
>> + * gpi_multi_desc_process() - Process received transfers from GSI HW
>> + * @dev: pointer to the corresponding dev node
>> + * @multi_xfer: pointer to the gpi_multi_xfer
>> + * @num_xfers: total number of transfers
>> + * @transfer_timeout_msecs: transfer timeout value
>> + * @transfer_comp: completion object of the transfer
>> + *
>> + * This function is used to process the received transfers based on the
>> + * completion events
> 
> As far as I can tell it doesn't "process" anything. All it does is
> reinit the completion (n + 7) / 8 times, and for the first n / 8
> iterations it will wait for an externally defined completion.
Yes correct. Changed the function name and description.
> 
> Why is this function even defined here, it solely operates on parameters
> coming from the I2C driver?
This function can be used for the other protocols as well and so defined 
here. Please let me know if its not a good idea to make this as common 
function for all required protocols and keep in gpi driver.
> 
>> + *
>> + * Return: On success returns 0, otherwise return error code
>> + */
>> +int gpi_multi_desc_process(struct device *dev, struct gpi_multi_xfer *multi_xfer,
>> +			   u32 num_xfers, u32 transfer_timeout_msecs,
>> +			   struct completion *transfer_comp)
>> +{
>> +	int i;
>> +	u32 max_irq_cnt, time_left;
>> +
>> +	max_irq_cnt = num_xfers / NUM_MSGS_PER_IRQ;
>> +	if (num_xfers % NUM_MSGS_PER_IRQ)
>> +		max_irq_cnt++;
>> +
>> +	/*
>> +	 * Wait for the interrupts of the processed transfers in multiple
>> +	 * of 64 and for the last transfer. If the hardware is fast and
> 
> I'm confused, where does this 64 come from?
It supposed to be 8, thanks for pointing.
> 
>> +	 * already processed all the transfers then no need to wait.
>> +	 */
>> +	for (i = 0; i < max_irq_cnt; i++) {
>> +		reinit_completion(transfer_comp);
> 
> I'm trying to convince myself that this isn't racey, but the split
> ownership of updating and checking multi_xfer->irq_cnt between the GPI
> and I2C drivers is just too hard for me to follow.
If this functionlaity is added into gpi driver, then it can be used for 
i2c and other protocols as well.
Otherwise, this code or function to be added into all protocol drivers.

>> +		if (max_irq_cnt != multi_xfer->irq_cnt) {
>> +			time_left = wait_for_completion_timeout(transfer_comp,
>> +								transfer_timeout_msecs);
>> +			if (!time_left) {
>> +				dev_err(dev, "%s: Transfer timeout\n", __func__);
>> +				return -ETIMEDOUT;
>> +			}
>> +		}
>> +		if (num_xfers > multi_xfer->msg_idx_cnt)
>> +			return 0;
>> +	}
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(gpi_multi_desc_process);
> 
> The dmaengine framework is expected to provide an abstraction between
> clients and DMA engines, so this doesn't look right.
> 
>> +
>>   /* gpi_of_dma_xlate: open client requested channel */
>>   static struct dma_chan *gpi_of_dma_xlate(struct of_phandle_args *args,
>>   					 struct of_dma *of_dma)
>> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
>> index 6680dd1a43c6..1341ff0db808 100644
>> --- a/include/linux/dma/qcom-gpi-dma.h
>> +++ b/include/linux/dma/qcom-gpi-dma.h
>> @@ -15,6 +15,12 @@ enum spi_transfer_cmd {
>>   	SPI_DUPLEX,
>>   };
>>   
>> +#define QCOM_GPI_BLOCK_EVENT_IRQ	BIT(0)
>> +
>> +#define QCOM_GPI_MAX_NUM_MSGS		16
>> +#define NUM_MSGS_PER_IRQ		8
>> +#define MIN_NUM_OF_MSGS_MULTI_DESC	4
> 
> Prefixing these QCOM_GPI_ seems like an excellent idea. Still puzzled
> about the numbers 8 and 4 though, are they universal for all variants of
> GPI or are they just arbitrary numbers picked by experimentation?
MIN_NUM_OF_MSGS_MULTI_DESC changed to 2 in V3, so that if the number of 
messages in a transfer are greter than 1, then is_tx_multi_xfer is set.

maximum channel tre's are 64 which is for config TRE, go TRE and DMA(Tx, 
Rx) TRE. 32 messages can't fit to allocate memory with size of 64 and so 
used maximum messages as 16. And plan to use multiple factor of 
MAX_NUM_MSGS for interrupts per messages and so defined NUM_MSGS_PER_IRQ 
to 8.	

> 
>> +
>>   /**
>>    * struct gpi_spi_config - spi config for peripheral
>>    *
>> @@ -51,6 +57,29 @@ enum i2c_op {
>>   	I2C_READ,
>>   };
>>   
>> +/**
>> + * struct gpi_multi_xfer - Used for multi transfer support
>> + *
>> + * @msg_idx_cnt: message index for the transfer
>> + * @buf_idx: dma buffer index
>> + * @unmap_msg_cnt: unampped transfer index
> 
> s/unampped/unmapped
Done
> 
>> + * @freed_msg_cnt: freed transfer index
>> + * @irq_cnt: received interrupt count
>> + * @irq_msg_cnt: transfer message count for the received irqs
>> + * @dma_buf: virtual address of the buffer
>> + * @dma_addr: dma address of the buffer
> 
> "the buffer"? There's up to 16 of them...

Done
> 
> 
> As mentioned above, I'm skeptical about this custom API - but if we
> were to go this route, the exact responsibilities and semantics should
> be documented.

Documentated the API's and other added in this file.
> 
> Regards,
> Bjorn
> 
>> + */
>> +struct gpi_multi_xfer {
>> +	u32 msg_idx_cnt;
>> +	u32 buf_idx;
>> +	u32 unmap_msg_cnt;
>> +	u32 freed_msg_cnt;
>> +	u32 irq_cnt;
>> +	u32 irq_msg_cnt;
>> +	void *dma_buf[QCOM_GPI_MAX_NUM_MSGS];
>> +	dma_addr_t dma_addr[QCOM_GPI_MAX_NUM_MSGS];
>> +};
>> +
>>   /**
>>    * struct gpi_i2c_config - i2c config for peripheral
>>    *
>> @@ -65,6 +94,8 @@ enum i2c_op {
>>    * @rx_len: receive length for buffer
>>    * @op: i2c cmd
>>    * @muli-msg: is part of multi i2c r-w msgs
>> + * @flags: true for block event interrupt support
>> + * @multi_xfer: indicates transfer has multi messages
>>    */
>>   struct gpi_i2c_config {
>>   	u8 set_config;
>> @@ -78,6 +109,12 @@ struct gpi_i2c_config {
>>   	u32 rx_len;
>>   	enum i2c_op op;
>>   	bool multi_msg;
>> +	u8 flags;
>> +	struct gpi_multi_xfer multi_xfer;
>>   };
>>   
>> +int gpi_multi_desc_process(struct device *dev, struct gpi_multi_xfer *multi_xfer,
>> +			   u32 num_xfers, u32 tranfer_timeout_msecs,
>> +			   struct completion *transfer_comp);
>> +
>>   #endif /* QCOM_GPI_DMA_H */
>> -- 
>> 2.17.1
>>
>>

