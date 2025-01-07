Return-Path: <linux-i2c+bounces-8943-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5953A03CAE
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 11:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE3107A3319
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 10:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007D81E47C2;
	Tue,  7 Jan 2025 10:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MIRU4NkE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4861DF986;
	Tue,  7 Jan 2025 10:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736246393; cv=none; b=AlljMloByoaWkqJt9hx8TRKpEAIb57n7qJ0f7zY/3ylELw3kpa7o5VPQ4XtwhpBBKAhKygNHXemZvqOVpoOxBvbKCPC9lZabZdauQ9F2f40fqmCKXf4rNd6d4wFfOdafMVlp8BczkanjkhsR6JKRK5MgXZ3oa9soyaEXEZGGqYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736246393; c=relaxed/simple;
	bh=u6K/1wUHmYcJlvz4ZfpapIRPdKLRMip1Uaq4bJ9tzPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cxiqy4Z0mODIOGA/7RuKoQjKQ5Rx8o3uR2Qy8ZgfuQSmRyuKCGSQ0pQvSdcwXr5HrSm8IYYV4oTsQTnoS5L9fpy3yY7k8kvQge7sUj5hkHUClBWeMX8JSCPtOhuVuWWFJ13viaqR2GisXoOOXdNVLVJoNkx/Z7Qae5cBDcwyLGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MIRU4NkE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5073xTEb008515;
	Tue, 7 Jan 2025 10:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ELX/Ot/VrVjOJV80+QYzCGxxspXK0WFLlE6K+LDBiQ0=; b=MIRU4NkESmkHw4GB
	7jLIsy0aYiWCCnw+2UTuQiCw5+fCDiwvVC5MbMReDsLm/juyT/Me/5GgOffj2nad
	Uha16gb4aaP/feHTeQahqK7xAblOQ8i0LAY1J7YF8tLF3Zau2+IlvYIudnOBZNkK
	ThwNT7/iELkrzWSJWhvUnuJL37QBJJHj6EYZG0gnnyUOOswTtk7a4yPQrRs/YjM1
	iOKdtAfiDxAVtd9bnTreLBQAoQJ0ekCXhltGHvpCu1mcbvjPEBtCULgsgGKIuORp
	eT9/3yy5L0MJi/wE0FEdP6wq3p/AMiXXcaPwd7vAlq1I2izh5VK/FsVohb9sqH4+
	PP7EaA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440vuq8v8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 10:39:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 507AdfeX021677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 10:39:41 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 Jan 2025
 02:39:37 -0800
Message-ID: <26560617-c37b-46e5-a28f-da13a1b071a3@quicinc.com>
Date: Tue, 7 Jan 2025 16:09:34 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Vinod Koul
	<vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <quic_vtanuku@quicinc.com>
References: <20241217170424.14703-1-quic_jseerapu@quicinc.com>
 <20241217170424.14703-3-quic_jseerapu@quicinc.com>
 <3a65ce67-b20f-43bf-9bb6-68861b9fa1d6@quicinc.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <3a65ce67-b20f-43bf-9bb6-68861b9fa1d6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hW79fyyc9kTs-tbAtE6-UjjqqmRyOORs
X-Proofpoint-GUID: hW79fyyc9kTs-tbAtE6-UjjqqmRyOORs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501070088



