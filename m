Return-Path: <linux-i2c+bounces-6265-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED87B96E028
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 18:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D58C1C24275
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 16:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B361A0723;
	Thu,  5 Sep 2024 16:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nerlkPCY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4556D6F066;
	Thu,  5 Sep 2024 16:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725554744; cv=none; b=vC49n5m/ZQQ6sA/0xXtFWdBq6GuuFvxis53CwPXyU/BvLViJ5b97lZED1b0DAG5fpnXUncazQJHMxWiOfqPF7kE/16ohWMKgTkDQeaZqBhPcTaF1YwriWPZqnb5nsGPCqsIN24jzZCG2EXU1xESvRK9zZ/GdomS/DMM570xA9zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725554744; c=relaxed/simple;
	bh=YWwbPzF+sNkt5ZpTARioh/0x0WR47L48CO6YcSiPyKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SguRQPD3A9szuH/qs0sFX6lwU3hvb1uxR6Y6JBgQrX1aP1aMsrZRxw4ALTA0+KyLwY+f90vVEkgYL/Xp3fe3OVgHjwT0KCaAnYArILJRmtIAFeJmZXftLXLNIUJGdqi5U+bU67tgER0cH0FS83/+igSElYhn553tiLSDPTvdVgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nerlkPCY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485974JZ016158;
	Thu, 5 Sep 2024 16:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gH2m8z07VyC9Rs4uG0Uvl0zZaPASslF/e9Q/tX9hoOk=; b=nerlkPCYZhbbBpBr
	NSScHB2ruGVyMU95nTcKEy0ov3a15xf+EL/4EkQVy2x2jk6QiHENXdA3nRD8sM2g
	t8LR2skwquCdUa8Wcmy6aApm20yGV0zO7V7NEUVKiyUKQjKjyqxNFfjNu6fdBXC4
	yc+nNrkQN5ErZhn8q7JWuScM0KiAP2JM+SDJtkaiKrZYx6DkkeZ7HOYPxL8B5PCn
	XTivXST2ASE0Eb4RfwykgJk6eTUEZolAQ5OHpi6dglMdc5u+2CUS8SnxoyMWc7xc
	KxqLtZeX+V1pbKCEYC6iW/oKwWiM/fvwlMqeg3LLwpJkuMIKFDlp+h3U7KTb/N21
	PVEkHw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41egmrn4rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 16:39:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485GdwfI007444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 16:39:58 GMT
Received: from [10.110.102.234] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 09:39:55 -0700
Message-ID: <63f988eb-e638-48fa-b566-3df39588bf7c@quicinc.com>
Date: Thu, 5 Sep 2024 09:39:54 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/21] dt-bindings: spi: document support for SA8255p
To: Andrew Lunn <andrew@lunn.ch>
CC: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <rafael@kernel.org>, <viresh.kumar@linaro.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <sudeep.holla@arm.com>, <andi.shyti@kernel.org>, <tglx@linutronix.de>,
        <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <jassisinghbrar@gmail.com>, <lee@kernel.org>,
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
        <quic_psodagud@quicinc.com>,
        Praveen Talari
	<quic_ptalari@quicinc.com>
References: <9a655c1c-97f6-4606-8400-b3ce1ed3c8bf@kernel.org>
 <516f17e6-b4b4-4f88-a39f-cc47a507716a@quicinc.com>
 <2f11f622-1a00-4558-bde9-4871cdc3d1a6@lunn.ch>
 <204f5cfe-d1ed-40dc-9175-d45f72395361@quicinc.com>
 <70c75241-b6f1-4e61-8451-26839ec71317@kernel.org>
 <75768451-4c85-41fa-82b0-8847a118ea0a@quicinc.com>
 <ce4d6ea9-0ba7-4587-b4a7-3dcb2d6bb1a6@kernel.org>
 <4896510e-6e97-44e0-b3d7-7a7230f935ec@quicinc.com>
 <b1ad1c7a-0995-48e0-8ebc-46a39a5ef4b3@kernel.org>
 <515a2837-69c3-47b2-978b-68ad3f6ad0fc@quicinc.com>
 <0ba03b8e-4dd5-4234-823e-db4c457fa292@lunn.ch>
Content-Language: en-US
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <0ba03b8e-4dd5-4234-823e-db4c457fa292@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: l_oq1IAyrxiZBlBS8JOfAaNdh9tdibTi
X-Proofpoint-ORIG-GUID: l_oq1IAyrxiZBlBS8JOfAaNdh9tdibTi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_12,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050124


On 9/5/2024 9:23 AM, Andrew Lunn wrote:
>> If the QUPs yaml changes are not included in the same series with
>> i2c,serial yaml changes, you see these errors:
>>
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: geniqup@9c0000: serial@990000:compatible:0: 'qcom,sa8255p-geni-uart' is not one of ['qcom,geni-uart', 'qcom,geni-debug-uart']
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: geniqup@9c0000: i2c@984000:compatible:0: 'qcom,sa8255p-geni-i2c' is not one of ['qcom,geni-i2c', 'qcom,geni-i2c-master-hub']
> So you have a couple of options:
>
> 1) It sounds like you should get the QUP changes merged first. Then
>    submit the i2c,serial changes. Is there a reason you cannot do
>    this? Is there a mutual dependency between these two series, or
>    just a one way dependency?

The ask in this thread is to create new yaml files since existing one is
using generic compatibles. With new yaml, we would need to provide
example and can't avoid it. If we have to provide example of QUP node,
IMO, we should provide a few subnodes as well since just QUP node
without subnodes(i2c/serial/spi)  will not be very useful.

We can possibly skip all 3 subnode and only keep one subsystem(e.g.
serial) so QUP and UART yaml can go together(still need two subsystems)
while SPI and I2C can go independently after QUP series is accepted. Not
sure if that is acceptable to maintainers though. QUP node in actual DT
will have all 3 types of subnodes(i2c,spi, serial) so example in this
case won't be complete.

>
> 2) Explain in the commit message that following errors are expected
>    because ... And explain in detail why the dependency cannot be
>    broken to avoid the errors.
>
> Andrew

