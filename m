Return-Path: <linux-i2c+bounces-6234-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4652896D342
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 11:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66BF41C25935
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 09:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97AAE198E93;
	Thu,  5 Sep 2024 09:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jU8T5RN6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BBA198833;
	Thu,  5 Sep 2024 09:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725528532; cv=none; b=TixZHj29LsFb6af91/NlP9CrWpRmLbp5eKWR4V7xlQgeiZEIN6dBlhhTRb0ENLVSHxeQfVaSAGLNXfZi1p5xjNrwpXeTS3SqgeaGsT1gt5ZbbayNyjz2HXEpwr/0hRyLWYGuCQeGeE9Dv6Q79hiSkLopMwOAohHgIuaKNp9Rx80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725528532; c=relaxed/simple;
	bh=KASvv5EJk6ENn/zXqEeW2Meq5eFj1vfZnBX0Dvggu34=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S6Wp/Vhli1zbp6nnhqrNEkHkLheEdsNTHZchN+pgxXSRrJUN4Z9/D2Ko6uuBKFc741WD+xABu596PME1mQv7MmcFRe69vS+fohKPT+QGhe8navpIN3GkJo5NbMZHe1JQomhsrCIstsLtiF1p9Ykqmv4Q3N4O0F5VF3ehzSX9gyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jU8T5RN6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48597AK9013888;
	Thu, 5 Sep 2024 09:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xcem/9jVFFQ6WbYt1SjQooWq7e6410xcUHJH4f85asQ=; b=jU8T5RN6vTEPgRPB
	GJEhNg/TPJHJDgSwY66AyWScSA244jr43nN1a4w+mnei0P81ClWLWePOOC0STg7D
	Q7adt+V5Hk/r661gYlRMi09SmwVwRdZumnjdyHvPhf7Sf0zaKpxBsYes+ae9GjEE
	cqWh7Um+/k4wXic/bXbRcIEukOr75xlIJioNxzk0nvjWh72I8FZqAz5HwBE4bOzO
	tPy5U6K/yFyQdklo80FRNyUChKsa4w6GiLy11FUm6z2vpMfSGSzNgDWzpfFIuaKZ
	GLtQsPeighFKQife7C4XSekY8pYC5NEMpnnaPLLgNHwfku0IGbd/5GgFj/IKbRya
	9Y54qg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dt69fktd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 09:28:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4859SiF0018456
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 09:28:44 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 02:28:41 -0700
Message-ID: <2e46be46-a029-4b2c-9608-95cb3e18294f@quicinc.com>
Date: Thu, 5 Sep 2024 14:58:38 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] Enable shared SE support over I2C
To: <neil.armstrong@linaro.org>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
CC: <quic_vdadhani@quicinc.com>
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
 <d1ceab6e-907a-4939-8be4-6b460d6c594f@linaro.org>
 <f70baa0a-f897-42af-931f-082e8c5c12b6@quicinc.com>
 <169e9428-e328-4c2a-b54c-c49852016a81@linaro.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <169e9428-e328-4c2a-b54c-c49852016a81@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kNPff3_51mZDtKhl5mlw6P1_HWOffFlV
X-Proofpoint-ORIG-GUID: kNPff3_51mZDtKhl5mlw6P1_HWOffFlV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_04,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050069

Thanks Neil !

