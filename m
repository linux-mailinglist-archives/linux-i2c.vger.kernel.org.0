Return-Path: <linux-i2c+bounces-6203-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E67EB96C5FA
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 20:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D1A5B21BA8
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 18:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632881E133F;
	Wed,  4 Sep 2024 18:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FupGuUxA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42D82AE9F;
	Wed,  4 Sep 2024 18:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725473290; cv=none; b=Sxxdwe4AOI/QHYuaDKG4ojVxVg3ceOghr0bx+rZSQibhZvHUqHO/9vsJXCkyZ27Ei7Qiw3H++RhIExN2/VfX6AM5gyPEGO6NyYK3+MQtWKhSNar9HQ/7X0ZCtj+xWKNEibOd1oUqy1eXiH+OpqIbXYAvG8co0sqD3SIUk1MtAFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725473290; c=relaxed/simple;
	bh=DAZMDM+ojgArjPYz3GYq7zIak/VZ/DvXd0M+uX3t+rA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YQ83AUvvMPUWcoZ3gRffVZbm7Gd7Na13kBpK7u9anfNCHme3t/4bBmzAsvF1uq7cNejvFw0mwlRg+poD+YnMNaAr3WWFWzux3dL0aIQAXH7DCSnyi066dFk6TFEnkm6p7kMIMJSNM8XaSvJ3UyKzWovYGcWogdMuL9TILH0iNCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FupGuUxA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4849KaJg014913;
	Wed, 4 Sep 2024 18:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pd1/ZjvknWu6B6l/n+tgyNKndfG6GvonW+0stJXLy+Y=; b=FupGuUxAX4DdE7Fv
	CUoWzb3A4mxu2zCo2XqyuM2KpIzN/kzKTBkME0iLZFrWN0xOoaaLlDHLErhfiM3C
	ZNs2zjZmiPf970pbLp8wtrBW0ZzOEi8YrylvYm9kYwirAlf49P2cFtm0acJALmXg
	NOVQ+9BvByYas72yR6q7xyv5txe4ES3mMSTJSBUt0TDU+Ajj0GWms6M93e6eGYCR
	hgkwvYTrMcawuX0G6eirTGmGPFO25V70oST4etB3GBLM9Z52F/ss4TvZW4Zetg1M
	MNn4RLXh7EQKGypgJ+j26h9GQmqyr7U4jvwtZ7OlTjbklDrcPs6m4sCxNhFmLIFk
	WzUJkg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bt673rx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 18:08:04 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484I83Lp020374
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 18:08:03 GMT
Received: from [10.216.2.237] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 11:07:59 -0700
Message-ID: <f70baa0a-f897-42af-931f-082e8c5c12b6@quicinc.com>
Date: Wed, 4 Sep 2024 23:37:55 +0530
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
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <d1ceab6e-907a-4939-8be4-6b460d6c594f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KrLLI9LjIOyRwlq4-CozeOQYTa9DlUwZ
X-Proofpoint-GUID: KrLLI9LjIOyRwlq4-CozeOQYTa9DlUwZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_15,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040136

Thanks Neil !

On 8/30/2024 1:17 PM, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 29/08/2024 11:24, Mukesh Kumar Savaliya wrote:
>> This Series adds support to share QUP based I2C SE between subsystems.
>> Each subsystem should have its own GPII which interacts between SE and
>> GSI DMA HW engine.
>>
>> Subsystem must acquire Lock over the SE on GPII channel so that it
>> gets uninterrupted control till it unlocks the SE. It also makes sure
>> the commonly shared TLMM GPIOs are not touched which can impact other
>> subsystem or cause any interruption. Generally, GPIOs are being
>> unconfigured during suspend time.
>>
>> GSI DMA engine is capable to perform requested transfer operations
>> from any of the SE in a seamless way and its transparent to the
>> subsystems. Make sure to enable “qcom,shared-se” flag only while
>> enabling this feature. I2C client should add in its respective parent
>> node.
>>
>> ---
>> Mukesh Kumar Savaliya (4):
>>    dt-bindindgs: i2c: qcom,i2c-geni: Document shared flag
>>    dma: gpi: Add Lock and Unlock TRE support to access SE exclusively
>>    soc: qcom: geni-se: Export function geni_se_clks_off()
>>    i2c: i2c-qcom-geni: Enable i2c controller sharing between two
>>      subsystems
>>
>>   .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |  4 ++
>>   drivers/dma/qcom/gpi.c                        | 37 ++++++++++++++++++-
>>   drivers/i2c/busses/i2c-qcom-geni.c            | 29 +++++++++++----
>>   drivers/soc/qcom/qcom-geni-se.c               |  4 +-
>>   include/linux/dma/qcom-gpi-dma.h              |  6 +++
>>   include/linux/soc/qcom/geni-se.h              |  3 ++
>>   6 files changed, 74 insertions(+), 9 deletions(-)
>>
> 
> I see in downstream that this flag is used on the SM8650 qupv3_se6_i2c,
> and that on the SM8650-HDK this i2c is shared between the aDSP battmgr and
> the linux to access the HDMI controller.
> 
> Is this is the target use-case ?
Not exactly that usecase. Here making it generic in a way to transfer 
data which is pushed from two subsystems independently. Consider for 
example one is ADSP i2c client and another is Linux i2c client. Not sure 
in what manner battmgr and HDMI sends traffic. we can debug it 
separately over that email.
> 
> We have some issues on this platform that crashes the system when Linux
> does some I2C transfers while battmgr does some access at the same time,
> the problem is that on the Linux side the i2c uses the SE DMA and not GPI
> because fifo_disable=0 so by default this bypasses GPI.
> 
> A temporary fix has been merged:
> https://lore.kernel.org/all/20240605-topic-sm8650-upstream-hdk-iommu-fix-v1-1-9fd7233725fa@linaro.org/
> but it's clearly not a real solution
> 
Seems you have added SID for the GPII being used from linux side. Need 
to know why you have added it and is it helping ? I have sent an email 
to know more about this issue before 2 weeks.

> What would be the solution to use the shared i2c with on one side battmgr
> using GPI and the kernel using SE DMA ?
> 
I have already sent an email on this issue, please respond on it. We 
shall debug it separately since this feature about sharing is still 
under implementation as you know about this patch series.

> In this case, shouldn't we force using GPI on linux with:
> ==============><=====================================================================
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
> b/drivers/i2c/busses/i2c-qcom-geni.c
> index ee2e431601a6..a15825ea56de 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -885,7 +885,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>          else
>                  fifo_disable = readl_relaxed(gi2c->se.base + 
> GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
> 
> -       if (fifo_disable) {
> +       if (gi2c->is_shared || fifo_disable) {
>                  /* FIFO is disabled, so we can only use GPI DMA */
>                  gi2c->gpi_mode = true;
>                  ret = setup_gpi_dma(gi2c);
> ==============><=====================================================================
> 
> Neil

