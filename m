Return-Path: <linux-i2c+bounces-8008-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8789CF4D1
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Nov 2024 20:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA8321F23800
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Nov 2024 19:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F0E1E104E;
	Fri, 15 Nov 2024 19:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HrhQI1IT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887961D5CD4
	for <linux-i2c@vger.kernel.org>; Fri, 15 Nov 2024 19:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731698936; cv=none; b=l4oGVIYEYDJrF0dyILQ1mFtgeiA5k+6+94XTPnVyi4V0QTLC3yASu7qwECgHD2iBszwYLwrGTaxTdkjr/SenWFIgI2AdigAMtlwC7ME2OD9c9FLMyqVEK85FrbChVYqvBj22yOVTyczHnWz1ZutoUuLuXpFQ+YkKAhrKcEJJrHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731698936; c=relaxed/simple;
	bh=60Z6eQAK6arTz7rOBFww9ucWpkpHIWcEIkLq3DISFaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FRoF6lZiFu6rLpVMCyNdAsfNjkcQCov7/CQeaI+RxUYDqpTWWKoPOWDEGZCKwgGr/zpT1h4dyUm0zDDYUobwORO/C4J++ktcpJJ4RJzRjNlIpz+li7aleOsDmrMha2aBUrjLiHlDIHOqzsjRMeXqARh0j3+ueRJxU8DaGFC6njA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HrhQI1IT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFI3MVl017903
	for <linux-i2c@vger.kernel.org>; Fri, 15 Nov 2024 19:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNvszKg9/8s4V9MEKOWqs+69mosPf7tGPtGaCjpPmk4=; b=HrhQI1ITxqDIOMhb
	7ADnbsn6L9eJap8TahwUeStxcJDF8hkB5SraTNvR9kuDIoJ+1FO1gcIKbP82RebJ
	QlyUCDhS+uu0RXjFO2fSg+j38SCXRtrjdahESCoZdq62kNgluFNryC9IfdIRnm8y
	TITvMovTVb7Rf2sUaGY4L1v4qwu+l3UgM2jC4NvCnmzMCWayOHrlnDiSocU77vi7
	VbSQu9NDSY32HNgZaJY7YsINsF+DGZ0tNdn3vNcE5pdQEXdc0v/ePwxc3VmZ1ebH
	ANW4TzfraEYl6lWPJlyom/kuVDzxM9FSZ/oXbIrfFD1LyLNF/KUpbPb09BOSjfWx
	xZS5mw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42wm75v5fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 15 Nov 2024 19:28:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-460958ceccdso2647061cf.1
        for <linux-i2c@vger.kernel.org>; Fri, 15 Nov 2024 11:28:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731698931; x=1732303731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FNvszKg9/8s4V9MEKOWqs+69mosPf7tGPtGaCjpPmk4=;
        b=ZgRuMs/xuaSjbsAst0Z34hNypuEch5Gqb6vbnL8vQrjbcSJ/kP/qivgj9KfWgDwMGq
         OZsD1DGC4mGnloeLEQ6st59y3DRqdiVNvQUrzJYK4K+JOg9VCY5cbptCZtUZ+p6oqYrZ
         rCged2P0pi8BiM1lnyLyshcgP/KizV7LrP8vuaMcIwLTtQHox9LAnhw5ThzY4QBDf2hI
         VgRAe6Wp3fhDcKqVjkY4bw9+ORIiiZp7gPZdIjYXVDimAbIjcf698V0elcdqwjUJlUWo
         shGvT47dbCJ1GBGfPgqPtOg9lFT+6ST5A1Nq4HYcPsYvCT7Zol7mgR46DOkrkWdeidzZ
         Alhg==
X-Forwarded-Encrypted: i=1; AJvYcCW5XdfdAK+eE0x77DDh2QqrjmoddVU1425jM3ZTIzhVPyyNPXBFGFz9Hn5UeBELl8X50UQxf26K+bc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSiSV2aS36cBrajqSDuzU602cTH5Do0s8mmWRdNQdB8WcPBD0J
	S8TYMmzIXz9GBfTrkHPojHdfZJElyOHOZ+hjVgAdySeTA7k8O9pSt5yZAMpQsdxRXsPxe/yOwky
	x6VHFFQW9EcEGeC3ZcDXuOhWjx2mGPXeVl7avd/my8sBVUy6kSiK+IyomH/g=
X-Received: by 2002:ac8:5984:0:b0:460:9669:f01 with SMTP id d75a77b69052e-46363de963bmr23184571cf.2.1731698931548;
        Fri, 15 Nov 2024 11:28:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/4Fp2AJaWIGIPBmMcmEXMPY3/bfBLpK7G5uCiUydNPQ6PeJOcwSsFrZEmstXfXX8TVczzug==
X-Received: by 2002:ac8:5984:0:b0:460:9669:f01 with SMTP id d75a77b69052e-46363de963bmr23184351cf.2.1731698931149;
        Fri, 15 Nov 2024 11:28:51 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf79b9e059sm1823667a12.19.2024.11.15.11.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 11:28:50 -0800 (PST)
Message-ID: <37762281-4903-4b2d-8f44-3cc4d988558d@oss.qualcomm.com>
Date: Fri, 15 Nov 2024 20:28:47 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing
 between two subsystems
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
        Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20241113161413.3821858-1-quic_msavaliy@quicinc.com>
 <20241113161413.3821858-5-quic_msavaliy@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241113161413.3821858-5-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SJechhtdLkTJPbKLe2cniYxfZJom4ofV
X-Proofpoint-ORIG-GUID: SJechhtdLkTJPbKLe2cniYxfZJom4ofV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150163

On 13.11.2024 5:14 PM, Mukesh Kumar Savaliya wrote:
> Add support to share I2C controller in multiprocessor system in a mutually
> exclusive way. Use "qcom,shared-se" flag in a particular i2c instance node
> if the usecase requires i2c controller to be shared.

Can we read back some value from the registers to know whether such sharing
takes place?

> Sharing of I2C SE(Serial engine) is possible only for GSI mode as client
> from each processor can queue transfers over its own GPII Channel. For
> non GSI mode, we should force disable this feature even if set by user
> from DT by mistake.

The DT is to be taken authoritatively

> 
> I2C driver just need to mark first_msg and last_msg flag to help indicate
> GPI driver to take lock and unlock TRE there by protecting from concurrent
> access from other EE or Subsystem.
> 
> gpi_create_i2c_tre() function at gpi.c will take care of adding Lock and
> Unlock TRE for the respective transfer operations.
> 
> Since the GPIOs are also shared between two SS, do not unconfigure them
> during runtime suspend. This will allow other SS to continue to transfer
> the data without any disturbance over the IO lines.
> 
> For example, Assume an I2C EEPROM device connected with an I2C controller.
> Each client from ADSP and APPS processor can perform i2c transactions
> without any disturbance from each other.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---

[...]

>  	} else {
>  		gi2c->gpi_mode = false;
> +
> +		/* Force disable shared SE case for non GSI mode */
> +		gi2c->se.shared_geni_se = false;

Doing this silently sounds rather odd..

Konrad