On 9/5/2024 12:39 PM, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 04/09/2024 20:07, Mukesh Kumar Savaliya wrote:
>> Thanks Neil !
>>
>> On 8/30/2024 1:17 PM, neil.armstrong@linaro.org wrote:
>>> Hi,
>>>
>>> On 29/08/2024 11:24, Mukesh Kumar Savaliya wrote:
>>>> This Series adds support to share QUP based I2C SE between subsystems.
>>>> Each subsystem should have its own GPII which interacts between SE and
>>>> GSI DMA HW engine.
>>>>
>>>> Subsystem must acquire Lock over the SE on GPII channel so that it
>>>> gets uninterrupted control till it unlocks the SE. It also makes sure
>>>> the commonly shared TLMM GPIOs are not touched which can impact other
>>>> subsystem or cause any interruption. Generally, GPIOs are being
>>>> unconfigured during suspend time.
>>>>
>>>> GSI DMA engine is capable to perform requested transfer operations
>>>> from any of the SE in a seamless way and its transparent to the
>>>> subsystems. Make sure to enable “qcom,shared-se” flag only while
>>>> enabling this feature. I2C client should add in its respective parent
>>>> node.
>>>>
>>>> ---
>>>> Mukesh Kumar Savaliya (4):
>>>>    dt-bindindgs: i2c: qcom,i2c-geni: Document shared flag
>>>>    dma: gpi: Add Lock and Unlock TRE support to access SE exclusively
>>>>    soc: qcom: geni-se: Export function geni_se_clks_off()
>>>>    i2c: i2c-qcom-geni: Enable i2c controller sharing between two
>>>>      subsystems
>>>>
>>>>   .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |  4 ++
>>>>   drivers/dma/qcom/gpi.c                        | 37 
>>>> ++++++++++++++++++-
>>>>   drivers/i2c/busses/i2c-qcom-geni.c            | 29 +++++++++++----
>>>>   drivers/soc/qcom/qcom-geni-se.c               |  4 +-
>>>>   include/linux/dma/qcom-gpi-dma.h              |  6 +++
>>>>   include/linux/soc/qcom/geni-se.h              |  3 ++
>>>>   6 files changed, 74 insertions(+), 9 deletions(-)
>>>>
>>>
>>> I see in downstream that this flag is used on the SM8650 qupv3_se6_i2c,
>>> and that on the SM8650-HDK this i2c is shared between the aDSP 
>>> battmgr and
>>> the linux to access the HDMI controller.
>>>
>>> Is this is the target use-case ?
>> Not exactly that usecase. Here making it generic in a way to transfer 
>> data which is pushed from two subsystems independently. Consider for 
>> example one is ADSP i2c client and another is Linux i2c client. Not 
>> sure in what manner battmgr and HDMI sends traffic. we can debug it 
>> separately over that email.
> 
> Considering battmgr runs in ADSP, it matches this use-case, no ?
> 
is your issue 100% ? I have received your email, so will debug over that 
email.
>>>
>>> We have some issues on this platform that crashes the system when Linux
>>> does some I2C transfers while battmgr does some access at the same time,
>>> the problem is that on the Linux side the i2c uses the SE DMA and not 
>>> GPI
>>> because fifo_disable=0 so by default this bypasses GPI.
>>>
>>> A temporary fix has been merged:
>>> https://lore.kernel.org/all/20240605-topic-sm8650-upstream-hdk-iommu-fix-v1-1-9fd7233725fa@linaro.org/
>>> but it's clearly not a real solution
>>>
>> Seems you have added SID for the GPII being used from linux side. Need 
>> to know why you have added it and is it helping ? I have sent an email 
>> to know more about this issue before 2 weeks.
> 
> I've added this because it actually avoids crashing when doing I2C6 
> transactions over SE DMA, now we need to understand why.
> 
Seems stream IS (SID) is corrected and points to the potential wrong 
device tree configuration. Its required for DMA transactions.
>>
>>> What would be the solution to use the shared i2c with on one side 
>>> battmgr
>>> using GPI and the kernel using SE DMA ?
>>>
>> I have already sent an email on this issue, please respond on it. We 
>> shall debug it separately since this feature about sharing is still 
>> under implementation as you know about this patch series.
> 
> Sorry for the delay, I was technically unable to answer, let me resume 
> it now that I'm able again.
> 
Sure, lets discuss there.
> Thanks,
> Neil
> 
>>
>>> In this case, shouldn't we force using GPI on linux with:
>>> ==============><=====================================================================
>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>>> b/drivers/i2c/busses/i2c-qcom-geni.c
>>> index ee2e431601a6..a15825ea56de 100644
>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>> @@ -885,7 +885,7 @@ static int geni_i2c_probe(struct platform_device 
>>> *pdev)
>>>          else
>>>                  fifo_disable = readl_relaxed(gi2c->se.base + 
>>> GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
>>>
>>> -       if (fifo_disable) {
>>> +       if (gi2c->is_shared || fifo_disable) {
>>>                  /* FIFO is disabled, so we can only use GPI DMA */
>>>                  gi2c->gpi_mode = true;
>>>                  ret = setup_gpi_dma(gi2c);
>>> ==============><=====================================================================
>>>
>>> Neil
> 

