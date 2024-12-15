Return-Path: <linux-i2c+bounces-8509-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA4D9F22C5
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Dec 2024 09:59:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1222D188699E
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Dec 2024 08:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF838142E76;
	Sun, 15 Dec 2024 08:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mGawjAhd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBDE653;
	Sun, 15 Dec 2024 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734253176; cv=none; b=tG8OmsKAsjs315SMkt1Vl/EbquZ2yrOSSXaYNFW6PW/yaa/IXXkpzD8DR0qP1NMacjS1wJjPoCr/xGP+maXKvRj7YNd8VJG1BlkLgrlnS2ZxHIPOqRZiRp+ZT46IYsSQoj0y3aXiUO/heXFvl7y/twczryfQ1ORP+HEPCTQggJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734253176; c=relaxed/simple;
	bh=7GgzyM5OdcJiF+QEfCDqge0zixN3wgc3bKfI2xGyU5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G2w5QGNdEqGhak8gYhD1Upj/jqxhG6o95KnsZ4inJmxzFfjRoh3XfjxRWJcTT7PmvyfUYOfaRfm3QmlwLYION1v0ikMjPF0kTL/joWelvz97IapTHJd/CS7kTTGWtDC3EKlwLpWUw+Ejt8RWSOfJIBJOQrSMd1i9fJNhF0Zn8Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mGawjAhd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BF7kVPi000940;
	Sun, 15 Dec 2024 08:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ouV8znYULb8R/3Q0Rn7X1YIf78a/Lq3bNDZTe6KpcKw=; b=mGawjAhdNMWS3m89
	ceUTcJR4ImUGGvRUD+Wmgultl0arGTCmeh7zQ4Ly39IgJ8ItwscqpOm0wD/hTp29
	wTo2YLelkfpQ6br5HHInma/Wmx4rBOf4lbUxEDvqQ1g++sQ/Z4yQkF55NsqKhLwx
	7viXIF1C2EfY2l8fNCrfWnxuj9uWjMtPfeeh9bTl+cfNMzPWAteh3nEAk+GuwK4D
	Jv2yb2rzDqyqEdJS2t5tQFBpMI14eNCFlM6kkEWAuUn2ORo502TpR7dCqs5m9HjV
	KlWMb/pA7D8LHnfgoUYNbx8RJvOGOKWykoKG/jZffDzlnZxzQqk/1oIolZCeMhxo
	q0GzNQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43h33u1nvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Dec 2024 08:59:25 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BF8xOUf007968
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Dec 2024 08:59:24 GMT
Received: from [10.216.61.10] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 15 Dec
 2024 00:59:16 -0800
Message-ID: <57815272-bc07-4c5e-8ae6-8bf8eaaca78f@quicinc.com>
Date: Sun, 15 Dec 2024 14:29:12 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing
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
References: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
 <20241129144357.2008465-5-quic_msavaliy@quicinc.com>
 <ce9f1ab1-56a0-4c0a-aa5b-f044111288ec@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <ce9f1ab1-56a0-4c0a-aa5b-f044111288ec@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: spVYEHlCci4OEMyZh8VKGd6Hre3GM1M7
X-Proofpoint-GUID: spVYEHlCci4OEMyZh8VKGd6Hre3GM1M7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412150075

Hi Konrad,

On 12/13/2024 6:35 PM, Konrad Dybcio wrote:
> On 29.11.2024 3:43 PM, Mukesh Kumar Savaliya wrote:
>> Add support to share I2C controller in multiprocessor system in a mutually
>> exclusive way. Use "qcom,shared-se" flag in a particular i2c instance node
>> if the usecase requires i2c controller to be shared.
>>
>> Sharing of I2C SE(Serial engine) is possible only for GSI mode as client
>> from each processor can queue transfers over its own GPII Channel. For
>> non GSI mode, we should force disable this feature even if set by user
>> from DT by mistake.
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
>>   drivers/i2c/busses/i2c-qcom-geni.c | 22 +++++++++++++++++++---
>>   1 file changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 7a22e1f46e60..ccf9933e2dad 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -1,5 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
>> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>   
>>   #include <linux/acpi.h>
>>   #include <linux/clk.h>
>> @@ -617,6 +618,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>   	peripheral.clk_div = itr->clk_div;
>>   	peripheral.set_config = 1;
>>   	peripheral.multi_msg = false;
>> +	peripheral.shared_se = gi2c->se.shared_geni_se;
>>   
>>   	for (i = 0; i < num; i++) {
>>   		gi2c->cur = &msgs[i];
>> @@ -627,6 +629,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>   		if (i < num - 1)
>>   			peripheral.stretch = 1;
>>   
>> +		peripheral.first_msg = (i == 0);
>> +		peripheral.last_msg = (i == num - 1);
>>   		peripheral.addr = msgs[i].addr;
>>   
>>   		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>> @@ -815,6 +819,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   		gi2c->clk_freq_out = KHZ(100);
>>   	}
>>   
>> +	if (of_property_read_bool(pdev->dev.of_node, "qcom,shared-se")) {
>> +		gi2c->se.shared_geni_se = true;
>> +		dev_dbg(&pdev->dev, "I2C is shared between subsystems\n");
>> +	}
>> +
>>   	if (has_acpi_companion(dev))
>>   		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
>>   
>> @@ -887,8 +896,10 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   	else
>>   		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
>>   
>> -	if (fifo_disable) {
>> -		/* FIFO is disabled, so we can only use GPI DMA */
>> +	if (fifo_disable || gi2c->se.shared_geni_se) {
>> +		/* FIFO is disabled, so we can only use GPI DMA.
>> +		 * SE can be shared in GSI mode between subsystems, each SS owns a GPII.
>> +		 **/
> 
> I don't think this change makes things clearer, I would drop it
Shall i revert back to previous change ? What's your suggestion ?
> 
>>   		gi2c->gpi_mode = true;
>>   		ret = setup_gpi_dma(gi2c);
>>   		if (ret) {
>> @@ -900,6 +911,12 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
>>   	} else {
>>   		gi2c->gpi_mode = false;
>> +
>> +		if (gi2c->se.shared_geni_se) {
>> +			dev_err(dev, "I2C sharing is not supported in non GSI mode\n");
>> +			return -EINVAL;
> 
> return dev_err_probe(dev, -EINVAL, "I2C...)
Yes, will incorporate this change in next patch. dt-binding change i am 
seeking something good writeup, then will upload V6. Thanks Konrad !
> 
> Konrad


