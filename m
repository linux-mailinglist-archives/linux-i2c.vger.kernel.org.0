Return-Path: <linux-i2c+bounces-7617-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B50E9B24D7
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 07:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B5E21F21754
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 06:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A46618CC09;
	Mon, 28 Oct 2024 06:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Yqn6YZUP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2718152E1C;
	Mon, 28 Oct 2024 06:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730095466; cv=none; b=b8xQYbAleZ7LtdiFkRPQdlFS+3MjTpa3cWzFBnv9EH4Yga0AzvOmj4Tpr+Bak/lfNPdRlr6QiBgRL34r4oAcjFBTBuf7LJ2HH0UZHh1PiQt56ePYfswuwFJICXCM3LeXe/efroJmg29TQCIDBTPVbd7P+V0+tGJ138+h8ZGPxhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730095466; c=relaxed/simple;
	bh=byvKsqR3gVx9MzmUveC3UBlwrhS1FzdgOWtUZ0T/mkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZgNm/whSUvmruhqk+WSibsXi3LVT235GzamUOPX/vAT7F1hyqjnjwtpocJCcbAYDHpNAkCKJ1oUFBXDbdzDbgWj3XSchtJF1YvxmcAdAiJVMTgYU5hJwC87uTb0vXc27xmGiQIzlcsNpUPLvelYVEW9AIkFLzVV8M8DhQdEznlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Yqn6YZUP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RNxPTJ009343;
	Mon, 28 Oct 2024 06:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9MIzFZ7XM4MG/PWIYBpRPw6+ewb8JHnvZGlpvo+RI0M=; b=Yqn6YZUPlN98lnp5
	T4BRRaU58ZZ7Xr3ee3q3S9CeGfJiflLzWI4xHA/ec6CalA2PLPWEMKpoSOIUay02
	fzBby2QqOuRL7BzH/IMhCH1tpInq7w90OQuCAggi/LzUwRTWKjSp9CgZSA1XbnTh
	5aqZVQMiovuFLuJNiJXOyaH7eYF4sjHQwIDmIRfQWMIM0ldcoLR/3TiLjlRjC+xe
	QmOmindT3L+Bqrx5D0PB9oBKGRk8Qlw2YTpuIU14u0QFVrF9YIVLaZZk4kNeyF3p
	IRTN16Gi4igGoXzPm1Q5WAM8tY+3IdNpBXjxdcO6NvkL9v6330gFukGhGA3HV5EC
	zg1vrg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grn4uumr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 06:04:16 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S64GlV016929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 06:04:16 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Oct
 2024 23:04:10 -0700
Message-ID: <9280ca8e-c1c8-4113-bfbd-ed27df527450@quicinc.com>
Date: Mon, 28 Oct 2024 11:34:07 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] i2c: i2c-qcom-geni: Add Block event interrupt
 support
To: Andi Shyti <andi.shyti@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>,
        <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>
References: <20241015120750.21217-1-quic_jseerapu@quicinc.com>
 <20241015120750.21217-6-quic_jseerapu@quicinc.com>
 <d2kffhvai5syxolobrk4g27w3f35p7v5azdy4tyvryfqnd4ohz@jxfgsubojysg>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <d2kffhvai5syxolobrk4g27w3f35p7v5azdy4tyvryfqnd4ohz@jxfgsubojysg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fTdGxOIux9C_6RWYth-RuSsFAeqUt3w_
X-Proofpoint-ORIG-GUID: fTdGxOIux9C_6RWYth-RuSsFAeqUt3w_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280049



