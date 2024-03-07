Return-Path: <linux-i2c+bounces-2248-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACD9874B23
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 10:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDC561F2B5C2
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 09:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD4983CAF;
	Thu,  7 Mar 2024 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qea1YXZM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6844204B;
	Thu,  7 Mar 2024 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709804627; cv=none; b=JIfFzP0gQGR13C5fMR0TnPrEM3sdBq+sYhNn9SJe1/fWB1JWmcXagS/WYqChO2HnyqNXZiH2rXOT2uWqueOuKinoa13IDTVY0jmw7/pm+bRfPkR+BlVdmw/ZImK0wyAL/H7gZQ3MoRFCHwGfvbjH/+p69BxHlsFJRAOZC9xgjpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709804627; c=relaxed/simple;
	bh=/TrJVRw3ayPHoXNVlJwTBx7vwegis84pIWo25EDIv5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fB2bHMK4zThsj3tXc0cM06+APMoGilRXx/bTK245TMDJi9mZ4Xr1t3P1VLpPkz7/p4HjJg9vqafNj0fwVBYX0gh2+YD2k505brgvkfHqjkzK0Ne5Elyxl/AH0baQtLcdE8iG1uSXWzjP112YIRwM0c4+QyalzS3DBmsVLLeuCog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qea1YXZM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4279ddSb006850;
	Thu, 7 Mar 2024 09:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=rdM6VkzA6wVNMp+ivDpo5llGb4u1XiWJpG/AdMiKJY4=; b=Qe
	a1YXZMJ4IsIP7S6agMl3wjrxVKkiDf4V9KaTXg36pW4CRTPq0UylLhwY7koQQ4b6
	eVN2FTe84ej1U248vTZ0xq/dzkCHL3YWnldb10FAalGpYKEzTEjlDcX0It/KSyfn
	WEbDKuHEblGl89SUzGsSy4IdALHCP1sgT1FgpgOZC7sc36ei10XynFelZsJ3JLW0
	1cYGeerlYugw+CoHDBd9pONoDhOwMH2YL+OTk1NeEGTdowdrBnXH4V92KMsi9Puk
	VL/BL7tBTsD6GxfLGzpMxIbqwER2fYY7vR3DMhQDOl368almPxE5zQi0pITCuH7v
	scT7tMYjmSAzbaBJFhHA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wpts7t7b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 09:43:42 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4279hfFj031294
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Mar 2024 09:43:41 GMT
Received: from [10.216.46.193] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 7 Mar
 2024 01:43:36 -0800
Message-ID: <8e288c24-72a9-4f9a-8aa1-ecd4c9b1652b@quicinc.com>
Date: Thu, 7 Mar 2024 15:13:20 +0530
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
To: Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>
CC: <konrad.dybcio@linaro.org>, <bjorn.andersson@linaro.org>,
        <andi.shyti@kernel.org>, <wsa@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <quic_vdadhani@quicinc.com>
References: <20240301112638.990045-1-quic_msavaliy@quicinc.com>
 <fuggv2kghhxijcljavzsus5uagjiknj5mrzwmqbxbhkyov5t75@smpxbhpdz7cv>
 <ZeSFVEcA9g2WTyJz@matsya>
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <ZeSFVEcA9g2WTyJz@matsya>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -l2jebVs9tjIYjLSD7CV4BH-iE7fjZev
X-Proofpoint-GUID: -l2jebVs9tjIYjLSD7CV4BH-iE7fjZev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_06,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 mlxscore=0 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070070



On 3/3/2024 7:42 PM, Vinod Koul wrote:
> On 01-03-24, 10:37, Bjorn Andersson wrote:
>> On Fri, Mar 01, 2024 at 04:56:38PM +0530, Mukesh Kumar Savaliya wrote:
>>> we are seeing protocol errors like NACK as transfer failure but
>>> ideally it should report exact error like NACK, BUS_PROTO or ARB_LOST.
>>>
>>> Hence we are adding such error support in GSI mode and reporting it
>>> accordingly by adding respective error logs.
>>>
>>> geni_i2c_gpi_xfer() needed to allocate heap based memory instead of
>>> stack memory to handle and store the geni_i2c_dev handle.
>>>
>>> Copy event status from GSI driver to the i2c device status and parse
>>> error when callback comes from gsi driver to the i2c driver. In the
>>> gpi.c, we need to store callback param into i2c config data structure
>>> so that inside the i2c driver, we can check what exactly the error is
>>> and parse it accordingly.
>>>
>>> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
>>> Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>> ---
>>>   drivers/dma/qcom/gpi.c             | 12 +++++++-
>>>   drivers/i2c/busses/i2c-qcom-geni.c | 46 +++++++++++++++++++-----------
>>>   include/linux/dma/qcom-gpi-dma.h   |  4 +++
>>>   3 files changed, 44 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>>> index 1c93864e0e4d..6d718916fba4 100644
>>> --- a/drivers/dma/qcom/gpi.c
>>> +++ b/drivers/dma/qcom/gpi.c
>>> @@ -1076,7 +1076,17 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
>>>   	dev_dbg(gpii->gpi_dev->dev, "Residue %d\n", result.residue);
>>>   
>>>   	dma_cookie_complete(&vd->tx);
>>> -	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
>>> +	if (gchan->protocol == QCOM_GPI_I2C) {
>>> +		struct dmaengine_desc_callback cb;
>>> +		struct gpi_i2c_config *i2c;
>>> +
>>> +		dmaengine_desc_get_callback(&vd->tx, &cb);
>>> +		i2c = cb.callback_param;
>>> +		i2c->status = compl_event->status;
>>
>> What would the DMA maintainer say about extending struct
>> dmaengine_tx_result with some protocol-specific status field?
> 
> That would be sane thing to do if we can get protocol status. Most of
> the times DMA txn would tell you success or fail, here we have firmware
> which tells us this and I see no reason why this can't be propagated.

Thanks Vinod for reviewing the change. I have uploaded latest patch 
considering other review comments.
> 

