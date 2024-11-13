Return-Path: <linux-i2c+bounces-7963-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCD69C7851
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 17:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C2EB1F25835
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 16:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C066615C14B;
	Wed, 13 Nov 2024 16:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K9qPQJFr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9461158D93;
	Wed, 13 Nov 2024 16:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731514220; cv=none; b=H1pKwLyctU86duqCxZQfCPozlrCES88Cz9mP9NHdFFNhBqx0zfCfCAHGWck/oKx6b+s8IPI3ZjLmzTCF8AT7djBHYd/G37nY5zdAzfC4cZSoX2uXIPK0iFuIhGr8sxidUWqSciH+nbSnStoqtncI2DMGm26Z6xCtnEHWN9rzo4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731514220; c=relaxed/simple;
	bh=jLoCiDQTYBWaMd6cKN6Ss9amjAO8T/ZZzIXk8XVzjGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=I0KgK73t5daJrj4hyAuJfwITfl7B6h4Df3CyBWzm61KefoMf8JFQGpNSzvtQrsErFjfP6P0ctbwVWp2fTOKe2DqimjDsEG9VYsV1riSOnbvvxLkTGD3ekdBzR8hJVp++GV2PQcbjC3WWDwrXENjvHqBbxbhxgVfc1CK8fnWA1lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K9qPQJFr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADA3SBj014677;
	Wed, 13 Nov 2024 16:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JeR/2vjwhWwcuzZWlp80DSJn/XNNIGNtt4gW3By2FcA=; b=K9qPQJFrDdhyumJL
	quv4TJtt4lnFTYSGpng2UmAkOXIMS1WjRFs7QB480ARs0+hlPKMStDwbjjgBVO4C
	1sNvFyMrGYZlfYB+LyNqSKrRAzm6wY4s+Fh4xSSVrUmM9W38VXLaeXcpx53H6y5C
	T2hQhor5MOS8qa+W+QVG5N+MFHiUW6W8t1plM9Wl47nY0mL/ksGprPtA4vuwdRv1
	+cIA82r3W5pW1sM5NlpG4cry87iphSwgbbLj5uvtOC2bsuFp8QWvu3p0dTiaW8OG
	KuWAphWjMhhDHPfnpLtqwoQiWsSu77ryONbZDWKO2O+94KucgVJfDZ53zAHhDVTz
	AMfuJg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v47y4jpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:10:07 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ADGA6E9003297
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:10:06 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 08:10:01 -0800
Message-ID: <3a9f8cea-c84f-4e63-bdf1-faa016566a65@quicinc.com>
Date: Wed, 13 Nov 2024 21:39:58 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing
 between two subsystems
To: Bjorn Andersson <andersson@kernel.org>
CC: <konrad.dybcio@linaro.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <conor+dt@kernel.org>, <agross@kernel.org>,
        <devicetree@vger.kernel.org>, <vkoul@kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>
References: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
 <20240927063108.2773304-5-quic_msavaliy@quicinc.com>
 <lmo4jylfwt3wingdqb6zc6ew2537kqksuckfyd7vwuu4ufg5cr@ic2j7bv2r6e4>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <lmo4jylfwt3wingdqb6zc6ew2537kqksuckfyd7vwuu4ufg5cr@ic2j7bv2r6e4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GyNpwFQsNPeZeKszOJ8BjOJqos-pi-Na
X-Proofpoint-GUID: GyNpwFQsNPeZeKszOJ8BjOJqos-pi-Na
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130135

Thanks for the review Bjorn !

