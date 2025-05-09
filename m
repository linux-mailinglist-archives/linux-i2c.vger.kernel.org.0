Return-Path: <linux-i2c+bounces-10912-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEA4AB0A78
	for <lists+linux-i2c@lfdr.de>; Fri,  9 May 2025 08:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3758D4A215F
	for <lists+linux-i2c@lfdr.de>; Fri,  9 May 2025 06:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6150126A1D9;
	Fri,  9 May 2025 06:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Aw0XaPdU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC6126A0BD;
	Fri,  9 May 2025 06:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746771541; cv=none; b=amDKNPcVzrRz9IUeUnQIQP28Vyvd73Jg1JrmwlKgGaW+WJNc34WPNlobhYR2SyKihM8Ia8fVU40G4DSepUCvMDsh5qyIbyFEriA9YV/VtB1TGtWXF43z59A3YLMZzgZTBPmlixM2y5Zu70nfJI84psnxDwWZyMi9pzdqlJa9USo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746771541; c=relaxed/simple;
	bh=TzvMSg7brzux3DxsfIv1UoDIW9mFEw5HuFBoRuNgPX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TDrpEKcor7uHwUwfClhJ/4/utKn8uhTdhAIfvv9954hyntBTVETZrCnbEzZDkt0sTnomqrvzGNhqrOwL+OLOTZByJqbd1NTMYnQvklMZKAwV1CJLN3mvCBtBycpnBRT937+K45U1S1A8Ms53AkMcejz/p7wlKNudRp+TTQQo2Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Aw0XaPdU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5491Ajlw025220;
	Fri, 9 May 2025 06:18:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZPQfVlhiUylm7IDtEFF3G36/Le2Gs/5G0a1jysqB0a4=; b=Aw0XaPdUS/5+aAWc
	gx0gt/GpGqRSdORxiVr2odpvfroQmqhPpCPqWJMUi0aTlHhv9GJZuraalsTmPLFy
	2uHiJXU/Gg2Ce+VLnQJQ942JFgGx/4gSqvFiJtXiRy+Hwci5P78Nr53bd/EmcDgG
	ig5v5KLMQnrKsgoIFZBkPhsZjn+FBORqchLQQKHkPR/xKEXpWEKrsQOCCsGmZ8vw
	ScKTK6l8qAd6r8hkgFgD/Bs6ZXB7GOgCVYlrB7hHvyLOdiVzvr7lKciKomINMx3Y
	9WSmxtygVgBm4l/xU3Y5hjOT/zuTi67cIQOJFjVOA9MDR4IGncYlFzXGy7HBYknY
	zKbSmQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp13nan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 06:18:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5496IpIo012673
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 06:18:51 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 23:18:47 -0700
Message-ID: <4456d0e2-3451-4749-acda-3b75ae99e89b@quicinc.com>
Date: Fri, 9 May 2025 11:48:44 +0530
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
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <ze5y6llgo2qx4nvilaqcmkam5ywqa76d6uetn34iblz4nefpeu@ozbgzwbyd54u>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA1OCBTYWx0ZWRfX5ZLaSSa2tt2l
 1U87h9OMbb+3c0+xh3XvzKsM2UeE7+c/txG9UFgeptIv1STPD0dUqtVgWNeNYOlrfrYVOeI22uU
 hU1BL/9BQol5pzZWLhYyVLmUwYIxPyD1BapV08VirptW+zsHeUv5gTFmDNsBiZpX9x2gsxZJv6w
 xuj1Ds+xVtiqh19t3ctQj68gOld823RU8JujEV8LCrB0iuok91VF1q6YEazG/YhqdOcN+ddx0yx
 /q8+hWhdmHFg9/igKYWx3czfS0UjPdF01z3ID2ywqhWDONIojVOZigBpvdFjxboqhBFEessktA2
 xKiFvaL56TYfxfG7T4LBmoaVhimrr+4Ok9RXM0LndZAJ+d7xzGseEICzQDkYxqrfSw9woc0ZxIv
 kWAy8K09cZ0yfkiO583BZIzb9SCW2YxL3K0Y3mqlZ5Q1FeBNpNKrYdbkGrdRcQz1IPIPKKiS
X-Proofpoint-GUID: 1YhT_MNkxTN24HATnjDlZLayQakUpgyz
X-Proofpoint-ORIG-GUID: 1YhT_MNkxTN24HATnjDlZLayQakUpgyz
X-Authority-Analysis: v=2.4 cv=W4o4VQWk c=1 sm=1 tr=0 ts=681d9e4b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=_mbsQNs53rQDILcNud0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_02,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090058



On 5/6/2025 5:02 PM, Dmitry Baryshkov wrote:
> On Tue, May 06, 2025 at 04:48:43PM +0530, Jyothi Kumar Seerapu wrote:
>> GSI hardware generates an interrupt for each transfer completion.
>> For multiple messages within a single transfer, this results in
>> N interrupts for N messages, leading to significant software
>> interrupt latency.
>>
>> To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
>> Enabling BEI instructs the GSI hardware to prevent interrupt generation
>> and BEI is disabled when an interrupt is necessary.
>>
>> When using BEI, consider splitting a single multi-message transfer into
>> chunks of 8 messages internally and so interrupts are not expected for
>> the first 7 message completions, only the last message triggers
>> an interrupt, indicating the completion of 8 messages.
>>
>> This BEI mechanism enhances overall transfer efficiency.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
>> ---
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
>>   drivers/dma/qcom/gpi.c           | 3 +++
>>   include/linux/dma/qcom-gpi-dma.h | 2 ++
>>   2 files changed, 5 insertions(+)
>>
>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>> index b1f0001cc99c..7e511f54166a 100644
>> --- a/drivers/dma/qcom/gpi.c
>> +++ b/drivers/dma/qcom/gpi.c
>> @@ -1695,6 +1695,9 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>>   
>>   		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
>>   		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
>> +
>> +		if (!(i2c->dma_flags & DMA_PREP_INTERRUPT))
>> +			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
>>   	}
>>   
>>   	for (i = 0; i < tre_idx; i++)
>> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
>> index 6680dd1a43c6..ebac0d3edff2 100644
>> --- a/include/linux/dma/qcom-gpi-dma.h
>> +++ b/include/linux/dma/qcom-gpi-dma.h
>> @@ -65,6 +65,7 @@ enum i2c_op {
>>    * @rx_len: receive length for buffer
>>    * @op: i2c cmd
>>    * @muli-msg: is part of multi i2c r-w msgs
>> + * @dma_flags: Flags indicating DMA capabilities
>>    */
>>   struct gpi_i2c_config {
>>   	u8 set_config;
>> @@ -78,6 +79,7 @@ struct gpi_i2c_config {
>>   	u32 rx_len;
>>   	enum i2c_op op;
>>   	bool multi_msg;
>> +	unsigned int dma_flags;
> 
> Why do you need extra field instead of using
> dma_async_tx_descriptor.flags?

In the original I2C QCOM GENI driver, using the local variable (unsigned 
in flags) and updating the "DMA_PREP_INTERRUPT" flag.

Sure, i will review if "dma_async_tx_descriptor.flags" can be retrieved 
in GPI driver for DMA_PREP_INTERRUPT flag status.
> 
>>   };
>>   
>>   #endif /* QCOM_GPI_DMA_H */
>> -- 
>> 2.17.1
>>
> 


