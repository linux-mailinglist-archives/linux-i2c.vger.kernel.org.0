Return-Path: <linux-i2c+bounces-8117-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7D49D4D2F
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 13:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E55BE281EF2
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 12:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55A51D63D5;
	Thu, 21 Nov 2024 12:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MsKk/+l4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085361CB322;
	Thu, 21 Nov 2024 12:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732193577; cv=none; b=Wz9sEWO2MXsjPFQt68iJsGJVHq2M6SERCA/9d/QMBw4si2gKzY213mJUuOgsDRG6NxIwZx2NA3Zhim4GDukqwlxn9bvuzPcw2f5/defwJ+quDzkkh76JLduvZ/8q/vVDO8/1jG9kXL2RD/F13p1Pot0gQCpmucbFvx5HF0r2h20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732193577; c=relaxed/simple;
	bh=Tm7spxMJ6Zj+nDIeJXwBeAHZQ6kM/5xAP+OpQLzgemg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aPMHs9I9bSXQ/SQq0kz3m1l59Rfcwr2Ru3Phkkjc3wtRoxMgWeaxAhaC3M7HQuDuhhve03oqiCN9suSJR+nDabR0p3Kfc4vrV9q5QPhLYjLqYuWe0pfbhpD40luqklLjwaP9K8LBs4TjBNwNPzeyt0NpY62869pZdePflVcqa8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MsKk/+l4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL7v4AU023179;
	Thu, 21 Nov 2024 12:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IDQZyEdNFTl6ugScjbH51zYYXoRfidT+VjWlo/Wzb8c=; b=MsKk/+l4Ct/bKGZQ
	BAyo5III8MbR72ekMQAnlGzj9/p/4Dhdbo/5z8X23yerPr0/NAOBBDQMGqohi4w7
	Rr85AcoUHaW0+oK/Dshab2DzvfiFWQbPgSZxWLavgqJqbEQQjspCL8J8Cmoqlqmo
	XsqTiCrLgXNM1Wcmvcyw6T1GnbUMKTOwtFNUDzS6SGjEhZK5NAo+l+Z9KTdkASsX
	foQNNUmqZn+bFDfY8Xnv2CPNJnaEL3BQoAlhSwIHfn0Sm+kePKfUKkAli6fmlWEY
	tnvaAWaGeWkMfqX2rioq0sA2NDtwY8ti+Dt6XXsAvrRG0hH2W6JGoasShRY0z5Rr
	taNJRA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4320wk0wp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 12:52:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ALCqlYA008845
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 12:52:47 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 04:52:43 -0800
Message-ID: <775eb18a-b8d5-4503-b9ac-bfa79be115f2@quicinc.com>
Date: Thu, 21 Nov 2024 18:22:40 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND 2/3] i2c: qcom_geni: Update compile dependenices
 for qcom geni
To: Bjorn Andersson <andersson@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        "Sumit
 Semwal" <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>
References: <20241111140244.13474-1-quic_jseerapu@quicinc.com>
 <20241111140244.13474-3-quic_jseerapu@quicinc.com>
 <3fkfjeif3e4z3utcim5dou2obwjoagtr3z2bnwkywa2xlm4jrb@jon6mwtp4ahv>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <3fkfjeif3e4z3utcim5dou2obwjoagtr3z2bnwkywa2xlm4jrb@jon6mwtp4ahv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5JzLxyqB180F_xC2Lu4YmMgymE60ApOx
X-Proofpoint-GUID: 5JzLxyqB180F_xC2Lu4YmMgymE60ApOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=966
 adultscore=0 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210101



On 11/12/2024 9:39 AM, Bjorn Andersson wrote:
> On Mon, Nov 11, 2024 at 07:32:43PM +0530, Jyothi Kumar Seerapu wrote:
>> I2C_QCOM_GENI is having compile dependencies on QCOM_GPI_DMA and
>> so update I2C_QCOM_GENI to depends on QCOM_GPI_DMA.
>>
> 
> Given that this is a separate patch, your wording can only be
> interpreted as this being an existing problem.
> 
>> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
>> ---
>>
>> v1 -> v2:
>> 	This patch is added in v2 to address the kernel test robot
>> 	reported compilation error.
>> 	ERROR: modpost: "gpi_multi_desc_process" [drivers/i2c/busses/i2c-qcom-geni.ko] undefined!
> 
> But as far as I can tell you introduce this problem in patch 3. If so
> this addition should be part of patch 3.

Sure, this change is added part of patch3.
> 
> 
> 
> Also, you have different subject prefix for patch 2 and 3, yet they
> relate to the same driver. Not pretty.
Thanks, corrected it.
> 
> Regards,
> Bjorn
> 
>>
>> drivers/i2c/busses/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>> index 0aa948014008..87634a682855 100644
>> --- a/drivers/i2c/busses/Kconfig
>> +++ b/drivers/i2c/busses/Kconfig
>> @@ -1049,6 +1049,7 @@ config I2C_QCOM_GENI
>>   	tristate "Qualcomm Technologies Inc.'s GENI based I2C controller"
>>   	depends on ARCH_QCOM || COMPILE_TEST
>>   	depends on QCOM_GENI_SE
>> +	depends on QCOM_GPI_DMA
>>   	help
>>   	  This driver supports GENI serial engine based I2C controller in
>>   	  master mode on the Qualcomm Technologies Inc.'s SoCs. If you say
>> -- 
>> 2.17.1
>>
>>

