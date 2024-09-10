Return-Path: <linux-i2c+bounces-6468-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E96E972D37
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 11:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDA5B1F25C23
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 09:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B82188002;
	Tue, 10 Sep 2024 09:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JVGDZc7C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A21171671;
	Tue, 10 Sep 2024 09:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725959732; cv=none; b=Nlnu0BSAm7LWkVIXuQf+EOKJj2X9hXZ8eKKztl3cypn860dNYLDwS5ogG4F3vi1BOH2eSp7iWaDy0EiH1OU8jvf6qDrRTD61+BfhriAk5N95WRotSQ5iHejvtQjMV6XWaUsxoSxvV86bg2beGJ57UbSdMh8+ZtEKcqVcoCLhoYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725959732; c=relaxed/simple;
	bh=hzh+J6/Xpo/8eBZY2lc5T4MswvsUoOpgSkJML+t7I6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WVBte+Ou3lOq08doAP+OeVQvyK408ee+nO8kgqXs91toIe9PYEu2kIYP50mlV2ZL8uptdSdwj1809B6rJpdGvckCf30gWSuHx/cfJD3Po1Q2TdmEL/ZObg++byUeWM5wpTZeq8jcqrWMi31TegtAZSFvYZU8YhHzAgT7k4iP0pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JVGDZc7C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48A57eDu021294;
	Tue, 10 Sep 2024 09:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ti5eEUzUoscS5gULG+Nev2Yltim4D2dB65KfWC7XflU=; b=JVGDZc7Cfs+fRh2/
	/N7mrjTR0a8TmxwsDwQfHe22IpykeW+Dcm7I1NHHtT9K+LTYwIjjVIk81VyBWpoD
	Wn4fv8MXtYyry79VEYQUYY1JF9Ac6ukliONWxBtA3eJs7QUKADA3Aae+7Ln/AVrh
	jB6cg6ewZF1H7U+ztnpHoe4CK8g8xEUh60p7NXvn4AdEAw3H9AF+3s082L0Wk4DK
	Q/cjeQfrzpS4EueaqEczPjCf5c8wegOwK68tkWy9WoubcfR6p7DKI115ETc6acNU
	8Ap7lD9EhnMuuYvVy4L989TZ4ZB81N5g4vbCCv6+wftWTUili9gSZDNQEiZw/7EL
	fSwkUA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gybpncdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 09:15:22 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48A9FMvd005215
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 09:15:22 GMT
Received: from [10.218.13.83] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Sep
 2024 02:15:16 -0700
Message-ID: <687db538-1a41-4353-89fd-d1869d960a12@quicinc.com>
Date: Tue, 10 Sep 2024 14:45:13 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing
 between two subsystems
To: <neil.armstrong@linaro.org>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <conor+dt@kernel.org>, <agross@kernel.org>,
        <devicetree@vger.kernel.org>, <vkoul@kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>
CC: <quic_vdadhani@quicinc.com>
References: <20240906191438.4104329-1-quic_msavaliy@quicinc.com>
 <20240906191438.4104329-5-quic_msavaliy@quicinc.com>
 <b3a5dd54-90ba-4d75-9650-efbff12cddeb@linaro.org>
 <3bd27b6d-74b8-4f7b-b3eb-64682442bbda@quicinc.com>
 <3dddd226-c726-434e-8828-c12f76a71752@linaro.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <3dddd226-c726-434e-8828-c12f76a71752@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LPWdNrYVz1yK5lL6_Dbzj4GOWfWbbaEO
X-Proofpoint-GUID: LPWdNrYVz1yK5lL6_Dbzj4GOWfWbbaEO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409100070

Hi Neil,

