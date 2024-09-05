Return-Path: <linux-i2c+bounces-6249-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1191C96DB1A
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 16:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65C17B250A3
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 14:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36CF419E7F8;
	Thu,  5 Sep 2024 14:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mf9j8cWM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE5819DF68;
	Thu,  5 Sep 2024 14:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545074; cv=none; b=UsnUjrdPmrmGzKRZWH6It85NDvRCcSqZrknujlK192QqkjXNsCmZTQW8LzIK+MTWYvB0deGcxI54Kmt1QjomI9x0TtqevQX+qCquWYS8bbZE1yY4Nfo9+32JazVhZRoTGn7NKhbgkdoiIiywX3gFsSy64WRC9rFmbiSuvKBMg6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545074; c=relaxed/simple;
	bh=BAJ9VYyEmanS+PFfwXykRirtRNrrIcKiKS3ue6Ie4zk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=l54jJFVMTZvCGf4o3LbHqUQVLuW90CpA1DsXR/C46H8K/BivGK0oi/NpvVmj2gxQutuZxWv/eNCVg7CdpXmYSPtzemgyXOxrcRxqN4s5yplu9SKAiBlZWnAGV1Elovn0EWZhTbsrzqllrNBWjceUJMz8HAQoUFs575OiW9E3aZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mf9j8cWM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485973fZ025924;
	Thu, 5 Sep 2024 14:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BAJ9VYyEmanS+PFfwXykRirtRNrrIcKiKS3ue6Ie4zk=; b=mf9j8cWMLIJg7Vzi
	P/QGp0SO0uvpdkTf7R+8JCimi6sSEwJ4sRkcq971+j6cL+IxNOoVavaepeuNjt/R
	dbyHKYw1FNfutJ3QdBqzfjtPiThziBjxR+BV5yKsKdX1oOs7+d8SXzZPHsnmAFl2
	qaMYdx7/yo0RR5qMi5M6NKqq+sojkbeNaR1IIlFw0Ugj56kV2PffM8m4goOw1JSJ
	dCGXB1bcIuKENWstC3jRYMzo2sO31kSBOzFjvExpIqCnCoAYiBMH4vJjqt2ttkQ8
	rEtiWQszqEDBI+/mLXHJA8jDj6k9f1XKf/y6Vnrgj9GZNZ0NA0zP+3FVXa2sE3+i
	FuEnRg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41drqe8g2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 14:03:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485E3pZa014887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 14:03:51 GMT
Received: from [10.110.102.234] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 07:03:47 -0700
Message-ID: <75768451-4c85-41fa-82b0-8847a118ea0a@quicinc.com>
Date: Thu, 5 Sep 2024 07:03:46 -0700
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
Content-Language: en-US
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <70c75241-b6f1-4e61-8451-26839ec71317@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mfOtKa7pytGj7RGF-VZlk3L-_P3fsu10
X-Proofpoint-ORIG-GUID: mfOtKa7pytGj7RGF-VZlk3L-_P3fsu10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_09,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409050104


On 9/5/2024 1:04 AM, Krzysztof Kozlowski wrote:
> On 04/09/2024 23:06, Nikunj Kela wrote:
>> On 9/4/2024 9:58 AM, Andrew Lunn wrote:
>>>> Sorry, didn't realize SPI uses different subject format than other
>>>> subsystems. Will fix in v3. Thanks
>>> Each subsystem is free to use its own form. e.g for netdev you will
>>> want the prefix [PATCH net-next v42] net: stmmac: dwmac-qcom-ethqos:
>> of course they are! No one is disputing that.
>>> This is another reason why you should be splitting these patches per
>>> subsystem, and submitting both the DT bindings and the code changes as
>>> a two patch patchset. You can then learn how each subsystem names its
>>> patches.
>> Qualcomm QUPs chips have serial engines that can be configured as
>> UART/I2C/SPI so QUPs changes require to be pushed in one series for all
>> 3 subsystems as they all are dependent.
> No, they are not dependent. They have never been. Look how all other
> upstreaming process worked in the past.

Top level QUP node(patch#18) includes i2c,spi,uart nodes.
soc/qcom/qcom,geni-se.yaml validate those subnodes against respective
yaml. The example that is added in YAML file for QUP node will not find
sa8255p compatibles if all 4 yaml(qup, i2c, spi, serial nodes) are not
included in the same series.


>
> Best regards,
> Krzysztof
>

