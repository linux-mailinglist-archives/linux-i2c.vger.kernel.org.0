Return-Path: <linux-i2c+bounces-8519-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD92E9F3037
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 13:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A6BD7A283C
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 12:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1D1204F9D;
	Mon, 16 Dec 2024 12:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kyHMj4Ne"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713C3204F6B
	for <linux-i2c@vger.kernel.org>; Mon, 16 Dec 2024 12:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734351046; cv=none; b=nP8BjLMWUEYpOVav2I+Q+sgxxEgXdIiZFab4gpms2G8Skjm0qpEhi9CmT0Ekqed21u0MHBH7TE6+THy9LVVEwULVMsHlGBhdMMH756Evg4eI0yWhWrlI4TvbEJ+Z5ALOmboi9zrzNSApZt2nu2mLKZF+9SONojEdIXtOfe2he9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734351046; c=relaxed/simple;
	bh=CxBUL9OkqLeB8OoWuJZqqR3Q2az/FtZRLHnnaK1fj7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BIyl8C8wcLXtgAzGKcVp3ePH32shbX/Ur3+reYQJNI6B54Vm1efwLb36ed640/sHfVrzutjkib+EEsD44nPrTSXMPLyATmL09pLtCdAbszZAY+itDKi+u3Sk6P+KUMf1E2312HTr0j4B1HBH4CtlsG/L5uat5LV1MIR5h7Tpipw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kyHMj4Ne; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG80eoH008376
	for <linux-i2c@vger.kernel.org>; Mon, 16 Dec 2024 12:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NlmH56qUx55E0h2YaAZNsyu2RFF+lvX77uI5vHEEUR8=; b=kyHMj4NeLVOHhe+f
	YL1oyr7HFXpGkQ1+4MA/ircJO/djweTOSZfGyufh8Tuv+5t3MtJW/XrkSvIfw5jL
	INHOkM0GAEYhR1Lwa0PQNOuzRmarJoxTWMQ2814oIR8fi+XgREw3ohF356MCVgPl
	4yy+2SjSUpEAiOojPUDuLqaC02vVMRgdVOfFpogztV0cZ+6xVsorLv0dVuJRkvlH
	cBSm5KzwV4O3E7UxsC7PibXNQ0ki9/HM5YwqEGS3Qx2FRwrIO5fn6Aum6aZ/34is
	eo9al6I9MGy0CTsa63yyvoRQrsdQ+Pn/eYzLjE6AB0GxaPJ9C2JG11A/DZasUSq9
	dyF5Hw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jgas8npw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 16 Dec 2024 12:10:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6da2abe1720so7432636d6.2
        for <linux-i2c@vger.kernel.org>; Mon, 16 Dec 2024 04:10:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734351042; x=1734955842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NlmH56qUx55E0h2YaAZNsyu2RFF+lvX77uI5vHEEUR8=;
        b=GLDUXrF0ATLQweTxKVZ+7XXrKVBhZk1YWL2Q/959pZsMd63Db5S6TQMFfw0M00Boam
         9auEgqZfEBOu6BoJ8hMNhWXwoZkLQLeNzngSFtYQ4FhdgNNayJw597/V7RijmUZWrg9d
         GQPFyO3AkQrg5EYkxow3gCs9ENKtUwmbWMAyiPSexuCwrI1PuTiIw3mWvTqCe24hNApq
         iMiW5vUcWkHNb7ECg8OzePqGNMF+Qz1oKn1rSgQU8rYC7vQWYlBfojYy2gL6HkMIcfiX
         geD0Ed3Z6NN0VTki5C58mPfzFUcwg2ejC8XznkX7f21Kalz8KYsjTAqNZImUSdTV8lvi
         azYw==
X-Forwarded-Encrypted: i=1; AJvYcCUV4XoLA0EwIKjoadAu43fQkQZ7sxmZG0vvD1D03TQxLuKfA5Uu32BtyZfMpQ8FCnj1zTKUTJnIJec=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT7gZCr3OcimmlSU781ZfqQM9mf6IOidS07uEUbsrpeizS4dTq
	ZWV42csu5NzJzXwL9yCl5smXdl6bp3MmsCMPh8T9GnceV1TojOIIybnkNsER2hEy42fAqWD5X4k
	TP4zLVDfzVi3BdSe7hLP8hPg0MopI+Qxv9BHW2s9wqkRGSgNlc2wbzccj75A=
X-Gm-Gg: ASbGncsVdmfNAF7pB6Lvt/zsEXk5JDEQXw++nqOBHc5tpJ+FBWeI+xDe1wdhxNBAW8G
	YmdIQ4N7sXLwMNdta1CAnSVlcIqUriPbFGBZpqeE4Z2VzaxjUCSPpxRl9RCwqTtBS8iMyGP2HhX
	ST8dvdiexGcefA772V3T8sUB1OxYkdYfo2oe6y8ebPZIpnsiR4WoVP4s71LTRQ+z8bKqItaJPZ1
	YSNpp9lEQKXkyhaK05OtnbkgiOZwL1Js+2mnbIofWhjseH2Yeanm+pa30xxiR1HYmFV27mDTRjK
	fpaZiJm3bEQFynlgcNHmB4jciUP7O6Od1no=
