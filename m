Return-Path: <linux-i2c+bounces-5936-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3D3964E59
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 21:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7B512833FB
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 19:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B7C1B8E92;
	Thu, 29 Aug 2024 19:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K0LMyed0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBF61B375A;
	Thu, 29 Aug 2024 19:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724958156; cv=none; b=gwdukc2aWNbWscddkXffWdgKqLcKwMeOMXoGcuAwgj2B3L5oddjOg1L16S9s2O0N6vpNBsYlLMY9X6MG3wVSTLyhia4Us1QGtel1ApAsGtkhGJAXCsfVOM8OmphzB6bwnQOw+bQ7Zi4dDQ0988d4lTtAwT3f2e50Djh5r80IfvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724958156; c=relaxed/simple;
	bh=/wmJtwFDN490HIh+23neW3jdiSkIUC6/3Or1KkDeYRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=I9oYkEckb2ZfJvJVmAXzqnxLhb4LRfmglWqy8CH59AbMiNCvCvIA8D2w9x6XkQHWh//CsR03ypajtGLYERxv803b/6ta0s+mCQJW4+XsVRPA/FRffKeWk2qKjyrg27l3H81+BL9nnvnMmKA5rzsPKeeRvMGRagc5fMA5ToP5c5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K0LMyed0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TGjpZ2000576;
	Thu, 29 Aug 2024 19:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vk4nZW/bDicP43XO1R2Ns1I318mX58Bj/9S9ag6wloc=; b=K0LMyed0l/G8fkIO
	NPghrtx7Cso89jMC+5F565Jf/sG5jhoOf7aFuxsRWreH5WluGeLAkXPWNDAdOPZT
	emdwDaGpjRbsot80jfztJSM+mPrc1jhCVFmZquV1/5tznPwjtR6ydXkDUMNvbtQi
	aSrOGE11mORKXY0dgUjF19KOw4B0O/3u5/sP8fD/Mfnk0ib6utkcnt+GHsvi2HEK
	CVf9S5gM0Gejb2RVq0rRWnYCVAH9NSbS7RIIEvim18eBX185hk1HOzOjnZ7aP85N
	bG25E8Sg3dR3xq+s2bc9LfGwNLFuZQVJ4DoehrHOqdQYqdaSJpgTMphAJMu0hNbz
	ihKgrg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puw6d4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:01:56 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TJ1s14030388
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:01:54 GMT
Received: from [10.110.28.107] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 29 Aug
 2024 12:01:50 -0700
Message-ID: <de0c40c2-3627-4c63-9112-4eb13cf75c0a@quicinc.com>
Date: Thu, 29 Aug 2024 12:01:50 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/22] ARM: dt: GIC: add extended SPI specifier
To: Rob Herring <robh@kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <rafael@kernel.org>, <viresh.kumar@linaro.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <sudeep.holla@arm.com>, <andi.shyti@kernel.org>, <tglx@linutronix.de>,
        <will@kernel.org>, <joro@8bytes.org>, <jassisinghbrar@gmail.com>,
        <lee@kernel.org>, <linus.walleij@linaro.org>, <amitk@kernel.org>,
        <thara.gopinath@gmail.com>, <broonie@kernel.org>,
        <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robin.murphy@arm.com>,
        <cristian.marussi@arm.com>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <vkoul@kernel.org>, <quic_gurus@quicinc.com>,
        <agross@kernel.org>, <bartosz.golaszewski@linaro.org>,
        <quic_rjendra@quicinc.com>, <robimarko@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <iommu@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_shazhuss@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-22-quic_nkela@quicinc.com>
 <20240829185240.GA914553-robh@kernel.org>
Content-Language: en-US
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <20240829185240.GA914553-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pfQJciifrzl-te3Okl98bZsPdJcXrs6z
X-Proofpoint-GUID: pfQJciifrzl-te3Okl98bZsPdJcXrs6z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=989 suspectscore=0
 adultscore=0 spamscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408290136


On 8/29/2024 11:52 AM, Rob Herring wrote:
> On Wed, Aug 28, 2024 at 01:37:20PM -0700, Nikunj Kela wrote:
>> Add interrupt specifier for extended SPI interrupts.
> What's an "extended SPI"? Is this a GIC spec thing? If so, what version?

Extended SPI is an extended range of SPI interrupts supported by GIC.

Excerpt below from
Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml

"The 1st cell is the interrupt type; 0 for SPI interrupts, 1 for PPI
interrupts, 2 for interrupts in the Extended SPI range, 3 for the
Extended PPI range. Other values are reserved for future use."

"The 2nd cell contains the interrupt number for the interrupt type. SPI
interrupts are in the range [0-987]. PPI interrupts are in the range
[0-15]. Extented SPI interrupts are in the range [0-1023]. Extended PPI
interrupts are in the range [0-127]."

>> Qualcomm SA8255p platform uses extended SPI for SCMI 'a2p' doorbells.
>>
>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>> ---
>>  include/dt-bindings/interrupt-controller/arm-gic.h | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/include/dt-bindings/interrupt-controller/arm-gic.h b/include/dt-bindings/interrupt-controller/arm-gic.h
>> index 35b6f69b7db6..9c06248446b7 100644
>> --- a/include/dt-bindings/interrupt-controller/arm-gic.h
>> +++ b/include/dt-bindings/interrupt-controller/arm-gic.h
>> @@ -12,6 +12,7 @@
>>  
>>  #define GIC_SPI 0
>>  #define GIC_PPI 1
>> +#define GIC_ESPI 2
>>  
>>  /*
>>   * Interrupt specifier cell 2.
>> -- 
>> 2.34.1
>>