On 10/16/2024 8:36 PM, Andi Shyti wrote:
> Hi Jyothi,
> 
> ...
> 
>> @@ -523,26 +576,49 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>   	enum dma_transfer_direction dma_dirn;
>>   	struct dma_async_tx_descriptor *desc;
>>   	int ret;
>> +	struct gpi_multi_xfer *gi2c_gpi_xfer;
>> +	dma_cookie_t cookie;
>>   
>>   	peripheral = config->peripheral_config;
>> -
>> -	dma_buf = i2c_get_dma_safe_msg_buf(msg, 1);
>> -	if (!dma_buf)
>> +	gi2c_gpi_xfer = &peripheral->multi_xfer;
>> +	gi2c_gpi_xfer->msg_idx_cnt = cur_msg_idx;
>> +	dma_buf = gi2c_gpi_xfer->dma_buf[gi2c_gpi_xfer->buf_idx];
>> +	addr = gi2c_gpi_xfer->dma_addr[gi2c_gpi_xfer->buf_idx];
>> +
>> +	dma_buf = i2c_get_dma_safe_msg_buf(&msgs[gi2c_gpi_xfer->msg_idx_cnt], 1);
>> +	if (!dma_buf) {
>> +		gi2c->err = -ENOMEM;
>>   		return -ENOMEM;
>> +	}
>>   
>>   	if (op == I2C_WRITE)
>>   		map_dirn = DMA_TO_DEVICE;
>>   	else
>>   		map_dirn = DMA_FROM_DEVICE;
>>   
>> -	addr = dma_map_single(gi2c->se.dev->parent, dma_buf, msg->len, map_dirn);
>> +	addr = dma_map_single(gi2c->se.dev->parent,
>> +			      dma_buf, msgs[gi2c_gpi_xfer->msg_idx_cnt].len,
> 
> You could save msgs[gi2c_gpi_xfer->msg_idx_cnt] in a separate
> variable to avoid this extra indexing.
> 
Thanks Andi, moved gi2c_gpi_xfer->msg_idx_cnt to separate local variable.
>> +			      map_dirn);
>>   	if (dma_mapping_error(gi2c->se.dev->parent, addr)) {
>> -		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
>> +		i2c_put_dma_safe_msg_buf(dma_buf, &msgs[gi2c_gpi_xfer->msg_idx_cnt],
>> +					 false);
>> +		gi2c->err = -ENOMEM;
>>   		return -ENOMEM;
>>   	}
>>   
>> +	if (gi2c->is_tx_multi_xfer) {
>> +		if (((gi2c_gpi_xfer->msg_idx_cnt + 1) % NUM_MSGS_PER_IRQ))
>> +			peripheral->flags |= QCOM_GPI_BLOCK_EVENT_IRQ;
>> +		else
>> +			peripheral->flags &= ~QCOM_GPI_BLOCK_EVENT_IRQ;
>> +
>> +		/* BEI bit to be cleared for last TRE */
>> +		if (gi2c_gpi_xfer->msg_idx_cnt == gi2c->num_msgs - 1)
>> +			peripheral->flags &= ~QCOM_GPI_BLOCK_EVENT_IRQ;
>> +	}
>> +
>>   	/* set the length as message for rx txn */
>> -	peripheral->rx_len = msg->len;
>> +	peripheral->rx_len = msgs[gi2c_gpi_xfer->msg_idx_cnt].len;
>>   	peripheral->op = op;
>>   
>>   	ret = dmaengine_slave_config(dma_chan, config);
>> @@ -560,25 +636,56 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>   	else
>>   		dma_dirn = DMA_DEV_TO_MEM;
>>   
>> -	desc = dmaengine_prep_slave_single(dma_chan, addr, msg->len, dma_dirn, flags);
>> +	desc = dmaengine_prep_slave_single(dma_chan, addr,
>> +					   msgs[gi2c_gpi_xfer->msg_idx_cnt].len,
>> +					   dma_dirn, flags);
>>   	if (!desc) {
>>   		dev_err(gi2c->se.dev, "prep_slave_sg failed\n");
>> -		ret = -EIO;
>> +		gi2c->err = -EIO;
>>   		goto err_config;
>>   	}
>>   
>>   	desc->callback_result = i2c_gpi_cb_result;
>>   	desc->callback_param = gi2c;
>>   
>> -	dmaengine_submit(desc);
>> -	*buf = dma_buf;
>> -	*dma_addr_p = addr;
>> +	if (!((msgs[cur_msg_idx].flags & I2C_M_RD) && op == I2C_WRITE)) {
>> +		gi2c_gpi_xfer->msg_idx_cnt++;
>> +		gi2c_gpi_xfer->buf_idx = (cur_msg_idx + 1) % QCOM_GPI_MAX_NUM_MSGS;
>> +	}
>> +	cookie = dmaengine_submit(desc);
>> +	if (dma_submit_error(cookie)) {
>> +		dev_err(gi2c->se.dev,
>> +			"%s: dmaengine_submit failed (%d)\n", __func__, cookie);
>> +		return -EINVAL;
> 
> goto err_config?
yes, updated it.
> 
>> +	}
>>   
>> +	if (gi2c->is_tx_multi_xfer) {
>> +		dma_async_issue_pending(gi2c->tx_c);
>> +		if ((cur_msg_idx == (gi2c->num_msgs - 1)) ||
>> +		    (gi2c_gpi_xfer->msg_idx_cnt >=
>> +		     QCOM_GPI_MAX_NUM_MSGS + gi2c_gpi_xfer->freed_msg_cnt)) {
>> +			ret = gpi_multi_desc_process(gi2c->se.dev, gi2c_gpi_xfer,
>> +						     gi2c->num_msgs, XFER_TIMEOUT,
>> +						     &gi2c->done);
>> +			if (ret) {
>> +				dev_dbg(gi2c->se.dev,
>> +					"I2C multi write msg transfer timeout: %d\n",
>> +					ret);
> 
> if you are returning an error, then print an error.
sure, updated it to error in V2 patch.
> 
>> +				gi2c->err = -ETIMEDOUT;
> 
> gi2c->err = ret?
Yes in this case, ret is -ETIMEDOUT, so updated in V2 patch as 
gi2c->err= ret.
> 
>> +				goto err_config;
>> +			}
>> +		}
>> +	} else {
>> +		/* Non multi descriptor message transfer */
>> +		*buf = dma_buf;
>> +		*dma_addr_p = addr;
>> +	}
>>   	return 0;
>>   
>>   err_config:
>> -	dma_unmap_single(gi2c->se.dev->parent, addr, msg->len, map_dirn);
>> -	i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
>> +	dma_unmap_single(gi2c->se.dev->parent, addr,
>> +			 msgs[cur_msg_idx].len, map_dirn);
>> +	i2c_put_dma_safe_msg_buf(dma_buf, &msgs[cur_msg_idx], false);
>>   	return ret;
> 
> I would have one more label here:
> 
>     out:
> 	gi2c->err = ret;
> 
> 	return ret;
> 
> in order to avoid always assigning twice
Thanks, added new label as out and handled it.
> 
>>   }
>>   
>> @@ -590,6 +697,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>   	unsigned long time_left;
>>   	dma_addr_t tx_addr, rx_addr;
>>   	void *tx_buf = NULL, *rx_buf = NULL;
>> +	struct gpi_multi_xfer *tx_multi_xfer;
>>   	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>>   
>>   	config.peripheral_config = &peripheral;
>> @@ -603,6 +711,39 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>   	peripheral.set_config = 1;
>>   	peripheral.multi_msg = false;
>>   
>> +	gi2c->gpi_config = &peripheral;
>> +	gi2c->num_msgs = num;
>> +	gi2c->is_tx_multi_xfer = false;
>> +	gi2c->tx_irq_cnt = 0;
>> +
>> +	tx_multi_xfer = &peripheral.multi_xfer;
>> +	tx_multi_xfer->msg_idx_cnt = 0;
>> +	tx_multi_xfer->buf_idx = 0;
>> +	tx_multi_xfer->unmap_msg_cnt = 0;
>> +	tx_multi_xfer->freed_msg_cnt = 0;
>> +	tx_multi_xfer->irq_msg_cnt = 0;
>> +	tx_multi_xfer->irq_cnt = 0;
> 
> you can initialize tx_multi_xfer to "{ };" to avoid all these
> " = 0"
Sure, done memset tx_multi_xfer to 0 in V2 patch.
> 
>> +
>> +	/*
>> +	 * If number of write messages are four and higher then
>> +	 * configure hardware for multi descriptor transfers with BEI.
>> +	 */
>> +	if (num >= MIN_NUM_OF_MSGS_MULTI_DESC) {
>> +		gi2c->is_tx_multi_xfer = true;
>> +		for (i = 0; i < num; i++) {
>> +			if (msgs[i].flags & I2C_M_RD) {
>> +				/*
>> +				 * Multi descriptor transfer with BEI
>> +				 * support is enabled for write transfers.
>> +				 * Add BEI optimization support for read
>> +				 * transfers later.
>> +				 */
>> +				gi2c->is_tx_multi_xfer = false;
>> +				break;
>> +			}
>> +		}
>> +	}
>> +
>>   	for (i = 0; i < num; i++) {
>>   		gi2c->cur = &msgs[i];
>>   		gi2c->err = 0;
>> @@ -613,14 +754,16 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>   			peripheral.stretch = 1;
>>   
>>   		peripheral.addr = msgs[i].addr;
>> +		if (i > 0 && (!(msgs[i].flags & I2C_M_RD)))
>> +			peripheral.multi_msg = false;
>>   
>> -		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>> +		ret =  geni_i2c_gpi(gi2c, msgs, i, &config,
> 
> what is the point of passing 'i' if you always refer to msgs[i]
> in geni_i2c_gpi()?
Handled with new variable in "geni_i2c_gpi "and so no need to pass 
current i2c msg index, removed it in V2 patch.
> 
>>   				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
>>   		if (ret)
>>   			goto err;
>>   
>>   		if (msgs[i].flags & I2C_M_RD) {
>> -			ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>> +			ret =  geni_i2c_gpi(gi2c, msgs, i, &config,
>>   					    &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
>>   			if (ret)
>>   				goto err;
>> @@ -628,18 +771,28 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>   			dma_async_issue_pending(gi2c->rx_c);
>>   		}
>>   
>> -		dma_async_issue_pending(gi2c->tx_c);
>> -
>> -		time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>> -		if (!time_left)
>> -			gi2c->err = -ETIMEDOUT;
>> +		if (!gi2c->is_tx_multi_xfer) {
>> +			dma_async_issue_pending(gi2c->tx_c);
>> +			time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>> +			if (!time_left) {
>> +				dev_err(gi2c->se.dev, "%s:I2C timeout\n", __func__);
>> +				gi2c->err = -ETIMEDOUT;
>> +			}
>> +		}
>>   
>>   		if (gi2c->err) {
>>   			ret = gi2c->err;
>>   			goto err;
>>   		}
>>   
>> -		geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
>> +		if (!gi2c->is_tx_multi_xfer) {
>> +			geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
>> +		} else {
>> +			if (gi2c->tx_irq_cnt != tx_multi_xfer->irq_cnt) {
> 
>     else if (...) {
>     	...
>     }
Sure, else if used here in V2 patch.
> 
> Andi

Regards,
JyothiKumar

