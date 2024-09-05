Return-Path: <linux-i2c+bounces-6261-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB96D96DEDF
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 17:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 635FC285D66
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 15:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13CB719F479;
	Thu,  5 Sep 2024 15:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SRKNY7WE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E19A4AEF5;
	Thu,  5 Sep 2024 15:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725551339; cv=none; b=NopyIYzgXLLV/D/gcoS8tqcgLc6CxKYTdD1BYjpKrVyrszeLn6Ie6QUKBTl+qiSko8sT0m7yeePuWdacNJz1e7itaMt9gVj9njbG9JfYcTZ6V9IWG1piULaWcnoExq5I+FbFqnVu0++gNZCGHV/ylT4oOm2k0TgK+Hjif1pV2vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725551339; c=relaxed/simple;
	bh=m/pB0sJ7Gyv748YYaN0YtwoYSb5DqmbagoUoIra4JbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KvbiJoLwuvRganUxkBUp9I8DZyrkcrXcnifQmTT2nZcM4fDA/8bS9VMDv8s+383RueNaLwPyERsRVR6lzR23nFhjjlvgwZUCY1v1Wq2/p1uqifsYc6yH2lemYZo9uVHs4Ec+Gs3seUBr83Wprbk0cpTVXqBTy38u0pRo72E2MAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SRKNY7WE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48597DbB008927;
	Thu, 5 Sep 2024 15:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nCnjjnDa8vTEgHpesvRhD6MywdZNlhEYt2stisCgDec=; b=SRKNY7WE8cgJorSm
	Mvhle6mI7MicldWpQn9i8u/5KxQ9/zQ2XNNgj5OG5aCUPbKRgp8IhcNScyofgOQt
	zTYJOEnh6PDvvr1DwRf2BpASOGwP9r5XEzxyvQmWniUMUFMN4CNqoAt6P4PtjNL8
	bpKhrtT+UtLdDUgRDZ/wsNZlbNhFlOXlHFW6jFhuLMdleNZU4cGsFcO/svoZlRsW
	xuQbp1pVUSS1o4Bgj6krM+KWfvThyJtTOLCmghvmJ/mbmsaSZPdLy6FcvrI0ORmT
	my3BnegqJ5bCoqD4uYzgUn8Cm/6pelhRTrWR0YnBQ6DgOumpaJFjSrSi9pqmsf3I
	9lbQQg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41f91r173x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 15:43:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485Fh9lm021067
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 15:43:09 GMT
Received: from [10.110.102.234] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 08:43:05 -0700
Message-ID: <efb2a776-d9c3-44bd-ab27-b66779dea85b@quicinc.com>
Date: Thu, 5 Sep 2024 08:43:05 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/21] dt-bindings: spi: document support for SA8255p
To: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew@lunn.ch>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <herbert@gondor.apana.org.au>,
        <davem@davemloft.net>, <sudeep.holla@arm.com>, <andi.shyti@kernel.org>,
        <tglx@linutronix.de>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jassisinghbrar@gmail.com>, <lee@kernel.org>,
        <linus.walleij@linaro.org>, <amitk@kernel.org>,
        <thara.gopinath@gmail.com>, <broonie@kernel.org>,
        <cristian.marussi@arm.com>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <iommu@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>, Praveen Talari <quic_ptalari@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-17-quic_nkela@quicinc.com>
 <sdxhnqvdbcpmbp3l7hcnsrducpa5zrgbmkykwfluhrthqhznxi@6i4xiqrre3qg>
 <b369bd73-ce2f-4373-8172-82c0cca53793@quicinc.com>
 <9a655c1c-97f6-4606-8400-b3ce1ed3c8bf@kernel.org>
 <516f17e6-b4b4-4f88-a39f-cc47a507716a@quicinc.com>
 <2f11f622-1a00-4558-bde9-4871cdc3d1a6@lunn.ch>
 <204f5cfe-d1ed-40dc-9175-d45f72395361@quicinc.com>
 <70c75241-b6f1-4e61-8451-26839ec71317@kernel.org>
 <75768451-4c85-41fa-82b0-8847a118ea0a@quicinc.com>
 <ce4d6ea9-0ba7-4587-b4a7-3dcb2d6bb1a6@kernel.org>
 <4896510e-6e97-44e0-b3d7-7a7230f935ec@quicinc.com>
 <a2c2e365-7e47-4ad1-87dc-b5603a927cc6@kernel.org>
Content-Language: en-US
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <a2c2e365-7e47-4ad1-87dc-b5603a927cc6@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2QnZU4PHRT-Lwqj32_uEGXZJO-VAJ1eh
X-Proofpoint-GUID: 2QnZU4PHRT-Lwqj32_uEGXZJO-VAJ1eh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_10,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050116


On 9/5/2024 7:49 AM, Krzysztof Kozlowski wrote:
> On 05/09/2024 16:15, Nikunj Kela wrote:
>> On 9/5/2024 7:09 AM, Krzysztof Kozlowski wrote:
>>> On 05/09/2024 16:03, Nikunj Kela wrote:
>>>> On 9/5/2024 1:04 AM, Krzysztof Kozlowski wrote:
>>>>> On 04/09/2024 23:06, Nikunj Kela wrote:
>>>>>> On 9/4/2024 9:58 AM, Andrew Lunn wrote:
>>>>>>>> Sorry, didn't realize SPI uses different subject format than other
>>>>>>>> subsystems. Will fix in v3. Thanks
>>>>>>> Each subsystem is free to use its own form. e.g for netdev you will
>>>>>>> want the prefix [PATCH net-next v42] net: stmmac: dwmac-qcom-ethqos:
>>>>>> of course they are! No one is disputing that.
>>>>>>> This is another reason why you should be splitting these patches per
>>>>>>> subsystem, and submitting both the DT bindings and the code changes as
>>>>>>> a two patch patchset. You can then learn how each subsystem names its
>>>>>>> patches.
>>>>>> Qualcomm QUPs chips have serial engines that can be configured as
>>>>>> UART/I2C/SPI so QUPs changes require to be pushed in one series for all
>>>>>> 3 subsystems as they all are dependent.
>>>>> No, they are not dependent. They have never been. Look how all other
>>>>> upstreaming process worked in the past.
>>>> Top level QUP node(patch#18) includes i2c,spi,uart nodes.
>>>> soc/qcom/qcom,geni-se.yaml validate those subnodes against respective
>>>> yaml. The example that is added in YAML file for QUP node will not find
>>>> sa8255p compatibles if all 4 yaml(qup, i2c, spi, serial nodes) are not
>>>> included in the same series.
>>>>
>>> So where is the dependency? I don't see it. 
>> Ok, what is your suggestion on dt-schema check failure in that case as I
>> mentioned above? Shall we remove examples from yaml that we added?
>>
>>
>>> Anyway, if you insist,
>>> provide reasons why this should be the only one patchset - from all
>>> SoCs, all companies, all developers - getting an exception from standard
>>> merging practice and from explicit rule about driver change. See
>>> submitting bindings.
>>>
>>> This was re-iterated over and over, but you keep claiming you need some
>>> sort of special treatment. If so, please provide arguments WHY this
>>> requires special treatment and *all* other contributions are fine with it.
> You did not respond to above about explaining why this patchset needs
> special treatment, so I assume there is no exception here to be granted
> so any new version will follow standard process (see submitting bindings
> / writing bindings).
>
> Best regards,
> Krzysztof

Things will be clear after you see the driver changes. Without looking
at the code, this discussion won't lead to anything constructive. So I
deferred the QUP related discussion until driver patches are posted.

Thanks,

-Nikunj


>

