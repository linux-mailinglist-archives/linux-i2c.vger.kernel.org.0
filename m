Return-Path: <linux-i2c+bounces-7959-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2AF9C7848
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 17:08:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E072A288C8B
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 16:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2C51632FD;
	Wed, 13 Nov 2024 16:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q0+XOo6n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17EE152165;
	Wed, 13 Nov 2024 16:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731514106; cv=none; b=puNP2J/Tqh2MzZ6nZdDzGNO/upPUOJNE36kYJi0FmoyxF4dyX2aW8ZW1kzZWvS4aHP/q512Oag2embrV2kWDmTZJWMa0+06wj+5NRJCBuusAccL9jRBpYb1oZB7pJVxVyhrjJ2nhonw/FT8wqr7C7b7VpG/PPXUvqY1v7ubRrMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731514106; c=relaxed/simple;
	bh=bWYPimN598Zrwat1kBddywhI2S7DJ6VVq4je5W63JZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jdPy8lXaeIuVt2W/t54RVjYoPQGyicGDGYRPvmu+AYNceIRk0P26nmgpQ9BdBcURmOPYWylI2BkZTj8URUQFkezjprADRjxYTz6wamlpMTnGUhLZrB1dricJ7GE6LSnBp0PX5nsywooBu8BYO6H3rMvwHhtnV1WsgnLKjirIVGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q0+XOo6n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD7usBa030530;
	Wed, 13 Nov 2024 16:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EHGqHKqZT0bXXatCYDRe1b8iBxMXvF04sizys8qPeMQ=; b=Q0+XOo6n/tCSIATJ
	XX9ie1evJODi+V9rrOJSiPU1r8BkUFP2hWUk+7CsS793dcfb/kOTAcnOs8Z8MuPe
	Ts2KEouB/sOw5QBvZoc5t/9Efl133AhDrGK90hnDLpoGRY2FntEO9zsVDzYRtDOd
	5SAmJVQMynmLS7m5nw/XjCcnve33Sr8HuYxKDAqqZ70qEjlX4hfLRlObwV55CB/1
	7uc+FNFVREN7v5l4KnsdEBhT88ZLLvnUUgHsgX0BVLN70mYbOA9+dyQH9GKpN2fB
	Y95LI+66b7ySDinBQ6fRKszGGNGNRXvu/wY4i7Q67dwaMdFIWnEpfX1tigIPwn7x
	SlLK1g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vr5y18ex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:08:17 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ADG8Gcc032173
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:08:16 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 08:08:11 -0800
Message-ID: <59203b6d-84f4-4068-bc57-f8ea53371309@quicinc.com>
Date: Wed, 13 Nov 2024 21:38:08 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing
 between two subsystems
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <conor+dt@kernel.org>, <agross@kernel.org>,
        <devicetree@vger.kernel.org>, <vkoul@kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>
References: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
 <20240927063108.2773304-5-quic_msavaliy@quicinc.com>
 <6a060f86-82af-4d39-9ab8-a377650e6bf3@linaro.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <6a060f86-82af-4d39-9ab8-a377650e6bf3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tISI20Gk6qLwDeuBYl_kP3A012SpBfED
X-Proofpoint-GUID: tISI20Gk6qLwDeuBYl_kP3A012SpBfED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130135

Thanks Bryan for sharing your comments.

On 10/15/2024 3:06 AM, Bryan O'Donoghue wrote:
> On 27/09/2024 07:31, Mukesh Kumar Savaliya wrote:
>> Add support to share I2C SE by two Subsystems in a mutually exclusive 
>> way.
> 
> As I read this the question jumps out "what is a subsystem" - in Linux 
> speak subsystem is say a bus or a memory management method but, here 
> what you really mean if I've understood the intent of this series is to 
> share the serial engine between two different bus-masters or perhaps a 
> better description is "system agent".
> 
> Please make that delination clear - its not two Linux subsystems but two 
> different Qcom SoC bus masters right ?
> 
It's like between two processor systems.
> For example the APSS - Application Specific Sub Subsystem - where Linux 
> runs and say cDSP - the compute DSP on qcom SoCs.
> 
Yes
> I'd rename this patch to make that clear - because "between two 
> subsystems" if you aren't intimately versed in qcom's architecture 
> suggests that a Linux i2c and spi driver are somehow muxing pins ..
> 
> Really this is a type of AMP - asymmetric multi processing.
> 
> "i2c: i2c-qcom-geni: Enable i2c controller sharing between two different 
> bus masters"
> 
I think bus masters can be within same APPS system too. hence
> And I'd mention in the commit log specific examples - APSS yes we get 
> but what is the other system agent in your use-case ?
> 
> A DSP ? Some other processor in the SoC ?
yes, It's DSP processor here. But can be Low power DSP OR Modem DSP.
> 
> Anyway highlight one use-case for this AMP case, please.
I have added below in cover letter. I should add example in this patch also.
Example :
Two clients from different SS can share an I2C SE for same slave device
OR their owned slave devices.
Assume I2C Slave EEPROM device connected with I2C controller.
Each client from ADSP SS and APPS Linux SS can perform i2c transactions.
This gets serialized by lock TRE + Transfers + Unlock TRE at HW level.
> 
> ---
> bod
> 
> 
> 
> 

