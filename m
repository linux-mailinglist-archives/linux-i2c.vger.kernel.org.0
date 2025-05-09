Return-Path: <linux-i2c+bounces-10910-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8257DAB0A69
	for <lists+linux-i2c@lfdr.de>; Fri,  9 May 2025 08:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC80A7A6025
	for <lists+linux-i2c@lfdr.de>; Fri,  9 May 2025 06:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2442826A1B4;
	Fri,  9 May 2025 06:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CBtq85w2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455161D7E41;
	Fri,  9 May 2025 06:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746771454; cv=none; b=mwfQL6y8RSupIstpuSp6qPDV7P7ndiRlRSOLRIQlDdHn2vKp/eOWJiIO2VQCwvV6lD5myghP90G/+ukInxsT5e8qcoxGE/L+irviOb9eZ/XxZh56IFNQJQKtwQqB1PgRnD0N7tJr4Tm9RLoH3oALYZaCLfVfov1EGyUmGlP64Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746771454; c=relaxed/simple;
	bh=cvSx5nd3whYZNFpm8D8QEGtTMGvSuoB/DWC12sAG+mM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iCRn85ToRXf83lyQyRMjbkyJvVHzFCXah4JrrwFk+z0jzO7W+E88fcS9+irE5KJK9aPXYeAHoVKtS/dLKv+1c8nTxRFlwY1S21xNv3zF1+vt95ojbNn0ltlWCZxN4g+cBUW3d9XJt8HjD4OXqpoEmMiV9lu4ZEiWrJp3gCb7Iiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CBtq85w2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5492E4iM010638;
	Fri, 9 May 2025 06:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mTdN91+3C9E85S346qQAIZNr9cE1lJKGDCwTd/eqkJw=; b=CBtq85w2IvUz1uCN
	t/teGqnLeRfW//kgUt714YUz19MZGVieddJqv/iqTVEguwUrlZQ/e+uO0PxxP2oC
	lpvX8YYSmRUS5CqWtXaL4k2BAMb9i/K4RswoeO+gXZ7DvzRMPot1y6rwqe7Kq7ZE
	l9JYbcnQa7KZhqNUed7L7ZYdyrS+dV3+muEZRNt4xmuQKL6iYq/U2fT7PgcToP9p
	hIuN5d7jK2/tHGCTxB1kJ89GQYaRysyHu0S20TM+iXFINAHpIrfZKdXt3ByeUGKp
	evZnjHnaFUnT94yZU+eZW2/RNS0Lxk9lny4QeUzPPeYodFqjwi8RM0R+NE68OWVp
	RsiR8w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpmkkh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 06:17:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5496HOMC021745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 06:17:24 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 23:17:19 -0700
Message-ID: <756681dd-1db0-4f22-ad51-52714cc9ea05@quicinc.com>
Date: Fri, 9 May 2025 11:46:44 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, Vinod Koul <vkoul@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya
	<quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <quic_vtanuku@quicinc.com>
References: <20250506111844.1726-1-quic_jseerapu@quicinc.com>
 <20250506111844.1726-3-quic_jseerapu@quicinc.com>
 <d15e5b43-f0bd-466a-9a2a-790eb0cf0c48@oracle.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <d15e5b43-f0bd-466a-9a2a-790eb0cf0c48@oracle.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=TpjmhCXh c=1 sm=1 tr=0 ts=681d9df4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=bWRW0vlhy_Az3oka6d8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: DgiMfVJM8yPKMjCgwDR4_dxjaSGOMDG3
X-Proofpoint-GUID: DgiMfVJM8yPKMjCgwDR4_dxjaSGOMDG3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA1OSBTYWx0ZWRfXzpNAl/RNplOP
 ko10DHq3hygzL4rKmuwNjgxjVFq+5UWbhoWsk+s1TPiIwOuDlp2C1fPPCw7CDvxdc8z7035h+VD
 Ad9+mikUci6Y5T4agm1w/wsTjNJT/GJhS8KhZz+D2IdqmSL0i4Qtv3Y3nGRPuz2coPAX6R1kXZO
 o9hkDv6cYDx4D+f+wfGg94xU5sGGi5dVXWXDur3ULDGjmzpkNXBbgFlSYYCN8nSWp9YBEn1RwXw
 +e/Vo9TmSRf2XAe+kCK7nGknXad/CjYJeEe/g/YbRltVdoIAaWN2821s/xg5EabJzNztIzbB8Ce
 YuZL+KS0TlU6gUTmyDDmUASFb0sK+uPZ6rziW40Yl9loVGBO1hgtUNRn6Nq23B+q4FCc68cgxLS
 5yx0chdZvXFNW1oF9k2/VeG2mkD5hVfR7wQOqi9bl/KuTNdEWn1RUig9DvdTwa3XGU2y/u8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_02,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1011 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090059



On 5/7/2025 7:51 AM, ALOK TIWARI wrote:
> 
> 
> On 06-05-2025 16:48, Jyothi Kumar Seerapu wrote:
>> +/**
>> + * struct geni_i2c_dev - I2C Geni device specific structure
>> + *
>> + * @se: geni serial engine
>> + * @tx_wm: Tx watermark level
>> + * @irq: i2c serial engine interrupt
>> + * @err: specifies error codes in i2c transfer failures
>> + * @adap: i2c geni adapter
>> + * @done: completion variable
>> + * @cur: pointer to the i2c_msg mentioning current i2c message in use
>> + * @cur_wr: variable used for i2c write opertions
> 
> typo opertions -> operations
Sure, thanks will correct it.
> 
>> + * @cur_rd: variable used for i2c read operations
>> + * @lock: spinlock variable used for synchronization
>> + * @core_clk: pointer to clk
>> + * @clk_freq_out: contains the i2c clock frequency
>> + * @clk_fld: pointer to geni_i2c_clk_fld
>> + * @suspended: flag used for system supend status
> 
> typo supend -> suspend
sure, will correct it.
> 
>> + * @dma_buf: virtual address of the buffer
>> + * @xfer_len: holds length for the dma operation
>> + * @dma_addr: dma address of the buffer
>> + * @tx_c: Tx dma channel
>> + * @rx_c: Rx dma channel
>> + * @gpi_mode: GPI DMA mode of operation
>> + * @abort_done: true for marking i2c abort transfer
>> + * @is_tx_multi_desc_xfer: true for i2c multi transfer support
>> + * @num_msgs: number of i2c messages in a transfer
>> + * @tx_irq_cnt: flag used for tx irq count in i2c multi transfer
>> + * @i2c_multi_desc_config: used for multi transfer support
>> + */
>>   struct geni_i2c_dev {
>>       struct geni_se se;
>>       u32 tx_wm;
>> @@ -100,6 +156,10 @@ struct geni_i2c_dev {
>>       struct dma_chan *rx_c;
>>       bool gpi_mode;
>>       bool abort_done;
>> +    bool is_tx_multi_desc_xfer;
>> +    u32 num_msgs;
>> +    u32 tx_irq_cnt;
>> +    struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
>>   };
> 
> 
> Thanks,
> Alok


