Return-Path: <linux-i2c+bounces-5933-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 235D2964A47
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 17:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C10241F23ED1
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 15:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60791B4C2D;
	Thu, 29 Aug 2024 15:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cz5wRa62"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05251B3733;
	Thu, 29 Aug 2024 15:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724945986; cv=none; b=hNH/4HMq9JM2T/C5CmxLW0bCiy5MV4aOVRXTkvXoWXhkPTph0388r6ambWc7rQHTxiebpsazF6xtLmQhHjNzn5zAh/xgfPnf03qo9vc5XdiIoPUB9GQRrxd+ucLY2pG/RiHXcnek6BCasVkmQ3DgLgbZNDyMjO/LTF/+vTUzj8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724945986; c=relaxed/simple;
	bh=irlj6udq+ajkTOZDEaMhoHi3gHxomUq9PIygsVw5x/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Bvsa4IZr59UdvwpDD0uOjwNRP8xVoV05P1WFdYVDlkmJKglwkd+bZu/vW/dh1G8CahqSnfT1xS1MQX4Zs2osGaiNbesdLuCMh9LzKboxjkyr2awY9vZ/8aj5sBhYZEAEC9rnRYwZFcPHVQ9UlB4ncdmifY90m5ksbMcSODaQDtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cz5wRa62; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T8iLKF019432;
	Thu, 29 Aug 2024 15:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+oZZN423x3H8FcKjymhNN5um5bqyqXeBRwGPv3NzEfU=; b=cz5wRa62qjH8a5jV
	7KkORyfpxFDnzfftfFP/PECkCs+D//aVBf0ez7mtdGCRq/4bA3izvRuLicMgvraT
	/pr4/nmcAMeRtgCYgHQ6tQQ3hBLiITAsyGMf3cfewFd/Q4SNWAURhUa0QgJzxrIu
	5nnCBuY2xq2OcniNEtDhG8efy3lG3OUMjG8hFikG+x46D5jDTbBXb69CccXEReTY
	LDLB55/ztC0UrTN/3ZwjAac+zWWDeAUrxtJP4kMRB2U4wjWrVg2lOfiw6QNWuA1q
	TYfbpTsi0NI7wicV6EA3efdjs84QBnVeGjqUy+QUHUOQf8znKuSs14Vy/GTDbNFk
	+acI+Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419putntxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 15:39:11 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TFdAdg021485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 15:39:10 GMT
Received: from [10.110.28.107] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 29 Aug
 2024 08:39:06 -0700
Message-ID: <e8e9cdcf-63c8-4bfa-aacc-d99338c7f8fa@quicinc.com>
Date: Thu, 29 Aug 2024 08:39:06 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/22] dt-bindings: arm-smmu: document the support on
 SA8255p
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <herbert@gondor.apana.org.au>,
        <davem@davemloft.net>, <sudeep.holla@arm.com>, <andi.shyti@kernel.org>,
        <tglx@linutronix.de>, <will@kernel.org>, <joro@8bytes.org>,
        <jassisinghbrar@gmail.com>, <lee@kernel.org>,
        <linus.walleij@linaro.org>, <amitk@kernel.org>,
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
 <20240828203721.2751904-15-quic_nkela@quicinc.com>
 <ompfueg7civ5spjdumkhd7qgx4cnvjcftznf3z3q5duuxppt5d@fao7zx4oxfm3>
Content-Language: en-US
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <ompfueg7civ5spjdumkhd7qgx4cnvjcftznf3z3q5duuxppt5d@fao7zx4oxfm3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SpEicdg2VgDAFzoy96fzPwPyuZgqW6b8
X-Proofpoint-ORIG-GUID: SpEicdg2VgDAFzoy96fzPwPyuZgqW6b8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_04,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290109


On 8/29/2024 12:36 AM, Krzysztof Kozlowski wrote:
> On Wed, Aug 28, 2024 at 01:37:13PM -0700, Nikunj Kela wrote:
>> Add compatible for smmu representing support on SA8255p.
>>
>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>> ---
>>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
>>  1 file changed, 3 insertions(+)
>>
> Your subjects contain quite redundant/excessive information. In the same
> time they lack information about device. 
>
> 1. s/document the support on/add/
> 2. s/SA8255p/SA8255p SMMU-or-whatever-device-it-is/
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof

Okay. I thought arm-smmu tag already indicate which device this patch is
for but would put SMMU explicitly in the subject.

Thanks,

-Nikunj


