Return-Path: <linux-i2c+bounces-6212-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 030D996C91D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 23:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 362451C24F0D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 21:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D3215099D;
	Wed,  4 Sep 2024 21:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BPWYIsWy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C29738DD1;
	Wed,  4 Sep 2024 21:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725484023; cv=none; b=tel8ntS72+Okbi+sW9pFdh2AdbsHKFM43ozXqh/RypgEZ4PFiXCBzSXT6i4Hnp0Imqu31T4Iei2WSo/d8LQO0AAgjrGd7tXjDAHUiU/3Pq6zU6KMK0/YFGyhWY79RO6JZg2pd2jrLfuMwyuO0SqVrbQTW9voxEselnBtQZA5E5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725484023; c=relaxed/simple;
	bh=odu6RoR3qtTtWweMGYFXbf4nuKSVJnn/jlrXrFQ+nm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G3F7XKEWK3iLcKyYCA30rO5Ox5gahatU/SyqTBPk8CCHZWvNOU93VkOHCsp2vNoiqYwKL8MhdU7z+1ovN8zFTKzLgZEkc0L7QF1M1Lg6mWqbACGh//kc9K/K9TXyjPdeSnAf1mcPUwIuIQrBGwSk+W9jp+ZWTNtm1ub14tQ4Hn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BPWYIsWy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484GrcYx009456;
	Wed, 4 Sep 2024 21:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dDglSu69AeoOpMOFO6jbmEMEAsj/2CnT5VlnlR29lX8=; b=BPWYIsWyHDs+n5QA
	0r3glsATHaHZfS3MlmPCkFL1D7dbQOp3mCOQvPb9pRMTPIDNMG6tc3hMI8BMJWR3
	vjBaWEogng5eIH6/vfWWAfp5zSGbB/vrjSA6f60jlf1tsniFY82BiNYki+cdhKrS
	gpTMrRbaj8fgTpa0piEIOhek2bVPpjNrX+TDxBTlMERnTFh8f3mHrC7sg360zDLM
	eXWLNN16uMJ2rzgkYdDvGebjku8nJfqSDucVF9Ij/fuOWzb9bew8TBLT/qPjHrnO
	1lZCwdUzk5nzmpIywfoihp2NAGACYy0qXkrqZcIm+0f9IJNGh4TdfrIqaxajsHqJ
	KHhr6g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41e0bhn93h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 21:06:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484L6Mj0000645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 21:06:22 GMT
Received: from [10.110.102.234] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 14:06:18 -0700
Message-ID: <204f5cfe-d1ed-40dc-9175-d45f72395361@quicinc.com>
Date: Wed, 4 Sep 2024 14:06:18 -0700
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
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-17-quic_nkela@quicinc.com>
 <sdxhnqvdbcpmbp3l7hcnsrducpa5zrgbmkykwfluhrthqhznxi@6i4xiqrre3qg>
 <b369bd73-ce2f-4373-8172-82c0cca53793@quicinc.com>
 <9a655c1c-97f6-4606-8400-b3ce1ed3c8bf@kernel.org>
 <516f17e6-b4b4-4f88-a39f-cc47a507716a@quicinc.com>
 <2f11f622-1a00-4558-bde9-4871cdc3d1a6@lunn.ch>
Content-Language: en-US
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <2f11f622-1a00-4558-bde9-4871cdc3d1a6@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pquT8ry2dJOFwM1L5eqbhUs2RQGmgVaK
X-Proofpoint-GUID: pquT8ry2dJOFwM1L5eqbhUs2RQGmgVaK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_19,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=978
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040160


On 9/4/2024 9:58 AM, Andrew Lunn wrote:
>> Sorry, didn't realize SPI uses different subject format than other
>> subsystems. Will fix in v3. Thanks
> Each subsystem is free to use its own form. e.g for netdev you will
> want the prefix [PATCH net-next v42] net: stmmac: dwmac-qcom-ethqos:
of course they are! No one is disputing that.
>
> This is another reason why you should be splitting these patches per
> subsystem, and submitting both the DT bindings and the code changes as
> a two patch patchset. You can then learn how each subsystem names its
> patches.

Qualcomm QUPs chips have serial engines that can be configured as
UART/I2C/SPI so QUPs changes require to be pushed in one series for all
3 subsystems as they all are dependent.


>
> Please pick one victim subsystem and work on the patches for just that
> subsystem. Once you have them correct, you can use everything you
> learned to fixup all your other patches, one by one.
>
> 	Andrew      	 

