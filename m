Return-Path: <linux-i2c+bounces-8389-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4D99EA763
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 05:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD879288217
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 04:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362C22248BF;
	Tue, 10 Dec 2024 04:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WUJzmAU0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6959879FD;
	Tue, 10 Dec 2024 04:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733806418; cv=none; b=M0OR9Y0c30zCKp6MpioF6rpGw42Z+x0OwTalcLc2WNnRJwm/sDem0i59xPW63lKL59WeNfkfFA5HSumfdo/yC5QSSd3+aWEHALF69MslHCxkILbISwmIYfTV8tIqcP2WbXXOKN6cC8285d/pLYAeMlW+M0dSmHZYQ3+BtCWltFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733806418; c=relaxed/simple;
	bh=yObqmvU/ePoI/kcsHHyIJJwiKdftff54MGHme9E36h0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BZThAeameoGEu0KTiqlWLI8aM9kpkYaGnMAHCFJ76k1gCHHgmOIa7wU6qyZlM45LL3/vQfU9ANNleV9wvPgUbepcmCfJ5epuxd0YthrmrO9noYGc33lp6ZSMaQ6OKpWp66/ne3tTv/sEeXx/poZLvVsDX/xd5yK6Qvglmqypz3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WUJzmAU0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA4433J019385;
	Tue, 10 Dec 2024 04:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5cYVtnmOPz8NGcZrOv9w2kjepmKPZDl1iP5pQsdE6iw=; b=WUJzmAU0jmiDy194
	x+GBjs3ab8bssVGvul5FKI2OYcKvGT2SkLi+1BnTZGaTjJ1rqPLh004EsGmKgHae
	Ax9PN4RFeZlB5hMN/zxKQjGWn/AOOKdqWwIcrzTfDYKMArcP8mV8rK+ydCaN6qFX
	Fbuop1WXMMuPkgbILy7IppCAOvQsuJxr+bjskOK4lOWblNiyq4TTsB5rMIUON/yM
	ReWbJg2S2W3wdcJ2CnmkDibPQxjHKbAiyxcFXJQ4MLYYLrgkK+SjbAfWt0kEUO11
	YZBb9tab4sc45gdt3mG7aMeLqUoiiU5tq5cUZjPms/iKO853wf6/l6mTqVt0KKl5
	WKyPEg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e3419uk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 04:53:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA4rTcX019755
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 04:53:30 GMT
Received: from [10.216.2.81] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 20:53:23 -0800
Message-ID: <e8376868-76bd-4b33-9a94-fe1f0d770319@quicinc.com>
Date: Tue, 10 Dec 2024 10:23:20 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/7] soc: qcom: geni-se:: Add support to load QUP SE
 Firmware via Linux subsystem
To: <neil.armstrong@linaro.org>, <andi.shyti@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
        <broonie@kernel.or>, <andersson@kernel.org>, <konradybcio@kernel.org>,
        <johan+linaro@kernel.org>, <dianders@chromium.org>,
        <agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>
CC: <quic_anupkulk@quicinc.com>,
        Mukesh Kumar Savaliya
	<quic_msavaliy@quicinc.com>
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
 <20241204150326.1470749-5-quic_vdadhani@quicinc.com>
 <c19e36cf-b041-4eaa-bbc2-007b30460963@linaro.org>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <c19e36cf-b041-4eaa-bbc2-007b30460963@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 33TUCyG5knqt0FfQWrtC4HG2DZoXG4YR
X-Proofpoint-ORIG-GUID: 33TUCyG5knqt0FfQWrtC4HG2DZoXG4YR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100034



On 12/4/2024 8:54 PM, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 04/12/2024 16:03, Viken Dadhaniya wrote:
>> Load the firmware to QUP SE based on the "qcom,load-firmware" property
>> specified in devicetree. Populate Serial engine and base address details
>> in the probe function of the protocol driver and pass to firmware load
>> routine.
>>
>> Skip the firmware loading if the firmware is already loaded in Serial
>> Engine's firmware memory area.
>>
>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> ---
>>   drivers/soc/qcom/qcom-geni-se.c      | 445 +++++++++++++++++++++++++++
>>   include/linux/soc/qcom/geni-se.h     |  17 +
>>   include/linux/soc/qcom/qup-fw-load.h | 179 +++++++++++
>>   3 files changed, 641 insertions(+)
>>   create mode 100644 include/linux/soc/qcom/qup-fw-load.h
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c 
>> b/drivers/soc/qcom/qcom-geni-se.c
>> index 4cb959106efa..423102fac3fc 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -1,5 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
>> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>>   /* Disable MMIO tracing to prevent excessive logging of unwanted 
>> MMIO traces */
>>   #define __DISABLE_TRACE_MMIO__
>> @@ -15,6 +16,7 @@
>>   #include <linux/pinctrl/consumer.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/soc/qcom/geni-se.h>
>> +#include <linux/soc/qcom/qup-fw-load.h>
>>   /**
>>    * DOC: Overview
>> @@ -97,6 +99,9 @@ struct geni_wrapper {
>>       unsigned int num_clks;
>>   };
>> +/* elf file should be at /lib/firmware/ */
>> +#define QUP_FW_ELF_FILE    "qupv3fw.elf"
> 
> I supposed the qupv3fw.elf is SoC specific, so it should use 
> /lib/firmware/qcom
> base path and also a SoC/platform specific path that should be specified
> with firmware-name in DT.
> 
> With this property, "qcom,load-firmware" could be dropped.
> 

Agree, will update in next patch.

>> +
>>   /**
>>    * struct geni_se_desc - Data structure to represent the QUP Wrapper 
>> resources
>>    * @clks:        Name of the primary & optional secondary AHB clocks
>> @@ -110,6 +115,9 @@ struct geni_se_desc {
>>   static const char * const icc_path_names[] = {"qup-core", "qup-config",
>>                           "qup-memory"};
>> +static const char * const protocol_name[] = { "None", "SPI", "UART",
>> +                          "I2C", "I3C", "SPI SLAVE"};
>> +
>>   #define QUP_HW_VER_REG            0x4
> <snip>
> 

