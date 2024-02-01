Return-Path: <linux-i2c+bounces-1581-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC97884550D
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 11:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 215991F2C4A2
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 10:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3630E15B0EF;
	Thu,  1 Feb 2024 10:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oy5MO2uP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3D115B102;
	Thu,  1 Feb 2024 10:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706782662; cv=none; b=nBKjxzEekcVcb1jRnRKNTlLVV65ieVv0LEQ+wY/ncXuwWW/JKoe7m6uFypTQzRm//Gu9eE3oePaVLOJ2ThxInBSzjAb9PqwdvpS2PYdEgyIMf3QKeJikaZFWSWI1hC6T2HFub4q1jhYxTX99Ih23EwBBhPWvXvugUAa9gVb3mDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706782662; c=relaxed/simple;
	bh=e90Rv4w1hU2IykaN/Qvvk//SylNjfXirH78B0STgVfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HGzbbvtl2WXzntERs4sf2oj4q0QyRVHsl7r7x9aCuULgZcDvludcjg42jnm6anZpYnqqIiJWk4eNbi8XhcoTJlhWrqLG+lAaNEKgvkcgK7yRcz5H4k8DPtIobWwZzBUKW1LMjFMByC8g1yn7wetnuzVJq8XylAaXZotQrHfgd/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oy5MO2uP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 411A6ABJ023316;
	Thu, 1 Feb 2024 10:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=AfWuN6LbuvcvxBSPjYrEHyzxmGBZs4Ru/UowddQIa/I=; b=oy
	5MO2uPH1iOGDMn1K3AYBte2R2rk5ue8ufwysMeg8lbtByd+K7bgYIaVC3vOPaFVq
	SVWB1vh+tTL5P0aZdipalfO93ohBmZ9YE1MOPjscyV6WgwFBnLGIbI2sOmNYOl7i
	RopZKjmOIxUxFn92IvNrQUW4Mirrdy0CqUX0YgPHao1ru063WRAKg17jaaPLS26N
	Lc2BslgE/4J9l4WhFLhmKF1omw373row0Bihot+NL+BXHKjPHRVywKG4xaAYQPDX
	oofcs+LJtbVqUmc1rqdjXGO6HRRifRmlQ5MvJht3Rg8nn+bw+uEkntLDABzIzOi/
	m/RLlSSHyLa/yU/mMYWw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w098c00ud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Feb 2024 10:17:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 411AHaxr022716
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Feb 2024 10:17:36 GMT
Received: from [10.218.25.146] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 1 Feb
 2024 02:17:32 -0800
Message-ID: <3a3a5ef2-c5c5-4c19-8760-6805d571658e@quicinc.com>
Date: Thu, 1 Feb 2024 15:47:15 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V2] i2c: i2c-qcom-geni: Correct I2C TRE sequence
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <vkoul@kernel.org>,
        <quic_bjorande@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
        <quic_msavaliy@quicinc.com>, <quic_vtanuku@quicinc.com>
References: <20240129061003.4085-1-quic_vdadhani@quicinc.com>
 <lib6m2bty4uilvvu544sjlezeux7ne4cx5i25j6yndicx7miaw@tvxpuekiczwh>
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <lib6m2bty4uilvvu544sjlezeux7ne4cx5i25j6yndicx7miaw@tvxpuekiczwh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GC_OZ6MCaLT0ZsA1jftpdRcrMfW03cg8
X-Proofpoint-GUID: GC_OZ6MCaLT0ZsA1jftpdRcrMfW03cg8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2402010081



On 1/30/2024 4:54 AM, Andi Shyti wrote:
> Hi Viken,
> 
> as Bryan has done some comments in version 1, please, Cc him to
> this patch.
> 
> On Mon, Jan 29, 2024 at 11:40:03AM +0530, Viken Dadhaniya wrote:
>> For i2c read operation, we are getting gsi mode timeout due
>> to malformed TRE(Transfer Ring Element). Currently we are
>> configuring incorrect TRE sequence in gpi driver
>> (drivers/dma/qcom/gpi.c) as below
>>
>> - Sets up CONFIG
>> - Sets up DMA tre
>> - Sets up GO tre
>>
>> As per HPG(Hardware programming guide), We should configure TREs in below
>> sequence for any i2c transfer
>>
>> - Sets up CONFIG tre
>> - Sets up GO tre
>> - Sets up DMA tre
>>
>> For only write operation or write followed by read operation,
>> existing software sequence is correct.
>>
>> for only read operation, TRE sequence need to be corrected.
>> Hence, we have changed the sequence to submit GO tre before DMA tre.
>>
>> Tested covering i2c read/write transfer on QCM6490 RB3 board.
>>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> Fixes: commit d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> 
> The format is:
> 
> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> 
> and goes above the SoB.
> 

Submitted V3 with correct fix tag.

>> ---
>> v1 -> v2:
>> - Remove redundant check.
>> - update commit log.
>> - add fix tag.
>> ---
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 0d2e7171e3a6..da94df466e83 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -613,20 +613,20 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>   
>>   		peripheral.addr = msgs[i].addr;
>>   
>> +		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>> +				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
>> +		if (ret)
>> +			goto err;
>> +
>>   		if (msgs[i].flags & I2C_M_RD) {
>>   			ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>>   					    &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
>>   			if (ret)
>>   				goto err;
>> -		}
>> -
>> -		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>> -				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
>> -		if (ret)
>> -			goto err;
>>   
>> -		if (msgs[i].flags & I2C_M_RD)
>>   			dma_async_issue_pending(gi2c->rx_c);
>> +		}
>> +
> 
> Bryan, could you please check here?
> 
> Thanks for your review!
> 
> Andi

