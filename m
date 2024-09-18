Return-Path: <linux-i2c+bounces-6853-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E8297BC12
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 14:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A648AB21F53
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 12:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E764E188CA3;
	Wed, 18 Sep 2024 12:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QMLdsj/m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846102E64B;
	Wed, 18 Sep 2024 12:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726662052; cv=none; b=is0VPNqmLQtpNXknV006v/P7r9tMiwFM2OFeMDpzeLLM6UawtJHEs1e0IxTeig2+JkqdXVF4WTHsjmslVgQXePxRlkOGvZyDivwHjacN5RXXCQ+X9SibeSvMWPjXfYJjvzRJc4BAXs+gON4LHhLaQz4JsPExq/Yp1ccGR0lm59k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726662052; c=relaxed/simple;
	bh=YReHkWzoW90cu/Ao3EPUTSj1YiN0NQwCGDLLvtaUMZs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=ft5ItMqdCFft2m6IWAggx/D4HYkKk0eUOyyNyNX5/AtizBkKyjg7jNzbSYb0L6UYb4d9WTZTzklBD8s0hrki6tasVvtABrtQr4PkL0j5MOG1Q8GUlJWYrhjyOal6VXU1hT/+btEjEkE1E9+tEW870Vr6Im8nQjXZbROvoJtPayQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QMLdsj/m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48I6lLrn002533;
	Wed, 18 Sep 2024 12:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y49ljK7hhswfxyQq8jRavd0/ztkz3NCyaDreEvf3yzY=; b=QMLdsj/muGPPF5rr
	ygvoxHb3GnfgoBBW2eJK76zQE0q1EixKzCJN4rtLP1YARM7TBt/uxf55ETNHvmVe
	+QBTzir+Eh3yex6V2Gdu9xO1/3JCGF+M3D+idrD5YFE8xlGOkalD41JO6zJ9Hjgd
	YRvA2mhNj1Vqhs9gYGpM85reWsFAffO/BmMtun3UkQe5G+S6JmdsYYB8POimF0lc
	THe7cylO0h3QmNATNQePjrhIPZ5/uoS3A5m70mu+mPdbR/lK3ql3ZD5j8AkqBukk
	iJg+AjLD+z74cMdyOXPmt4iMOlfqczDUAFaO2gzH3Uew07Lp6jNXBv9yQ+hBp7CN
	X7ubCg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hfhwbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 12:20:39 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48ICKcOx015988
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 12:20:38 GMT
Received: from [10.216.13.254] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Sep
 2024 05:20:32 -0700
Message-ID: <77ce3d16-9e56-4ed3-89bd-e4d26d88eae2@quicinc.com>
Date: Wed, 18 Sep 2024 17:50:27 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
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
 <687db538-1a41-4353-89fd-d1869d960a12@quicinc.com>
 <ed0c3d9c-82d8-47db-938c-4e60e8ebed77@linaro.org>
Content-Language: en-US
In-Reply-To: <ed0c3d9c-82d8-47db-938c-4e60e8ebed77@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: udEkeV9OS7ClIy2BFO3gv_FICQsEvsUd
X-Proofpoint-ORIG-GUID: udEkeV9OS7ClIy2BFO3gv_FICQsEvsUd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409180080

Thanks Neil for the review !

