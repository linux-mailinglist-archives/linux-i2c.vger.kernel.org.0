Return-Path: <linux-i2c+bounces-6252-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A8A96DBAB
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 16:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C8BE1C24EC9
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 14:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB6928684;
	Thu,  5 Sep 2024 14:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WlNkXtMW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E75CA6B;
	Thu,  5 Sep 2024 14:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725546095; cv=none; b=gSUvIJJD+EFhMqjIBtXmE6SJzv+eIqGiD/PMPMmwek+botF8ESlnK1yVuYy+VzA83FF5yvx3sA3Q3MVP76qC9ssxzIfDipkL4hlxw/kdWC3WyIOZ14HJvB5JeqqpFCADf6Cp3RGlKexDUbsYCM1VJq6TQsnGq2L8A3aWxG0JWnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725546095; c=relaxed/simple;
	bh=DXyaYUEdp9Wc5HqoVQv8h4Xdqi2x4QC9WP7/RCMuanY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oU2i2+feEojsZgVnLw3U4/bG3qAEC3Yg25sMudCwbOCYpYN9ys3E23N5QCLejBJgkaSXezpF56HxHqnCPynSpwhhSanIo0ppDovMEo+hyP3I8nPoRYfYE28Vqw27cOJUzTi1rWYJqDjex1m6cHbtwWlY+JdetJ6Xt9ba3Xn7auI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WlNkXtMW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48597n0o023730;
	Thu, 5 Sep 2024 14:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PqmjsGtsdH0pPKX2Ec8nWXjou6CnajA32b/jszhvD/A=; b=WlNkXtMWL4A/p4gj
	eimNBRrtTjZB9Z3WhjPtgq1cOmqEOBOy9PFERhTZm8vBWYo+/y1qbK/qlITSK7AP
	1MbuDlf18GTjDMQCXuHnyhpELUbgX4LdZr7qIjTb/U2ztsyGxTLPdG+Pn4ldtncz
	Kjw8NQwKzDlnrwdht/A+gvm85rLbq35s2CTkyrnMMpPB/9Gj8/+Nm3i9vBMLH3Dd
	XKrZJ+X9mYfuO5svrt9X3UFhMqef5HPpXpOQ+FEUd1cQc3gagvjfUAqANWUPwNdN
	xc5aJx0QKGkJJe1JmhdkYbgHyUH5sAT9KqFIm/iYS+hJk2KpBry/loFskPu/NKjW
	h6/sAw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41f86ks3da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 14:15:53 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485EFq25019533
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 14:15:52 GMT
Received: from [10.110.102.234] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 07:15:48 -0700
Message-ID: <4896510e-6e97-44e0-b3d7-7a7230f935ec@quicinc.com>
Date: Thu, 5 Sep 2024 07:15:48 -0700
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
Content-Language: en-US
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <ce4d6ea9-0ba7-4587-b4a7-3dcb2d6bb1a6@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mwTkK25Wdk3u_xGDqOaQj7Oc4I2DLIkL
X-Proofpoint-ORIG-GUID: mwTkK25Wdk3u_xGDqOaQj7Oc4I2DLIkL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_09,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050106


On 9/5/2024 7:09 AM, Krzysztof Kozlowski wrote:
> On 05/09/2024 16:03, Nikunj Kela wrote:
>> On 9/5/2024 1:04 AM, Krzysztof Kozlowski wrote:
>>> On 04/09/2024 23:06, Nikunj Kela wrote:
>>>> On 9/4/2024 9:58 AM, Andrew Lunn wrote:
>>>>>> Sorry, didn't realize SPI uses different subject format than other
>>>>>> subsystems. Will fix in v3. Thanks
>>>>> Each subsystem is free to use its own form. e.g for netdev you will
>>>>> want the prefix [PATCH net-next v42] net: stmmac: dwmac-qcom-ethqos:
>>>> of course they are! No one is disputing that.
>>>>> This is another reason why you should be splitting these patches per
>>>>> subsystem, and submitting both the DT bindings and the code changes as
>>>>> a two patch patchset. You can then learn how each subsystem names its
>>>>> patches.
>>>> Qualcomm QUPs chips have serial engines that can be configured as
>>>> UART/I2C/SPI so QUPs changes require to be pushed in one series for all
>>>> 3 subsystems as they all are dependent.
>>> No, they are not dependent. They have never been. Look how all other
>>> upstreaming process worked in the past.
>> Top level QUP node(patch#18) includes i2c,spi,uart nodes.
>> soc/qcom/qcom,geni-se.yaml validate those subnodes against respective
>> yaml. The example that is added in YAML file for QUP node will not find
>> sa8255p compatibles if all 4 yaml(qup, i2c, spi, serial nodes) are not
>> included in the same series.
>>
> So where is the dependency? I don't see it. 

Ok, what is your suggestion on dt-schema check failure in that case as I
mentioned above? Shall we remove examples from yaml that we added?


> Anyway, if you insist,
> provide reasons why this should be the only one patchset - from all
> SoCs, all companies, all developers - getting an exception from standard
> merging practice and from explicit rule about driver change. See
> submitting bindings.
>
> This was re-iterated over and over, but you keep claiming you need some
> sort of special treatment. If so, please provide arguments WHY this
> requires special treatment and *all* other contributions are fine with it.
>
> Best regards,
> Krzysztof
>

