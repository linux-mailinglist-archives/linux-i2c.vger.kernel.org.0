Return-Path: <linux-i2c+bounces-1615-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8AE846E2C
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Feb 2024 11:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 340CD1C25B70
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Feb 2024 10:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61E613BE92;
	Fri,  2 Feb 2024 10:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="carNmVjG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C1C2E851;
	Fri,  2 Feb 2024 10:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706870691; cv=none; b=kphuL0jx0FbXbV0mCRssneWGGFfAeeNQ5k4G8bmFUXnjLF06w/2ZYiBGTbvxEMF4R+P8vX0iH+udOz9jDkHTEG7fL+I8C8sczdLnfUsXtyOeBH6dLM2ESEndqHsEcDSMWDX8i8jlS7GWYO78YsgT0HEcVuGq2HPaYjjPcUZ9RGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706870691; c=relaxed/simple;
	bh=GHnwCHwJQbMRAPZ29WpLtl5i6EFmMObvZ9Us3Ngztxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iiHmAI/Z6pKI2VidH3k+yzWbIzPAmcRybzj0pollrqPPO2b8wYO234o1M7PMZTmXWACcm2Nmk997qlnpIzYDc/v9/Gq769fYZWTZQrMYL3KSc4lABU5ayCfR0lUbOEiobUb61neirRxEkv3U9Isk8SHKpS3BH6z/8W9XPLfDWpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=carNmVjG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4127UFDG021846;
	Fri, 2 Feb 2024 10:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=yLwbVAKqMou6+Mz6mKl7Cjfqk5tcCVRsLZSJ+MzzKIQ=; b=ca
	rNmVjGcbAS5kkB6QHcxG3CdPRnUJUcDRMhpZ7O4TrAIJBVvvPH5y/dCl8TFAgcTn
	VUubDAU71tHpNJ2xBlcwjJkxEswWhMGToIX/gZNw/2CuhNRD+Wxqlqog3sV+vJK9
	7dh60mur8xw5bZWsuGLcz3jNCT+nbP2gLUD4Gk9ZB6t0LaIsaJ5BN/Py/LWB+LqE
	qe6bwkoO/3RuA3PySTP5hDbTaGjS/FUWCdxkgRdl+WLqJ9fZiwgMqavQMZGvdDpg
	p+W7hlsSXFP5GZxTESBRZIeT3j4Ahmq5gYBd/cYGSBWP4mFC+S0aatgcqimHa3Jg
	gjr6BcYTnbYPGhekDzig==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w0pwjh4dn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 10:44:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 412AicLV001826
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Feb 2024 10:44:38 GMT
Received: from [10.216.22.4] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 2 Feb
 2024 02:44:34 -0800
Message-ID: <70e7b48c-4bec-460c-8b48-f022b1728e63@quicinc.com>
Date: Fri, 2 Feb 2024 16:14:34 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V3] i2c: i2c-qcom-geni: Correct I2C TRE sequence
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <vkoul@kernel.org>,
        <quic_bjorande@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
        <bryan.odonoghue@linaro.org>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240201101323.13676-1-quic_vdadhani@quicinc.com>
 <dt2uwtff5yacr7ci7xbezbe7bpwxsvspimceat7cozhzgazszx@6cjp5r7abfqd>
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <dt2uwtff5yacr7ci7xbezbe7bpwxsvspimceat7cozhzgazszx@6cjp5r7abfqd>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fNpm7OFmVr4QU3Jtkg5NYWajfURvK5he
X-Proofpoint-ORIG-GUID: fNpm7OFmVr4QU3Jtkg5NYWajfURvK5he
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_04,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402020078

Hi Andi,

Thanks for review and taking care of patch.
We have responded to dmitry to describe more about GPI operation and 
tried to explain flow in general.
We shall keep updating over email for commit log.

Please help amend below tags in commit log since we are taking it over 
email:

Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # qrb5165-rb5
Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>

On 2/1/2024 7:52 PM, Andi Shyti wrote:
> Hi Viken,
> 
> On Thu, Feb 01, 2024 at 03:43:23PM +0530, Viken Dadhaniya wrote:
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
>>
>> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> 
> as Dmitry has written, please, next time don't forget the tags:
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # qrb5165-rb5
> 
> You can also add mine:
> 
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> 
> Please make sure to Cc Dmitry who is raising his concerns and
> check on his comments.
> 
> Andi
> 
> PS just as a reminder, if Dmitry's concerns remain related only
> to the commit log, I gave you the option to agree with him in the
> e-mail thread without necessarily sending a v4. I can then update
> the commit log before pushing.