On 9/10/2024 3:22 PM, neil.armstrong@linaro.org wrote:
> On 10/09/2024 11:15, Mukesh Kumar Savaliya wrote:
>> Hi Neil,
>>
>> On 9/9/2024 6:34 PM, neil.armstrong@linaro.org wrote:
>>> On 09/09/2024 11:18, Mukesh Kumar Savaliya wrote:
>>>> Hi Neil,
>>>>
>>>> On 9/9/2024 2:24 PM, neil.armstrong@linaro.org wrote:
>>>>> Hi,
>>>>>
>>>>> On 06/09/2024 21:14, Mukesh Kumar Savaliya wrote:
>>>>>> Add support to share I2C SE by two Subsystems in a mutually 
>>>>>> exclusive way.
>>>>>> Use  "qcom,shared-se" flag in a particular i2c instance node ifthe
>>>>>> usecase requires i2c controller to be shared.
>>>>>>
>>>>>> I2C driver just need to mark first_msg and last_msg flag to help 
>>>>>> indicate
>>>>>> GPI driver to  take lock and unlock TRE there by protecting from 
>>>>>> concurrent
>>>>>> access from other EE or Subsystem.
>>>>>>
>>>>>> gpi_create_i2c_tre() function at gpi.c will take care of adding 
>>>>>> Lock and
>>>>>> Unlock TRE for the respective transfer operations.
>>>>>>
>>>>>> Since the GPIOs are also shared for the i2c bus between two SS, do 
>>>>>> not
>>>>>> touch GPIO configuration during runtime suspend and only turn off the
>>>>>> clocks. This will allow other SS to continue to transfer the data
>>>>>> without any disturbance over the IO lines.
>>>>>
>>>>> This doesn't answer my question about what would be the behavior if 
>>>>> one
>>>>> use uses, for example, GPI DMA, and the Linux kernel FIFO mode or 
>>>>> SE DMA ?
>>>>>
>>>> Shared usecase is not supported for non GSI mode (FIFO and DMA), it 
>>>> should be static usecase. Dynamic sharing from two clients of two 
>>>> subsystems is only for GSI mode. Hope this helps ?
>>>
>>> Sure, this is why I proposed on v1 cover letter reply to add:
>> Sure, i will add in cover letter and code check combining with 
>> fifo_disable check.
>>> ==============><=====================================================================
>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>>> b/drivers/i2c/busses/i2c-qcom-geni.c
>>> index ee2e431601a6..a15825ea56de 100644
>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>> @@ -885,7 +885,7 @@ static int geni_i2c_probe(struct platform_device 
>>> *pdev)
>>>           else
>>>                   fifo_disable = readl_relaxed(gi2c->se.base + 
>>> GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
>>>
>>> -       if (fifo_disable) {
>>> +       if (gi2c->is_shared || fifo_disable) {
>>   Should be ANDING logically, as we need to combine both check. Shared
>>   usecase possible only for fifo_disable.
> 
> Could you elaborate on that ? GPI DMA is totally usable even if FIFO is 
> enabled,
> it's a decision took in the driver to _not_ use GPI when FIFO is enabled.
> 
Yes, Neil, you are right. Its actually reverse condition from HW 
configuration.

if fifo_disable = true, then FIFO registers will not be accessible, 
meaning its GPI mode only. And SW should decide use GPI DMA mode only.

if fifo_disable = false, it can still use GPI DMA/CPU_DMA. we need to 
restrict from SW side.

Provided above, i suggest to keep conditional check with ANDING.
We want only GSI mode to be supported with shared SE. Because GSI mode 
only has GPII channel allocated to each EE. if not, then it will be 
misused between EEs and no way to prevent concurrency at HW level.(E.g. 
we use lock/unlock in GSI mode)

If so, hope you agree with the conditional check of ANDing both flags?
> Neil
> 
>>
>>   if(gi2c->is_shared && fifo_disable) {
>>>                   /* FIFO is disabled, so we can only use GPI DMA */
>>>                   gi2c->gpi_mode = true;
>>>                   ret = setup_gpi_dma(gi2c);
>>> ==============><=====================================================================
>>>
>>> Thanks,
>>> Neil
>>>
>>>>> Because it seems to "fix" only the GPI DMA shared case.
>>>>>
>>>>> Neil
>>>>>
>>>>>>
>>>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>>>> ---
>>>>>>   drivers/i2c/busses/i2c-qcom-geni.c | 29 
>>>>>> ++++++++++++++++++++++-------
>>>>>>   1 file changed, 22 insertions(+), 7 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>>>>>> b/drivers/i2c/busses/i2c-qcom-geni.c
>>>>>> index eebb0cbb6ca4..ee2e431601a6 100644
>>>>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>>>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>>>>> @@ -1,5 +1,6 @@
>>>>>>   // SPDX-License-Identifier: GPL-2.0
>>>>>>   // Copyright (c) 2017-2018, The Linux Foundation. All rights 
>>>>>> reserved.
>>>>>> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights 
>>>>>> reserved.
>>>>>>   #include <linux/acpi.h>
>>>>>>   #include <linux/clk.h>
>>>>>> @@ -99,6 +100,7 @@ struct geni_i2c_dev {
>>>>>>       struct dma_chan *rx_c;
>>>>>>       bool gpi_mode;
>>>>>>       bool abort_done;
>>>>>> +    bool is_shared;
>>>>>>   };
>>>>>>   struct geni_i2c_desc {
>>>>>> @@ -602,6 +604,7 @@ static int geni_i2c_gpi_xfer(struct 
>>>>>> geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>>>>>       peripheral.clk_div = itr->clk_div;
>>>>>>       peripheral.set_config = 1;
>>>>>>       peripheral.multi_msg = false;
>>>>>> +    peripheral.shared_se = gi2c->is_shared;
>>>>>>       for (i = 0; i < num; i++) {
>>>>>>           gi2c->cur =&msgs[i];
>>>>>> @@ -612,6 +615,8 @@ static int geni_i2c_gpi_xfer(struct 
>>>>>> geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>>>>>           if (i < num -1)
>>>>>>               peripheral.stretch = 1;
>>>>>> +        peripheral.first_msg =(i == 0);
>>>>>> +        peripheral.last_msg = (i == num - 1);
>>>>>>           peripheral.addr = msgs[i].addr;
>>>>>>           ret = geni_i2c_gpi(gi2c, &msgs[i], &config,
>>>>>> @@ -631,8 +636,11 @@ static int geni_i2c_gpi_xfer(struct 
>>>>>> geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>>>>>           dma_async_issue_pending(gi2c->tx_c);
>>>>>>           time_left =wait_for_completion_timeout(&gi2c->done, 
>>>>>> XFER_TIMEOUT);
>>>>>> -        if (!time_left)
>>>>>> +        if (!time_left) {
>>>>>> +            dev_err(gi2c->se.dev, "I2C timeout gpi flags:%d 
>>>>>> addr:0x%x\n",
>>>>>> +                        gi2c->cur->flags, gi2c->cur->addr);
>>>>>>               gi2c->err = -ETIMEDOUT;
>>>>>> +        }
>>>>>>           if (gi2c->err) {
>>>>>>               ret = gi2c->err;
>>>>>> @@ -800,6 +808,11 @@ static int geni_i2c_probe(struct 
>>>>>> platform_device *pdev)
>>>>>>           gi2c->clk_freq_out = KHZ(100);
>>>>>>       }
>>>>>> +    if (of_property_read_bool(pdev->dev.of_node, 
>>>>>> "qcom,shared-se")) {
>>>>>> +        gi2c->is_shared = true;
>>>>>> +        dev_dbg(&pdev->dev, "Shared SE Usecase\n");
>>>>>> +    }
>>>>>> +
>>>>>>       if (has_acpi_companion(dev))
>>>>>>           ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
>>>>>> @@ -962,14 +975,16 @@ static int __maybe_unused 
>>>>>> geni_i2c_runtime_suspend(struct device *dev)
>>>>>>       struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>>>>>>       disable_irq(gi2c->irq);
>>>>>> -    ret = geni_se_resources_off(&gi2c->se);
>>>>>> -    if (ret) {
>>>>>> -        enable_irq(gi2c->irq);
>>>>>> -        return ret;
>>>>>> -
>>>>>> +    if (gi2c->is_shared) {
>>>>>> +        geni_se_clks_off(&gi2c->se);
>>>>>>       } else {
>>>>>> -        gi2c->suspended = 1;
>>>>>> +        ret = geni_se_resources_off(&gi2c->se);
>>>>>> +        if (ret) {
>>>>>> +            enable_irq(gi2c->irq);
>>>>>> +            return ret;
>>>>>> +        }
>>>>>>       }
>>>>>> +    gi2c->suspended = 1;
>>>>>>       clk_disable_unprepare(gi2c->core_clk);
>>>>>
>>>>>
>>>
>>>
> 

