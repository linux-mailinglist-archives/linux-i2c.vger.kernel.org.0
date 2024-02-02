Return-Path: <linux-i2c+bounces-1614-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 042FE846E28
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Feb 2024 11:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CF491C25B73
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Feb 2024 10:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2ADF13BEA7;
	Fri,  2 Feb 2024 10:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HEd8nRDl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CF813D508;
	Fri,  2 Feb 2024 10:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706870600; cv=none; b=E+RgF9q0bealRcQJmt65srMdH89E891fGBPX+0cyklaBQlZyyTli3qAYdYVgPmboBIp/nSZR9rRYlefL8ivVqHCSfrDYihY964/rTglYpC82SPvAonuA3D0DbCje5p49kX+Qm2taBX8BW7LI4QVu0NsN3G/1QI+3g58wU0fvqqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706870600; c=relaxed/simple;
	bh=SmvyNI8V8SRPPIBI9d2Z5GeFHvqDc4/qCw2OJw6A41A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MikUN3BkI06a2Qy/JxpkaXY0FnWu8UbeNQL5IWbz5LpFMVf1og/dXmE32wqKXhH/HHKaUgoBZyB9KiExE/UvpScZT5nr09alKTrTwR4v1NSMWLpCbiYqYIzXwV672QG2ZJDtrtKBUoSE9iyjyykGI2t98qKUuIyeUb0Zg9YTW2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HEd8nRDl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4127OSoi012151;
	Fri, 2 Feb 2024 10:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=/bFRhgcsa6swu4QEu0V5icLUy7y+bHlwEkZkKhWnGDQ=; b=HE
	d8nRDl9venLpdy69Cz3xvcdaSlQAbDv1q0VPJnZ2oEB+43sr81mANHcrciSdkW5b
	IDYejUeUl+QepjlB+kXEKpyPS/nXDgqJt7mdu3V7QlPsL39QD7EYu71P4Nx7P3/i
	HevRMwn8grwAjQaNJnS21ZBOGdYlKHMhjYxcrS8uibMvN5DGoV3QBDYjKRDtoE8m
	xfhi7SbSBWYwC8qIQTqQPe9Wa8CaP7g+JppDfNCxP7jhgcPxv7b2k503doYEFyQ6
	M/yxjkHXCNwt4odattFPa3s/MY+Kyh9jkte9jHCj0tMsqt7npIUYEE00t0E6EQOT
	ucw/V4zJ6v5ptLZAWDxw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w0pwc14n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 10:43:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 412AhD1o007580
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Feb 2024 10:43:13 GMT
Received: from [10.216.22.4] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 2 Feb
 2024 02:43:09 -0800
Message-ID: <60b5e755-352b-476d-8c6e-2170594ae80d@quicinc.com>
Date: Fri, 2 Feb 2024 16:13:06 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V3] i2c: i2c-qcom-geni: Correct I2C TRE sequence
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <vkoul@kernel.org>, <quic_bjorande@quicinc.com>,
        <manivannan.sadhasivam@linaro.org>, <bryan.odonoghue@linaro.org>,
        <quic_msavaliy@quicinc.com>, <quic_vtanuku@quicinc.com>
References: <20240201101323.13676-1-quic_vdadhani@quicinc.com>
 <CAA8EJpqQtHDRK2pex+5F-fMRTosJuFCx59e89MWhnie1O3dHKA@mail.gmail.com>
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <CAA8EJpqQtHDRK2pex+5F-fMRTosJuFCx59e89MWhnie1O3dHKA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nPIsaKzv9CiCTO9j9lSyRU9i9KPsLtxm
X-Proofpoint-ORIG-GUID: nPIsaKzv9CiCTO9j9lSyRU9i9KPsLtxm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_04,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402020078


On 2/1/2024 5:24 PM, Dmitry Baryshkov wrote:
> On Thu, 1 Feb 2024 at 12:13, Viken Dadhaniya <quic_vdadhani@quicinc.com> wrote:
>>
>> For i2c read operation in GSI mode, we are getting timeout
>> due to malformed TRE basically incorrect TRE sequence
>> in gpi(drivers/dma/qcom/gpi.c) driver.
>>
>> TRE stands for Transfer Ring Element - which is basically an element with
>> size of 4 words. It contains all information like slave address,
>> clk divider, dma address value data size etc).
>>
>> Mainly we have 3 TREs(Config, GO and DMA tre).
>> - CONFIG TRE : consists of internal register configuration which is
>>                 required before start of the transfer.
>> - DMA TRE :    contains DDR/Memory address, called as DMA descriptor.
>> - GO TRE :     contains Transfer directions, slave ID, Delay flags, Length
>>                 of the transfer.
>>
>> Driver calls GPI driver API to config each TRE depending on the protocol.
>> If we see GPI driver, for RX operation we are configuring DMA tre and
>> for TX operation we are configuring GO tre.
>>
>> For read operation tre sequence will be as below which is not aligned
>> to hardware programming guide.
>>
>> - CONFIG tre
>> - DMA tre
>> - GO tre
>>
>> As per Qualcomm's internal Hardware Programming Guide, we should configure
>> TREs in below sequence for any RX only transfer.
>>
>> - CONFIG tre
>> - GO tre
>> - DMA tre
>>
>> In summary, for RX only transfers, we are reordering DMA and GO TREs.
>> Tested covering i2c read/write transfer on QCM6490 RB3 board.
> 
> This hasn't improved. You must describe what is the connection between
> TRE types and the geni_i2c_gpi calls.
> It is not obvious until somebody looks into the GPI DMA driver.
> 
> Another point, for some reason you are still using just the patch
> version in email subject. Please fix your setup so that the email
> subject also includes the `[PATCH` part in the subject, which is there
> by default.
> Hint: git format-patch -1 -v4 will do that for you without a need to
> correct anything afterwards.
> 

At high level, let me explain the I2C to GPI driver flow in general.

I2C driver calls GPI driver exposed functions which will prepare all the 
TREs as per programming guide and
queues to the GPI DMA engine for execution. Upon completion of the 
Transfer, GPI DMA engine will generate an
interrupt which will be handled inside the GPIO driver. Then GPI driver 
will call DMA framework registered callback by i2c.
Upon receiving this callback, i2c driver marks the transfer completion.

>>
>> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> 
> I think you got some review tags for v2, didn't you? They should have
> been included here, otherwise the efforts spent by the reviewer are
> lost.
> 

Sorry, missed to add reviewed-by tag.
Andi will help to update.

>> ---
>> v2 -> v3:
>> - Update commit log to explain change in simple way.
>> - Correct fix tag format.
>>
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