On 9/9/2024 6:34 PM, neil.armstrong@linaro.org wrote:
> On 09/09/2024 11:18, Mukesh Kumar Savaliya wrote:
>> Hi Neil,
>>
>> On 9/9/2024 2:24 PM, neil.armstrong@linaro.org wrote:
>>> Hi,
>>>
>>> On 06/09/2024 21:14, Mukesh Kumar Savaliya wrote:
>>>> Add support to share I2C SE by two Subsystems in a mutually 
>>>> exclusive way.
>>>> Use  "qcom,shared-se" flag in a particular i2c instance node if the
>>>> usecase requires i2c controller to be shared.
>>>>
>>>> I2C driver just need to mark first_msg and last_msg flag to help 
>>>> indicate
>>>> GPI driver to  take lock and unlock TRE there by protecting from 
>>>> concurrent
>>>> access from other EE or Subsystem.
>>>>
>>>> gpi_create_i2c_tre() function at gpi.c will take care of adding Lock 
>>>> and
>>>> Unlock TRE for the respective transfer operations.
>>>>
>>>> Since the GPIOs are also shared for the i2c bus between two SS, do not
>>>> touch GPIO configuration during runtime suspend and only turn off the
>>>> clocks. This will allow other SS to continue to transfer the data
>>>> without any disturbance over the IO lines.
>>>
>>> This doesn't answer my question about what would be the behavior if one
>>> use uses, for example, GPI DMA, and the Linux kernel FIFO mode or SE 
>>> DMA ?
>>>
>> Shared usecase is not supported for non GSI mode (FIFO and DMA), it 
>> should be static usecase. Dynamic sharing from two clients of two 
>> subsystems is only for GSI mode. Hope this helps ?
> 
> Sure, this is why I proposed on v1 cover letter reply to add:
Sure, i will add in cover letter and code check combining with 
fifo_disable check.
> ==============><=====================================================================
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
> b/drivers/i2c/busses/i2c-qcom-geni.c
> index ee2e431601a6..a15825ea56de 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -885,7 +885,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>           else
>                   fifo_disable = readl_relaxed(gi2c->se.base + 
> GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
> 
> -       if (fifo_disable) {
> +       if (gi2c->is_shared || fifo_disable) {
  Should be ANDING logically, as we need to combine both check. Shared
  usecase possible only for fifo_disable.

  if(gi2c->is_shared && fifo_disable) {
>                   /* FIFO is disabled, so we can only use GPI DMA */
>                   gi2c->gpi_mode = true;
>                   ret = setup_gpi_dma(gi2c);
> ==============><=====================================================================
> 
> Thanks,
> Neil
> 
>>> Because it seems to "fix" only the GPI DMA shared case.
>>>
>>> Neil
>>>
>>>>
>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> ---
>>>>   drivers/i2c/busses/i2c-qcom-geni.c | 29 ++++++++++++++++++++++-------
>>>>   1 file changed, 22 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>>>> b/drivers/i2c/busses/i2c-qcom-geni.c
>>>> index eebb0cbb6ca4..ee2e431601a6 100644
>>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>>> @@ -1,5 +1,6 @@
>>>>   // SPDX-License-Identifier: GPL-2.0
>>>>   // Copyright (c) 2017-2018, The Linux Foundation. All rights 
>>>> reserved.
>>>> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights 
>>>> reserved.
>>>>   #include <linux/acpi.h>
>>>>   #include <linux/clk.h>
>>>> @@ -99,6 +100,7 @@ struct geni_i2c_dev {
>>>>       struct dma_chan *rx_c;
>>>>       bool gpi_mode;
>>>>       bool abort_done;
>>>> +    bool is_shared;
>>>>   };
>>>>   struct geni_i2c_desc {
>>>> @@ -602,6 +604,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev 
>>>> *gi2c, struct i2c_msg msgs[], i
>>>>       peripheral.clk_div = itr->clk_div;
>>>>       peripheral.set_config = 1;
>>>>       peripheral.multi_msg = false;
>>>> +    peripheral.shared_se = gi2c->is_shared;
>>>>       for (i = 0; i < num; i++) {
>>>>           gi2c->cur = &msgs[i];
>>>> @@ -612,6 +615,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev 
>>>> *gi2c, struct i2c_msg msgs[], i
>>>>           if (i < num - 1)
>>>>               peripheral.stretch = 1;
>>>> +        peripheral.first_msg = (i == 0);
>>>> +        peripheral.last_msg = (i == num - 1);
>>>>           peripheral.addr = msgs[i].addr;
>>>>           ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>>>> @@ -631,8 +636,11 @@ static int geni_i2c_gpi_xfer(struct 
>>>> geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>>>           dma_async_issue_pending(gi2c->tx_c);
>>>>           time_left = wait_for_completion_timeout(&gi2c->done, 
>>>> XFER_TIMEOUT);
>>>> -        if (!time_left)
>>>> +        if (!time_left) {
>>>> +            dev_err(gi2c->se.dev, "I2C timeout gpi flags:%d 
>>>> addr:0x%x\n",
>>>> +                        gi2c->cur->flags, gi2c->cur->addr);
>>>>               gi2c->err = -ETIMEDOUT;
>>>> +        }
>>>>           if (gi2c->err) {
>>>>               ret = gi2c->err;
>>>> @@ -800,6 +808,11 @@ static int geni_i2c_probe(struct 
>>>> platform_device *pdev)
>>>>           gi2c->clk_freq_out = KHZ(100);
>>>>       }
>>>> +    if (of_property_read_bool(pdev->dev.of_node, "qcom,shared-se")) {
>>>> +        gi2c->is_shared = true;
>>>> +        dev_dbg(&pdev->dev, "Shared SE Usecase\n");
>>>> +    }
>>>> +
>>>>       if (has_acpi_companion(dev))
>>>>           ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
>>>> @@ -962,14 +975,16 @@ static int __maybe_unused 
>>>> geni_i2c_runtime_suspend(struct device *dev)
>>>>       struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>>>>       disable_irq(gi2c->irq);
>>>> -    ret = geni_se_resources_off(&gi2c->se);
>>>> -    if (ret) {
>>>> -        enable_irq(gi2c->irq);
>>>> -        return ret;
>>>> -
>>>> +    if (gi2c->is_shared) {
>>>> +        geni_se_clks_off(&gi2c->se);
>>>>       } else {
>>>> -        gi2c->suspended = 1;
>>>> +        ret = geni_se_resources_off(&gi2c->se);
>>>> +        if (ret) {
>>>> +            enable_irq(gi2c->irq);
>>>> +            return ret;
>>>> +        }
>>>>       }
>>>> +    gi2c->suspended = 1;
>>>>       clk_disable_unprepare(gi2c->core_clk);
>>>
>>>
> 
> 