On 1/7/2025 11:33 AM, Mukesh Kumar Savaliya wrote:
> 
> 
> On 12/17/2024 10:34 PM, Jyothi Kumar Seerapu wrote:
>> The I2C driver gets an interrupt upon transfer completion.
>> When handling multiple messages in a single transfer, this
>> results in N interrupts for N messages, leading to significant
>> software interrupt latency.
>>
>> To mitigate this latency, utilize Block Event Interrupt (BEI)
>> mechanism. Enabling BEI instructs the hardware to prevent interrupt
>> generation and BEI is disabled when an interrupt is necessary.
>>
>> Large I2C transfer can be divided into chunks of 8 messages internally.
>> Interrupts are not expected for the first 7 message completions, only
>> the last message triggers an interrupt, indicating the completion of
>> 8 messages. This BEI mechanism enhances overall transfer efficiency.
>>
>> This optimization reduces transfer time from 168 ms to 48 ms for a
>> series of 200 I2C write messages in a single transfer, with a
>> clock frequency support of 100 kHz.
>>
>> BEI optimizations are currently implemented for I2C write transfers only,
>> as there is no use case for multiple I2C read messages in a single 
>> transfer
>> at this time.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
>> ---
>>
>> v3 -> v4:
>>    - API's added for Block event interrupt with multi descriptor 
>> support for
>>      I2C is moved from qcom-gpi-dma.h file to I2C geni qcom driver file.
>>    - gpi_multi_xfer_timeout_handler function is moved from GPI driver to
>>      I2C driver.
>>    - geni_i2c_gpi_multi_desc_xfer structure is added as a member of
>>      struct geni_i2c_dev.
>>
>> v2 -> v3:
>>     - In i2c_gpi_cb_result function, moved the logic of
>>      "!is_tx_multi_xfer" to else.
>>     - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
>>     - Updated commit description
>>
>> v1 -> v2:
>>     - Moved gi2c_gpi_xfer->msg_idx_cnt to separate local variable.
>>     - Updated goto labels for error scenarios in geni_i2c_gpi function
>>     - memset tx_multi_xfer to 0.
>>     - Removed passing current msg index to geni_i2c_gpi
>>     - Fixed kernel test robot reported compilation issues.
>>
>>   drivers/i2c/busses/i2c-qcom-geni.c | 275 ++++++++++++++++++++++++++---
>>   1 file changed, 250 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/ 
>> i2c-qcom-geni.c
>> index 7a22e1f46e60..7945d86852e9 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -78,6 +78,33 @@ enum geni_i2c_err_code {
>>   #define XFER_TIMEOUT        HZ
>>   #define RST_TIMEOUT        HZ
>> +#define QCOM_I2C_GPI_MAX_NUM_MSGS        16
>> +#define QCOM_I2C_GPI_NUM_MSGS_PER_IRQ        8
>> +#define QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC    2
>> +
>> +/**
>> + * struct geni_i2c_gpi_multi_desc_xfer - Used for multi transfer support
>> + *
>> + * @msg_idx_cnt: message index for the transfer
>> + * @buf_idx: dma buffer index
>> + * @unmap_msg_cnt: unmapped transfer index
>> + * @freed_msg_cnt: freed transfer index
>> + * @irq_cnt: received interrupt count
>> + * @irq_msg_cnt: transfer message count for the received irqs
>> + * @dma_buf: virtual addresses of the buffers
>> + * @dma_addr: dma addresses of the buffers
>> + */
>> +struct geni_i2c_gpi_multi_desc_xfer {
>> +    u32 msg_idx_cnt;
>> +    u32 buf_idx;
>> +    u32 unmap_msg_cnt;
>> +    u32 freed_msg_cnt;
>> +    u32 irq_cnt;
>> +    u32 irq_msg_cnt;
>> +    void *dma_buf[QCOM_I2C_GPI_MAX_NUM_MSGS];
>> +    dma_addr_t dma_addr[QCOM_I2C_GPI_MAX_NUM_MSGS];
>> +};
>> +
>>   struct geni_i2c_dev {
>>       struct geni_se se;
>>       u32 tx_wm;
>> @@ -100,6 +127,10 @@ struct geni_i2c_dev {
>>       struct dma_chan *rx_c;
>>       bool gpi_mode;
>>       bool abort_done;
>> +    bool is_tx_multi_desc_xfer;
> can you add description for these added variables similar to above 
> structure ?
The existing "struct geni_i2c_dev" does not have any description added. 
So, adding description for only new entries might not be ideal.
Could you please suggest whether we should follow the existing practice 
of not adding description for "struct geni_i2c_dev" entries, or should 
we add descriptions for the entire "struct geni_i2c_dev"? I feel that 
adding descriptions for the whole structure might not be related to this 
series.
>> +    u32 num_msgs;
> is it possible to set is_tx_multi_desc_xfer flag based on num_msgs ?
>> +    u32 tx_irq_cnt;
>> +    struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
>>   };
>>   struct geni_i2c_desc {
>> @@ -500,6 +531,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg *msg,
>>   static void i2c_gpi_cb_result(void *cb, const struct 
>> dmaengine_result *result)
>>   {
>>       struct geni_i2c_dev *gi2c = cb;
>> +    struct geni_i2c_gpi_multi_desc_xfer *tx_multi_xfer;
>>       if (result->result != DMA_TRANS_NOERROR) {
>>           dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
>> @@ -508,7 +540,22 @@ static void i2c_gpi_cb_result(void *cb, const 
>> struct dmaengine_result *result)
>>           dev_dbg(gi2c->se.dev, "DMA xfer has pending: %d\n", result- 
>> >residue);
>>       }
>> -    complete(&gi2c->done);
>> +    if (!gi2c->is_tx_multi_desc_xfer) {
>> +        complete(&gi2c->done);
>> +    } else {
>> +        tx_multi_xfer = &gi2c->i2c_multi_desc_config;
>> +
>> +        /*
>> +         * Send Completion for last message or multiple of
>> +         * QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
>> +         */
>> +        if ((tx_multi_xfer->irq_msg_cnt == gi2c->num_msgs - 1) ||
>> +            (!((tx_multi_xfer->irq_msg_cnt + 1) % 
>> QCOM_I2C_GPI_NUM_MSGS_PER_IRQ))) {
>> +            tx_multi_xfer->irq_cnt++;
>> +            complete(&gi2c->done);
>> +        }
>> +        tx_multi_xfer->irq_msg_cnt++;
>> +    }
>>   }
>>   static void geni_i2c_gpi_unmap(struct geni_i2c_dev *gi2c, struct 
>> i2c_msg *msg,
>> @@ -526,7 +573,87 @@ static void geni_i2c_gpi_unmap(struct 
>> geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>       }
>>   }
>> -static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>> +/**
>> + * geni_i2c_gpi_multi_desc_unmap() - unmaps the buffers post multi 
>> message TX transfers
>> + * @dev: pointer to the corresponding dev node
>> + * @gi2c: i2c dev handle
>> + * @msgs: i2c messages array
>> + * @peripheral: pointer to the gpi_i2c_config
>> + */
>> +static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, 
>> struct i2c_msg msgs[],
>> +                      struct gpi_i2c_config *peripheral)
>> +{
>> +    u32 msg_xfer_cnt, wr_idx = 0;
>> +    struct geni_i2c_gpi_multi_desc_xfer *tx_multi_xfer = &gi2c- 
>> >i2c_multi_desc_config;
>> +
>> +    /*
>> +     * In error case, need to unmap all messages based on the 
>> msg_idx_cnt.
>> +     * Non-error case unmap all the processed messages.
>> +     */
>> +    if (gi2c->err)
>> +        msg_xfer_cnt = tx_multi_xfer->msg_idx_cnt;
>> +    else
>> +        msg_xfer_cnt = tx_multi_xfer->irq_cnt * 
>> QCOM_I2C_GPI_NUM_MSGS_PER_IRQ;
>> +
>> +    /* Unmap the processed DMA buffers based on the received 
>> interrupt count */
>> +    for (; tx_multi_xfer->unmap_msg_cnt < msg_xfer_cnt; 
>> tx_multi_xfer->unmap_msg_cnt++) {
>> +        if (tx_multi_xfer->unmap_msg_cnt == gi2c->num_msgs)
>> +            break;
>> +        wr_idx = tx_multi_xfer->unmap_msg_cnt % 
>> QCOM_I2C_GPI_MAX_NUM_MSGS;
>> +        geni_i2c_gpi_unmap(gi2c, &msgs[tx_multi_xfer->unmap_msg_cnt],
>> +                   tx_multi_xfer->dma_buf[wr_idx],
>> +                   tx_multi_xfer->dma_addr[wr_idx],
>> +                   NULL, (dma_addr_t)NULL);
>> +        tx_multi_xfer->freed_msg_cnt++;
>> +    }
>> +}
>> +
>> +/**
>> + * geni_i2c_gpi_multi_xfer_timeout_handler() - Handle multi message 
>> transfer timeout
>> + * @dev: pointer to the corresponding dev node
>> + * @multi_xfer: pointer to the geni_i2c_gpi_multi_desc_xfer
>> + * @num_xfers: total number of transfers
>> + * @transfer_timeout_msecs: transfer timeout value
>> + * @transfer_comp: completion object of the transfer
>> + *
>> + * This function is used to wait for the processed transfers based on
>> + * the interrupts generated upon transfer completion.
>> + * Return: On success returns 0, otherwise return error code (- 
>> ETIMEDOUT)
>> + */
>> +static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
>> +                           struct geni_i2c_gpi_multi_desc_xfer 
>> *multi_xfer,
>> +                           u32 num_xfers, u32 transfer_timeout_msecs,
>> +                           struct completion *transfer_comp)
>> +{
>> +    int i;
>> +    u32 max_irq_cnt, time_left;
>> +
>> +    max_irq_cnt = num_xfers / QCOM_I2C_GPI_NUM_MSGS_PER_IRQ;
>> +    if (num_xfers % QCOM_I2C_GPI_NUM_MSGS_PER_IRQ)
>> +        max_irq_cnt++;
>> +
>> +    /*
>> +     * Wait for the interrupts of the processed transfers in multiple
>> +     * of 8 and for the last transfer. If the hardware is fast and
>> +     * already processed all the transfers then no need to wait.
>> +     */
>> +    for (i = 0; i < max_irq_cnt; i++) {
>> +        reinit_completion(transfer_comp);
>> +        if (max_irq_cnt != multi_xfer->irq_cnt) {
>> +            time_left = wait_for_completion_timeout(transfer_comp,
>> +                                transfer_timeout_msecs);
>> +            if (!time_left) {
>> +                dev_err(dev, "%s: Transfer timeout\n", __func__);
>> +                return -ETIMEDOUT;
>> +            }
>> +        }
>> +        if (num_xfers > multi_xfer->msg_idx_cnt)
>> +            return 0;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg 
>> msgs[],
>>               struct dma_slave_config *config, dma_addr_t *dma_addr_p,
>>               void **buf, unsigned int op, struct dma_chan *dma_chan)
>>   {
>> @@ -538,26 +665,48 @@ static int geni_i2c_gpi(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg *msg,
>>       enum dma_transfer_direction dma_dirn;
>>       struct dma_async_tx_descriptor *desc;
>>       int ret;
>> +    struct geni_i2c_gpi_multi_desc_xfer *gi2c_gpi_xfer;
>> +    dma_cookie_t cookie;
>> +    u32 msg_idx;
>>       peripheral = config->peripheral_config;
>> -
>> -    dma_buf = i2c_get_dma_safe_msg_buf(msg, 1);
>> -    if (!dma_buf)
>> -        return -ENOMEM;
>> +    gi2c_gpi_xfer = &gi2c->i2c_multi_desc_config;
>> +    dma_buf = gi2c_gpi_xfer->dma_buf[gi2c_gpi_xfer->buf_idx];
>> +    addr = gi2c_gpi_xfer->dma_addr[gi2c_gpi_xfer->buf_idx];
>> +    msg_idx = gi2c_gpi_xfer->msg_idx_cnt;
>> +
>> +    dma_buf = i2c_get_dma_safe_msg_buf(&msgs[msg_idx], 1);
>> +    if (!dma_buf) {
>> +        ret = -ENOMEM;
>> +        goto out;
>> +    }
>>       if (op == I2C_WRITE)
>>           map_dirn = DMA_TO_DEVICE;
>>       else
>>           map_dirn = DMA_FROM_DEVICE;
>> -    addr = dma_map_single(gi2c->se.dev->parent, dma_buf, msg->len, 
>> map_dirn);
>> +    addr = dma_map_single(gi2c->se.dev->parent, dma_buf,
>> +                  msgs[msg_idx].len, map_dirn);
>>       if (dma_mapping_error(gi2c->se.dev->parent, addr)) {
>> -        i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
>> -        return -ENOMEM;
>> +        i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
>> +        ret = -ENOMEM;
>> +        goto out;
>> +    }
>> +
>> +    if (gi2c->is_tx_multi_desc_xfer) {
>> +        if (((msg_idx + 1) % QCOM_I2C_GPI_NUM_MSGS_PER_IRQ))
>> +            peripheral->flags |= QCOM_GPI_BLOCK_EVENT_IRQ;
>> +        else
>> +            peripheral->flags &= ~QCOM_GPI_BLOCK_EVENT_IRQ;
>> +
>> +        /* BEI bit to be cleared for last TRE */
>> +        if (msg_idx == gi2c->num_msgs - 1)
>> +            peripheral->flags &= ~QCOM_GPI_BLOCK_EVENT_IRQ;
>>       }
>>       /* set the length as message for rx txn */
>> -    peripheral->rx_len = msg->len;
>> +    peripheral->rx_len = msgs[msg_idx].len;
>>       peripheral->op = op;
>>       ret = dmaengine_slave_config(dma_chan, config);
>> @@ -575,7 +724,8 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, 
>> struct i2c_msg *msg,
>>       else
>>           dma_dirn = DMA_DEV_TO_MEM;
>> -    desc = dmaengine_prep_slave_single(dma_chan, addr, msg->len, 
>> dma_dirn, flags);
>> +    desc = dmaengine_prep_slave_single(dma_chan, addr, 
>> msgs[msg_idx].len,
>> +                       dma_dirn, flags);
>>       if (!desc) {
>>           dev_err(gi2c->se.dev, "prep_slave_sg failed\n");
>>           ret = -EIO;
>> @@ -585,15 +735,48 @@ static int geni_i2c_gpi(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg *msg,
>>       desc->callback_result = i2c_gpi_cb_result;
>>       desc->callback_param = gi2c;
>> -    dmaengine_submit(desc);
>> -    *buf = dma_buf;
>> -    *dma_addr_p = addr;
>> +    if (!((msgs[msg_idx].flags & I2C_M_RD) && op == I2C_WRITE)) {
>> +        gi2c_gpi_xfer->msg_idx_cnt++;
>> +        gi2c_gpi_xfer->buf_idx = (msg_idx + 1) % 
>> QCOM_I2C_GPI_MAX_NUM_MSGS;
>> +    }
>> +    cookie = dmaengine_submit(desc);
>> +    if (dma_submit_error(cookie)) {
>> +        dev_err(gi2c->se.dev,
>> +            "%s: dmaengine_submit failed (%d)\n", __func__, cookie);
>> +        ret = -EINVAL;
>> +        goto err_config;
>> +    }
>> +    if (gi2c->is_tx_multi_desc_xfer) {
>> +        dma_async_issue_pending(gi2c->tx_c);
>> +        if ((msg_idx == (gi2c->num_msgs - 1)) ||
>> +            (gi2c_gpi_xfer->msg_idx_cnt >=
>> +             QCOM_I2C_GPI_MAX_NUM_MSGS + gi2c_gpi_xfer- 
>> >freed_msg_cnt)) {
>> +            ret = geni_i2c_gpi_multi_xfer_timeout_handler(gi2c- 
>> >se.dev, gi2c_gpi_xfer,
>> +                                      gi2c->num_msgs, XFER_TIMEOUT,
>> +                                      &gi2c->done);
>> +            if (ret) {
>> +                dev_err(gi2c->se.dev,
>> +                    "I2C multi write msg transfer timeout: %d\n",
>> +                    ret);
>> +                gi2c->err = ret;
>> +                goto err_config;
>> +            }
>> +        }
>> +    } else {
>> +        /* Non multi descriptor message transfer */
>> +        *buf = dma_buf;
>> +        *dma_addr_p = addr;
>> +    }
>>       return 0;
>>   err_config:
>> -    dma_unmap_single(gi2c->se.dev->parent, addr, msg->len, map_dirn);
>> -    i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
>> +    dma_unmap_single(gi2c->se.dev->parent, addr,
>> +             msgs[msg_idx].len, map_dirn);
>> +    i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
>> +
>> +out:
>> +    gi2c->err = ret;
>>       return ret;
>>   }
>> @@ -605,6 +788,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg msgs[], i
>>       unsigned long time_left;
>>       dma_addr_t tx_addr, rx_addr;
>>       void *tx_buf = NULL, *rx_buf = NULL;
>> +    struct geni_i2c_gpi_multi_desc_xfer *tx_multi_xfer;
>>       const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>>       config.peripheral_config = &peripheral;
>> @@ -618,6 +802,33 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg msgs[], i
>>       peripheral.set_config = 1;
>>       peripheral.multi_msg = false;
>> +    gi2c->num_msgs = num;
>> +    gi2c->is_tx_multi_desc_xfer = false;
>> +    gi2c->tx_irq_cnt = 0;
>> +
>> +    tx_multi_xfer = &gi2c->i2c_multi_desc_config;
>> +    memset(tx_multi_xfer, 0, sizeof(struct 
>> geni_i2c_gpi_multi_desc_xfer));
>> +
>> +    /*
>> +     * If number of write messages are two and higher then
>> +     * configure hardware for multi descriptor transfers with BEI.
>> +     */
>> +    if (num >= QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC) {
>> +        gi2c->is_tx_multi_desc_xfer = true;
>> +        for (i = 0; i < num; i++) {
>> +            if (msgs[i].flags & I2C_M_RD) {
>> +                /*
>> +                 * Multi descriptor transfer with BEI
>> +                 * support is enabled for write transfers.
>> +                 * TODO: Add BEI optimization support for
>> +                 * read transfers later.
>> +                 */
>> +                gi2c->is_tx_multi_desc_xfer = false;
>> +                break;
>> +            }
>> +        }
>> +    }
>> +
>>       for (i = 0; i < num; i++) {
>>           gi2c->cur = &msgs[i];
>>           gi2c->err = 0;
>> @@ -628,14 +839,16 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg msgs[], i
>>               peripheral.stretch = 1;
>>           peripheral.addr = msgs[i].addr;
>> +        if (i > 0 && (!(msgs[i].flags & I2C_M_RD)))
>> +            peripheral.multi_msg = false;
>> -        ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>> +        ret =  geni_i2c_gpi(gi2c, msgs, &config,
>>                       &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
>>           if (ret)
>>               goto err;
>>           if (msgs[i].flags & I2C_M_RD) {
>> -            ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>> +            ret =  geni_i2c_gpi(gi2c, msgs, &config,
>>                           &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
>>               if (ret)
>>                   goto err;
>> @@ -643,18 +856,26 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg msgs[], i
>>               dma_async_issue_pending(gi2c->rx_c);
>>           }
>> -        dma_async_issue_pending(gi2c->tx_c);
>> -
>> -        time_left = wait_for_completion_timeout(&gi2c->done, 
>> XFER_TIMEOUT);
>> -        if (!time_left)
>> -            gi2c->err = -ETIMEDOUT;
>> +        if (!gi2c->is_tx_multi_desc_xfer) {
>> +            dma_async_issue_pending(gi2c->tx_c);
>> +            time_left = wait_for_completion_timeout(&gi2c->done, 
>> XFER_TIMEOUT);
>> +            if (!time_left) {
>> +                dev_err(gi2c->se.dev, "%s:I2C timeout\n", __func__);
>> +                gi2c->err = -ETIMEDOUT;
>> +            }
>> +        }
>>           if (gi2c->err) {
>>               ret = gi2c->err;
>>               goto err;
>>           }
>> -        geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, 
>> rx_addr);
>> +        if (!gi2c->is_tx_multi_desc_xfer) {
>> +            geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, 
>> rx_buf, rx_addr);
>> +        } else if (gi2c->tx_irq_cnt != tx_multi_xfer->irq_cnt) {
>> +            gi2c->tx_irq_cnt = tx_multi_xfer->irq_cnt;
>> +            geni_i2c_gpi_multi_desc_unmap(gi2c, msgs, &peripheral);
>> +        }
>>       }
>>       return num;
>> @@ -663,7 +884,11 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg msgs[], i
>>       dev_err(gi2c->se.dev, "GPI transfer failed: %d\n", ret);
>>       dmaengine_terminate_sync(gi2c->rx_c);
>>       dmaengine_terminate_sync(gi2c->tx_c);
>> -    geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, 
>> rx_addr);
>> +    if (gi2c->is_tx_multi_desc_xfer)
>> +        geni_i2c_gpi_multi_desc_unmap(gi2c, msgs, &peripheral);
>> +    else
>> +        geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, 
>> rx_addr);
>> +
>>       return ret;
>>   }
> 


