Return-Path: <linux-i2c+bounces-1582-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A18784551A
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 11:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A54E51F2D12D
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 10:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBAB15B97E;
	Thu,  1 Feb 2024 10:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LWCg70vn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A81815B965;
	Thu,  1 Feb 2024 10:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706782805; cv=none; b=YY7zV7sf/T37MnAX5ya2aOdHJHJOt8x924fhGG3FQNftJzTkYb4AgRNAANJS+ZFZvlv/Pu+XuoDfm76DuZ38nnrXj7IJ700X/Q42NU6SqRfvKooblUYbxirrywp1gctDtZOF84SqEYM8vISLyoGbaosN2EiiPwMzJF54wt1ZVUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706782805; c=relaxed/simple;
	bh=xi/8b3BxqRfZl77tejalMtSOj09xnAZLoeQvbFNl7Vg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=atM5R1K7XDqnBLkLnde2NoCAQbTJEFLkNN+atPXoHP7edI5h5yoggsl/xSMSorRBmZWsF5rldxJZFQ1br5M/bY8J0cn3ACUFPdVvBsIPMWiBhYeVaCJMRE2Js+UekiXZyn7Woe3C10lpC52As0ff8120hFK+33eA5vtn0UzqsV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LWCg70vn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4114DSw5014975;
	Thu, 1 Feb 2024 10:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Cs6WgiiciK9vVs7gFUVZL5uOfzrCe61iHmJ3EgRx1bE=; b=LW
	Cg70vn/Y+L/LYLCutVlTiQXfpIv5cfkNGoo8KUcbuvpZ+qg+jM8cpwIrs0bW+qgn
	Tf5OrhMZkYh8nlpX5RGCfNjffFF1AeVNjqFswGe6zyJbyf+SMkRmaRalqIe/8pE5
	dTmOW2gMRjQEnQ80VVmgvuQ/4r2m90gi+BFb8Uq5CV+PjJgN6sA5YKl8DJqhg4yy
	SVxwuH2bsTbO1y0Twid60b6frA4cfi+TjvCbqO4UDHnfaZzR5coSD6toVz+kD6oY
	IertvFV3d/B155jBkNdlisBZ4husnefl7hqifqDhrcQFZn5+VUcpUJONRkfm+pVX
	QNRU8APvPKUW1ndGPvWQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vypaq2vs3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Feb 2024 10:19:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 411AJxGZ007078
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Feb 2024 10:19:59 GMT
Received: from [10.218.25.146] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 1 Feb
 2024 02:19:55 -0800
Message-ID: <9d895aca-eeb6-4530-bda9-c4832c777c5d@quicinc.com>
Date: Thu, 1 Feb 2024 15:49:52 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V2] i2c: i2c-qcom-geni: Correct I2C TRE sequence
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <vkoul@kernel.org>, <quic_bjorande@quicinc.com>,
        <manivannan.sadhasivam@linaro.org>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>
References: <20240129061003.4085-1-quic_vdadhani@quicinc.com>
 <CAA8EJpr_KXsjTUYha7OVg4HLLJLqMRvJun9DnMkBFvq3R2nk=Q@mail.gmail.com>
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <CAA8EJpr_KXsjTUYha7OVg4HLLJLqMRvJun9DnMkBFvq3R2nk=Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 57YP34WQwBylirESFTnFb50SIszsdLf2
X-Proofpoint-GUID: 57YP34WQwBylirESFTnFb50SIszsdLf2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2402010083



On 1/30/2024 5:19 AM, Dmitry Baryshkov wrote:
> On Mon, 29 Jan 2024 at 08:10, Viken Dadhaniya <quic_vdadhani@quicinc.com> wrote:
>>
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
> 
> It is not clear how this is relevant and/or affected by swapping
> I2C_WRITE and I2C_READ gpi calls.
> 

Submitted V3 with proper commit log.

>>
>> For only write operation or write followed by read operation,
>> existing software sequence is correct.
>>
>> for only read operation, TRE sequence need to be corrected.
>> Hence, we have changed the sequence to submit GO tre before DMA tre.
>>
>> Tested covering i2c read/write transfer on QCM6490 RB3 board.
> 
> Please read Documentation/process/submitting-patches.rst, understand
> it and write a proper commit message.
> 
>>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> Fixes: commit d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> 
> As it was pointed out, this line shows ignorance of the mentioned file
> and of the existing community practices.
> 

Updated fixes tag in V3.

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
>>                  peripheral.addr = msgs[i].addr;
>>
>> +               ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>> +                                   &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
>> +               if (ret)
>> +                       goto err;
>> +
>>                  if (msgs[i].flags & I2C_M_RD) {
>>                          ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>>                                              &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
>>                          if (ret)
>>                                  goto err;
>> -               }
>> -
>> -               ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>> -                                   &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
>> -               if (ret)
>> -                       goto err;
>>
>> -               if (msgs[i].flags & I2C_M_RD)
>>                          dma_async_issue_pending(gi2c->rx_c);
>> +               }
>> +
>>                  dma_async_issue_pending(gi2c->tx_c);
>>
>>                  timeout = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>
>>
> 
> 

