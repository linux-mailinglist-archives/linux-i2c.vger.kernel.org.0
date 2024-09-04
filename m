Return-Path: <linux-i2c+bounces-6204-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF75896C607
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 20:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9991E1F23BD6
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 18:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02F61E2028;
	Wed,  4 Sep 2024 18:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OoXyTEHi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416291E2010;
	Wed,  4 Sep 2024 18:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725473347; cv=none; b=fiwFhIHVK3CL09dKPLe8Pmajj3zehlqdsFeElAExnFU/XeKurvMJsXrNJtOU30hImNhgNAoDV0zTWKPN290TzezuBbOROOAjifi6znx3mslaO8WOzl2g2WvM9j7/FogfMlDXbt3xCZjNd73+JxTMX9sI4aVAHoWPRSQsoJVEr5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725473347; c=relaxed/simple;
	bh=oSitCQr8AXhYorVU/L0nNes7NsTQ1eOBeefpxY64K1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TIXQe6OsqSApPazzfChHLEiz87wCXd+XltTUIDjPaUdDSwsr4rbx35s19Pv7TsfHIvCerEoR5Zy6TFZAO605niWv5uDxvIRTWyD9ima/Sz1UZm4WHkuwwdAuu/tbuvkWH0L37hnddVFiq7LtqxNrXKFaAfz9oVi/y/k+fLnpv1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OoXyTEHi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484E3KLN019864;
	Wed, 4 Sep 2024 18:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TVc5y3Eh4NEh02Rn+HQxIRxAzU99UVhFHomnyAEneIM=; b=OoXyTEHiPcNs6/JN
	earocHUxdvKhDIPaKHSSACPqEuYlMx0Nzyt7XEejNR7Bho/TJytKjhLE1hHQ2q+I
	PHCUCu4rmD8IIsWr0YfAiDURqV7pFAWzLyXJrvSuGth3CEdcVvTcrrFl6sh8ON9t
	+SQ152elvHlO6MSntujUb6UDvl4B3WHK55JrNA3ayn7zwZ7sEmUfgslfuQQa/uzO
	pG4SqCDVwlrhBtHDv3By3fIQy0JgsUrMVrk1crSLWFVuMyY8v9gXlK5d2xried50
	g6QI+X1nJTD2614OUjAxjahnACgYa+veCDLj3mizj6Immb5+8h4O39V0GyYLCq9E
	y17nOA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41egmrt49s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 18:09:02 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484I92TB013134
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 18:09:02 GMT
Received: from [10.216.2.237] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 11:08:58 -0700
Message-ID: <7130e38e-0c9f-4d34-b427-f652619e53fa@quicinc.com>
Date: Wed, 4 Sep 2024 23:38:46 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] Enable shared SE support over I2C
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
CC: <quic_vdadhani@quicinc.com>
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
 <c3ee4cd4-a4a6-421c-9114-fba5ecc365da@linaro.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <c3ee4cd4-a4a6-421c-9114-fba5ecc365da@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: H9BMyFXyZCebJO3mkWxiYeZj7noL16It
X-Proofpoint-GUID: H9BMyFXyZCebJO3mkWxiYeZj7noL16It
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_15,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 clxscore=1011 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=667 spamscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040136



On 8/29/2024 3:40 PM, Bryan O'Donoghue wrote:
> On 29/08/2024 10:24, Mukesh Kumar Savaliya wrote:
>> This Series adds support to share QUP based I2C SE between subsystems.
>> Each subsystem should have its own GPII which interacts between SE and
>> GSI DMA HW engine.
>>
>> Subsystem must acquire Lock over the SE on GPII channel so that it
>> gets uninterrupted control till it unlocks the SE. It also makes sure
>> the commonly shared TLMM GPIOs are not touched which can impact other
>> subsystem or cause any interruption. Generally, GPIOs are being
>> unconfigured during suspend time.
>>
>> GSI DMA engine is capable to perform requested transfer operations
>> from any of the SE in a seamless way and its transparent to the
>> subsystems. Make sure to enable “qcom,shared-se” flag only while
>> enabling this feature. I2C client should add in its respective parent
>> node.
>>
>> ---
>> Mukesh Kumar Savaliya (4):
>>    dt-bindindgs: i2c: qcom,i2c-geni: Document shared flag
>>    dma: gpi: Add Lock and Unlock TRE support to access SE exclusively
>>    soc: qcom: geni-se: Export function geni_se_clks_off()
>>    i2c: i2c-qcom-geni: Enable i2c controller sharing between two
>>      subsystems
>>
>>   .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |  4 ++
>>   drivers/dma/qcom/gpi.c                        | 37 ++++++++++++++++++-
>>   drivers/i2c/busses/i2c-qcom-geni.c            | 29 +++++++++++----
>>   drivers/soc/qcom/qcom-geni-se.c               |  4 +-
>>   include/linux/dma/qcom-gpi-dma.h              |  6 +++
>>   include/linux/soc/qcom/geni-se.h              |  3 ++
>>   6 files changed, 74 insertions(+), 9 deletions(-)
>>
> 
> In the cover letter please give an example of Serial Engine sharing.
> 
Sure Bryan, Noted. In next patch will update in cover letter.
> 
> 

