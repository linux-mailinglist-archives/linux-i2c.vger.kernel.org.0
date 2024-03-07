Return-Path: <linux-i2c+bounces-2250-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB1A874BC3
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 11:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF0921C20FC8
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 10:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1928586656;
	Thu,  7 Mar 2024 09:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Lmc49Ut+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134FB8528E;
	Thu,  7 Mar 2024 09:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709805558; cv=none; b=OiOVRtSZidBmrqp6kdtLSIh9Ja/lco8y/60KqQA0Ny4FuUEkhSVjSw4fNFN8oAQSGU5DcfE+dxY7yV92oyv1OmUCSXalf3ACyh/HoDLdk6X1ypCWbfCpzjuAU763wFGgCooLw1M3gfwvbVcct99w+//C0nM0RHzIm4dcDaakrUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709805558; c=relaxed/simple;
	bh=nsh32M67OB7l8NM5ipQG76Wv+KI5J7W8AvMe1Jj7RW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rvumLI+aksdQdC+LxwDClqv5Cbf5vKAlqU6XE6iknl1ATCeLSL/fkYCwSagEpEv9et/CkepDFDnAKCvSpJGAf9aLgN3K6Wo0B5QboaE/frNjBMRZqdO+V8Dhaqy1wkRiejVq6hhYNT0Xb2QdEBgKrwCUuSscfojNSmvrNPWPqzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Lmc49Ut+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4276LRwA005981;
	Thu, 7 Mar 2024 09:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=y/WG++vAa+SE9VXhAH0fMg1oJJNdStCCIwW5Y1b021Q=; b=Lm
	c49Ut+J9HsDWLfDm2mkOBOs000tjaVd2tPmWCXyjzaaxqUvzw3zFDbmgG6vQ+GIb
	UQaQHDZzDlHItbdH3pJeDc9n5W4UDyyacvyJg3UC7qYv+Cc56VVkpRI3ieJzXkrt
	RGiTRoMw+KlQcfz40Ig6aPgQ8lCnRCx6Ue/S81x/WhGKOnbklH93gCy4IS8Cnt6u
	bUBBbDJ+Cz9Jg8D8pk1/ETi5zBasORjcdoinsVyZ9DcRIPNo7Fvx+lj5GflezP2S
	nId8A1qQGVb+IgdQOCYbZrP24YXu5dz086/DtlIzJKveiFL9UntkatFKSAwryOhh
	CnGP7LDFmZ6iFeL3IiKQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wq790rm73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 09:59:12 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4279xALd007211
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Mar 2024 09:59:11 GMT
Received: from [10.216.46.193] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 7 Mar
 2024 01:59:05 -0800
Message-ID: <5df68078-24f9-4754-b0b9-6fdafc908831@quicinc.com>
Date: Thu, 7 Mar 2024 15:29:00 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>
CC: <konrad.dybcio@linaro.org>, <bjorn.andersson@linaro.org>,
        <vkoul@kernel.org>, <andi.shyti@kernel.org>, <wsa@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <quic_vdadhani@quicinc.com>
References: <20240301112638.990045-1-quic_msavaliy@quicinc.com>
 <fuggv2kghhxijcljavzsus5uagjiknj5mrzwmqbxbhkyov5t75@smpxbhpdz7cv>
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <fuggv2kghhxijcljavzsus5uagjiknj5mrzwmqbxbhkyov5t75@smpxbhpdz7cv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BWeCZhOgq5lns8SP0EzvCGwx46CIjIRh
X-Proofpoint-GUID: BWeCZhOgq5lns8SP0EzvCGwx46CIjIRh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_06,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070072



