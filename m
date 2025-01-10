Return-Path: <linux-i2c+bounces-9018-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C4EA088AA
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jan 2025 07:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A88EF3A89B7
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jan 2025 06:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8ABE20764C;
	Fri, 10 Jan 2025 06:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="liutDd3P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11B92066D4;
	Fri, 10 Jan 2025 06:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736492194; cv=none; b=P+EyskO+7odLPrfOf7cdGBUbCXmYlmwctnEpZKsUKTtQKtBxKO0zyPRmZO+f79tk0zg8FjsndjnpGBql8/iT0G2L3sxVquChrFaB0wroSXOU+VWZx1Y3VOY+MX8Mr5r+J0LFgHPV4IK5Jxr7MNLA4po/tqw9kHe8PBmVAB+umbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736492194; c=relaxed/simple;
	bh=y1iLq6uFyAoWsUCQXZ1Fh3RHmgz/QPhSg+d0SKTY0m4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QW4TqTm3DdFfdmF90aKGl6e81yLkNUa6VZQq1Rs/unmtlmTMyO3s9d58OMnD7+T/xaW8ZlHm9BAfh0fassU0Cm/KXRO+Jr+2cqD0iaHFCEzF3QAG+ntvXDQnhXJjYc09zvIeh5iwR3KYqopBnBXEgIUGhJYIYlffMJgX+cP2+Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=liutDd3P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A3vbKO016268;
	Fri, 10 Jan 2025 06:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uqyHJVcLV0oHsBGN4ljVWxNiqdKoRDx6AXgDASkumaA=; b=liutDd3PzyLFpjRf
	cYSBXwWvsix0ieyDaXRX0e6+2o+Q9ld7wcdj1DMLjvQLumo72i6d2b3ZvbxOfQI4
	sn29HOF+zNCYXblZo44eCkTrqZ7tc+dOH/Ldv3ArchSXx1PFNuW/kvkFuCAqjNIi
	AEvI5KDT6tRdpuy2Bbcy0Bio9R5NgTkPky02HS8DmiCyPmvk+S7IKaVtpO2tAtAi
	RrbDEKXDJDjduQIv3ZOFQDXNvM6Gl81PR7mhxUrcKccWTp5EEXaQ9X3fIYPequ8u
	dgmtbIXn9GdHozI69KqFyLP9yIsVx0TGEVg0ocxwnpLLBW7FXDjlEl5g7I4BvaJz
	SVFFZQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442v3rgbrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 06:56:28 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50A6uR9v019457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 06:56:27 GMT
Received: from [10.216.39.150] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 22:56:19 -0800
Message-ID: <17138798-b72b-4e78-8fad-419e1a63fa5b@quicinc.com>
Date: Fri, 10 Jan 2025 12:26:16 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/7] Add support to load QUP SE firmware from
To: Caleb Connolly <caleb.connolly@linaro.org>,
        Viken Dadhaniya
	<quic_vdadhani@quicinc.com>, <andi.shyti@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
        <broonie@kernel.or>, <andersson@kernel.org>, <konradybcio@kernel.org>,
        <johan+linaro@kernel.org>, <dianders@chromium.org>,
        <agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>
CC: <=quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
 <66fb0c6d-472c-4131-bd25-83266cf497e4@linaro.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <66fb0c6d-472c-4131-bd25-83266cf497e4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PhOnlJmPZlTu82dC93IHwQ_4FUIrtZ-W
X-Proofpoint-ORIG-GUID: PhOnlJmPZlTu82dC93IHwQ_4FUIrtZ-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 clxscore=1011 mlxscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100055

Thanks Caleb for your testing and sharing results. Since Viken is on 
leave, i am following on this.

On 1/7/2025 4:55 PM, Caleb Connolly wrote:
> Hi Viken,
> 
> On 04/12/2024 16:03, Viken Dadhaniya wrote:
>> In Qualcomm SoCs, firmware loading for Serial Engines (SE) in the QUP
>> hardware has traditionally been managed by TrustZone (TZ). This setup
>> handled Serial Engines(SE) assignments and access control permissions,
>> ensuring a high level of security but limiting flexibility and
>> accessibility.
>>   
>> This limitation poses a significant challenge for developers who need more
>> flexibility to enable any protocol on any of the SEs within the QUP
>> hardware.
>>   
>> To address this, we are introducing a change that opens the firmware
>> loading mechanism to the Linux environment. This enhancement increases
>> flexibility and allows for more streamlined and efficient management. We
>> can now handle SE assignments and access control permissions directly
>> within Linux, eliminating the dependency on TZ.
>>   
>> We propose an alternative method for firmware loading and SE
>> ownership/transfer mode configuration based on device tree configuration.
>> This method does not rely on other execution environments, making it
>> accessible to all developers.
>>   
>> For SEs used prior to the kernel, their firmware will be loaded by the
>> respective image drivers (e.g., Debug UART, Secure or trusted SE).
>> Additionally, the GSI firmware, which is common to all SEs per QUPV3 core,
>> will not be loaded by Linux driver but TZ only. At the kernel level, only
>> the SE protocol driver should load the respective protocol firmware.
> 
> I gave this series a spin on the RB3 Gen 2 with U-Boot.
> 
Is it possible to try on RB8 board ? Because that's where this support 
is enabled. It also needs respective TZ configuration to allow FW 
loading from Linux.


> After fixing the compilation errors, it seems like there is a consistent
> hard crash (the board freezes and resets) at some point during i2c
> controller init with this series.
> 
Can you please share exact repro steps ? We can try locally and check 
what's wrong and also review in future how we make it working for U-boot 
combination.
> I noticed a similar issue with this same logic implemented in U-Boot.
> 
> Could you clarify which xfer mode is appropriate for the i2c controllers
> on the RB3 Gen 2 and maybe give this a try yourself, or let me know what
> other info you'd need to debug this.
> 
Yes, please share the procedure , we will try internally.
is there any DTSI change done as part of your testing ?
> Thanks and kind regards,
>>
>> Viken Dadhaniya (7):
>>    dt-bindings: i2c: qcom,i2c-geni: Document DT properties for QUP
>>      firmware loading
>>    spi: dt-bindings: Document DT properties for QUP firmware loading
>>    dt-bindings: serial: Document DT properties for QUP firmware loading
>>    soc: qcom: geni-se:: Add support to load QUP SE Firmware via Linux
>>      subsystem
>>    i2c: qcom-geni: Load i2c qup Firmware from linux side
>>    spi: geni-qcom: Load spi qup Firmware from linux side
>>    serial: qcom-geni: Load UART qup Firmware from linux side
>>
>>   .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |  11 +
>>   .../serial/qcom,serial-geni-qcom.yaml         |  12 +
>>   .../bindings/spi/qcom,spi-geni-qcom.yaml      |  11 +
>>   drivers/i2c/busses/i2c-qcom-geni.c            |  11 +-
>>   drivers/soc/qcom/qcom-geni-se.c               | 445 ++++++++++++++++++
>>   drivers/spi/spi-geni-qcom.c                   |   7 +-
>>   drivers/tty/serial/qcom_geni_serial.c         |   7 +-
>>   include/linux/soc/qcom/geni-se.h              |  17 +
>>   include/linux/soc/qcom/qup-fw-load.h          | 179 +++++++
>>   9 files changed, 692 insertions(+), 8 deletions(-)
>>   create mode 100644 include/linux/soc/qcom/qup-fw-load.h
>>
> 