On 9/30/2024 9:16 AM, Bjorn Andersson wrote:
> On Fri, Sep 27, 2024 at 12:01:08PM GMT, Mukesh Kumar Savaliya wrote:
>> Add support to share I2C SE by two Subsystems in a mutually exclusive way.
>> Use "qcom,shared-se" flag in a particular i2c instance node if the usecase
>> requires i2c controller to be shared.
>>
> 
> Please start your commit message by describing the problem your patch
> is solving.
> 
Done
>> Sharing of SE(Serial engine) is possible only for GSI mode as each
>> subsystem(SS) can queue transfers over its own GPII Channel. For non GSI
>> mode, we should force disable this feature even if set by user from DT by
>> mistake.
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
> 
> This last paragraph describes patch 3, right?
Yes,  i think i should i keep it in patch 3.
> 
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 24 ++++++++++++++++++++----
>>   1 file changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 212336f724a6..479fa8e1c33f 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -1,5 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
>> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>   
>>   #include <linux/acpi.h>
>>   #include <linux/clk.h>
>> @@ -602,6 +603,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>   	peripheral.clk_div = itr->clk_div;
>>   	peripheral.set_config = 1;
>>   	peripheral.multi_msg = false;
>> +	peripheral.shared_se = gi2c->se.shared_geni_se;
>>   
>>   	for (i = 0; i < num; i++) {
>>   		gi2c->cur = &msgs[i];
>> @@ -612,6 +614,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>   		if (i < num - 1)
>>   			peripheral.stretch = 1;
>>   
>> +		peripheral.first_msg = (i == 0);
>> +		peripheral.last_msg = (i == num - 1);
> 
> There are multiple error paths in this loop, which would result in us
> never issuing the unlock TRE - effectively blocking other subsystems
> from accessing the serial engine until we perform our next access
> (assuming that APSS issuing a lock TRE when APSS already has the channel
> locked isn't a problem?)
> 
>>   		peripheral.addr = msgs[i].addr;
>>   
>>   		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>> @@ -631,8 +635,11 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>   		dma_async_issue_pending(gi2c->tx_c);
>>   
>>   		time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>> -		if (!time_left)
>> +		if (!time_left) {
>> +			dev_dbg(gi2c->se.dev, "I2C timeout gpi flags:%d addr:0x%x\n",
>> +						gi2c->cur->flags, gi2c->cur->addr);
> 
> This looks useful, but unrelated to this patch.
Sure, Removed it.
> 
>>   			gi2c->err = -ETIMEDOUT;
>> +		}
>>   
>>   		if (gi2c->err) {
>>   			ret = gi2c->err;
>> @@ -800,6 +807,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   		gi2c->clk_freq_out = KHZ(100);
>>   	}
>>   
>> +	if (of_property_read_bool(pdev->dev.of_node, "qcom,shared-se")) {
>> +		gi2c->se.shared_geni_se = true;
> 
> 	gi2c->se.shared_geni_se = of_property_read_bool(dev->of_node, "qcom,shared-se");
> 
>> +		dev_dbg(&pdev->dev, "I2C is shared between subsystems\n");
>> +	}
>> +
>>   	if (has_acpi_companion(dev))
>>   		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
>>   
>> @@ -870,8 +882,10 @@ static int geni_i2c_probe(struct platform_device *pdev)
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
> I think you're trying to document why we're entering the "GPI-only"
> branch. The addition you made was that if the user has requested
> "shared-se", then it's GPI-only.
> 
yes, that's right.
> But I'm not able to wrap my head around your addition here. Why does it
> matter that each subsystem own a GPII? Is that a reason for choosing
> GPI-only mode?
Not sure i got your question here.
The feature flag true means it should be in GPI mode.
> 
>>   		gi2c->gpi_mode = true;
>>   		ret = setup_gpi_dma(gi2c);
>>   		if (ret) {
>> @@ -883,6 +897,9 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
>>   	} else {
>>   		gi2c->gpi_mode = false;
>> +
>> +		/* Force disable shared SE case for non GSI mode */
> 
> GSI or GPI mode?
Changed to GPI.
> 
>> +		gi2c->se.shared_geni_se = false;
> 
> If shared_geni_se was true prior to this assignment, wouldn't we have
> entered the if (fifo_disable ...) branch?
In that case also we should enter the condition of executing in GPI mode.
> 
>>   		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
>>   
>>   		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
>> @@ -964,7 +981,6 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>>   	if (ret) {
>>   		enable_irq(gi2c->irq);
>>   		return ret;
>> -
> 
> Please avoid such unrelated cleanups.
> 
Sure
> Regards,
> Bjorn
> 
>>   	} else {
>>   		gi2c->suspended = 1;
>>   	}
>> -- 
>> 2.25.1
>>