X-Received: by 2002:a05:6214:d48:b0:6d8:e634:203a with SMTP id 6a1803df08f44-6dc8ca68868mr77285856d6.4.1734351040909;
        Mon, 16 Dec 2024 04:10:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9ohBWqLcw2WzLnjXvZK61kA+e0cqwUBrq/b2HNo6N6Cw5j+zGOJhcrhuG4ZGdoAFrQQRdfw==
X-Received: by 2002:a05:6214:d48:b0:6d8:e634:203a with SMTP id 6a1803df08f44-6dc8ca68868mr77285606d6.4.1734351040509;
        Mon, 16 Dec 2024 04:10:40 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96359fdfsm323658066b.93.2024.12.16.04.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 04:10:40 -0800 (PST)
Message-ID: <cc8655ed-0021-4490-8873-519c9b5b939c@oss.qualcomm.com>
Date: Mon, 16 Dec 2024 13:10:38 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing
 between two subsystems
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
        Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
 <20241129144357.2008465-5-quic_msavaliy@quicinc.com>
 <ce9f1ab1-56a0-4c0a-aa5b-f044111288ec@oss.qualcomm.com>
 <57815272-bc07-4c5e-8ae6-8bf8eaaca78f@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <57815272-bc07-4c5e-8ae6-8bf8eaaca78f@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: egGJU_r5pdQ-xp-ktJGqT4gEPTIgxLI3
X-Proofpoint-ORIG-GUID: egGJU_r5pdQ-xp-ktJGqT4gEPTIgxLI3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160101

On 15.12.2024 9:59 AM, Mukesh Kumar Savaliya wrote:
> Hi Konrad,
> 
> On 12/13/2024 6:35 PM, Konrad Dybcio wrote:
>> On 29.11.2024 3:43 PM, Mukesh Kumar Savaliya wrote:
>>> Add support to share I2C controller in multiprocessor system in a mutually
>>> exclusive way. Use "qcom,shared-se" flag in a particular i2c instance node
>>> if the usecase requires i2c controller to be shared.
>>>
>>> Sharing of I2C SE(Serial engine) is possible only for GSI mode as client
>>> from each processor can queue transfers over its own GPII Channel. For
>>> non GSI mode, we should force disable this feature even if set by user
>>> from DT by mistake.
>>>
>>> I2C driver just need to mark first_msg and last_msg flag to help indicate
>>> GPI driver to take lock and unlock TRE there by protecting from concurrent
>>> access from other EE or Subsystem.
>>>
>>> gpi_create_i2c_tre() function at gpi.c will take care of adding Lock and
>>> Unlock TRE for the respective transfer operations.
>>>
>>> Since the GPIOs are also shared between two SS, do not unconfigure them
>>> during runtime suspend. This will allow other SS to continue to transfer
>>> the data without any disturbance over the IO lines.
>>>
>>> For example, Assume an I2C EEPROM device connected with an I2C controller.
>>> Each client from ADSP and APPS processor can perform i2c transactions
>>> without any disturbance from each other.
>>>
>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>> ---
>>>   drivers/i2c/busses/i2c-qcom-geni.c | 22 +++++++++++++++++++---
>>>   1 file changed, 19 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>>> index 7a22e1f46e60..ccf9933e2dad 100644
>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>> @@ -1,5 +1,6 @@
>>>   // SPDX-License-Identifier: GPL-2.0
>>>   // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
>>> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>     #include <linux/acpi.h>
>>>   #include <linux/clk.h>
>>> @@ -617,6 +618,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>>       peripheral.clk_div = itr->clk_div;
>>>       peripheral.set_config = 1;
>>>       peripheral.multi_msg = false;
>>> +    peripheral.shared_se = gi2c->se.shared_geni_se;
>>>         for (i = 0; i < num; i++) {
>>>           gi2c->cur = &msgs[i];
>>> @@ -627,6 +629,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>>           if (i < num - 1)
>>>               peripheral.stretch = 1;
>>>   +        peripheral.first_msg = (i == 0);
>>> +        peripheral.last_msg = (i == num - 1);
>>>           peripheral.addr = msgs[i].addr;
>>>             ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>>> @@ -815,6 +819,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>>           gi2c->clk_freq_out = KHZ(100);
>>>       }
>>>   +    if (of_property_read_bool(pdev->dev.of_node, "qcom,shared-se")) {
>>> +        gi2c->se.shared_geni_se = true;
>>> +        dev_dbg(&pdev->dev, "I2C is shared between subsystems\n");
>>> +    }
>>> +
>>>       if (has_acpi_companion(dev))
>>>           ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
>>>   @@ -887,8 +896,10 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>>       else
>>>           fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
>>>   -    if (fifo_disable) {
>>> -        /* FIFO is disabled, so we can only use GPI DMA */
>>> +    if (fifo_disable || gi2c->se.shared_geni_se) {
>>> +        /* FIFO is disabled, so we can only use GPI DMA.
>>> +         * SE can be shared in GSI mode between subsystems, each SS owns a GPII.
>>> +         **/
>>
>> I don't think this change makes things clearer, I would drop it
> Shall i revert back to previous change ? What's your suggestion ?

Yes, drop changing this comment.

Konrad

