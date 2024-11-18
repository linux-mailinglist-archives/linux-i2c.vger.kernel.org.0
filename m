Return-Path: <linux-i2c+bounces-8013-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 420DC9D0909
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 06:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00B4A1F2132A
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 05:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B5D13DBBE;
	Mon, 18 Nov 2024 05:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lI5VZsB2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15B938B;
	Mon, 18 Nov 2024 05:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731908784; cv=none; b=acYtsgd2DOJQilzKXE4+vDyhBycUhI/7aflEPBZIzlXx/tMnbczyX8YG+o3TNET7NnRTcDnnaKChlHzdKnb3z9g8ktnnjsDfcqAEsUl2uxPhjxv03L05rAiKqkJNCdYMmDCpl9kRX7Ydu86q4cWB/e4MIt4grAo62r/f5ayYpxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731908784; c=relaxed/simple;
	bh=LGK6RloDYnRtYa3w8qIbhxM0HOt5cUCWr0RClUSvQfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tEiIKNDYUW6drHwVpBXtc9PlUErFnYz5GAaAD/EDhhiZGS5leZSfglgGtRXHQJXpIW+Kd4F06SjI+pFHZeOD2BrlXr2E2QpW8kXMCvIlY4yeDXGRARWVPTUDzDkA7jjDFBxH5vXJO4VCROgEh5P4RclGBd0Urz/fjTJchyxbKJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lI5VZsB2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5Rkfs029074;
	Mon, 18 Nov 2024 05:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yCJ8dyeGsUZMtMfPIB3o51h+Pk2z2/zF1MkiH1G8ABs=; b=lI5VZsB2mDyRIGOd
	AT9orFTXX9sa7q3d8tG3ji88o1ZCmGKt0hfEtfMSiOWNPs10mDxiWPP/L6Q45iRb
	Mj3KZ0rTuNzVpSKuMs6B5y3E1LXaPw7jHeoohxh4TwcuYM65lnz68/rI/oLxcm4i
	Ji7RXOzvaiOf9ToL+N8GlU3QxeU3A4tHADrbn7d5b74xWkdqLvrc1GMV53PyIdZF
	LE7oQP1+K2ZhZ816Jh2is9q9ISg95LN3VUyKS6N4GOL4KCEfxRSVS0l6fycc2vvf
	rzc6MWluhl/Ui7PWfgqF3v4ecIDNau+cZhSwwHyHwGbxHmteTgrMtgYDTUe7s53l
	Ibmxig==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xmp7bf7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 05:46:14 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI5k2R1006096
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 05:46:02 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 17 Nov
 2024 21:45:57 -0800
Message-ID: <cbbb78c9-54ec-453a-92ec-6b174bd3d9cb@quicinc.com>
Date: Mon, 18 Nov 2024 11:15:54 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing
 between two subsystems
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <conor+dt@kernel.org>, <agross@kernel.org>,
        <devicetree@vger.kernel.org>, <vkoul@kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>
CC: <quic_vdadhani@quicinc.com>
References: <20241113161413.3821858-1-quic_msavaliy@quicinc.com>
 <20241113161413.3821858-5-quic_msavaliy@quicinc.com>
 <37762281-4903-4b2d-8f44-3cc4d988558d@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <37762281-4903-4b2d-8f44-3cc4d988558d@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jArVZabZvxIs2jeGLx4Slp0hGB5L39vj
X-Proofpoint-GUID: jArVZabZvxIs2jeGLx4Slp0hGB5L39vj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180049

Thanks for the review konrad !

On 11/16/2024 12:58 AM, Konrad Dybcio wrote:
> On 13.11.2024 5:14 PM, Mukesh Kumar Savaliya wrote:
>> Add support to share I2C controller in multiprocessor system in a mutually
>> exclusive way. Use "qcom,shared-se" flag in a particular i2c instance node
>> if the usecase requires i2c controller to be shared.
> 
> Can we read back some value from the registers to know whether such sharing
> takes place?
Actually, HW register doesn't provide such mechanism, it's add on 
feature if SE is programmed for GSI mode.
> 
>> Sharing of I2C SE(Serial engine) is possible only for GSI mode as client
>> from each processor can queue transfers over its own GPII Channel. For
>> non GSI mode, we should force disable this feature even if set by user
>> from DT by mistake.
> 
> The DT is to be taken authoritatively
> 
To clarify - Does it mean i should not have SW disable this feature OR 
override  ? And let it continue in non GSI mode even it's not going to 
work ?
>>
>> I2C driver just need to mark first_msg and last_msg flag to help indicate
>> GPI driver to take lock and unlock TRE there by protecting from concurrent
>> access from other EE or Subsystem.
>>
>> gpi_create_i2c_tre() function at gpi.c will take care of adding Lock and
>> Unlock TRE for the respective transfer operations.
>>
>> Since the GPIOs are also shared between two SS, do not unconfigure them
>> during runtime suspend. This will allow other SS to continue to transfer
>> the data without any disturbance over the IO lines.
>>
>> For example, Assume an I2C EEPROM device connected with an I2C controller.
>> Each client from ADSP and APPS processor can perform i2c transactions
>> without any disturbance from each other.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
> 
> [...]
> 
>>   	} else {
>>   		gi2c->gpi_mode = false;
>> +
>> +		/* Force disable shared SE case for non GSI mode */
>> +		gi2c->se.shared_geni_se = false;
> 
> Doing this silently sounds rather odd..
we can have Some SW logging added ?
> 
> Konrad