On 3/1/2024 10:07 PM, Bjorn Andersson wrote:
> On Fri, Mar 01, 2024 at 04:56:38PM +0530, Mukesh Kumar Savaliya wrote:
>> we are seeing protocol errors like NACK as transfer failure but
>> ideally it should report exact error like NACK, BUS_PROTO or ARB_LOST.
>>
>> Hence we are adding such error support in GSI mode and reporting it
>> accordingly by adding respective error logs.
>>
>> geni_i2c_gpi_xfer() needed to allocate heap based memory instead of
>> stack memory to handle and store the geni_i2c_dev handle.
>>
>> Copy event status from GSI driver to the i2c device status and parse
>> error when callback comes from gsi driver to the i2c driver. In the
>> gpi.c, we need to store callback param into i2c config data structure
>> so that inside the i2c driver, we can check what exactly the error is
>> and parse it accordingly.
>>
>> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
>> Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>   drivers/dma/qcom/gpi.c             | 12 +++++++-
>>   drivers/i2c/busses/i2c-qcom-geni.c | 46 +++++++++++++++++++-----------
>>   include/linux/dma/qcom-gpi-dma.h   |  4 +++
>>   3 files changed, 44 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>> index 1c93864e0e4d..6d718916fba4 100644
>> --- a/drivers/dma/qcom/gpi.c
>> +++ b/drivers/dma/qcom/gpi.c
>> @@ -1076,7 +1076,17 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
>>   	dev_dbg(gpii->gpi_dev->dev, "Residue %d\n", result.residue);
>>   
>>   	dma_cookie_complete(&vd->tx);
>> -	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
>> +	if (gchan->protocol == QCOM_GPI_I2C) {
>> +		struct dmaengine_desc_callback cb;
>> +		struct gpi_i2c_config *i2c;
>> +
>> +		dmaengine_desc_get_callback(&vd->tx, &cb);
>> +		i2c = cb.callback_param;
>> +		i2c->status = compl_event->status;
> 
> What would the DMA maintainer say about extending struct
> dmaengine_tx_result with some protocol-specific status field?
> 
>> +		dmaengine_desc_callback_invoke(&cb, &result);
>> +	} else {
>> +		dmaengine_desc_get_callback_invoke(&vd->tx, &result);
>> +	}
>>   
>>   gpi_free_desc:
>>   	spin_lock_irqsave(&gchan->vc.lock, flags);
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index da94df466e83..5092d10e8f47 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -484,9 +484,16 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>   
>>   static void i2c_gpi_cb_result(void *cb, const struct dmaengine_result *result)
>>   {
>> -	struct geni_i2c_dev *gi2c = cb;
>> -
>> -	if (result->result != DMA_TRANS_NOERROR) {
>> +	struct gpi_i2c_config *i2c = cb;
>> +	struct geni_i2c_dev *gi2c = i2c->gi2c;
>> +
>> +	if (i2c->status & (BIT(NACK) << 5)) {
> 
> Wouldn't it be cleaner to:
> 
> status = FIELD_GET(SOME_MASK, i2c->status);
> if (status == BIT(NACK)) {
> ...
> 
> Or can multiple of these be set? Still would like to see you extract the
> field instead of having the shift in every single conditional.
> 

Thanks Bjorn !
Yes, agreed to use FIELT_GET.
For these three error, Either one of the error would get reported.

>> +		geni_i2c_err(gi2c, NACK);
>> +	} else if (i2c->status & (BIT(BUS_PROTO) << 5)) {
>> +		geni_i2c_err(gi2c, BUS_PROTO);
>> +	} else if (i2c->status & (BIT(ARB_LOST) << 5)) {
>> +		geni_i2c_err(gi2c, ARB_LOST);
>> +	} else if (result->result != DMA_TRANS_NOERROR) {
>>   		dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
>>   		gi2c->err = -EIO;
>>   	} else if (result->residue) {
>> @@ -568,7 +575,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>   	}
>>   
>>   	desc->callback_result = i2c_gpi_cb_result;
>> -	desc->callback_param = gi2c;
>> +	desc->callback_param = peripheral;
>>   
>>   	dmaengine_submit(desc);
>>   	*buf = dma_buf;
>> @@ -585,33 +592,38 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>   static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], int num)
>>   {
>>   	struct dma_slave_config config = {};
>> -	struct gpi_i2c_config peripheral = {};
>> +	struct gpi_i2c_config *peripheral;
>>   	int i, ret = 0, timeout;
>>   	dma_addr_t tx_addr, rx_addr;
>>   	void *tx_buf = NULL, *rx_buf = NULL;
>>   	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>>   
>> -	config.peripheral_config = &peripheral;
>> -	config.peripheral_size = sizeof(peripheral);
>> +	peripheral = devm_kzalloc(gi2c->se.dev, sizeof(*peripheral), GFP_KERNEL);
> 
> This will be allocated for every transfer, and only freed when you
> remove the geni bus driver, i.e. this is in practice a memory leak.
> 
> 
> But do you really need to move this to the heap? If I understand the DMA
> api, the callback will not be invoked after you exit this function, so
> it should be fine to have it on the stack.
> 

yes, I do Agree, its a memory leak. Removed heap memory allocation.
Next comment addresses this comment since i have removed heap
memory allocation and added a new structure as part of the
existing structure to get the error status.

>> +	if (!peripheral)
>> +		return -ENOMEM;
>> +
>> +	config.peripheral_config = peripheral;
>> +	config.peripheral_size = sizeof(struct gpi_i2c_config);
>>   
>> -	peripheral.pack_enable = I2C_PACK_TX | I2C_PACK_RX;
>> -	peripheral.cycle_count = itr->t_cycle_cnt;
>> -	peripheral.high_count = itr->t_high_cnt;
>> -	peripheral.low_count = itr->t_low_cnt;
>> -	peripheral.clk_div = itr->clk_div;
>> -	peripheral.set_config = 1;
>> -	peripheral.multi_msg = false;
>> +	peripheral->gi2c = gi2c;
>> +	peripheral->pack_enable = I2C_PACK_TX | I2C_PACK_RX;
>> +	peripheral->cycle_count = itr->t_cycle_cnt;
>> +	peripheral->high_count = itr->t_high_cnt;
>> +	peripheral->low_count = itr->t_low_cnt;
>> +	peripheral->clk_div = itr->clk_div;
>> +	peripheral->set_config = 1;
>> +	peripheral->multi_msg = false;
>>   
>>   	for (i = 0; i < num; i++) {
>>   		gi2c->cur = &msgs[i];
>>   		gi2c->err = 0;
>>   		dev_dbg(gi2c->se.dev, "msg[%d].len:%d\n", i, gi2c->cur->len);
>>   
>> -		peripheral.stretch = 0;
>> +		peripheral->stretch = 0;
>>   		if (i < num - 1)
>> -			peripheral.stretch = 1;
>> +			peripheral->stretch = 1;
>>   
>> -		peripheral.addr = msgs[i].addr;
>> +		peripheral->addr = msgs[i].addr;
>>   
>>   		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>>   				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
>> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
>> index 6680dd1a43c6..af264f769344 100644
>> --- a/include/linux/dma/qcom-gpi-dma.h
>> +++ b/include/linux/dma/qcom-gpi-dma.h
>> @@ -64,6 +64,8 @@ enum i2c_op {
>>    * @set_config: set peripheral config
>>    * @rx_len: receive length for buffer
>>    * @op: i2c cmd
>> + * @status: stores gpi event status based on interrupt
>> + * @gi2c: pointer to i2c device handle
> 
> The order doesn't match the struct below.
> 

Yes, removed this change since we don't need to have new member inside 
this structure.

>>    * @muli-msg: is part of multi i2c r-w msgs
>>    */
>>   struct gpi_i2c_config {
>> @@ -78,6 +80,8 @@ struct gpi_i2c_config {
>>   	u32 rx_len;
>>   	enum i2c_op op;
>>   	bool multi_msg;
>> +	u32 status;
>> +	struct geni_i2c_dev *gi2c;
> 
> These two entries doesn't have anything to do with the "gpi i2c config",
> just as the remainder of the properties has nothing to do with the "dma
> callback".
> 
> Please split them off into their own structure.
> 

Sure, made the chages by adding new structure.

> Regards,
> Bjorn
> 
>>   };
>>   
>>   #endif /* QCOM_GPI_DMA_H */
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
>>
> 

